int pinLed1 = 3;
int pinLed2 = 5;
int pinLed3 = 7;
int val = 0;
bool write1;
bool write2;
bool write3;

void setup() {
  Serial.begin(9600);
  pinMode(pinLed1,OUTPUT);
  pinMode(pinLed2,OUTPUT);
  pinMode(pinLed3,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
   if(Serial.available()==true){
     val = Serial.read();
     if(val>=128){
       if(val == 128){
         write1 = true;
       }
       else{
         write1 =false;
       }
       if(val == 129){
         write2= true;
       }
       else{
         write2=false;
       }
       if(val == 130){
         write3= true;
       }
       else{
         write3=false;
       }
     }
     else{
       if(write1){
         analogWrite(pinLed1,val);
       }
       if(write2){
         analogWrite(pinLed2,val);
       }
       if(write3){
         analogWrite(pinLed3,val);
       }
     }
   }
}
