#include "testApp.h"
bool dead(Enemy enemy){
    return (enemy.dead);
}

bool outOfBounds(Enemy enemy) {
    if (enemy.position.x > ofGetWidth() || enemy.position.x < 0 || enemy.position.y > ofGetHeight()) {
        return true;
    }
    else {
        return false;
    }
}
//--------------------------------------------------------------
void testApp::setup(){	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//If you want a landscape oreintation 
	iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	ofSetRectMode(OF_RECTMODE_CENTER);
	ofBackground(0);
    ofEnableAlphaBlending();
    ofEnableSmoothing();
    score = 0;
}

//--------------------------------------------------------------
void testApp::update(){
    myProjectile.update();
    for (int i = 0; i < enemies.size(); i++) {
        enemies[i].update();
        if(myProjectile.hit(&enemies[i])) {
            score++;
        }
    }

    if ((int)ofGetElapsedTimef()%10 == 0) {
        Enemy tmpEnemy;
        int x = ofMap(ofRandomWidth(), 0, ofGetWidth(), BORDER, ofGetWidth() - BORDER);
        int y = ofMap(ofRandomHeight(), 0, ofGetHeight(), BORDER, ofGetHeight() - BORDER);
        tmpEnemy.set(ofPoint(x,y), ofPoint(ofRandom(-3,3), ofRandom(-3, 3)));
        enemies.push_back(tmpEnemy); 
    }
  //  enemies.erase(remove_if(enemies.begin(), enemies.end(), dead), enemies.end() );
    enemies.erase(remove_if(enemies.begin(), enemies.end(), outOfBounds), enemies.end());
}

//--------------------------------------------------------------
void testApp::draw(){

    myProjectile.show();
	for (int i = 0; i < fingers.size(); i++) {
        fingers[i].show();
    }
    for (int i = 0; i < enemies.size(); i++) {
        enemies[i].show();
    }

}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    int fingerId = 999;
    bool moveExisting = false;
    for (int i = 0; i < fingers.size(); i++) {
        if (fingers[i].touching(touch.x, touch.y)) {
            fingerId = i;
            moveExisting = true;
            break;
        }
    }
    
    if (!moveExisting) {
        Finger newFinger;
        newFinger.set(touch.x, touch.y);
        newFinger.id = touch.id;
        fingers.push_back(newFinger);
        myProjectile.add(ofPoint(touch.x, touch.y));

    }
    

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    for (int i = 0; i < fingers.size(); i++) {
        if (fingers[i].touching(touch.x, touch.y)) {
            fingers[i].set(touch.x, touch.y);
            myProjectile.points[i].set(touch.x, touch.y);

        }
    }

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

