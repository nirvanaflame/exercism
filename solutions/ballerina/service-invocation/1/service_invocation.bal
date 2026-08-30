import ballerina/io;
import ballerina/http;


public function main() {
    http:Client brainyQuoteClient = check new http:Client("localhost:9095");
    string qoute = check brainyQuoteClient->get("/brainyquote");
    io:println(qoute);
}
