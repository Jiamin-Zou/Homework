console.log(`==*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*==`);
console.log(`Phase I - JS Fundamentals`);
console.log(`==*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*==`);
console.log(`\n`);

console.log(`===========================`);
function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
      var x = 'in block';  
      console.log(x);
    }
    console.log(x);
}

mysteryScoping1();
// in block
// in block


console.log(`===========================`);
function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
      const x = 'in block';  
      console.log(x);
    }
    console.log(x);
}

mysteryScoping2();
// in block
// out of block


console.log(`===========================`);
// function mysteryScoping3() {
//     const x = 'out of block';
//     if (true) {
//       var x = 'in block';  
//       console.log(x);
//     }
//     console.log(x);
// }

// mysteryScoping3();
// var x = 'in block';  
//     ^
// SyntaxError: Identifier 'x' has already been declared


console.log(`===========================`);
function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
      let x = 'in block';  
      console.log(x);
    }
    console.log(x);
}

mysteryScoping4();
// in block
// out of block


console.log(`===========================`);
// function mysteryScoping5() {
//     let x = 'out of block';
//     if (true) {
//       let x = 'in block';  
//       console.log(x);
//     }
//     let x = 'out of block again';
//     console.log(x);
// }

// mysteryScoping5();
// let x = 'out of block again';
//     ^
// SyntaxError: Identifier 'x' has already been declared
console.log(`===========================`);

console.log(`\n\n`);
console.log(`==*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*==`);
console.log(`Phase II - JS Looping Constructs`);
console.log(`==*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*==`);
console.log(`\n`);

console.log(`===========================`);
function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`;
}
console.log(`madLib(verb, adj, noun)`);
console.log(madLib('make', 'best', 'guac'));


console.log(`===========================`);
function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}
console.log(`isSubstring(searchString, subString)`);
console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));


console.log(`===========================`)
function fizzBuzz(array) {
  var arr = []
  array.forEach(num=> {
    if ((num % 3 === 0) ^ (num % 5 === 0)) {
      arr.push(num);
    }
  });
  return arr;
}
console.log(`fizzBuzz(array)`);
console.log(fizzBuzz([3, 4, 6, 7, 10, 12, 15, 25, 30])); // [ 3, 6, 10, 12, 25 ]


console.log(`===========================`)
function isPrime(num) {
  if (num < 2) {
    return false;
  }

  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}
console.log(`isPrime(num)`);
console.log(isPrime(-1));
console.log(isPrime(0));
console.log(isPrime(1));
console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));


console.log(`===========================`);
function sumOfNPrimes(n) {
  let sum = 0;
  let count = 0;
  let i = 2;

  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
    i++;
  }
  return sum;
}
console.log(`sumOfNPrimes(n)`);
console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));
console.log(`===========================`);