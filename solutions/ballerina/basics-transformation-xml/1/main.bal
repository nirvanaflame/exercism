import ballerina/xmldata;
import ballerina/io;

function processFuelRecords(string inputFilePath, string outputFilePath) returns error? {
    xml input = check io:fileReadXml(inputFilePath);
    FillUpEntry[] entries = parseXml(input);

    // table<FillUpDb> db = processRecords(entries);
    // var response = from var {employeeId: id, gasFillUpCount: gas, totalFuelCost: cost, totalGallons: gallons, totalMilesAccrued: miles} in db
    //     order by id
    //     select {employeeId: id, gasFillUpCount: gas, totalFuelCost: cost, totalGallons: gallons, totalMilesAccrued: miles};

    // _ = check io:fileWriteJson(outputFilePath, response.toJson());
}

function parseXml(xml fuelEvents) returns FillUpEntry[] {
    var events = fuelEvents.elementChildren();
    int n = events.length();

    FillUpEntry[] arr = []; 
    // foreach int i in 0..<1 {
    //     xml x = events.get(i);
    //     io:println(x);
    // }

    table<FillUpEntry> books = from var event in fuelEvents/<FuelEvent>
                    select {
                        employeeId: getEmployeeId(event),
                        gallons: getGallons(event),
                        gasPrice: 0,
                        odometerReading: 0
                    };



    // foreach xml fuelEvent in events {
    //     arr.push({
    //         employeeId: getEmployeeId(fuelEvent),
    //         gallons: 0,
    //         gasPrice: 0,
    //         odometerReading: 0
    //     });
    // }

    return books.toArray();
}

function getEmployeeId(xml:Element event) returns int {
    map<string> sad = event.getAttributes();
    string? s = sad["employeeId"];
    int res = checkpanic int:fromString(s ?: "0");
    return res;
}

function getGallons(xml:Element event) returns decimal {
    io:println("Was it even called");
    io:println("gallons nahui: " + event.<gallons>);
    return 0.0;
}

function processRecords(FillUpEntry[] entries) returns table<FillUpDb> {
    table<FillUpDb> key(employeeId) db = table [];

    foreach FillUpEntry entry in entries {
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
        "/home/nf/IdeaProjects/exercism/ballerina/basics-transformation-xml/tests/resources/example01_input.xml",
         "/home/nf/IdeaProjects/exercism/ballerina/basics-transformation-xml/tests/resources/test_output.xml");
    io:print(sad);
}