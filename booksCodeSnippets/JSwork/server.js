import { createServer } from "node:http";
let server = createServer((request, response) => {
    response.writeHead(200, { "Content-Type": "text/html" });
    response.write(`
<h1>Hello!</h1>
<p>You asked for <code>${request.url}</code></p>`);
    response.end();
});
server.listen(8000);
console.log("Listening! (port 8000)");

//This code creates a server that reads request bodies and streams them back to the client as all-uppercase text:
import { createServer } from "node:http";
createServer((request, response) => {
    response.writeHead(200, { "Content-Type": "text/plain" });
    request.on("data", chunk =>
        response.write(chunk.toString().toUpperCase()));
    request.on("end", () => response.end());
}).listen(8000);

fetch("http://localhost:8000/", {
    method: "POST",
    body: "Hello server"
}).then(resp => resp.text()).then(console.log);
// → HELLO SERVER