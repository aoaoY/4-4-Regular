float mappedRandom;
float preMappedRandom; // aux

float mappedRandom_1;
float preMappedRandom_1; // color

float mappedPerlin;
float preMappedPerlin; // mainobject

float mappedPerlin_1;
float preMappedPerlin_1;


float f=0.0; // bleed
float dif;
float d=1.5;

float dura; 
float g=20.0;

void setup() {
  size(1500, 400);
  pixelDensity(displayDensity());
  smooth();
  background(255);
}

void draw() {
  //background(231, 230, 255);
  translate(0, cos(frameCount)*height/2);

  dura=width/frameCount/2;

  stroke(231, 230, 255);
  strokeWeight(1.5);
  line(frameCount*4, 0, frameCount*4, height); // display vertical line


  preMappedRandom = mappedRandom;
  mappedRandom=map(random(1), 0, 1, 0, height);
  dif=random(-20, 20);

  noStroke();
  //stroke(0,50);
  //strokeWeight(1);
  //point(frameCount*2, mappedRandom);
  fill(0, 100);
  ellipse(frameCount*4, mappedRandom, 3*d, 3*d);
  fill(255, 240, 0);
  ellipse(frameCount*4, mappedRandom, 2*d, 2*d);
  fill(255, 173, 34);
  ellipse(frameCount*4, mappedRandom, d, d); // display decorative point


  stroke(0, 255, 0);
  strokeWeight(0.3);
  line(frameCount*6, mappedRandom, (frameCount-1)*6, preMappedRandom);// display color1
  stroke(255, 235, 140);
  strokeWeight(0.5);
  line(frameCount*6, mappedRandom+dif, (frameCount-1)*6, preMappedRandom+dif); // display color2

  noFill();
  preMappedRandom_1 = mappedRandom_1;
  mappedRandom_1=map(random(1), 0, 1, 2*f, height-2*f);
  strokeWeight(0.5);
  stroke(231, 230, 255);
  line(width-frameCount*6, mappedRandom_1, width-(frameCount-1)*6, preMappedRandom_1); // display color3
  strokeWeight(0.3);
  stroke(252, 56, 149);
  line(width-frameCount*6, mappedRandom_1+dif, width-(frameCount-1)*6, preMappedRandom_1+dif); // display color4


  translate(frameCount*3, -cos(frameCount)*200);
  preMappedPerlin = mappedPerlin;
  mappedPerlin=map(noise(frameCount/100.0), 0, 1, f, height-f);
  strokeWeight(1);
  stroke(12, 0, 217, 100);
  point(frameCount*2, mappedPerlin);
  ellipse(frameCount*2, mappedPerlin, 3*d, 3*d); // display centerellipse
  strokeWeight(1);
  stroke(255, 14, 38);
  line(frameCount*2, mappedPerlin, (frameCount-1)*2, preMappedPerlin);
  mappedPerlin=map(noise(frameCount/5.0), 0, 1, f, height-f); // display mainobject

  //saveFrame("ink-####.png");
  //fill(0);
  //noStroke();
  //rect(0, 0, g, g);
  //rect(0, height-g, g, g);

  //stroke(0);
  //strokeWeight(2);
  //line(0,0,0,g);


  //rotate(PI);
  //preMappedPerlin_1 = mappedPerlin_1;
  //mappedPerlin_1=map(noise(frameCount/100.0), 0, 1, f, height/2-f);
  //strokeWeight(1);
  //stroke(12, 0, 217, 150);
  //point(frameCount*2, mappedPerlin_1);
  //ellipse(frameCount*2, mappedPerlin_1, 5, 5);
  //strokeWeight(1);
  //stroke(255, 14, 38);
  //line(frameCount*2, mappedPerlin_1, (frameCount-1)*2, preMappedPerlin_1);
  //mappedPerlin_1=map(noise(frameCount/5.0), 0, 1, f, height-f);
}
