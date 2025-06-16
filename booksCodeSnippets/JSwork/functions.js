const halve = function (x) {
  return x / 2;
}

function add(x, y) {
  return x + y;
}

const add1 = (x, y) => {
  return x + y;
}
//+-+-+-+-+-+-+-

function multiply(factor) {
  return number => number * factor;
}
let twice = multiply(2);
console.log(twice(5));

//+-+-+-+-+-+-+-+-
function repeat(n, action) {
  for (let i = 0; i < n; i++) {
    action(i);
  }
}
function unless(test, then) {
  if (!test) then();
}
repeat(3, n => {
  unless(n % 2 == 1, () => {
    console.log(n, "is even");
  });
});