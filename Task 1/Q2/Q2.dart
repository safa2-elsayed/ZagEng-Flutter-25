void main(){
  double distance =25.0 ;
  double speed = 40.0 ;
  double Time = distance / speed ;
  int hours= Time.toInt();
  int minutes= ((Time -hours) *60).toInt() ;
  int seconds= (((Time -hours)*60-minutes)*60).toInt() ;

print ("To reach the office you spend $hours Hours, $minutes Minutes, $seconds Seconds");
}