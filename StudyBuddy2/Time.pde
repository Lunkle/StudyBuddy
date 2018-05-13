class Time {
  int hour;
  int minute;
  int second;

  Time(int hour, int minute, int second) {
    this.hour = hour;
    this.minute = minute;
    this.second = second;
  }

  Time(int hour, int minute) {
    this(hour, minute, 0);
  }

  String getTwelveHourClockTime() {
    //TODO: return 3:24pm as an example
    String twelveTime;
    String minuteString = (this.minute < 10? "0":"") + str(this.minute);
    if (this.hour < 12) {
      twelveTime=str(this.hour)+str(':') +minuteString+ " am";
    } else {
      twelveTime=str(this.hour-12)+str(':') +minuteString+" pm";
    }
    return twelveTime;
  }

  String getTwentyFourHourClockTime() {
    //TODO: return 15:24 as an example
    String fullClock;
    String minuteString = (this.minute < 10? "0":"") + str(this.minute);
    fullClock=str(this.hour)+ ":" +minuteString;
    return fullClock;
  }

  Time convertFromString(String timeString) {
    String[] splitNums = timeString.split(":");
    return new Time(int(splitNums[0]),int(splitNums[1]));
  }
  
  
  
  
}