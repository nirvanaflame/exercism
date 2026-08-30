import ballerina/lang.array;

string[] yacht_category = [
    "yacht", "ones", "twos", "threes", "fours", "fives", "sixes",
    "full house", "little straight", "big straight",
    "four of a kind", "choice"
];

public function score(int[] dice, string category) returns int {
    int[] sorted_dice = array:sort(dice);

    int res = 0;
    int cat = yacht_category.indexOf(category) ?: 0;
    match cat {
        0 => { res = is_yacht(dice) ? 50 : 0; }
        1|2|3|4|5|6 => { res = int:sum(0, ...dice.filter(x => x == cat)); }
        7 => { res = is_full_house(sorted_dice) ? int:sum(0, ...dice) : 0; }
        8 => { res = sorted_dice == [1,2,3,4,5] ? 30 : 0; }
        9 => { res = sorted_dice == [2,3,4,5,6] ? 30 : 0; }
        10 => { res = is_four_of_kind(sorted_dice) ? sum_of_four(sorted_dice) : 0; }
        11 => { res = int:sum(0, ...dice); }
    }
   
    return res;
}

function is_yacht(int[] dice) returns boolean {
    return 1 == (map from int d in dice select [d.toString(), 0] on conflict()).length();
}

function is_full_house(int[] dice) returns boolean {
    return !is_yacht(dice) && (
        (dice[0] == dice[2] && dice[3] == dice[4]) 
        || (dice[0] == dice[1] && dice[2] == dice[4])
    );
}

function is_four_of_kind(int[] dice) returns boolean {
    return dice[0] == dice[3] || dice[1] == dice[4];
}


function sum_of_four(int[] dice) returns int {
    return int:sum(0, ...(dice[0] == dice[1] ?
        dice.slice(0, 4) :
        dice.slice(1, 5)
    ));
}
