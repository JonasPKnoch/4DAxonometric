/*
  Drawing
*/

void line4D(Vector4 vec1, Vector4 vec2, Projection4 project) {
 PVector v1 = project.ProjectPoint(vec1);
 PVector v2 = project.ProjectPoint(vec2);
 
 line(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
}

void surface4D(Vector4[] verts, Projection4 project) {
  beginShape();
  for(int i = 0; i < verts.length; i++) {
    PVector v = project.ProjectPoint(verts[i]);
    vertex(v.x, v.y, v.z);
  }
  endShape();
}

void object4D(Object4 object, Projection4 project) {
  object4D(object, project, new Vector4(), new Vector4(1, 1, 1, 1), 0, 0, 0, 0, 0, 0);
}

void object4D(Object4 object, Projection4 project, Vector4 offset, Vector4 scale, float xyRot, float xzRot, float xwRot, float yzRot, float ywRot, float zwRot) {
  for(int i = 0; i < object.parts.length; i++) {
    int[] part = object.parts[i];
    
    if(part.length == 2) {
      line4D(object.verts[part[0]].mult(scale).rotate(xyRot, xzRot, xwRot, yzRot, ywRot, zwRot).add(offset), object.verts[part[1]].mult(scale).rotate(xyRot, xzRot, xwRot, yzRot, ywRot, zwRot).add(offset), project);
    } else {
      Vector4[] verts = new Vector4[part.length];
      
      for(int j = 0; j < part.length; j++) {
        verts[j] = object.verts[part[j]];
      }
      
      surface4D(verts, project);
    }
  }
}
