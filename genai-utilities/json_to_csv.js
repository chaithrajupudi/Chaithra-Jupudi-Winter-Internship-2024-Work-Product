fs = require('fs');
json2csv = require('json2csv').parse;


function convertJsonToCSV(jsonFilePath, csvFilePath){
    try{
        const jsonData = require(jsonFilePath);

        const csvData = json2csv(jsonData);

        fs.writeFileSync(csvFilePath, csvData, 'utf8');

        console.log("CSV file generated");
    } catch (error) {
        console.error("Error converting JSON to CSV:", error);
    }
}

convertJsonToCSV('./sample_json2.json', './output.csv');
