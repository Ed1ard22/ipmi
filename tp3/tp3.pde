/*  ----------------------------------------------------------
    OP‑ART interactivo – Trabajo recuperatorio Programación 1
    Autor: Eduardo Toranza  |  Lic. Diseño Multimedial – UNLP
    link video explicativo: https://youtu.be/n53DOmSIE5w?si=GCMo_Y9uzGCZLmZg 
    ----------------------------------------------------------
    Controles:
      + / –        : agrandar / achicar azulejos
      C            : modo colores aleatorios ON/OFF
      I            : alterna crecimiento dinámico de mini‑cuadrados
      0            : reiniciar sketch a valores originales
   ---------------------------------------------------------- */

PImage refImg;

// ---------- variables “de estado” ----------
int   tileSize       = 40;   // tamaño de un azulejo grande
final int defaultTS  = 40;   // copia para reset
boolean randomMode   = false;
boolean dynamicMini  = true; // mini‑cuadrados crecen según el mouse

void setup() {
  size(800, 400);         // 800×400 píxeles
  refImg = loadImage("F_13.jpg");   //  ⬅️  imagen de referencia
  imageMode(CORNER);
  rectMode(CORNER);
  noStroke();
}

void draw() {  
  background(255);

  // ----- 1) Referencia estática a la izquierda -----
  image(refImg, 0, 0, 400, 400);

  // ----- 2) Obra OP‑ART interactiva a la derecha -----
  pushMatrix();
  translate(400, 0);            // nos movemos al panel derecho
  drawOpArt(tileSize);          // ⬅️ función “void” con parámetro
  popMatrix();

  // Pequeña ayuda en pantalla
  fill(0);
  textSize(11);
  text("'+/-' tamaño | 'C' random color | 'I' mini dinámico | '0' reset", 10, height-8);
}

// --------------------------------------------------
// FUNCIÓN VOID con parámetro (NO retorna)
// Dibuja la cuadrícula de azulejos y mini‑cuadrados
// --------------------------------------------------
void drawOpArt(int ts) {
  int cols = ceil(400.0 / ts);      // cantidad de columnas/filas (400 px de ancho)
  float maxD = sqrt(2 * 200 * 200); // distancia máxima posible al centro de un tile

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < cols; j++) {
      float x = i * ts;
      float y = j * ts;

      boolean isBlack = (i + j) % 2 == 0;       // damero clásico
      if (randomMode) {                         // modo color aleatorio
        fill(random(255));
      } else {
        fill(isBlack ? 0 : 255);
      }
      rect(x, y, ts, ts);

      // ---- mini‑cuadrados en las 4 esquinas ----
      float dMouse = dist(mouseX - 400, mouseY, x + ts * .5, y + ts * .5);
      float mini   = smallSquare(ts, dMouse, maxD);   // ⬅️ función que SÍ retorna

      fill(randomMode ? random(255) : (isBlack ? 255 : 0));
      float gap = 2;  // pequeño margen de separación
      rect(x + gap,           y + gap,            mini, mini);
      rect(x + ts - mini-gap, y + gap,            mini, mini);
      rect(x + gap,           y + ts - mini - gap,mini, mini);
      rect(x + ts - mini-gap, y + ts - mini - gap,mini, mini);
    }
  }
}

// ---------------------------------------------------------------------
// FUNCIÓN que SÍ RETORNA un valor float
// Calcula dinámicamente el tamaño de cada mini‑cuadrado
// ---------------------------------------------------------------------
float smallSquare(float big, float d, float maxDist) {
  if (!dynamicMini) return big * .15;          // tamaño fijo si la opción está OFF
  // map(): cuanto más cerca el mouse, más grande el mini‑cuadrado
  return map(d, 0, maxDist, big * .3, big * .1);
}

// --------------------------------------------------
// Interacción con el teclado
// --------------------------------------------------
void keyPressed() {
  if (key == '+' || key == '=') {                 // agrandar
    tileSize = min(tileSize + 4, 80);
  } else if (key == '-') {                        // achicar
    tileSize = max(tileSize - 4, 10);
  } else if (key == 'c' || key == 'C') {          // color aleatorio ON/OFF
    randomMode = !randomMode;
  } else if (key == 'i' || key == 'I') {          // mini dinámico ON/OFF
    dynamicMini = !dynamicMini;
  } else if (key == '0') {                        // reiniciar TODO
    tileSize    = defaultTS;
    randomMode  = false;
    dynamicMini = true;
  }
}
