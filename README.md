# Buscaminas
La aplicación fue desarrollada utilizando Flutter y probada en un dispositivo físico Android.

---

## Funcionalidades implementadas

### Audio
Se incorporaron efectos de sonido utilizando el paquete audioplayers.
- Reproducción de sonido al revelar una celda segura.
- Reproducción de sonido de explosión al seleccionar una mina.


### Acelerómetro
Se utilizó el paquete sensors_plus para acceder al acelerómetro del dispositivo.
- Al finalizar el juego, el usuario puede reiniciar la partida agitando el dispositivo.
- Se registran los valores del eje X del acelerómetro utilizando Logger.i para validar el funcionamiento del sensor.
- Esta funcionalidad fue probada en un dispositivo físico, ya que los emuladores y plataformas de escritorio no cuentan con sensores reales.

### Compartir resultado
Se integró el paquete share_plus para permitir compartir el resultado del juego.
- Se agregó un botón de compartir en el AppBar de la pantalla del juego.
- El botón solo se muestra cuando la partida ha finalizado.
- El mensaje compartido incluye el nombre del juego, la dificultad y el tiempo de supervivencia.

### Reloj de juego
- Se implementó un temporizador que comienza cuando el jugador toca una celda.
- El tiempo transcurrido se muestra en pantalla y se incluye en el mensaje de compartido.

## Consideraciones
Las funcionalidades relacionadas con sensores fueron probadas en un dispositivo físico, debido a que los emuladores y entornos de escritorio no cuentan con acelerómetro real, lo que puede generar problemas en la ejecución.

## Trabajos futuros
Como posibles mejoras y extensiones del proyecto están las siguientes:
- Implementar la detección de victoria al descubrir todas las celdas sin minas.
- Agregar un sistema de puntuación o ranking basado en el tiempo de resolución.
- Incorporar animaciones y efectos visuales para mejorar la experiencia de usuario.
- Permitir la configuración dinámica del número de minas según la dificultad.
- Integrar persistencia de datos para guardar estadísticas del jugador entre partidas.
