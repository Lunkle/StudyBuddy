void writeText(String fileName, String[] text) {
    PrintWriter output = createWriter(fileName);
    for (int i = 0; i < text.length; i++) {
        output.println(text[i]);
    }
    output.flush(); // Writes the remaining data to the file
    output.close(); // Finishes the file
}
