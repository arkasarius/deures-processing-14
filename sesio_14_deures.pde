public class b {
  PShape s;
  PVector[] points;
  int number;
  float radius=50;
  b(int numberof) {
    number=numberof;
    points=new PVector[number];
    for (int i=0; i<number; i++) {
      points[i]=new PVector(0, 0);
    }
    inicialitza();
  }
  void inicialitza() {
    float angle=360/number;
    int count =0;
    for (PVector p : points) {
      p.set(0, 1);
      p.rotate(radians(angle*count));
      count++;
      p.mult(random(radius,radius*1.2));
      print(p);
    }
  }
  PShape calculate() {
    s = createShape();
    s.beginShape();
    for (PVector p : points) {
      s.vertex(p.x, p.y);
    }
    s.endShape(CLOSE);
    return(s);
  }
  void deforma() {
  }
  PVector[] givePoints() {
    return points;
  }
  void setNumber(int numberof) {
    number=numberof;
    points=new PVector[number];
    for (int i=0; i<number; i++) {
      points[i]=new PVector(0, 0);
    }
    inicialitza();
  }
  void setRadius(float amount){
    radius=amount;
  }
}
b forma;
void setup() {
  size(800, 800);
  forma= new b(6);
  noFill();
  frameRate(6);
  background(255);
}
void draw() {
  PShape a = forma.calculate();
  shape(a, 400, 400);
  
  for (PVector p : forma.givePoints()) {
    stroke(255, 0, 0);
    ellipse(p.x+400, p.y+400, 5, 5);
    stroke(0);
  }
  
  forma.setRadius(random(50,400));
  forma.setNumber((int)random(6,36));
  /*
  fill(255,20);
  rect(-1,-1,801,801);
  */
  noFill();
}
