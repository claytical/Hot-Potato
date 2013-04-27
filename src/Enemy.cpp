//
//  Enemy.cpp
//  fingers
//
//  Created by Clay Ewing on 4/17/13.
//
//

#include "Enemy.h"

void Enemy::set(ofPoint pos, ofPoint s) {
    position = pos;
    speed = s;
    dead = false;
}

//--------------------------------------------------------------
void Enemy::show(){
    if (!dead) {
        ofNoFill();
        ofSetColor(0, 0, 255, 255);
        ofCircle(position.x, position.y, ENEMY_SIZE);
        ofFill();
        ofSetColor(0, 0, 200, 200);
        ofCircle(position.x, position.y, ENEMY_SIZE - 3);
        ofSetColor(0, 0, 0);
        ofCircle(position.x, position.y, 2);
    }
    else {
        ofFill();
        ofSetColor(127, 255);
        ofCircle(position.x, position.y, ENEMY_SIZE);
        ofNoFill();
        ofSetColor(200, 200);
        ofCircle(position.x, position.y, ENEMY_SIZE - 3);
        ofSetColor(0, 0, 0);
        ofCircle(position.x, position.y, 2);
        
    }
}

//--------------------------------------------------------------


void Enemy::update() {
    position.x += speed.x;

    if (dead) {
        position.y += 1;
    }
    else {
        position.y += speed.y;
    }
}