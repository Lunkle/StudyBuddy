class Time{
    int hour;
    int minute;
    int second;
    
    Time(int hour, int minute, int second){
        this.hour = hour;
        this.minute = minute;
        this.second = second;
    }
    
    Time(int hour, int minute){
        this(hour, minute, 0);
    }
    
    String getTwelveHourClockTime(){
        //TODO: return 3:24pm as an example
        String twelveTime;
        if (this.hour < 12) {
          twelveTime=str(this.hour)+str(':') +str(minute);
        }
        else {
          twelveTime=str(this.hour-12)+str(':') +str(minute);
        }
        return twelveTime;
    }
    
    String getTwentyFourHourClockTime(){
        //TODO: return 15:24 as an example
        String fullClock;
        fullClock=str(this.hour)+str(':') +str(minute);
        return fullClock;
    }
    
    
}