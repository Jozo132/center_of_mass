
float x_poz;
float y_poz;


CenterOfMass test = new CenterOfMass();    // Initialize the class



void setup() {
  size(500, 500);
  // CenterOfMass  ::  add(   float weight  ,  PVector(  position_X  , position_Y  , (optional) position_Z  ))
  //   add(weight, new PVector(x,y));
  test.add(random(1,2), new PVector(100, 100));        // add test weight point 0
  test.add(random(3,4), new PVector(-100, 100));       // add test weight point 1
  test.add(random(2,3), new PVector(100, -100));       // add test weight point 2
  test.add(random(4,5), new PVector(-100, -100));      // add test weight point 3

  test.add(random(0.1,10), new PVector(0, 0));              // add test weight point 4
  test.set(4, random(0.1,10), new PVector(-50, -20));   // change values of test weight point 4

  test.calculate();  // Calculate or update the position and weight of the center of mass

  float COMBINED_WEIGHT = test.weight;      // Izhodna teža težišča
  float COMBINED_X = test.position.x; // Izhodna koordinata x težišča
  float COMBINED_Y = test.position.y; // Izhodna koordinata y težišča
  float COMBINED_Z = test.position.z; // Izhodna koordinata y težišča

  println("Weight of center of mass = " + COMBINED_WEIGHT);
  println("     x of center of mass = " + COMBINED_X);
  println("     y of center of mass = " + COMBINED_Y);
  println("     z of center of mass = " + COMBINED_Z);
}

float resolucija = 400;

void draw() {
  background(255);

  grid(10);

  test.set(4, 1, new PVector(map(mouseX, 0, width, -200 * (width/height), 200 * (width/height) ), map(mouseY, height, 0, -200, 200)));      // Popravi vrednosti Teža 4
  test.calculate();  // Calculate or update the position and weight of the center of mass

  x_poz = map(test.position.x, -resolucija/2 * (width/height), resolucija/2 * (width/height), 0, width);
  y_poz = map(test.position.y, -resolucija/2, resolucija/2, height, 0);

  draw_cordinate_base_lines();
  draw_CoM_following_lines();
  draw_weight_circles();
}


void draw_cordinate_base_lines() {
  stroke(0);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}

void draw_CoM_following_lines() {
  stroke(80);
  line(x_poz, height/2, x_poz, y_poz);
  line(width/2, y_poz, x_poz, y_poz);
}

void draw_weight_circles() {
  strokeWeight(1);
  
  fill(0, 255, 255, 190);
  stroke(0);
  x_poz = map(test.position.x, -resolucija/2 * (width/height), resolucija/2 * (width/height), 0, width);
  y_poz = map(test.position.y, -resolucija/2, resolucija/2, height, 0);
  float velikost = test.weight * (height * 0.02) / test.size();
  point_weight(test.weight, new PVector(test.position.x, test.position.y), velikost);

  fill(120, 120);
  stroke(0);
  for (int i = 0; i < test.size(); i++) {
    ArrayList podatki_v_prasici = test.get(i);
    point_weight((float)podatki_v_prasici.get(0), (PVector)podatki_v_prasici.get(1));
  }
}



void point_weight(float weight, PVector pozicija) {
  point_weight(weight, pozicija, 0);
}

void point_weight(float weight, PVector pozicija, float velikost_dana) {
  float x_poz = map(pozicija.x, -resolucija/2 * (width/height), resolucija/2 * (width/height), 0, width);
  float y_poz = map(pozicija.y, -resolucija/2, resolucija/2, height, 0);

  if (velikost_dana == 0) { 
    float velikost = weight * (height * 0.02);
    ellipse(x_poz, y_poz, velikost, velikost);
    line(x_poz - velikost/2, y_poz, x_poz + velikost/2, y_poz);
    line(x_poz, y_poz - velikost/2, x_poz, y_poz + velikost/2);
  } else {
    ellipse(x_poz, y_poz, velikost_dana, velikost_dana);
    line(x_poz - velikost_dana/2, y_poz, x_poz + velikost_dana/2, y_poz);
    line(x_poz, y_poz - velikost_dana/2, x_poz, y_poz + velikost_dana/2);
  }
}


void grid(int razmak) {
  int stevilo_crt_x = int(((width/height) * (resolucija/2)) / (float)razmak);
  int stevilo_crt_y = int((resolucija/2) / (float)razmak);

  float delta_prikaza = height/2 / stevilo_crt_y;

  stroke(0, 20);

  for (int i = 0; i <= stevilo_crt_x; i++) {
    float poz_x_P = width/2 + delta_prikaza*(i+1);
    float poz_x_N = width/2 - delta_prikaza*(i+1);
    line(poz_x_P, 0, poz_x_P, height);
    line(poz_x_N, 0, poz_x_N, height);
  }

  for (int i = 0; i <= stevilo_crt_y; i++) {
    float poz_y_P = height/2 + delta_prikaza*(i+1);
    float poz_y_N = height/2 - delta_prikaza*(i+1);
    line(0, poz_y_P, width, poz_y_P);
    line(0, poz_y_N, width, poz_y_N);
  }
}
