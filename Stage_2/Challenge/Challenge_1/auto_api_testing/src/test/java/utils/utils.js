function fn() {
    return {
        generarTitulo: function() {
            var timestamp = new Date().getTime();
            return 'Post de prueba ' + timestamp;
        },
        generarBody: function() {
            return 'Este es un body generado dinámicamente para pruebas con Karate.';
        },
        generarUserId: function() {
            return Math.floor(Math.random() * 100) + 1;
        }
    };
}