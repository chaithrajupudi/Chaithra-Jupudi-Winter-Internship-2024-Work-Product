const Http = require("http");
const Https = require("https");
const DotEnv = require("dotenv");
const Express = require("express");
const Cors = require("cors");
const Axios = require('axios');

let _express = Express();
let _server = Http.createServer(_express);
let _axiosAgent = null;
let _allUrls = {};

const KStorageLib = "storagelib";
const KVisionLib = "visionlib";
const KSpeechib = "speechlib";
const KSTranslateLib = "translatelib";
const KGenAITextlib = "genai-textlib";
const KGenAIImagelib = "genai-imagelib";
const KVectorSearchlib = "vector-searchlib";
const KGenAITextV2lib = "genai-textlib-v2";
const KGenAIMultimodalV2lib = "genai-multimodallib-v2";

DotEnv.config();

_express.use(Express.json
({
    extended: true,
    limit: '10mb'
}));

_express.use(Express.urlencoded
({
    extended: true
}));

_express.use(Cors
({
    origin: "*"
}));

function prepareErrorMessage(exception)
{
    const code = exception.response.status;
    const message = exception.response.data.results;

    const errorInfo = {};
    errorInfo.message = message;
    errorInfo.code = ((code == undefined) || (code < 400)) ? 500 : code;;
    return errorInfo;
}

function prepareAllUrls()
{
    _allUrls[KStorageLib] = `${process.env.STORAGELIB_HOST}`;
    _allUrls[KVisionLib] = `${process.env.VISIONLIB_HOST}`;
    _allUrls[KSpeechib] = `${process.env.SPEECHLIB_HOST}`;
    _allUrls[KSTranslateLib] = `${process.env.TRANSLATELIB_HOST}`;
    _allUrls[KGenAITextlib] = `${process.env.GENAI_TEXTLIB_HOST}`;
    _allUrls[KGenAIImagelib] = `${process.env.GENAI_IMAGELIB_HOST}`;
    _allUrls[KVectorSearchlib] = `${process.env.GENAI_VECTORSEARCHLIB_HOST}`;
    _allUrls[KGenAITextV2lib] = `${process.env.GENAI_TEXTLIB_V2_HOST}`;
    _allUrls[KGenAIMultimodalV2lib] = `${process.env.GENAI_MULTILIB_V2_HOST}`;
}

function prepareTextInfo(request)
{
    const textInfo = {};    
    textInfo.text = request.body.text;
    textInfo.sourceLanguage = request.body.language;
    textInfo.targetLanguage = "en-US";
    textInfo.prompt = request.body.prompt;
    textInfo.desc = request.body.desc;
    textInfo.modelId = request.headers.modelid;
    textInfo.endpointId = request.headers.endpointid;
    textInfo.query = request.query;    
    return textInfo;
}

function prepareShortHeaders(endpointId)
{
    const genAIHeaders = {};
    genAIHeaders.temperature = 0.4;
    genAIHeaders.maxtokens = 1024;
    genAIHeaders.topk = 40;
    genAIHeaders.topp = 0.8;    
    genAIHeaders.endpointid = endpointId;
    return genAIHeaders;
}

function prepareTextContentInfo(promptInfo)
{
    const contentInfo = {};
    const partInfo = {};
    partInfo.text = promptInfo.prompt;

    contentInfo.role = "user";
    contentInfo.parts = [];
    contentInfo.parts.push(partInfo);
    return [contentInfo];
}


function initializeAIGenie()
{
    _axiosAgent = new Https.Agent
    ({
        rejectUnauthorized: false
    });

    prepareAllUrls();
}

function processTranslationResponse(response)
{
    const translateResponseList = response.data.results;
    return translateResponseList;
}

function processGenericResponse(response)
{
    const genaiResponse = response.data.results;
    return genaiResponse;
}


async function translateText(textInfo)
{
    const requestOptions= {};
    requestOptions.httpsAgent = _axiosAgent;
    
    requestOptions.headers = {};
    requestOptions.headers =
    {        
       "content-type": "application/json",
       "mime-type": "text/plain"
    }

    const requestBody = [];
    requestBody.push(textInfo.text);

    try
    {
        const response = await Axios.post(`${_allUrls[KSTranslateLib]}/translate/text?src=${textInfo.sourceLanguage}&trg=${textInfo.targetLanguage}`,
                                            requestBody, requestOptions);
        const translateResponseList = processTranslationResponse(response);
        return translateResponseList[0];        
    }
    catch(exception)
    {
        throw exception;
    }
}

async function receiveTextAction(translatedResponse, textInfo)
{
    const requestOptions= {};
    requestOptions.httpsAgent = _axiosAgent;
    requestOptions.params = textInfo.query;

    const requestBody = {};
    const promptInfo = {};
    promptInfo.prompt = `${textInfo.prompt}\n${translatedResponse.target}\n\n${textInfo.desc}`;
    
    const contentsList = prepareTextContentInfo(promptInfo);
    requestBody.contents = contentsList;

    const genAIHeaders = prepareShortHeaders(textInfo.endpointId);
    requestOptions.headers = genAIHeaders;

    try
    {
        const response = await Axios.post(`${_allUrls[KGenAITextV2lib]}/genai/text`,
                                                requestBody, requestOptions);
        const genaiResponse = processGenericResponse(response);
        return genaiResponse;
    }
    catch(exception)
    {
        throw exception;
    }
}

async function receiveEndpointTextAction(translatedResponse, textInfo)
{
    const requestOptions= {};
    requestOptions.httpsAgent = _axiosAgent;
    requestOptions.params = textInfo.query;

    const requestBody = {};
    requestBody.instances = [];

    const promptInfo = {};
    promptInfo.prompt = `${textInfo.prompt}\n${translatedResponse.target}\n\n${textInfo.desc}`;
    requestBody.instances.push(promptInfo);

    const genAIHeaders = prepareShortHeaders(textInfo.endpointId);
    requestOptions.headers = genAIHeaders;

    try
    {
        const response = await Axios.post(`${_allUrls[KGenAITextV2lib]}/genai/text/endpoint`,
                                                requestBody, requestOptions);
        const genaiResponse = processGenericResponse(response);
        return genaiResponse;
    }
    catch(exception)
    {
        throw exception;
    }
}


async function performTextAction(textInfo)
{
    try
    {
        let translateResponse = {};
        if (textInfo.sourceLanguage == "en-US")
        {
            translateResponse.source = `${textInfo.text}\n\n${textInfo.desc}`;
            translateResponse.target = `${textInfo.text}\n\n${textInfo.desc}`;
        }
        else
            translateResponse = await translateText(textInfo);
        
        const genAIResponse = await receiveTextAction(translateResponse, textInfo);
        return genAIResponse;
    }
    catch(exception)
    {
        throw exception;
    }
}

async function performEndpointTextAction(textInfo)
{
    try
    {
        let translateResponse = {};
        if (textInfo.sourceLanguage == "en-US")
        {
            translateResponse.source = `${textInfo.text}\n\n${textInfo.desc}`;
            translateResponse.target = `${textInfo.text}\n\n${textInfo.desc}`;
        }
        else
            translateResponse = await translateText(textInfo);
        
        const genAIResponse = await receiveEndpointTextAction(translateResponse, textInfo);
        return genAIResponse;
    }
    catch(exception)
    {
        throw exception;
    }
}

/* API DEFINITIONS - START */
/**
 * @fires /text/action/v2
 * @method POST
 * @description Get UI Action for the Text command
 */
_express.post("/text/action/v2", async (request, response) =>
{
    const textInfo = prepareTextInfo(request);
    const results = {};
    try
    {
        const responseList = await performTextAction(textInfo);
        results.results = responseList;
        response.send(results);
    }
    catch(exception)
    {
        let errorInfo = prepareErrorMessage(exception);
        results.results = errorInfo.message;
        response.status(errorInfo.code).send(results);
    }
});

/**
 * @fires /text/action/v2
 * @method POST
 * @description Get UI Action for the Text command reference to a custom model 
 */
 _express.post("/text/action/endpoint/v2", async (request, response) =>
 {
     const textInfo = prepareTextInfo(request);
     const results = {};
     try
     {
         const responseList = await performEndpointTextAction(textInfo);
         results.results = responseList;
         response.send(results);
     }
     catch(exception)
     {
         let errorInfo = prepareErrorMessage(exception);
         results.results = errorInfo.message;
         response.status(errorInfo.code).send(results);
     }
 });

/* API DEFINITIONS - END */

var port = process.env.port || process.env.PORT || 6067;
_server.listen(port);

initializeAIGenie();

console.log("Server running at http://localhost:%d", port);
