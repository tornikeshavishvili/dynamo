const grammar = require('./grammar.js');
const fs = require('fs');

(async function () {
    // Example usage of the compiled grammar
    const parser = grammar;
    const input = fs.readFileSync('sample.dynamo', 'utf-8');  
    try {
        const result = parser.parse(input);
        fs.writeFileSync('parsedResult.js', result);
        console.log("Parsing result:",result);
    } catch (error) {
        console.error("Parsing error:", error);
    }
})(); 



 