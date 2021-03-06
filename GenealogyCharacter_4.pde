int obNum=19; //number of mainobjects

float[] posXs= new float[obNum];
float[] posYs=new float[obNum];

float[] mapXs=new float[obNum];
float[] mapYs=new float[obNum];


float time;
float r=5.0; // radius of mainobject.red circle
float dia; // diameter of decoration.circle

float posX = 0, posY = 0; // position of mainobject & color.0.rose red
float posX_1=0, posY_1=0; // position of color.1.green
float posX_2=0, posY_2=0; // position of color.2.yellow
float mapX=0, mapY=0; // position of decoration.flying
//float posX_3=0, posY_3=0;
//float posX_4=0, posY_4=0;

float f=50.0; // bleed

void setup() {
  size(1500, 400);
  pixelDensity(displayDensity());
  //background(255);

  time=0;

  for (int i=0; i<posXs.length; i++) {
    posXs[i]=(float(i+1)*width)/(posXs.length+1); // create each mainobject
    posYs[i]=0;

    mapXs[i]=0;
    mapYs[i]=0;
  }
}

void draw() {
  time=frameCount/200.0; // speed of movement
  background(255);


  fill(252, 56, 149);
  stroke(255, 14, 38);
  strokeWeight(3);
  beginShape();
  curveVertex(0, 0);
  curveVertex(0, 0);
  while (posX <= width) {
    posY = map(noise(posX, time), 0, 1, 0, height/2);
    curveVertex(posX, posY);
    posX += width/(obNum+1);
  }
  curveVertex(width, 0);
  curveVertex(width, 0);
  endShape();
  posX=0; // display color.0.rose red

  fill(0, 246, 122);
  stroke(255, 235, 140);
  strokeWeight(3);
  beginShape();
  curveVertex(0, height);
  curveVertex(0, height);
  while (posX_1 <= width) {
    posY_1 = map(noise(posX_1, time), 0, 1, 2*height/3, height);
    curveVertex(posX_1, posY_1);
    posX_1 += width/(obNum+1);
  }
  curveVertex(width, height);
  curveVertex(width, height);
  endShape();
  posX_1=0; // display color.1.green

  fill(255, 235, 140);
  stroke(252, 56, 149);
  strokeWeight(3);
  beginShape();
  curveVertex(0, height);
  curveVertex(0, height);
  while (posX_2 <= width) {
    posY_2 = map(noise(posX_2, time), 0, 1, 4*height/5, height);
    curveVertex(posX_2, posY_2+30);
    posX_2 += width/(obNum+1)/2;
  }
  curveVertex(width, height);
  curveVertex(width, height);
  endShape();
  posX_2=0; // display color.2.yellow


  //noFill();
  //stroke(255, 14, 38);
  //strokeWeight(1.0);
  // while (posX_3 <= width) {
  //  posY_3 = map(noise(posX_3, time), 0, 1, 3*height/4, height);
  //  posX_3 += 1000/(obNum+1);
  //  triangle(posX_3-2*r, height,posX_3+2*r, height, posX_3, posY_3);
  //}
  //posX_3=0;

  //noFill();
  //stroke(255, 14, 38);
  //strokeWeight(4.0);
  //beginShape();
  //curveVertex(width, 0);
  //curveVertex(width, 0);
  //while (posY_3 <= height) {
  //  posX_3 = map(noise(posY_3, time), 0, 1, 3*width/4, width);
  //  curveVertex(posX_3, posY_3);
  //  posY_3 += 1000/(obNum+1);
  //}
  //curveVertex(width, height);
  //curveVertex(width, height);
  //endShape();
  //posY_3=0; // display color4

  //noFill();
  //stroke(255, 14, 38);
  //strokeWeight(3.0);
  //beginShape();
  //curveVertex(width, 0);
  //curveVertex(width, 0);
  //while (posY_4 <= height) {
  //  posX_4 = map(noise(posY_4, time), 0, 1, width/2, 3*width/4);
  //  curveVertex(posX_4, posY_4);
  //  posY_4 += 1000/(obNum+1);
  //}
  //curveVertex(width, height);
  //curveVertex(width, height);
  //endShape();
  //posY_4=0; // display color5



  noFill();
  for (int i=0; i<posXs.length; i++) {
    stroke(255, 14, 38);
    strokeWeight(1.0);
    ellipse(posXs[i], posYs[i], 2*r, 2*r); //  display mainobject.red circle
    posYs[i]=map(noise(posXs[i], time), 0, 1, f, height-f); // move mainobject


    float e=lerp(0.1, 2, mapXs[i]/width);
    //stroke(29, 32, 135, 100);
    //strokeWeight(e);
    float g=-500;
    float m_r=10;
    while (g<1500) {
      stroke(29, 32, 135, 100);
      strokeWeight(e);
      line(mapXs[i]+g+m_r, mapYs[i]+random(10), mapXs[i]+g, mapYs[i]);
      stroke(252, 56, 149, 100);
      strokeWeight(e);
      //line(mapXs[i]+g, mapYs[i], mapXs[i]+g+10, mapYs[i]);
      ellipse(mapXs[i]+g+5, mapYs[i], m_r/2, m_r/2);
      g+=600;
    }
    mapXs[i]=lerp(0, width, posYs[i]/height);
    mapYs[i]=lerp(posYs[i], height, posXs[i]/width); // display flying
  } 


  for (int i=0; i<posXs.length; i++) {

    strokeWeight(1);
    stroke(0, 246, 122);   
    ellipse(posXs[i], posYs[i]/2, dia/2, dia/2); // display circle.0. green
    dia=posYs[i]; // calculate diameter of circle

    strokeWeight(0.5);
    stroke(255, 14, 38);   
    ellipse(posXs[i], posYs[i]/2, dia/2-1, dia/2-1); // display circle.1.red
    stroke(255, 235, 140);
    ellipse(posXs[i], posYs[i]/2+dia/8, dia/4, dia/4); // display circle.2.yellow
  } 

  //stroke(0, 255, 255);

  for (int i=0; i<posXs.length; i++) {
    noFill();
    stroke(0, 255, 255);
    strokeWeight(1.0);
    line(posXs[i]-2, 10, posXs[i]+2, 10); // horizontal.above
    line(posXs[i], 10, posXs[i], posYs[i]-r-1); // vertical.moved
    line(posXs[i]-r, posYs[i]-r-3, posXs[i]+r, posYs[i]-r-3); // horizontal.moved.0

    fill(29, 32, 135, 100);
    stroke(29, 32, 135, 100); 
    strokeWeight(0.3);    
    line(posXs[i]-r, posYs[i]-r-2, posXs[i]+r, posYs[i]-r-2); // horizontal.moved.1
    arc(posXs[i], posYs[i]-r-3, r, 2, 0, PI);
  }

  //stroke(0, 0, 255);
  //strokeWeight(1.0);
  //fill(29, 32, 135);
  fill(0);
  noStroke();
  for (int i=0; i<posXs.length; i++) {
    arc(posXs[i], posYs[i]+5*r, r, 7*r, -PI/2, PI/2); // display mainobject.black pendant
    //arc(posXs[i], posYs[i]+4*r, r, 5*r, PI/2, 3*PI/2);
  } 
  //saveFrame("chuan-####.png");
}
