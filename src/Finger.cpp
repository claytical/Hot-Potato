//
//  Finger.cpp
//  fingers
//
//  Created by Clay Ewing on 4/17/13.
//
//

#include "Finger.h"


//--------------------------------------------------------------
void Finger::show(){
    ofNoFill();
    ofSetColor(127);
    ofRect(position.x, position.y, 50, 50);
    ofFill();
    ofSetColor(200);
    ofRect(position.x, position.y, 10, 10);
}

//--------------------------------------------------------------

bool Finger::touching(float x, float y) {
    return (ofDist(x, y, position.x, position.y) <= 25);
}

//--------------------------------------------------------------
void Finger::set(float x, float y){
    position.x = x;
    position.y = y;
}

//--------------------------------------------------------------
