import processing.sound.*;
SoundFile alert;
Timer timer;
Button restartButton;
Button startButton;
Timer restTimer;
Button plusOne;
Button minusOne;
Button plusFive;
Button minusFive;
Button select;
int interval;
int workout;
int rest;
boolean mouseClicked = false;
int editingWorkout;
enum ApplicationState{
  workoutState,
  restState,
  menuState
}
ApplicationState currentState = ApplicationState.menuState;
void setup(){
  alert = new SoundFile(this,"beep.wav");
  editingWorkout = 0;
  size(displayWidth, displayHeight);
  timer = new Timer();
  restTimer = new Timer();
  restartButton = new Button(width/2,600,100,50,"Restart");
  startButton = new Button(width/2,600,100,50,"Start");
  timer.setInterval(workout);
  restTimer.setInterval(rest);
  interval = 0;
  plusOne = new Button(width/2+150,400,100,50,"+1");
  minusOne = new Button(width/2-150,400,100,50,"-1");
  plusFive = new Button(width/2+300,400,100,50,"+5");
  minusFive = new Button(width/2-300,400,100,50,"-5");
  select = new Button(width/2,400,100,50,"Switch");
}
void draw(){
  
  //println(timer.secondsLeft());
  //background(255);
  //text(timer.secondsLeft(),width/2,height/2);
  //if(timer.alert() == true){
  //  background(0);
  //}
  //restartButton.show();
  //if(restartButton.checkClick() == true){
  //  background(255,0,0);
  //}
  background(255);
  switch(currentState){
    case menuState:
      startButton.show();
      plusOne.show();
      minusOne.show();
      plusFive.show();
      minusFive.show();
      select.show();
      if(select.checkClick()==true){
        editingWorkout++;
      }
      if(editingWorkout%3 == 0){
        text("Workout Timer",width/2,100);
        text(workout,width/2,200);
        if(plusOne.checkClick() == true){
           workout = workout+1;
        }
        if(minusOne.checkClick() == true){
           workout = workout-1;
           if(workout<0){
             workout = 0;
           }
        }
        if(plusFive.checkClick() == true){
           workout = workout+5;
        }
        if(minusFive.checkClick() == true){
           workout = workout-5;
           if(workout<0){
             workout = 0;
           }
        }
      }
      if(editingWorkout%3 == 1){
        text("Rest Timer",width/2,100);
        text(rest,width/2,200);
        if(plusOne.checkClick() == true){
          rest = rest+1;
        }
        if(minusOne.checkClick() == true){
          rest = rest-1;
          if(workout<0){
             workout = 0;
           }
        }
        if(plusFive.checkClick() == true){
          rest = rest+5;
        }
        if(minusFive.checkClick() == true){
          rest = rest-5;
          if(workout<0){
             workout = 0;
           }
        }
      }
      if(editingWorkout%3 ==2){
        text("Workout Intervals",width/2,100);
        text(interval,width/2,200);
        if(plusOne.checkClick() == true){
          interval = interval+1;
        }
        if(minusOne.checkClick() == true){
          interval = interval-1;
          if(interval<0){
             interval = 0;
           }
        }
        if(plusFive.checkClick() == true){
          interval = interval+5;
        }
        if(minusFive.checkClick() == true){
          interval = interval-5;
          if(interval<0){
             interval = 0;
           }
        }
      }
      if(startButton.checkClick() == true){
        currentState = ApplicationState.workoutState;
        timer.setTimeStamp();
        timer.setInterval(workout);
        restTimer.setInterval(rest);
      }
      break;
     case workoutState:
       
       text(timer.secondsLeft(),width/2,height/2);
       if(timer.secondsLeft() == 1 && alert.isPlaying() == false){
          alert.play();
        } 
       if(timer.secondsLeft() == 0){
        
         interval = interval - 1;
         if(interval == 0){
          currentState = ApplicationState.menuState;
        }
        else{
          restTimer.setTimeStamp();
          currentState = ApplicationState.restState;
        }
       }
       break;
      case restState:
       
        text(restTimer.secondsLeft(),width/2,height/2);
        if(restTimer.secondsLeft() == 1 && alert.isPlaying() == false){
          alert.play();
        }  
        if(restTimer.secondsLeft() == 0){
         
          timer.setTimeStamp();
          currentState = ApplicationState.workoutState;
        }
      
  }
  mouseClicked = false;
}
void mouseClicked(){
  mouseClicked = true;
}
