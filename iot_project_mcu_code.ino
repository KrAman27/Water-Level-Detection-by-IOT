#include <ESP8266WiFi.h>
#include <SoftwareSerial.h>
#include <FirebaseArduino.h>
#include <FirebaseHttpClient.h>

#define FIREBASE_HOST "Host-ID"
#define FIREBASE_AUTH "Auth key"
#define WIFI_SSID "Name"
#define WIFI_PASSWORD "Password"


int resval=0;
int respin=A0;


void setup() {
  Serial.begin(9600);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while(WiFi.status() != WL_CONNECTED){
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  if(Firebase.failed()){
    Serial.println("Connection to Firebase failed");
  } else {
    Serial.println("Connected to Firebase database");
  }
  Firebase.setInt("level", 0);
}
void loop() {
  resval=analogRead(respin);
  Firebase.setInt("level", resval);
  if(Firebase.failed()){
    Serial.print("Unable to update the database ");
    Serial.println(Firebase.error());
  }
  Serial.println(Firebase.getInt("level"));
  Serial.println(resval);
  delay(1000);
}
