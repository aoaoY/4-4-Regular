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

  //saveFrame("xhua-####.png");
}

// class 1
class Shua {
  float movX, movY; // position of mainobject
  float vel; // speed of movement.ob
  float l; // length of string.ob.allochroic 

  Shua(
    float _movX, 
    float _movY, 
    float _vel, 
    float _l) {
    movX=_movX;
    movY=_movY;
    vel=_vel;
    l=_l;
  }

  void update() {
    updatePos(timeStep);
    updateVel();
  }

  void updatePos(float timeStep) {
    movX=movX+vel*timeStep; // change of position.ob
  }

  void updateVel() {
    //float uni = uni;
    vel=8*sin(uni); // speed of movement.ob
  }

  void display() {

    float f=-20;
    while (f<30) {  
      stroke(0, 255, 255);
      strokeWeight(0.3);
      line(movX+l/2, movY+f, movX+lerp(0, l, cos(uni)), movY+f);
      // display guideline.ob

      noStroke();
      if (vel<0) {
        fill(0-252*sin(uni), 0-56*sin(uni), 255+106*sin(uni));
        //fill(252, 56, 149);
        ;
      } else {
        fill(0+252*sin(uni), 0+56*sin(uni), 255-106*sin(uni));
      }    
      quad(movX+l/2, movY+f, movX-lerp(0, l/2, cos(uni)), movY+f+d/3, movX-l/2, movY+f, movX-lerp(0, l/2, cos(uni)), movY+f-d/3);
      // display string.ob.allochroic 

      fill(255, 14, 38);
      ellipse(movX+lerp(0, l, cos(uni)), movY+f, d, d);
      // display red point.ob

      f+=10;
    }
  }
}

// class 2
class Rhy {
  float mapX, mapY; // position of background-point
  float r;

  Rhy(
    float _mapX, 
    float _mapY, 
    float _r) {
    mapX= _mapX; 
    mapY= _mapY; 
    r= _r;
  }


  void display() {

    //noStroke();
    if (sin(uni/2)>0) {
      stroke(255, 235, 140);
      strokeWeight(2*sin(uni/2));
    } else {
      stroke(255, 235, 140);
      strokeWeight(-2*sin(uni/2));
    }   
    fill(189, 221, 183);
    ellipse(mapX, mapY, r*2*sin(uni/2), r*2*sin(uni/2));
    // display scattered breathpoint.bac

    noStroke();
    fill(255);
    ellipse(mapX+random(r), mapY+random(r), r/4*cos(uni/2), r/4*cos(uni/2));
    ellipse(mapX-random(r), mapY-random(r), r/4*cos(uni/2), r/4*cos(uni/2));
    ellipse(mapX-random(r), mapY+random(r), r/4*cos(uni/2), r/4*cos(uni/2));
    ellipse(mapX+random(r), mapY-random(r), r/4*cos(uni/2), r/4*cos(uni/2));
    // display breathpoint.bac.white.shaking 

    fill(233, 183, 254);
    ellipse(mapX+random(r/2), mapY+random(r/2), r/2*cos(uni/2), r/2*cos(uni/2));
    // display breathpoint.bac.rose red.shaking
  }
}
