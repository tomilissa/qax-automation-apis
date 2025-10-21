const prompt = require('prompt-sync')({sigint: true});

let nombre = 'Tomas';
var edad = 32;
let estudioAutomation = true;
let hobbies = ['Futbol',  'Tenis',  'PS5'];
var edad = 33;

console.log('Nombre: ' + nombre);
console.log('Edad: ' + edad);
console.log('Estudio Automation: ' + estudioAutomation);
console.log('Hobbies: ' + hobbies);

console.log(typeof nombre);
console.log(typeof edad);
console.log(typeof estudioAutomation);
console.log(typeof hobbies);

var nuevoHobbie;

var nuevoHobbie = prompt("¿Cuál es tu hobby favorito?");
hobbies.push(nuevoHobbie);
console.log(hobbies.length);