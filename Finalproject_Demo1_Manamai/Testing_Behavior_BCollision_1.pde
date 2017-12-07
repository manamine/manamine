

import punktiert.math.Vec;
import punktiert.physics.*;

//world object
VPhysics physics;

//number of particles in the scene
int amount = 300;

void setup() {
  size(1080 ,720);
  noStroke();
  fill(0, 255);

  physics = new VPhysics(width, height);
  physics.setfriction(.1f);

  for (int i = 0; i < amount; i++) {
    //val for arbitrary radius
    float rad = random(5, 20);
    //vector for position
    Vec pos = new Vec (random(rad, width-rad), random(rad, height-rad));
    //create particle (Vec pos, mass, radius)
    VParticle particle = new VParticle(pos, 1, rad);
    //add Collision Behavior
    particle.addBehavior(new BCollision());
    //add particle to world
    physics.addParticle(particle);
  }
    
}

 void draw() {
  background(0);

  physics.update();

  for (VParticle p : physics.particles) {
    fill(255);
    ellipse(p.x, p.y, p.getRadius()*2, p.getRadius()*2);
  }
  
  if(mousePressed){
    physics.addParticle(new VParticle(new Vec(mouseX, mouseY),1, random(5,20)).addBehavior(new BCollision()));
  }
}