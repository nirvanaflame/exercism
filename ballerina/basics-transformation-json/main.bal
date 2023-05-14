import ballerina/io;

function processFuelRecords(string inputFilePath, string outputFilePath) returns error? {
    json input = check io:fileReadJson(inputFilePath);


    table<FillUpDb> db = jsonToTable(input);
    var sad = from var {employeeId: id, gasFillUpCount: gas, totalFuelCost: cost, totalGallons: gallons, totalMilesAccrued: miles} in db
        order by id
        select {employeeId: id, gasFillUpCount: gas, totalFuelCost: cost, totalGallons: gallons, totalMilesAccrued: miles};

    error? res = io:fileWriteJson(outputFilePath, sad.toJson());
    
    return res;
}

function jsonToTable(json jsonString) returns table<FillUpDb> {
    table<FillUpDb> key(employeeId) db = table [];

    foreach json j in <json[]> jsonString {
        FillUpEntry entry = checkpanic j.cloneWithType(FillUpEntry);

        int id = entry.employeeId;
        if db.hasKey(id) {
            var rec = db.get(id);
            db.put({
                employeeId: rec.employeeId,
                baseMiles: rec.baseMiles,
                gasFillUpCount: rec.gasFillUpCount + 1,
                totalFuelCost: updateTotalCost(rec, entry),
                totalGallons: rec.totalGallons + entry.gallons,
                totalMilesAccrued: entry.odometerReading - rec.baseMiles
            });
        } else {
            db.put({
                employeeId: entry.employeeId,
                baseMiles: entry.odometerReading,
                gasFillUpCount: 1,
                totalFuelCost: totalCost(entry),
                totalGallons: entry.gallons,
                totalMilesAccrued: 0
            });
        }
    }

    return db;
}

function updateMiles(FillUpDb db, FillUpEntry entry) returns int {
    return db.totalMilesAccrued + entry.odometerReading - db.totalMilesAccrued;
}

function updateTotalCost(FillUpDb db, FillUpEntry entry) returns decimal {
    return db.totalFuelCost + totalCost(entry);
}

function totalCost(FillUpEntry entry) returns decimal {
    return entry.gallons * entry.gasPrice;
}

type FillUpEntry record {|
    int employeeId;
    int odometerReading;
    decimal gallons;
    decimal gasPrice;
|};

type FillUpDb record {|
    readonly int employeeId;
    readonly int baseMiles;
    int gasFillUpCount;
    decimal totalFuelCost;
    decimal totalGallons;
    int totalMilesAccrued;
|};

public function main() {
    var sad = processFuelRecords(
        "/home/nf/IdeaProjects/exercism/ballerina/basics-transformation-json/tests/resources/example01_input.json",
         "/home/nf/IdeaProjects/exercism/ballerina/basics-transformation-json/tests/resources/test_output.json");
    io:print(sad);
}
