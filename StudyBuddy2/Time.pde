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
        return "";
    }
    
    String getTwentyFourHourClockTime(){
        //TODO: return 15:24 as an example
        return "";
    }
}
