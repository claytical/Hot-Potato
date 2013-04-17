//
//  Projectile.h
//  fingers
//
//  Created by Clay Ewing on 4/17/13.
//
//

#include "ofMain.h"

class Projectile{

public:

    void show();
    void set(ofPoint a, ofPoint b);
    void update();
    int traveling;
    ofPoint pointA;
    ofPoint pointB;
    ofPoint position;
    
};
