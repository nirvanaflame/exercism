# Returns the string `Hello` with the input string name.
#
# + planet - planet name as a string
# + seconds - person's age measured in seconds
# + return - person's age in years of that planet, or error if unknown planet.
function age(string planet, int seconds) returns float|error {
    float earchYear = <float>seconds / 31557600.0;
    float res = 0f;
    match planet {
        "Earth" => {res = earchYear;}
        "Mercury" => {res = earchYear / 0.2408467;}
        "Venus" => {res = earchYear / 0.61519726;}
        "Mars" => {res = earchYear / 1.8808158;}
        "Jupiter" => {res = earchYear / 11.862615;}
        "Saturn" => {res = earchYear / 29.447498;}
        "Uranus" => {res = earchYear / 84.016846;}
        "Neptune" => {res = earchYear / 164.79132;}
        _ => {return error("not a planet");}        
    }

    return res.round(2);
}
