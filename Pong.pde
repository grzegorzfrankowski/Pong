Ball ball; 
Raquet raquetLeft;
Raquet raquetRight;

int scoreLeft = 0;
int scoreRight = 0;

void setup(){
  size(800,600);
  ball = new Ball(width/2, height/2, 50);
  ball.speedX = 5; 
  ball.speedY = random(-3,3);
  
  raquetLeft = new Raquet(15, height/2, 30,200);
  raquetRight = new Raquet(width-15, height/2, 30,200);
  
  keyPressed();
  keyReleased();
}

void draw(){
  background(100,255,100);
  
  if (ball.right() > width) { 
    scoreLeft = scoreLeft + 1;
    ball.x = width/2;
    ball.y = height/2;
  }
  if (ball.left() < 0) {
    scoreRight = scoreRight + 1;
    ball.x = width/2;
    ball.y = height/2;
  }
  if (ball.bottom() > height) {
    ball.speedY = -ball.speedY;
  }
  if (ball.top() < 0) {
    ball.speedY = -ball.speedY;
  }
  
   if (raquetLeft.bottom() > height) {
    raquetLeft.y = height-raquetLeft.h/2;
  }

  if (raquetLeft.top() < 0) {
    raquetLeft.y = raquetLeft.h/2;
  }
    
  if (raquetRight.bottom() > height) {
    raquetRight.y = height-raquetRight.h/2;
  }

  if (raquetRight.top() < 0) {
    raquetRight.y = raquetRight.h/2;
  }
  
  if ( ball.left() < raquetLeft.right() && ball.y > raquetLeft.top() && ball.y < raquetLeft.bottom()){
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - raquetLeft.y, -raquetLeft.h/2, raquetLeft.h/2, -10, 10);
  }

  if ( ball.right() > raquetRight.left() && ball.y > raquetRight.top() && ball.y < raquetRight.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - raquetRight.y, -raquetRight.h/2, raquetRight.h/2, -10, 10);
  }
 
  ball.move();
  ball.display();
  
  raquetLeft.move();
  raquetLeft.display();
  raquetRight.move();
  raquetRight.display();
  
  textSize(30);
  textAlign(CENTER);
  text("Player Two: "+scoreRight, width/2+200, 30); // Right side score
  text("Player One: "+scoreLeft, width/2-200, 30); // Left side score
   
  if(scoreLeft>9){
   playerOne(); 
   delay(1000);
  }
  if(scoreRight>9){
   playerTwo(); 
   delay(1000);
  }
}

class Ball {
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color r,g,b;
  
  
  Ball(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = 0;
    speedY = 0;
    r = 255; 
    g = 180;
    b = 0;
  }
  
  void move() {
    
    y = y + speedY;
    x = x + speedX;
  }
  
  void display() {
    noStroke();
    fill(r,g,b);
    ellipse(x,y,diameter,diameter); 
  }
  
  
  float left(){
    return x-diameter/2;
  }
  float right(){
    return x+diameter/2;
  }
  float top(){
    return y-diameter/2;
  }
  float bottom(){
    return y+diameter/2;
  }
}

class Raquet{

  float x;
  float y;
  float w;
  float h;
  float speedY;
  float speedX;
  color r,g,b;
  
  Raquet(float tempX, float tempY, float tempW, float tempH){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    speedX = 0;
    r=255;
    g=100;
    b=0;
  }

  void move(){
    y += speedY;
    x += speedX;
  }

  void display(){
    noStroke();
    fill(r,g,b);
    rect(x-w/2,y-h/2,w,h);
  } 
  
 
  float left(){
    return x-w/2;
  }
  float right(){
    return x+w/2;
  }
  float top(){
    return y-h/2;
  }
  float bottom(){
    return y+h/2;
  }
}

 void keyPressed(){
  if(keyCode == UP){
    raquetRight.speedY=-3;
  }
  if(keyCode == DOWN){
    raquetRight.speedY=3;
  }
  if(key == 'a'){
    raquetLeft.speedY=-3;
  }
  if(key == 'z'){
    raquetLeft.speedY=3;
  }
}

void keyReleased(){
  if(keyCode == UP){
    raquetRight.speedY=0;
  }
  if(keyCode == DOWN){
    raquetRight.speedY=0;
  }
  if(key == 'a'){
    raquetLeft.speedY=0;
  }
  if(key == 'z'){
    raquetLeft.speedY=0;
  }
}
void playerOne(){
  background(0);
   textSize(50);
   fill(255);
   textAlign(CENTER);
   text("GAME OVER", width/2, height/2+30); 
   text("Player 1 Wins!", width/2, height/2-30); 
   scoreLeft=0;
   scoreRight=0;
  }
void playerTwo(){
  background(0);
   textSize(50);
   fill(255);
   textAlign(CENTER);
   text("GAME OVER", width/2, height/2+30); 
   text("Player 2 Wins!", width/2, height/2-30); 
   scoreLeft=0;
   scoreRight=0;
  }
  
