# Quick Task

### 📁 Archivo
`Stage_1/Quick_Task/mi_ficha.js`

### 🗒️ Objetivo
Practicar la inicialización de variables, tipos de datos y el uso de funciones básicas (`console.log`, `typeof`, `.length`, `prompt`).

### 👩‍💻 Instrucciones
1.  Crea un archivo llamado `mi_ficha.js`.
2.  Dentro, guarda tu información en variables:
    *   Tu nombre (string)
    *   Tu edad (number)
    *   Si estás estudiando automatización en APIs (boolean)
    *   Tu lista de hobbies (array)
3.  Muestra la información de cada variable en la consola usando `console.log()`.
4.  Usa `typeof` para imprimir el tipo de cada variable en la consola.
5.  Pregunta al usuario cuál es su hobby favorito y agrega ese hobby a tu lista de hobbies.
6.  Muestra la cantidad total de hobbies usando la propiedad `.length`.
7.  Cambia el valor de la variable `edad` sumándole 1 (como si hubieras cumplido años) y vuelve a mostrarlo en la consola.

### ✅ Casos de Prueba

#### **CP-1: Visualización inicial de la información personal**
*   **Given:** El script `mi_ficha.js` contiene las variables `nombre`, `edad`, `estudiandoAutomatizacion` y `hobbies` con valores iniciales.
*   **When:** Se ejecuta el script `mi_ficha.js`.
*   **Then:** La consola debe mostrar la información de cada variable.

#### **CP-2: Verificación de tipos de datos**
*   **Given:** El script `mi_ficha.js` contiene variables de diferentes tipos (string, number, boolean, array).
*   **When:** Se utiliza el operador `typeof` para cada variable.
*   **Then:** La consola debe mostrar los tipos de dato correctos: `"string"`, `"number"`, `"boolean"` y `"object"`.

#### **CP-3: Agregar un hobby a la lista**
*   **Given:** El script ha inicializado la lista de `hobbies`.
*   **When:** El usuario ingresa un nuevo hobby.
*   **Then:** El nuevo hobby es agregado a la lista y la consola debe mostrar la lista actualizada.

#### **CP-4: Recuento total de hobbies**
*   **Given:** La lista de `hobbies` ha sido actualizada con un nuevo elemento.
*   **When:** Se accede a la propiedad `.length` de la lista de `hobbies`.
*   **Then:** La consola debe mostrar el número total de hobbies en la lista actualizado.

#### **CP-5: Actualización de la edad**
*   **Given:** El script contiene la variable `edad` con su valor inicial.
*   **When:** Se suma 1 al valor de la variable `edad`.
*   **Then:** La consola debe mostrar el nuevo valor de la edad (`edad` inicial + 1).



### 🚀 Ejecución (comandos o pasos):
1.  Clona o descarga el repositorio.
2.  Abre una nueva terminal en la carpeta raíz `qax-automation-apis`.
3.  Cambia al directorio del proyecto con el comando: cd Stage_1/Quick_Task
4.  Ejecuta el script con el comando: node mi_ficha.js

### 🖼️ Evidencias: 
- Stage_1/Quick_Task/Evidences
