import ballerina/io;
import ballerina/http;

final http:Client brainyQuoteClient = check new ("http://localhost:9095/brainyquote");

final http:Client legacyClient = check new ("http://localhost:6060/legacyquote");

public function main() returns error? {
    string|error qoute = check brainyQuoteClient->get("/");

    if qoute is error {
        io:println(qoute.message());
    } else {
        io:println(qoute);
    }

    // Similarly implement the same logic for the invocation of the `legacyClient` endpoint
    string|error legacy = check legacyClient->get("/"); 

    if legacy is error {
        io:println(legacy.message());
        return error("Something wrong with the connection");
    } else {
        io:println(legacy);
    }
}
