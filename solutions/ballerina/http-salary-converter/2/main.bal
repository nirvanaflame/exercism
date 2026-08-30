import ballerina/http;

# The exchange rate API base URL
configurable string apiUrl = "http://localhost:8080";

final http:Client exchangeClient = check new (string `${apiUrl}/rates`);

type Response readonly & record {|
    string base;
    map<decimal> rates;
|};

# Convert provided salary to local currency.
#
# + salary - Salary in source currency
# + sourceCurrency - Soruce currency
# + localCurrency - Employee's local currency
# + return - Salary in local currency or error
public function convertSalary(decimal salary, string sourceCurrency, string localCurrency) returns decimal|error {
    Response|error res = exchangeClient->get(string `/${sourceCurrency}`);

    if res is error {
        return error("currency not found");
    } else {
        decimal? cur = res.rates[localCurrency];
        if cur is null {
            return error("no currency for conversion");
        } else {
            return cur * salary;
        }
    }
}
