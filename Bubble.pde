

class Bubble {
  float bubbleSize;
  float xPos, yPos;

  float xSpeed, ySpeed;
  float xDir, yDir;

  color clr, startColor;

  Bubble() {

    this.bubbleSize = random(1, 5);
    this.xPos = random(50, width - 50); 
    this.yPos = random(50, height - 50);

    this.xSpeed = random(1, 10); 
    this.ySpeed = random(1, 10);

    this.xDir = 1;
    this.yDir = 1;

    this.newColor();
    //this.startColor = color(random(0, 255), random(0, 255), random(0, 255));
    this.clr = this.startColor;
  }

  void move() {
    this.clr = this.startColor;
    //move the bubble
    this.xPos += this.xSpeed * this.xDir; 
    this.yPos += this.ySpeed * this.yDir;
  }

  void bounce(int myNumber) {
    //bounce the bubble
    if (this.yPos >= height - this.bubbleSize/2) {
      this.yDir = -1;
      //this.newColor();
    }
    if (this.yPos <= 0 + this.bubbleSize/2) {
      this.yDir = 1;
      //this.newColor();
    }
    if (this.xPos >= width - this.bubbleSize/2) {
      this.xDir = -1;
      //this.newColor();
    }
    if (this.xPos <= 0 + this.bubbleSize/2) {
      this.xDir = 1;
      //this.newColor();
    }

    for (int i = 0; i< numBubbles; i++) {
      if (i != myNumber) {
        if (checkCollide(bubbles[i])) {
          bubbleBounce(bubbles[i]);
          //this.clr = color(255, 0, 0, 100);
        }//end if checkcollide
      }//end if not myNumber
    }//end for loop
  }//end bounce function

  void bubbleBounce(Bubble bbl){
    float oldXSpeed = this.xSpeed;
    float oldYSpeed = this.ySpeed;
    
    float oldXdir = this.xDir;
    float oldYdir = this.yDir;
    
    this.xSpeed = bbl.xSpeed;
    this.ySpeed = bbl.ySpeed;
    
    this.xDir = bbl.xDir;
    this.yDir = bbl.yDir;
    
    bbl.xSpeed = oldXSpeed;
    bbl.ySpeed = oldYSpeed;
    
    bbl.xDir = oldXdir;
    bbl.yDir = oldYdir;
  }

  void draw() {
    //draw the bubble
    fill(this.clr);
    ellipse(this.xPos, this.yPos, this.bubbleSize, this.bubbleSize);
  }

  void newColor() {
    this.startColor = color(random(0, 255), random(0, 255), random(0, 255));
  }


  boolean checkCollide(Bubble bbl) {
    float distSquared = dist2(bbl.xPos, bbl.yPos);
    float bothRadii = this.bubbleSize/2 + bbl.bubbleSize/2;
    float radSquared = bothRadii * bothRadii;
    if (distSquared <= radSquared) {
      return true;
    } else {
      return false;
    }
  }

  float dist2(float otherX, float otherY) {
    float xSide = this.xPos - otherX;
    float ySide = this.yPos - otherY;
    return xSide * xSide + ySide * ySide;
  }
}


