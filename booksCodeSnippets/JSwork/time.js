console.log(new Date(Date.now()));
console.log(/🍎{3}/u.test("🍎🍎🍎"));
console.log(/🍎{6}/.test("🍎🍎🍎"));

let adunare = Function("termen1, termen2", 'console.log(termen1+temermen2)');
adunare(10,100);