Shua[] shuas;
Rhy[] rhys;

float curTime;
float uni; // one period
float d=5; // diameter of point.ob
float timeStep=1;
float dura=2;  // period of movement
float b=50.0; // bleed

Shua myShua1;

void setup() {
  size(1500, 400);
  pixelDensity(displayDensity());
  smooth();  
  //background(255);
  //background(0, 0, 255);
  background(120, 216, 237);

  rhys=new Rhy[1000]; // number of background-point
  for (int e=0; e<rhys.length; e++) {
    rhys[e]=new Rhy(
      //map(random((e+1)/rhys.length), 0, 1, b, width-b), 
      //map(random((e+1)/rhys.length), 0, 1, b, height-b), 
      //height/(rhys.length+1)*(e+1),
      random(0, width), 
      random(0, height), 
      random(1, 10)
      );
  }


  shuas=new Shua[5]; // number of mainobject
  for (int i=0; i<shuas.length; i++) {
    shuas[i]=new Shua(
      random(0, width), 
      height/(shuas.length+1)*(i+1), 
      0, 
      25+random(-20, 10)
      );
  }

  myShua1=new Shua(
    random(0, width/4), 
    3*height/5, 
    0, 
    random(10, 15)  
    );
}

void draw() {
  //background(255);

  background(120, 216, 237);


  //translate(width/6, -height/6);

  curTime=frameCount/40.0; 
  uni = curTime/dura*PI;

  for (int e=0; e<rhys.length; e++) {
    //rhys[i].update();
    rhys[e].display();
  }  // display background-o=point

  for (int i=0; i<shuas.length; i++) {
    shuas[i].update();
    shuas[i].display();

    translate(width/2, height/3);
    rotate(PI/2); // change direction of movement
    translate(-width/5, -height/50); 
    myShua1.update();
    myShua1.display();
  } // display mainobject  

  saveFrame("xhua-####.png");
}
