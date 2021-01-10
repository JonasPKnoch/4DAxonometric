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
    return new Vector4(x + add.x, y + add.y, z + add.z, w + add.w);
  }
  
  Vector4 mult(float mult) {
    x *= mult;
    y *= mult;
    z *= mult;
    w *= mult;
    
    return this;
  }
  
  Vector4 mult(Vector4 mult) {
    return new Vector4(x*mult.x, y*mult.y, z*mult.z, w*mult.w);
  }
  
  Vector4 rotate(float xyRot, float xzRot, float xwRot, float yzRot, float ywRot, float zwRot) {
    Vector4 ret = new Vector4(x, y, z, w);
    
    float transformX = 0;
    float transformY = 0;
    float transformZ = 0;
    float transformW = 0;
  
    transformX = cos(xyRot)*ret.x - sin(xyRot)*ret.y;
    transformY = sin(xyRot)*ret.x + cos(xyRot)*ret.y;
    ret.x = transformX;
    ret.y = transformY;
     
    transformX = cos(xzRot)*ret.x - sin(xzRot)*ret.z;
    transformZ = sin(xzRot)*ret.x + cos(xzRot)*ret.z;
    ret.x = transformX;
    ret.z = transformZ;
     
    transformX = cos(xwRot)*ret.x - sin(xwRot)*ret.w;
    transformW = sin(xwRot)*ret.x + cos(xwRot)*ret.w;
    ret.x = transformX;
    ret.w = transformW;
     
    transformY = cos(yzRot)*ret.y - sin(yzRot)*ret.z;
    transformZ = sin(yzRot)*ret.y + cos(yzRot)*ret.z;
    ret.y = transformY;
    ret.z = transformZ;
     
    transformY = cos(ywRot)*ret.y - sin(ywRot)*ret.w;
    transformW = sin(ywRot)*ret.y + cos(ywRot)*ret.w;
    ret.y = transformY;
    ret.w = transformW;
     
    transformZ = cos(zwRot)*ret.z - sin(zwRot)*ret.w;
    transformW = sin(zwRot)*ret.z + cos(zwRot)*ret.w;
    ret.z = transformZ;
    ret.w = transformW;
    
    return ret;
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
  
  float xDepth;
  float yDepth;
  float zDepth;
  float wDepth;
  
  Projection4() {
    setProjectionIsometric();
  }
  
  void setProjectionIsometric() {
    xDepth = 1;
    yDepth = 1;
    zDepth = 1;
    wDepth = 1;
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
    return new PVector(vec.x*xHorz + vec.y*yHorz + vec.z*zHorz + vec.w*wHorz, vec.x*xVert + vec.y*yVert + vec.z*zVert + vec.w*wVert, vec.x*xDepth + vec.y*yDepth + vec.z*zDepth + vec.w*wDepth);
  }
}
