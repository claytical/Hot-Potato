#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//If you want a landscape oreintation 
	iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	ofBackground(127,127,127);
    myProjectile.set(ofPoint(ofGetWidth()/2, ofGetHeight()/2), ofPoint(ofGetWidth()/2, ofGetHeight()/2));
}

//--------------------------------------------------------------
void testApp::update(){
    myProjectile.update();
}

//--------------------------------------------------------------
void testApp::draw(){
	for (int i = 0; i < fingers.size(); i++) {
        fingers[i].show();
    }
    myProjectile.show();
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
        }
        else {
            Finger newFinger;
            newFinger.set(touch.x, touch.y);
            newFinger.id = touch.id;
            fingers.push_back(newFinger);        
        }
        if (fingerId == 0) {
            myProjectile.pointA.set(touch.x, touch.y);
        }
        else {
            myProjectile.pointB.set(touch.x, touch.y);
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
    fingers[fingerId].set(touch.x, touch.y);
    if (fingerId == 0) {
        myProjectile.pointA.set(touch.x, touch.y);
    }
    else {
        myProjectile.pointB.set(touch.x, touch.y);
    }

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

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

