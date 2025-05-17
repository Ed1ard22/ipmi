PImage[] imagenes = new PImage[3];
PFont fuente;
int estado = 0; // 0: inicio, 1-3: pantallas, 4: fin
int tiempoInicio;
int duracionPantalla = 15000; // 15 segundos por pantalla
float opacidadTexto = 0;
boolean aumentando = true;

void setup() {
  size(640, 480);
  // Cargar imágenes
  imagenes[0] = loadImage("rainroom1.jpg");
  imagenes[1] = loadImage("rainroom2.jpg");
  imagenes[2] = loadImage("rainroom3.jpg");
  // Cargar fuente
  fuente = createFont("Arial", 24);
  textFont(fuente);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(0);
  switch(estado) {
    case 0:
      // Pantalla de inicio
      fill(255);
      textSize(32);
      text("Presentación: Rain Room", width/2, height/2 - 40);
      rectMode(CENTER);
      fill(100, 100, 255);
      rect(width/2, height/2 + 40, 200, 50);
      fill(255);
      textSize(20);
      text("Iniciar", width/2, height/2 + 40);
      break;
    case 1:
    case 2:
    case 3:
      // Pantallas de presentación
      image(imagenes[estado - 1], 0, 0, width, height);
      // Animación de opacidad del texto
      if (aumentando) {
        opacidadTexto += 2;
        if (opacidadTexto >= 255) aumentando = false;
      } else {
        opacidadTexto -= 2;
        if (opacidadTexto <= 0) aumentando = true;
      }
      fill(255, opacidadTexto);
      textSize(24);
    String texto = "";

if (estado == 1) {
  texto = "Rain Room es una instalación inmersiva\ndonde la lluvia se detiene al caminar,\ncreando una experiencia personal única.";
}
else if (estado == 2) {
  texto = "Utiliza sensores 3D y tecnología de seguimiento\npara detectar a los visitantes y controlar la caída del agua\nen tiempo real.";
}
else if (estado == 3) {
  texto = "Creada por Random International,\nRain Room explora la relación entre el ser humano,\nla tecnología y la naturaleza artificial.";
  }

// texto animado con opacidad cambiante
fill(255, opacidadTexto);
textSize(20);
text(texto, width/2, height - 80);

      // Cambio automático de pantalla
      if (millis() - tiempoInicio > duracionPantalla) {
        estado++;
        tiempoInicio = millis();
      }
      break;
    case 4:
      // Pantalla final con botón de reinicio
      fill(255);
      textSize(32);
      text("Fin de la presentación", width/2, height/2 - 40);
      rectMode(CENTER);
      fill(100, 255, 100);
      rect(width/2, height/2 + 40, 200, 50);
      fill(0);
      textSize(20);
      text("Reiniciar", width/2, height/2 + 40);
      break;
  }
}

void mousePressed() {
  if (estado == 0) {
    // Botón de inicio
    if (mouseX > width/2 - 100 && mouseX < width/2 + 100 &&
        mouseY > height/2 + 15 && mouseY < height/2 + 65) {
      estado = 1;
      tiempoInicio = millis();
    }
  } else if (estado == 4) {
    // Botón de reinicio
    if (mouseX > width/2 - 100 && mouseX < width/2 + 100 &&
        mouseY > height/2 + 15 && mouseY < height/2 + 65) {
      estado = 0;
    }
  }
}
