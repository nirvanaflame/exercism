import ballerina/http;

public type Calculation record {|
    float operand1;
    float operand2;
    string operator;
|};

public type Response record {|
    float result;
    string expression;
|};

service / on new http:Listener(9090) {

    resource function post calc(@http:Payload Calculation payload) returns Response {

        string operation = payload.operator;
        float x = payload.operand1;
        float y = payload.operand2;
        
        float res = 0f;
        match operation {
            "+" => { res = x + y; }
            "-" => { res = x - y; }
            "x"|"*" => { res = x * y; }
            "/" => { res= x / y; }
            _ => { res = 0; }
        }

        string exp = string `${x}${operation}${y}`;
        
        return {
            result: res,
            expression: exp
        };
    }
}
