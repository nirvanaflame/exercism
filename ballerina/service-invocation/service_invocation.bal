import ballerina/io;
import ballerina/http;


final http:Client brainyQuoteClient = check new ("http://localhost:9095/brainyquote");

public function main() {
    string|error quote = brainyQuoteClient->get("/");

    if quote is error {
        io:println(quote.message());
    } else {
        io:println(quote);
    }
}
