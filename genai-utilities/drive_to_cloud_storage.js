const fs = require('fs');
const { google } = require('googleapis');
require('dotenv').config();


// create a service account in the GCP project and download the JSON file
const serviceAccountKey = require('./credentials.json');

const auth = new google.auth.GoogleAuth({
  credentials: serviceAccountKey,
  scopes: ['https://www.googleapis.com/auth/drive'],
});

const drive = google.drive({ version: 'v3', auth });

async function downloadFile(fileId, destFilePath) {
  const dest = fs.createWriteStream(destFilePath);
  try {
    const response = await drive.files.get({ fileId, alt: 'media' }, { responseType: 'stream' });
    response.data
      .on('error', err => {
        console.error('Error downloading file:', err);
      })
      .on('end', () => {
        console.log('File downloaded successfully');
      })
      .pipe(dest);

    
    return new Promise((resolve, reject) => {
      dest.on('finish', resolve);
      dest.on('error', reject);
    });
  } catch (error) {
    console.error('Error:', error);
    throw error;
  }
}

const bucketName = process.env.BUCKET_NAME;

const { Storage } = require('@google-cloud/storage');

const storage = new Storage();

async function uploadFile(localFilePath, destFileName) {
  const fileContents = fs.readFileSync(localFilePath);
  const file = storage.bucket(bucketName).file(destFileName);
  await file.save(fileContents);
  console.log(`${localFilePath} uploaded to ${bucketName} as ${destFileName}`);
}

async function downloadAndUpload(fileId, localFilePath, destFileName) {
  try {
    await downloadFile(fileId, localFilePath);

    await uploadFile(localFilePath, destFileName);
    console.log('File uploaded successfully');
  } catch (error) {
    console.error('Error:', error);
  }
}

const fileId = process.env.FILE_ID;
const localFilePath = './sample.jpeg';
const destFileName = 'sample.jpeg';


downloadAndUpload(fileId, localFilePath, destFileName).catch(console.error);
