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
        },
        generarPassword: function() {
            var lower = 'abcdefghijklmnopqrstuvwxyz';
            var upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
            var digits = '0123456789';
            var specials = '!@#$%^&*()_+[]{}|;:,.<>?';

            // Tomamos al menos un caracter de cada tipo
            var password = '';
            password += lower.charAt(Math.floor(Math.random() * lower.length));
            password += upper.charAt(Math.floor(Math.random() * upper.length));
            password += digits.charAt(Math.floor(Math.random() * digits.length));
            password += specials.charAt(Math.floor(Math.random() * specials.length));

            // Rellenamos hasta 8 caracteres con cualquiera de los caracteres permitidos
            var allChars = lower + upper + digits + specials;
            while (password.length < 8) {
                password += allChars.charAt(Math.floor(Math.random() * allChars.length));
            }

            // Opcional: mezclar los caracteres para que no siempre empiece igual
            password = password.split('').sort(function () {
                return 0.5 - Math.random()
            }).join('');

            return password;
        },
        generarPasswordInvalida: function() {
            var lower = 'abcdefghijklmnopqrstuvwxyz';
            var upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
            var digits = '0123456789';
            var specials = '!@#$%^&*()_+[]{}|;:,.<>?';

            // Tomamos al menos un caracter de cada tipo
            var password = '';
            password += lower.charAt(Math.floor(Math.random() * lower.length));
            password += upper.charAt(Math.floor(Math.random() * upper.length));
            password += digits.charAt(Math.floor(Math.random() * digits.length));

            // Rellenamos hasta 8 caracteres con cualquiera de los caracteres permitidos
            var allChars = lower + upper + digits;
            while (password.length < 8) {
                password += allChars.charAt(Math.floor(Math.random() * allChars.length));
            }

            // Opcional: mezclar los caracteres para que no siempre empiece igual
            password = password.split('').sort(function () {
                return 0.5 - Math.random()
            }).join('');

            return password;
        },
        generarUsername: function() {
            var num= Math.floor(Math.random() * 100) + 1;
            var num_2= Math.floor(Math.random() * 10) + 1;
            var username= num_2+'qax' + num;
            return username;
        },
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