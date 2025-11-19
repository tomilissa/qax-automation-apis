function fn() {
  // 1️⃣ Lee el entorno actual (por ejemplo: -Dkarate.env=qa)
  var env = karate.env || 'dev';

  // 2️⃣ Inicializa el objeto config
  var config = {
    env: env
  };

  // 3️⃣ Configuración base por entorno
  if (env == 'dev') {
    config.baseUrl = 'https://api.restful-api.dev';
  } else if (env == 'qa') {
    config.baseUrl = 'https://qa.api.restful-api.dev';
  } else if (env == 'stage') {
    config.baseUrl = 'https://stage.api.restful-api.dev';
  } else if (env == 'prod') {
    config.baseUrl = 'https://prod.api.restful-api.dev';
  }

  // 4️⃣ Permite sobrescribir baseUrl desde la consola (opcional)
  // Ejemplo: mvn test -DbaseUrl=https://custom-url.dev/api
  var customBase = karate.properties['baseUrl'];
  if (customBase) {
    config.baseUrl = customBase;
  }

  // 5️⃣ Configuración global del comportamiento de Karate
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 15000);
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);

  // 6️⃣ Retorna el objeto de configuración
  return config;
}
