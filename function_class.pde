



class CenterOfMass {
  /*---------------------------------------------------------------------------
   * CenterOfMass class
   *
   *  Copyright 2018 by Jozo132 <jozo132@gmail.com>
   *  Licensed under GNU General Public License 3.0 or later.
   *   
   *  Feel free to reuse and/or redistribute this portion of the program (this class)
   *  for any and all uses, either commercial or free.
   * 
   *---------------------------------------------------------------------------
   *  This program is free software: you can redistribute it and/or modify
   *  it under the terms of the GNU General Public License as published by
   *  the Free Software Foundation, either version 3 of the License, or
   *  (at your option) any later version.
   * 
   *  This program is distributed in the hope that it will be useful,
   *  but WITHOUT ANY WARRANTY; without even the implied warranty of
   *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   *  GNU General Public License for more details.
   * 
   *  You should have received a copy of the GNU General Public License
   *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
   *---------------------------------------------------------------------------
   */

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
