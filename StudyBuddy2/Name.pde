void getUsername(){
  
   
  String[] lines = loadStrings("Name.txt");
  println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++) {
    println(lines[i]);
  }
  String[];

}