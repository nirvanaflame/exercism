import ballerina/io;

function processFuelRecords(string inputFilePath, string outputFilePath) returns error? {
    string[][]|io:Error input = check io:fileReadCsv(inputFilePath);

    if input is error {
        // do nothing
    } else {
        var entries = fromCsv(input);
        
        table<FillUpDb> db = processRecords(entries);
        var res = from var entry in db order by entry.employeeId select entry;
        
    _ = check io:fileWriteCsv(outputFilePath, toCsv(res));
    }
}

function fromCsv(string[][] matrix) returns FillUpEntry[] {
    FillUpEntry[] arr = [];
    foreach int i in 0..<matrix.length() {
        var row = matrix[i];
        arr.push({
            employeeId: asInt(row[0]),
            odometerReading: asInt(row[1]),
            gallons: asDecimal(row[2]),
            gasPrice: asDecimal(row[3])
        });
    }

    return arr;
}

function toCsv(table<FillUpDb> db) returns string[][] {
    string[][] matrix = [];
    foreach var entry in db {
        io:println(entry);
        string[] row = [
            entry.employeeId.toString(), 
            entry.gasFillUpCount.toString(),
            entry.totalFuelCost.toString(),
            entry.totalGallons.toString(),
            entry.totalMilesAccrued.toString()
        ];
        matrix.push(row);
    }

    return matrix;
}

function asInt(string s) returns int {
    return checkpanic int:fromString(s.trim());
}

function asDecimal(string s) returns decimal {
    return checkpanic decimal:fromString(s.trim());
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
