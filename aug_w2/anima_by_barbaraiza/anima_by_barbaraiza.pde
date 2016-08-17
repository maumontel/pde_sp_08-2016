PImage img1;
PImage img2;
PImage img3;


void setup() {
  size(149, 210);
  img1 = loadImage("img1.png");
  img2 = loadImage("img2.png");
  img3= loadImage("img3.png");
}

void draw() {
  if (key == 'o') {
  image(img1, 0, 0, 149, 210);
  }
  if (key == 'u') {
    image(img2, 0, 0, 149, 210);
  }
  if (key == 'i') {
    image(img3, 0, 0, 149, 210);
  }
}

