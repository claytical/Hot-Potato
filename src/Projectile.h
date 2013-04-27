//
//  Projectile.h
//  fingers
//
//  Created by Clay Ewing on 4/17/13.
//
//
#define TAIL_SIZE 200
#define PROJECTILE_SIZE 5

#include "ofMain.h"
#include "Enemy.h"

class Projectile{

public:

    void show();
    void add(ofPoint point);
    void update();
    bool hit(Enemy *);
    int traveling;
    vector <ofPoint> points;
    vector <ofPoint> tail;
    ofPoint position;
    
};
