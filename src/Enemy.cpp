//
//  Enemy.cpp
//  fingers
//
//  Created by Clay Ewing on 4/17/13.
//
//

#include "Enemy.h"

void Enemy::set(ofPoint pos, float s) {
    position = pos;
    speed = s;
    dead = false;
}

//--------------------------------------------------------------
void Enemy::show(){
    if (!dead) {
        ofSetColor(0, 0, 255, 255);
        ofCircle(position.x, position.y, ENEMY_SIZE);
    }
}

//--------------------------------------------------------------


void Enemy::update() {
    position.y += speed;
}