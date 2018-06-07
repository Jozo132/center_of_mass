# center_of_mass
Processing IDE based calculation of the center of mass in 1D, 2D and 3D coordinate systems.

This is an example of an automated and simplified computation of static or dynamic measurement systems using my own class.

You can add any number of weight points in a coordinate system (their mass and location).
The existing points can be updated/changed on the fly so an almost realtime measurement system can be implemented using the class.

Usage:
  
  Initialisation:
  
    ~: CenterOfMass test = new CenterOfMass();    // Initialize the class
  
  Weight points are added and updated the same way an ArrayList is
  
  Adding new weight points:
  
    1D >>  ~: test.add( 0.4 , new PVector(10.0) );               // add test weight point [0] which weights 0.4 and is at x=10
    2D >>  ~: test.add( 0.4 , new PVector(10.0 , 20.0) );        // add test weight point [1] which weights 0.4 and is at x=10 y=20
    3D >>  ~: test.add( 0.4 , new PVector(10.0 , 20.0 , 15.0) ); // add test weight point [2] which weights 0.4 and is at x=10 y=20 z=15

  Changing existing weight point values:
  
    1D >>  ~: test.set(0, 1.6 , new PVector(9.2) );               // set test weight point [0] to weight 1.6 and position x=9.2
    2D >>  ~: test.set(1, 1.6 , new PVector(9.2 , 18.9) );        // set test weight point [1] to weight 1.6 and position x=9.2 y=18.2
    3D >>  ~: test.set(2, 1.6 , new PVector(9.2 , 18.9 , 17.3) ); // set test weight point [2] to weight 1.6 and position x=9.2 y=18.2 z=17.3
  
  Calculating input weight points to output center of mass weight and position:
  
    ~: test.calculate();  // Calculate or update from input values
  
  Retrieving or getting output from last calculation:
  
    ~: float calculated_weight  = test.weight;       // Get output wieght of all forces
    ~: float calculated_x       = test.position.x;   // Get x position of the center of mass
    ~: float calculated_y       = test.position.y;   // Get y position of the center of mass
    ~: float calculated_z       = test.position.z;   // Get z position of the center of mass
  
