# center_of_mass
Processing IDE based calculation of the center of mass in 1D, 2D and 3D coordinate systems.

This is an example of an automated and simplified computation of static or dynamic measurement systems using my own class.

You can add any number of weight points in a coordinate system (their mass and location).
The existing points can be updated/changed on the fly so an almost realtime measurement system can be implemented using the class.

Usage:
  
  Initialisation:
  
    CenterOfMass test = new CenterOfMass();    // Initialize the class
    
  Adding new weight points:
  
    One dimension (linear)
    ##test.add(0.4, new PVector(10)); // add test weight point [0] which weights 0.4 and is at x=10##
    
    Two dimensions (planar)
    ##test.add(0.4, new PVector(10, 20)); // add test weight point [0] which weights 0.4 and is at x=10 and y=20##
    
    Three dimensional
    ##test.add(0.4, new PVector(10, 20, 15)); // add test weight point [0] which weights 0.4 and is at x=10, y=20 and z=15##
