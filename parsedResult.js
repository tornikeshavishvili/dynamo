const context = require("./context");
const fs = require("fs");
const http = require("http");function main() {
function createserverandlisten(port){
let server = context.createServer();
server.listen(port);
}
function reversestringandprint(str){
let reversed = context.reverseString(str);
context.print(reversed);
fs.writeFileSync("./reversed.txt",reversed);
}
reversestringandprint("hello world");
createserverandlisten(5000);
} main();