//
//  Projectile.cpp
//  fingers
//
//  Created by Clay Ewing on 4/17/13.
//
//

#include "Projectile.h"
bool tooLong(ofPoint point){
    return (point.z > TAIL_SIZE);
}

//--------------------------------------------------------------
void Projectile::show(){
    ofSetColor(255, 255, 0, 255);
    ofCircle(position.x, position.y, PROJECTILE_SIZE);
    for (int i = 0; i < tail.size(); i++) {
        ofSetColor(255, 255, 0, ofMap(i, 0, TAIL_SIZE, 0, 127));
        ofCircle(tail[i].x, tail[i].y, 3);
        tail[i].z++;
    }
}

//--------------------------------------------------------------

//--------------------------------------------------------------
void Projectile::update(){
    if (points.size() > 0) {
        tail.push_back(position);
        int which = traveling%points.size();
        position.x += (points[which].x - position.x) * .1;
        position.y += (points[which].y - position.y) * .1;
        if (ofDist(position.x, position.y, points[which].x, points[which].y) < 5) {
            traveling++;
        }
    }
    tail.erase( remove_if(tail.begin(), tail.end(), tooLong), tail.end() );

 }

//--------------------------------------------------------------

void Projectile::add(ofPoint point) {
    points.push_back(point);
}

//--------------------------------------------------------------

void Projectile::hit(Enemy * enemy) {
    if (ofDist(enemy->position.x, enemy->position.y, position.x, position.y) <= ENEMY_SIZE + PROJECTILE_SIZE) {
       enemy->dead = true;
    }
}
