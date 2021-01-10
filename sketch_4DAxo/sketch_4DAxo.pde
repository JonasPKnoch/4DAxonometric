Projection4 project;
Object4 object;
int time;

void setup() {
  size(800, 800, P3D);
  ortho();
  
  project = new Projection4();
  object = loadObject4JSON("Objects/HyperCube.json");
  time = 0;
  
  strokeWeight(4);
  stroke(0);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  
  time++;
  
  object4D(object, project, new Vector4(0, 0, 0, 0), new Vector4(2, 2, 2, 2), time*0.0001, time*0.0002, time*0.003, time*0.004, time*0.005, time*0.006);
}
