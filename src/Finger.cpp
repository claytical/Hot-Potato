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
    ofSetColor(255, 0, 0);
    ofCircle(position.x, position.y, 50);
}

//--------------------------------------------------------------

//--------------------------------------------------------------
void Finger::set(float x, float y){
    position.x = x;
    position.y = y;
}

//--------------------------------------------------------------
