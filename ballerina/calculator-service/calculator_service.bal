import ballerina/http;

# Add the necessary attributes to this record to accept two operands and an operator.
#
# + operand1 - Is a float used as the first operand in an equation
# + operand2- Is a float used as the second operand in an equation
# + operator - Is a string that represents the operator
public type Calculation record {|
    float operand1;
    float operand2;
    string operator;
|};

# Add the necessary attributes to this record to include the result value and the expression.
#
# + result - The result of the operation
# + expression - The evaluated expression that used to calculate the result
public type Response record {|
    float result;
    string expression;
|};

service / on new http:Listener(9090) {

    // Add HTTP resource function to accept a POST request on path '/calc'
    // The function should accept the above Calculation record as the payload and return a generic json object
    resource function post calc(@http:Payload Calculation payload) returns Response {

        // Check for each operator '+', '-', 'x' or '*' and '/'. and do the calculation

        string operation = payload.operator;
        float x = payload.operand1;
        float y = payload.operand2;
        float res = 0f;

        match operation {
            "+" => {
                res = x + y;
            }
            "-" => {
                res = x - y;
            }
            "x"|"*" => {
                res = x * y;
            }
            "/" => {
                res= x / y;
            }
            _ => {
                res = 0;
            }
        }

        // Convert the two operands and the expression into a string representation with no whitespace.

        string exp= string `${x}${operation}${y}`;

        // Return the result as a Response with the calculation expressed as a string e.g. { result: 1.0, expression: "0+0" };
        
        return {
            result: res,
            expression: exp
        };
    }
}
