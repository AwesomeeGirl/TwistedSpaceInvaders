/**
*Represents an alien falling
*@author Saumya Agawral, Veena Krishnan
*/
class Alien{
  float xpos;
  float ypos;
  int tint;
  String alienLink;
  float speed;
  float angle;
 
/**
*Determines a random location for the alien to fall from
*/
  Alien() {
    xpos = random(450);
    ypos = random(50);
    tint = (int) random(255);
    speed = 0.75;
  }

/**
*Sets the alien graphics
*@return alienLink The link to the drawing for the alien sprite
*/
  String display() {
    alienLink = "alien.png";
    return alienLink;
  }

/**
*Initializes the alien falling
*/
  void invade() {
    ypos = ypos + speed;
  }

/**
*Returns the alien to the top of the screen to restart invasion process
*/
  void remove() {
    tint = (int) random(255);
    xpos = random(450);
    ypos = 0;
  }

/**
*Removes the alien from the screen when the game has ended
*/
  void endScreen() {
    ypos = 570;
  }

/**
*Causes the alien's speed to increase
*/  
  void speedUp() {
    speed = speed + 0.025;
  }

/**
*Causes the alien to have the blinking visual effect
*/
  void changeColor() {
    tint = (int) random(255);
    tint(tint);
  }

}
