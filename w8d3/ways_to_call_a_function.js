function Cat () {
    this.name = 'Markov';
    this.age = 3;
}

function Dog () {
    this.name = 'Noodles';
    this.age = 4;
}

Dog.prototype.chase = function (cat) {
    console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

console.log("method style calling. this is set to Noodles");
Noodles.chase(Markov);


console.log("\n")
console.log("call and apply change the identity of this.");
console.log("\n")
console.log("Noodles.chase.call(Markov, Noodles)");
Noodles.chase.call(Markov, Noodles);
// .call makes the first argument as 'this'

console.log("\n")
console.log("Noodles.chase.apply(Markov, [Noodles])");
Noodles.chase.apply(Markov, [Noodles]);
// .apply is similar, but we need to pass it an array of arguments