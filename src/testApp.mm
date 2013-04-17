#include "testApp.h"
bool dead(Enemy enemy){
    return (enemy.dead);
}
//--------------------------------------------------------------
void testApp::setup(){	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//If you want a landscape oreintation 
	iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	ofBackground(0);
    ofEnableAlphaBlending();
    /*
    for (int i = 0; i < NUMBER_OF_ENEMIES; i++) {
        Enemy tmpEnemy;
        tmpEnemy.set(ofPoint(ofRandom(ofGetWidth(), ofRandom(-ofGetHeight()))), ofRandom(-3));
        enemies.push_back(tmpEnemy);
    }
     */
}

//--------------------------------------------------------------
void testApp::update(){
    myProjectile.update();
    for (int i = 0; i < enemies.size(); i++) {
        enemies[i].update();
        myProjectile.hit(&enemies[i]);
    }

    if ((int)ofGetElapsedTimef()%10 == 0) {
        Enemy tmpEnemy;
        tmpEnemy.set(ofPoint(ofRandom(ofGetWidth(), ofRandom(-ofGetHeight()))), ofRandom(-3));
        enemies.push_back(tmpEnemy); 
    }
    enemies.erase( remove_if(enemies.begin(), enemies.end(), dead), enemies.end() );

}

//--------------------------------------------------------------
void testApp::draw(){
	for (int i = 0; i < fingers.size(); i++) {
        fingers[i].show();
    }
    myProjectile.show();
    for (int i = 0; i < enemies.size(); i++) {
        enemies[i].show();
    }
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    if (touch.id < MAX_FINGERS) {
        bool movingFinger = false;
        int fingerId = 0;

        for (int i = 0; i < fingers.size(); i++) {
            if (fingers[i].id == touch.id) {
                //finger already exists, move it.
                movingFinger = true;
                fingerId = i;
            }
        }
        if (movingFinger) {
            fingers[fingerId].set(touch.x, touch.y);
            myProjectile.points[fingerId].set(touch.x, touch.y);

        }
        else {
            Finger newFinger;
            newFinger.set(touch.x, touch.y);
            newFinger.id = touch.id;
            fingers.push_back(newFinger);        
            myProjectile.add(ofPoint(touch.x, touch.y));

        }
    }
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    int fingerId = 0;
    for (int i = 0; i < fingers.size(); i++) {
        if (fingers[i].id == touch.id) {
            //finger already exists, move it.
            fingerId = i;

        }
        
    }
    myProjectile.points[fingerId].set(touch.x, touch.y);
    fingers[fingerId].set(touch.x, touch.y);
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){
    fingers.clear();
    myProjectile.points.clear();
}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}

