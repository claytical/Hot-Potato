//
//  Enemy.h
//  fingers
//
//  Created by Clay Ewing on 4/17/13.
//
//
#ifndef ENEMY_H
#define ENEMY_H

#include "ofMain.h"
#define ENEMY_SIZE  10

class Enemy{
    
public:
    void set(ofPoint pos, ofPoint s);
    void show();
    void update();
    ofPoint speed;
    ofPoint position;
    bool dead;
    
};
#endif