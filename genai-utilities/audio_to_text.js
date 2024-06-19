const { VertexAI } = require('@google-cloud/vertexai');
const fs = require('fs');
require('dotenv').config();


const vertex_ai = new VertexAI({ project: process.env.PROJECT, location: 'us-central1' });
const model = 'gemini-1.5-pro-preview-0409';


function readAudioFile(filePath) {
    const fileData = fs.readFileSync(filePath);
    return Buffer.from(fileData).toString('base64');
}


async function generateContent(audioFilePath) {
    const audioData = {
        inlineData: {
            mimeType: 'audio/mpeg',
            data: readAudioFile(audioFilePath)
        }
    };

    const req = {
        contents: [
            { role: 'user', parts: [audioData, { text: `transcribe the audio and print the text while differentiating the speakers` }] }
        ],
    };

    const generativeModel = vertex_ai.preview.getGenerativeModel({
        model: model,
        generationConfig: {
            'maxOutputTokens': 8192,
            'temperature': 1,
            'topP': 0.95,
        },
        safetySettings: [
            { 'category': 'HARM_CATEGORY_HATE_SPEECH', 'threshold': 'BLOCK_MEDIUM_AND_ABOVE' },
            { 'category': 'HARM_CATEGORY_DANGEROUS_CONTENT', 'threshold': 'BLOCK_MEDIUM_AND_ABOVE' },
            { 'category': 'HARM_CATEGORY_SEXUALLY_EXPLICIT', 'threshold': 'BLOCK_MEDIUM_AND_ABOVE' },
            { 'category': 'HARM_CATEGORY_HARASSMENT', 'threshold': 'BLOCK_MEDIUM_AND_ABOVE' }
        ],
    });

    const streamingResp = await generativeModel.generateContentStream(req);

    for await (const item of streamingResp.stream) {
        process.stdout.write(JSON.stringify(item["candidates"][0]["content"]["parts"][0]["text"]));
    }
}

generateContent("./sample_audio2.mp3");
