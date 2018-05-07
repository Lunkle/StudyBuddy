CustomCalendar calendar = new CustomCalendar();

class CustomCalendar{
    CustomCalendar(){
    }
    
    String getMonthDay(){
        return getMonth() + ", " + day();
    }
    
    String getMonth(){
        int monthNum = month();
        switch(monthNum){
            case 1:
                break;
            case 2:
        }
    }
}
