
class Asteroid extends Body {
  //float speed; // Speed of asteroid
  PVector speed;
  float r;
  float tint;

  Asteroid() { 
    super(random(width), random(height));
    img = loadImage("asteroid.png");
    speed = new PVector(random(-1, 1), random(0.1, 1)); 
    tint = random(100, 255);
    r = random(20, 50);
  }
  Asteroid(float x, float y) { 
    super(x, y);
    img = loadImage("asteroid.png");
    speed = new PVector(random(-1,1), random(0.1, 1)); 
    tint = random(100,255);
    r = random(20, 50); 
  }
  
  PVector returnloc() {
    return location;
  }
  void reset() {
    location = new PVector(random(100, 480), 0);
    speed =  new PVector(random(-1, 1), random(0.1, 1));
  }
  // Move the asteroid down
  void move() {
    // Increment by speed
    location.x += speed.x;
    location.y += speed.y;
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (location.y > height) { 
      return true;
    } else {
      return false;
    }
  }
  void bounce() {
    if (location.x >= width - 20) {
      location.x = width - 20;
      speed.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      speed.x *= -1;
    }
  }

  void wrapAround() {
    if (location.x > width)
      location.x = 0; 
    else if (location.x < 0)
      location.x = width;
    else if (location.y > height)
      location.y = 0;
    else if (location.y < 0)
      location.y = height;
  }

  // Display the asteroid
  void display() {
    // Display the asteroid
    tint(tint, tint, tint);
    image(img, location.x, location.y, r, r);
  }
}
