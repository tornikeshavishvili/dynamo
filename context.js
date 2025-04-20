const http = require('node:http');

module.exports.reverseString = function (str) {
    return str.split("").reverse().join("");
};
module.exports.print = function (reversed) {
    console.log(reversed);
};

module.exports.createServer = function () {
    
    const server = http.createServer({ keepAliveTimeout: 60000 }, (req, res) => {
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({
            data: 'Hello World!',
        }));
    });

    return server;
}