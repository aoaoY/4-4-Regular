Star[] stars;

float posX, posY; // position of point.green
float centerX, centerY; // postion of translate

float r; // radius of point.center
float dia; // diameter of circle.gradient

float dura; // duration of movement
float start_t;
//float end_t;
float cur_t;
float mov_t;


float uni; // period of movement
float u; 

float a, b, c, d, e, g; // angle

float ro_r; // diameter of arc 
float d_3; // diameter of arc.blue.sin(uni)>0(clockwise)
float d_4; // diameter of arc.green.sin(uni)<0


void setup() {
  size(1500, 400);
  pixelDensity(displayDensity());
  smooth();  
  background(255);


  posX=0;
  posY=0;
  centerX=random(width/5, 4*width/5);
  centerY=random(height/5, 4*height/5);
  r=random(3, 10);
  dia=random(100, 500);
  dura=10.0; 
  start_t=0;
  mov_t=0;

  stars=new Star[500];
  for (int i=0; i<stars.length; i++) {
    stars[i]=new Star(
      random(width)-centerX, 
      random(height)-centerY, 
      random(2)
      );
  }
}

void draw() {
  background(255);

  mov_t=cur_t-start_t;
  uni=lerp(0, PI/2, mov_t/dura);  
  cur_t=frameCount/10;
  u=sqrt(pow(sin(uni), 2));

  translate(centerX, centerY);

  for (int i=0; i<stars.length; i++) {
    stars[i].display();
  }

  rotate(PI*sin(uni));
  float f=10; 
  while (f<100) {
    //fill(232, 234, 237);
    fill(0, 255, 0);
    stroke(0);
    strokeWeight(0.3);
    posX=map(f, 100, 0, 1, width)-width/2;
    posY=map(f, 100, 0, 1, height)-height/2;
    ellipse(posX, posY, 2*r*u, 2*r*u); // display point.green

    ro_r=sqrt(pow(posX, 2)+pow(posY, 2))*2;
    strokeWeight(0.1);
    float a=atan2(height, width); // angle of diagonal line
    if (sin(uni)>0) {
      fill(233, 183, 254, 10);
      stroke(231, 252, 185);
      arc(0, 0, ro_r, ro_r, a, PI*sin(uni)+a); // display color.o.purple
    } else {
      fill(229, 252, 182, 10);
      stroke(231, 252, 185);
      arc(0, 0, ro_r, ro_r, PI*sin(uni)+a, a); // display color.1.green
    }

    fill(233, 183, 254, 255*u);
    noStroke();
    ellipse(posX+random(r, 2*r), posY+random(2*r), random(r), random(r));
    ellipse(posX+random(0, 2*r), posY-random(r), random(r), random(r));
    ellipse(posX-random(r, 3*r), posY-random(r, 2*r), random(r), random(r));
    ellipse(posX-random(r, 2*r), posY+random(r, 2*r), random(r), random(r)); 
    // display point.shaking around green point

    f+=10;
  }


  if (sin(uni)>0) {
    noFill();
    stroke(0, 255, 255);
    strokeWeight(0.3+u);
    d_3=200;
    arc(0, 0, d_3*u, d_3*u, 0, PI*u); // display arc.blue

    fill(255-3*u, 14+42*u, 38+111*u);
    noStroke();
    ellipse(d_3*cos(uni)*sin(uni)/2, d_3*sin(uni)*sin(uni)/2, 10*u, 10*u); 
    // display point on arc.rose red
  } else {
    noFill();
    stroke(0, 255, 0);
    strokeWeight(0.3+u);
    d_4=150;
    arc(0, 0, d_4*u, d_4*u, PI*sin(uni), 0); // display arc.green

    fill(255-3*u, 14+42*u, 38+111*u);
    noStroke();
    ellipse(-d_4*cos(uni)*sin(uni)/2, -d_4*sin(uni)*sin(uni)/2, 10*u, 10*u);
  }

  noFill();
  strokeWeight(2);
  rotate(-PI*sin(uni-PI/2));
  if (sin(uni)>0) {
    if ((r+dia*(1+sin(uni-PI/2)))<(d_3*u)) {
      stroke(255, 255, 0, 255*u/4);
      ellipse(0, 0, r+dia*(1+sin(uni-PI/2)), r+dia*(1+sin(uni-PI/2)));
    } else {
      stroke(0, 255, 0, 255*u/4);
      ellipse(0, 0, r+dia*(1+sin(uni-PI/2)), r+dia*(1+sin(uni-PI/2)));
    } // display circle.distensible
  } else {
    if ((r+dia*(1+sin(uni-PI/2)))<(d_4*u)) {
      stroke(0, 255, 255, 255*u/4);
      ellipse(0, 0, r+dia*(1+sin(uni-PI/2)), r+dia*(1+sin(uni-PI/2)));
    } else {
      stroke(0, 0, 255, 255*u/4);
      ellipse(0, 0, r+dia*(1+sin(uni-PI/2)), r+dia*(1+sin(uni-PI/2)));
    } // display circle.contractible
  }


  rotate(-PI*sin(uni-PI/2));
  stroke(185, 190, 252, 255*sin(uni)/4);
  strokeWeight(1);
  line(0, dia*sin(uni), 0, -dia*sin(uni));
  line(dia*sin(uni), 0, -dia*sin(uni), 0);

  rotate(-PI*sin(uni-PI/2));
  stroke(255, 0, 255, 100*sin(uni)/4);
  line(0, dia*sin(uni-PI/6), 0, -dia*sin(uni-PI/6));
  line(dia*sin(uni-PI/6), 0, -dia*sin(uni-PI/6), 0); // display cross.rotary


  stroke(255, 14, 38);
  strokeWeight(random(4));
  fill(0);
  ellipse(0, 0, 3*r*u, 3*r*u); // display point.center

  //saveFrame("shiny-####.png");
}

// class 1
class Star {
  float sX;
  float sY;
  float r_1;

  Star(
    float _sX, 
    float _sY, 
    float _r_1
    ) {
    sX=_sX;
    sY= _sY;
    r_1=_r_1;
  }

  void display() {
    noFill();
    strokeWeight(random(1));
    //sX=width/2-centerX;
    //sY=height/2-centerY;
    b=atan2(sY, sX);
    c=a+2*PI*u;
    d=a+PI*u;  
    e=a-2*PI*u;
    g=a-PI*u;
    if (b>0) {
      if (sin(uni)>0) {      
        if ((d<b)&&(b<c)) {
          stroke(255, 173, 34);
          strokeWeight(random(1, 2));
          ellipse(sX, sY, r_1+r*u, r_1+r*u);
        } else {
          stroke(176, 199, 144);
          ellipse(sX, sY, r_1+r*u, r_1+r*u);
        }
      } else {
        if ((e<b-2*PI)&&(b-2*PI<g)) {
          stroke(255, 55, 0);
          strokeWeight(random(1, 2));
          ellipse(sX, sY, r_1+r*u, r_1+r*u);
        } else {
          stroke(176, 199, 144);
          ellipse(sX, sY, r_1+r*u, r_1+r*u);
        }
      }
    } else {
      if (sin(uni)>0) {      
        if ((d<b+2*PI)&&(b+2*PI<c)) {
          stroke(255, 173, 34);
          strokeWeight(random(1, 2));
          ellipse(sX, sY, r_1+r*u, r_1+r*u);
        } else {
          stroke(176, 199, 144);
          ellipse(sX, sY, r_1+r*u, r_1+r*u);
        }
      } else {
        if ((e<b)&&(b<g)) {
          stroke(255, 55, 0);
          strokeWeight(random(1, 2));
          ellipse(sX, sY, r_1+r*u, r_1+r*u);
        } else {
          stroke(176, 199, 144);
          ellipse(sX, sY, r_1+r*u, r_1+r*u);
        }
      }
    }
  }
}
