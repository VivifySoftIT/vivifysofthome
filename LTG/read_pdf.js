const fs = require('fs');
const path = require('path');
const pdf = require('pdf-parse');

const file = path.resolve(__dirname, process.argv[2]);
console.log('Reading:', file);

try {
    const dataBuffer = fs.readFileSync(file);
    pdf(dataBuffer).then(function(data) {
        console.log(`--- ${file} ---`);
        console.log(data.text);
    }).catch(function(err) {
        console.error("PDF-PARSE Error:", err.message);
    });
} catch(e) {
    console.error("FS Error:", e.message);
}
