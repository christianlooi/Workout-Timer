class Button{
    float x,y,w,h;
    String text;
  public Button(float x, float y, float w, float h, String text){
       this.x = x;
       this.y = y;
       this.w = w;
       this.h = h;
       this.text = text;
  }
  public void show(){
    fill(255);
    rect(x-w/2,y-h/2,w,h);
    textSize(32);
    fill(0);
    textAlign(CENTER,CENTER);
    text(text,x,y);
  }
  public boolean checkClick(){
    if(mouseClicked == true && x-w/2<mouseX&& mouseX<x+w/2&&y-h/2<mouseY&&mouseY<y+h/2){
      return(true);
    }
    else{
      return(false);
    }
  }  
}
