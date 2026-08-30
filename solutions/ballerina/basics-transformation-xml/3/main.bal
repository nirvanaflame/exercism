import ballerina/io;

function processFuelRecords(string inputFilePath, string outputFilePath) returns error? {
    xml input = check io:fileReadXml(inputFilePath);
    FillUpEntry[] entries = fromXml(input);

    table<FillUpDb> db = processRecords(entries);

    _ = check io:fileWriteXml(outputFilePath, employeeFuelRecordToXml(db));
}

function fromXml(xml fuelEvents) returns FillUpEntry[] {
    xmlns "http://www.so2w.org" as s;
    FillUpEntry[] typedEntries =
        from var event in fuelEvents/<s:FuelEvent>
    select {
        employeeId: checkpanic int:fromString(event?.employeeId ?: "0"),
        odometerReading: checkpanic int:fromString((event/<s:odometerReading>).data()),
        gallons: checkpanic decimal:fromString((event/<s:gallons>).data()),
        gasPrice: checkpanic decimal:fromString((event/<s:gasPrice>).data())
    };
    return typedEntries;
}

function employeeFuelRecordToXml(table<FillUpDb> db) returns xml {
        var response = from var {employeeId: id, gasFillUpCount: gas, totalFuelCost: cost, totalGallons: gallons, totalMilesAccrued: miles} in db
        order by id
        select {employeeId: id, gasFillUpCount: gas, totalFuelCost: cost, totalGallons: gallons, totalMilesAccrued: miles};


    xml:Element fuelRecordsXml = xml `<s:employeeFuelRecords xmlns:s="http://www.so2w.org"></s:employeeFuelRecords>`;
    xmlns "http://www.so2w.org" as s;

    foreach var {employeeId, gasFillUpCount, totalFuelCost, totalGallons, totalMilesAccrued} in response {
        xml fuelRecordXml = xml `<s:employeeFuelRecord employeeId="${employeeId}"><s:gasFillUpCount>${gasFillUpCount}</s:gasFillUpCount><s:totalFuelCost>${totalFuelCost}</s:totalFuelCost><s:totalGallons>${totalGallons}</s:totalGallons><s:totalMilesAccrued>${totalMilesAccrued}</s:totalMilesAccrued></s:employeeFuelRecord>`;
        xml:setChildren(fuelRecordsXml, xml:getChildren(fuelRecordsXml) + fuelRecordXml);
    }
    return fuelRecordsXml;
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
