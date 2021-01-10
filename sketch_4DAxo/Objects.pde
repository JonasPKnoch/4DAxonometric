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
      vec = vec.rotate(xyRot, xzRot, xwRot, yzRot, ywRot, zwRot);
    }
  }
  
  void translate(Vector4 trans) {
    for(Vector4 vec : verts) {
      vec = vec.add(trans);
    }
  }
  
  void scale(Vector4 scale) {
    for(Vector4 vec : verts) {
      vec = vec.mult(scale);
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
