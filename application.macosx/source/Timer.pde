class Timer{
  int timeStamp;
  int interval;
  
  public Timer(){
    timeStamp = 0;
    interval = 0;
    
    
  }
  public void setInterval(int seconds ){
    interval = seconds*1000;
  }
  public void setTimeStamp(){
    timeStamp = millis();
  }
  public boolean alert(){
    if(timeStamp+interval<millis()){
      return(true);
     
    }
    else{
      return(false);
    }
  }
  public int secondsLeft(){
    return((timeStamp+interval-millis())/1000+1);
  }
}
