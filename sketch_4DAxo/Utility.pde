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
