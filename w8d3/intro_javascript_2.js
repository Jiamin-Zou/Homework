// Phase I
function titleize(names, callback) {
    arr = names.map((name)=> `Mx. ${name} Jingleheimer Schmidt`);
    callback(arr);
}
const printCallback = function(arr) {
    arr.forEach(name => {console.log(name)});
};

titleize(["Mary", "Brian", "Leo"], printCallback);


// Phase II
function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
};

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'` )
};

Elephant.prototype.grow = function() {
    this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick);
};

Elephant.prototype.play = function() {
    rand_i = Math.floor(Math.random() * this.tricks.length);
    console.log(`${this.name} is ${this.tricks[rand_i]}!`);
}

let dumbo = new Elephant("Dumbo", 40, ["flying in the air", "spraying water"])



// Phase III

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) {
    console.log(`🐘 ${elephant.name} is trotting by!`);
};

herd.forEach( elephant => {
    Elephant.paradeHelper(elephant);
});

// Phase IV
function dinerBreakfast(){
    let order = "I'd like cheesy scrambled eggs please.";
    console.log(order);

    return function(food) {
        order = `${order.slice(0, order.length - 8)} and ${food} please.`;
        console.log(order);
    }
}

let bfastOrder = dinerBreakfast();
// "I'd like cheesy scrambled eggs please"
bfastOrder("chocolate chip pancakes");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes please."
bfastOrder("grits");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes and grits please."