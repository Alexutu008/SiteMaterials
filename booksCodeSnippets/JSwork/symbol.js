const length = Symbol("length");
Array.prototype[length] = 0;
console.log([1, 2].length);
// → 2
console.log([1, 2][length]);
// → 0