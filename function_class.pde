



class CenterOfMass {

  float weight = 0;
  PVector position = new PVector();
  boolean OK = false;
  
  ArrayList weights = new ArrayList();
  ArrayList<PVector> points = new ArrayList();
  
  void reset(){
    weights = new ArrayList(); 
    points = new ArrayList();
  }
  
  void add(float weight, PVector point){
    weights.add(weight); 
    points.add(point);
  }
  
  void set(int poz_temp, float weight, PVector point){
    weights.set(poz_temp, weight); 
    points.set(poz_temp, point);
  }
  
  ArrayList get(int poz_temp){
    ArrayList output_matrix = new ArrayList();
    output_matrix.add(weights.get(poz_temp));
    output_matrix.add(points.get(poz_temp));
    return output_matrix;
  }
  
  int size(){
    return(weights.size());
  }
  
  void calculate() {
    weight = 0;
    position = new PVector();
    if (weights.size() == points.size()) {

      for (int i = 0; i < weights.size(); i++) {
        weight += (float)weights.get(i);
      }

      for (int i = 0; i < weights.size(); i++) {
        position.x += ((float)weights.get(i)*points.get(i).x);
        position.y += ((float)weights.get(i)*points.get(i).y);
        position.z += ((float)weights.get(i)*points.get(i).z);
      }
      
      position.x /= weight;
      position.y /= weight;
      position.z /= weight;
      
      OK = true;
      return;
    } else {
      println("Matrix sizes don't match!");
      exit();
      OK = false;
      return;
    }
  }
  
  void calculate(ArrayList weights_temp, ArrayList<PVector> points_temp) {
    weight = 0;
    position = new PVector();
    if (weights_temp.size() == points_temp.size()) {

      for (int i = 0; i < weights_temp.size(); i++) {
        weight += (float)weights_temp.get(i);
      }

      for (int i = 0; i < weights_temp.size(); i++) {
        position.x += ((float)weights_temp.get(i)*points_temp.get(i).x);
        position.y += ((float)weights_temp.get(i)*points_temp.get(i).y);
        position.z += ((float)weights_temp.get(i)*points_temp.get(i).z);
      }
      
      position.x /= weight;
      position.y /= weight;
      position.z /= weight;
      
      OK = true;
      return;
    } else {
      println("Matrix sizes don't match!");
      exit();
      OK = false;
      return;
    }
  }
}
