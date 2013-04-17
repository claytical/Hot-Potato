//
//  Projectile.cpp
//  fingers
//
//  Created by Clay Ewing on 4/17/13.
//
//

#include "Projectile.h"

//--------------------------------------------------------------
void Projectile::show(){
    ofSetColor(255, 255, 0);
    ofCircle(position.x, position.y, 5);
}

//--------------------------------------------------------------

//--------------------------------------------------------------
void Projectile::update(){
    if (traveling%2 == 0) {
        position.x += (pointA.x - position.x) * .1;
        position.y += (pointA.y - position.y) * .1;
        if (ofDist(position.x, position.y, pointA.x, pointA.y) < 1) {
            traveling++;
        }
    }
    else {
        position.x += (pointB.x - position.x) * .1;
        position.y += (pointB.y - position.y) * .1;
        if (ofDist(position.x, position.y, pointB.x, pointB.y) < 1) {
            traveling++;
        }

    }
}

//--------------------------------------------------------------

//--------------------------------------------------------------
void Projectile::set(ofPoint a, ofPoint b){
    position.x = (a.x + b.x) / 2;
    position.y = (a.y + b.y) / 2;
    pointA = a;
    pointB = b;
    traveling = 0;
}

//--------------------------------------------------------------
