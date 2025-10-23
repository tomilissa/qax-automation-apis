function generarEmail() {
var timestamp = new Date().getTime();
return 'usuario' + timestamp + '@qaxpert.com';
}

function fn() {
return { generarEmail: generarEmail };
}