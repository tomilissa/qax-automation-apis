# Quick Task

## Formato esperado de entrega
- 📁 Carpeta: `Stage_1/Quick_Task/mi_ficha.js`
- 🗒️ Objetivo: practicar inicialización de variables, tipos de datos y funciones básicas (console.log, typeof, .length, prompt).

Instrucciones:
1. Crea un archivo llamado mi_ficha.js.
2. Dentro, guarda tu información en variables:

 - Tu nombre (string)
 - Tu edad (number)
 - Si estás estudiando automatización en APIs (boolean)
 - Tu lista de hobbies (array)

3. Muestra la información en pantalla usando console.log().

4. Usa typeof para imprimir el tipo de cada variable.

5. Pregunta al usuario (usando prompt()) cuál es su hobby favorito y agrega ese hobby a tu lista.

6. Muestra cuántos hobbies hay en total usando la propiedad .length.

7. Cambia el valor de edad sumándole 1 (como si hubieras cumplido años) y vuelve a mostrarlo en pantalla.


Casos de Prueba:

CP-1: Visualización inicial de la información personal

Given que el script mi_ficha.js contiene las variables nombre, edad, estudiandoAutomatizacion y hobbies con valores iniciales.
When se ejecuta el script mi_ficha.js
Then la consola debe mostrar la información de cada variable.

CP-2: Verificación de tipos de datos

Given que el script mi_ficha.js contiene variables de diferentes tipos (string, number, boolean, array).
When se utiliza el operador typeof para cada variable.
Then la consola debe mostrar los tipos de dato correctos: "string", "number", "boolean" y "object".

CP-3: Agregar un hobby a la lista
Given que el script ha inicializado la lista de hobbies.
When el usuario ingresa un nuevo hobby
Then el nuevo hobby es agregado a la lista y la consola debe mostrar la lista actualizada.

CP-4: Recuento total de hobbies
Given que la lista de hobbies ha sido actualizada con un nuevo elemento.
When se accede a la propiedad .length de la lista de hobbies.
Then la consola debe mostrar el número total de hobbies en la lista actualizado.

CP-5: Actualización de la edad
Given que el script contiene la variable edad con su valor inicial.
When se suma 1 al valor de la variable edad.
Then la consola debe mostrar el nuevo valor de la edad (edad inicial + 1).




Ejecución (comandos o pasos):
1. Descargar el repositorio
2. Abrir una nueva terminal desde la carpeta "qax-automation-apis"
3. Cambiar de ubicación utilizando el comando: cd Stage_1/Quick_Task
4. Ejecutar el comando: node mi_ficha.js

🖼️ Evidencias en: Stage_1/Quick_Task/Evidences
