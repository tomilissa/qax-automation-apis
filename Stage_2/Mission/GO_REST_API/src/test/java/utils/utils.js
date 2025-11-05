function fn() {
    return {
        generarName: function() {
            var num= Math.floor(Math.random() * 100) + 1;
            var num_2= Math.floor(Math.random() * 10) + 1;
            var name= num_2+'qax' + num;
            return name;
            },

        generarEmail: function() {
            var timestamp = new Date().getTime();
            var email = 'usuario' + timestamp + '@qaxpert.com';
            return email;
            },

        generarGender: function() {
            var genders = ["Male", "Female"];
            var indiceAleatorio = Math.floor(Math.random() * genders.length);
            return genders[indiceAleatorio];
            },
            
        generarTitulo: function() {
            var timestamp = new Date().getTime();
            return 'Post de prueba de Tomas ' + timestamp;
        },
        generarBody: function() {
            return 'Este es un body generado dinámicamente para pruebas con Karate de Tomas.';
        },    
    };
}