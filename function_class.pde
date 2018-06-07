



class CenterOfMass {
  float weight = 0;
  PVector position = new PVector();
  boolean OK = false;

  ArrayList weights = new ArrayList();
  ArrayList<PVector> points = new ArrayList();

  void reset() {    // Reset all values and delete all weight points
    weights = new ArrayList();   
    points = new ArrayList();
    weight = 0;
    position = new PVector();
  }

  void add(float weight, PVector point) {  // Add new weight point
    weights.add(weight); 
    points.add(point);
  }

  void set(int poz_temp, float weight, PVector point) {  // Update exisitng wight point
    weights.set(poz_temp, weight); 
    points.set(poz_temp, point);
  }

  int size() {       // Get the number of weight points of the class
    return(weights.size());
  }

  void calculate() {    // Calculate the center of mass from existing weight points
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

  void calculate(ArrayList weights_temp, ArrayList<PVector> points_temp) {   // Calculate the center of mass from given ArrayLists
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
