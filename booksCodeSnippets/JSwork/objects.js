class Rabbit {
    constructor(type) {
        this.type = type;
    }
    speak(line) {
        console.log(`The ${this.type} rabbit says '${line}'`);
    }
}
let killerRabbit = new Rabbit("killer");


// function ArchaicRabbit(type) {
//     this.type = type;
// }
// ArchaicRabbit.prototype.speak = function (line) {
//     console.log(`The ${this.type} rabbit says '${line}'`);
// };
// let oldSchoolRabbit = new ArchaicRabbit("old school");

console.log(Object.getPrototypeOf(Rabbit) == Function.prototype);
// → true
console.log(Object.getPrototypeOf(killerRabbit) == Rabbit.prototype);
// → true