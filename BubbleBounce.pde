
int numBubbles;
float backColor0, backColor1, backColor2;
Bubble[] bubbles;

void setup(){
  size(1024, 640);
  backColor0 = random(0, 255);
  backColor1 = random(0, 255);
  backColor2 = random(0, 255);
  

  
  numBubbles = 1;
  bubbles = new Bubble[numBubbles];
  
  for (int i = 0; i < numBubbles; i++){
    bubbles[i] = new Bubble();
  }
  
}

void draw(){
  background(backColor0, backColor1, backColor2);
  
  for (int i = 0; i < numBubbles; i++){
    bubbles[i].move();
    bubbles[i].bounce(i);
    bubbles[i].draw();
  }


}
//Problems to Solve
//start with negative velocity

