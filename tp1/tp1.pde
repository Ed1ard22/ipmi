void setup () {

PImage miFoto;

//cargar la imagen en la variable:
miFoto = loadImage ("retrato proccesing.jpeg");

//dimension de la ventana:
size (800,400);

//fondo:
background(200, 190, 180); // color cerámico claro

// línea de azulejos (cuadritos) en la parte de arriba
for (int i = 0; i < width; i += 20) {
  if ((i / 20) % 2 == 0) {
    fill(50); // oscuro
  } else {
    fill(180); // claro
  }
  rect(i, 100, 20, 20);
}

//muestro la imagen:
image( miFoto , 0 , 0 , 400 ,400);

//rostro:
fill (255,220,200);
noStroke();
ellipse ( 600, 210, 195, 260);

//ojos:
fill(255); //blanco de los ojos
ellipse(550, 190, 50, 25);
ellipse(650, 190, 50, 25);

//irirs marron miel (mas grande):
fill(153, 101, 21); // Color marrón miel
ellipse(550, 190, 30, 27); // Iris

//pupila negra (mas chica, centrada):
fill(0); // Negro
ellipse(550, 190, 15, 15); // Pupila

//brillo en el ojo:
fill(255);  // Blanco
ellipse(555, 185, 5, 5);  // Pequeño brillo arriba a la derecha

//ojo izquierdo:
// Iris marrón miel 
fill(153, 101, 21); // Color marrón miel
ellipse(650, 190, 30, 27); // Iris

//pupila negra:
fill(0);  // Negro
ellipse(650, 190, 15, 15); // Pupila

//brillo en el ojo:
fill(255); // Blanco
ellipse(655, 185, 5, 5); // Pequeño brillo arriba a la derecha

//ceja izquierda:
fill(80, 50, 20); // color marrón oscuro
noStroke();
beginShape();
vertex(520, 165); // punto más bajo (inicio cerca de la nariz)
bezierVertex(535, 155, 565, 155, 580, 165); // curva superior
bezierVertex(565, 170, 535, 170, 520, 165); // termina recto
endShape(CLOSE);

//ceja derecha:
fill(80, 50, 20); // color marrón oscuro
noStroke();
beginShape();
vertex(620, 165); // punto más bajo (inicio cerca de la nariz)
bezierVertex(635, 155, 665, 155, 680, 165); // curva superior
bezierVertex(665, 170, 635, 170, 620, 165); // termina recto
endShape(CLOSE);

//labios
fill(255, 200, 180);  // color de piel (tono claro)
noStroke();
ellipse(600, 280, 60, 20);  // labios cerrados

// Línea en el centro 
stroke(255, 160, 140);  // color más oscuro para la línea
strokeWeight(2);  // grosor de la línea
line(570, 280, 629, 280);  // línea horizontal en el medio de los labios

//nariz:
fill(255, 200, 180);
noStroke();
triangle(600, 210, 585, 255, 615, 255);

//pelo:
fill(60, 40, 20); // color del pelo (castaño oscuro)
noStroke();

beginShape();
// Lado izquierdo del pelo
vertex(500, 150);
vertex(510, 140);
vertex(520, 150);

// Primera punta que baja un poco (mechón)
vertex(525, 165);
vertex(530, 150);

vertex(540, 145);
vertex(550, 165); // otra punta más baja
vertex(555, 150);

vertex(565, 140);
vertex(570, 160); // otra punta
vertex(575, 150);

vertex(580, 145);
vertex(585, 165); // esta punta toca un poquito la ceja

vertex(590, 150);
vertex(600, 140);
vertex(610, 150);
vertex(620, 160); // mechón central que puede caer más

vertex(630, 150);
vertex(640, 145);
vertex(645, 165); // otra punta

vertex(650, 150);
vertex(660, 140);
vertex(670, 155);
vertex(680, 150);
vertex(690, 140);

// Cierra el contorno por arriba de la cabeza
vertex(690, 80);
vertex(500, 80);
endShape(CLOSE);

//cuello:

fill(255,220,200); // mismo color de piel
noStroke();
rect(560, 300, 80, 50); // ancho y largo del cuello

//ropa:
// camiseta azul
fill(0, 80, 200); // azul fuerte
beginShape();
vertex(560, 350);
vertex(640, 350);
vertex(670, 400);
vertex(530, 400);
endShape(CLOSE);

// campera negra con blanco
fill(30); // negro
beginShape();
vertex(530, 350);
vertex(570, 330);
vertex(570, 400);
vertex(500, 400);
endShape(CLOSE);

beginShape();
vertex(630, 330);
vertex(670, 350);
vertex(700, 400);
vertex(630, 400);
endShape(CLOSE);
}
