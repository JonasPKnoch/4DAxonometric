/*
  Projection
*/

class Vector4 {
  float x;
  float y;
  float z;
  float w;
  
  Vector4() {
    this.x = 0;
    this.y = 0;
    this.z = 0;
    this.w = 0;
  }
  
  Vector4(float x, float y, float z, float w) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.w = w;
  }
  
  Vector4 add(Vector4 add) {
    x += add.x;
    y += add.y;
    z += add.z;
    w += add.w;
    
    return this;
  }
  
  Vector4 rotate(float xyRot, float xzRot, float xwRot, float yzRot, float ywRot, float zwRot) {
    float transformX = 0;
    float transformY = 0;
    float transformZ = 0;
    float transformW = 0;
  
    transformX = cos(xyRot)*x - sin(xyRot)*y;
    transformY = sin(xyRot)*x + cos(xyRot)*y;
    x = transformX;
    y = transformY;
     
    transformX = cos(xzRot)*x - sin(xzRot)*z;
    transformZ = sin(xzRot)*x + cos(xzRot)*z;
    x = transformX;
    z = transformZ;
     
    transformX = cos(xwRot)*x - sin(xwRot)*w;
    transformW = sin(xwRot)*x + cos(xwRot)*w;
    x = transformX;
    w = transformW;
     
    transformY = cos(yzRot)*y - sin(yzRot)*z;
    transformZ = sin(yzRot)*y + cos(yzRot)*z;
    y = transformY;
    z = transformZ;
     
    transformY = cos(ywRot)*y - sin(ywRot)*w;
    transformW = sin(ywRot)*y + cos(ywRot)*w;
    y = transformY;
    w = transformW;
     
    transformZ = cos(zwRot)*z - sin(zwRot)*w;
    transformW = sin(zwRot)*z + cos(zwRot)*w;
    z = transformZ;
    w = transformW;
    
    return this;
  }
}

class Projection4 {
  float xHorz;
  float xVert;
  float yHorz;
  float yVert;
  float zHorz;
  float zVert;
  float wHorz;
  float wVert;
  
  Projection4() {
    setProjectionIsometric();
  }
  
  void setProjectionIsometric() {
    setProjectAngles(7*PI/4, 5*PI/4, 3*PI/2, 0);
  }
  
  void setProjectAngles(float angleX, float angleY, float angleZ, float angleW) {
    xHorz = cos(angleX);
    xVert = sin(angleX);
    yHorz = cos(angleY);
    yVert = sin(angleY);
    zHorz = cos(angleZ);
    zVert = sin(angleZ);
    wHorz = cos(angleW);
    wVert = sin(angleW);
  }
  
  PVector ProjectPoint(Vector4 vec) {
    return new PVector(vec.x * xHorz + vec.y * yHorz + vec.z * zHorz + vec.w * wHorz, vec.x * xVert + vec.y * yVert + vec.z * zVert + vec.w * wVert);
  }
}

/*
  Objects
*/

class Object4 {
  Vector4[] verts;
  int[][] parts;
  
  Object4(Vector4[] verts, int[][] parts) {
    this.verts = verts;
    this.parts = parts;
  }
  
  void rotateAbout(float xyRot, float xzRot, float xwRot, float yzRot, float ywRot, float zwRot) {    
    for(Vector4 vec : verts) {
      vec.rotate(xyRot, xzRot, xwRot, yzRot, ywRot, zwRot);
    }
  }
  
  void translate(Vector4 trans) {
    for(Vector4 vec : verts) {
      vec.add(trans);
    }
  }
}

Object4 loadObject4JSON(String file) {
  JSONObject json = loadJSONObject(file);
  
  JSONArray verts = json.getJSONArray("Vertices");
  JSONArray parts = json.getJSONArray("Parts");
  
  Object4 ret = new Object4(new Vector4[verts.size()/4], new int[parts.size()][]);
  
  for(int i = 0; i < verts.size()/4; i ++) {
    ret.verts[i] = new Vector4(verts.getFloat(i*4), verts.getFloat(i*4 + 1), verts.getFloat(i*4 + 2), verts.getFloat(i*4 + 3));
  }
  
  for(int i = 0; i < parts.size(); i++) {
    ret.parts[i] = parts.getJSONArray(i).getIntArray();
  }
  
  return ret;
}

/*
  Drawing
*/

void line4D(Vector4 vec1, Vector4 vec2, Projection4 project) {
 PVector v1 = project.ProjectPoint(vec1);
 PVector v2 = project.ProjectPoint(vec2);
 
 line(v1.x, v1.y, v2.x, v2.y);
}

void surface4D(Vector4[] verts, Projection4 project) {
  beginShape();
  for(int i = 0; i < verts.length; i++) {
    PVector v = project.ProjectPoint(verts[i]);
    vertex(v.x, v.y);
  }
  endShape();
}

void object4D(Object4 object, Projection4 project, Vector4 offset, Vector4 scale, float xyRot, float xzRot, float xwRot, float yzRot, float ywRot, float zwRot) {
  for(int i = 0; i < object.parts.length; i++) {
    int[] part = object.parts[i];
    
    if(part.length == 2) {
      line4D(object.verts[part[0]], object.verts[part[1]], project);
    } else {
      Vector4[] verts = new Vector4[part.length];
      
      for(int j = 0; j < part.length; j++) {
        verts[j] = object.verts[part[j]];
      }
      
      surface4D(verts, project);
    }
  }
}

/*
  Utility
*/

Vector4[] vecList4(float[] ps) {
  Vector4[] ret = new Vector4[int(ps.length*0.5)];
  
  for(int i = 0; i < ret.length; i++) {
    int in = i*4;
    ret[i] = new Vector4(in, in + 1, in + 2, in + 3);
  }
  
  return ret;
}

/*
  Running
*/

final float xAng = 7*PI/4;
final float yAng = 5*PI/4;
final float zAng = 3*PI/2;
final float wAng = 0;

void setup() {
  size(600,600);
  colorMode(HSB);
  strokeWeight(5);
  noSmooth();
  frameRate(30);
  background(255);
  translate(300,300);
  
  Object4 cube = loadObject4JSON("5-Cell.json");
  Projection4 project = new Projection4();
  object4D(cube, project);
}

/*
void draw() {
  background(255);
  translate(200,200);  
  rot+= 0.015;

  time++;
}
*/
