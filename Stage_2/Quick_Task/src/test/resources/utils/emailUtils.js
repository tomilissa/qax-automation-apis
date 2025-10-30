function fn() {
function generarEmail() {
var timestamp = new Date().getTime();
return 'usuario' + timestamp + '@qaxpert.com';
}

return { generarEmail: generarEmail };
}