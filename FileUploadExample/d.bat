set TOMCAT_HOME=C:\Tools\ApacheTomcat
rem call %TOMCAT_HOME%\bin\shutdown.bat
del %TOMCAT_HOME%\webapps\StudyBuddy.war
rmdir %TOMCAT_HOME%\webapps\StudyBuddy /S /Q
rmdir %TOMCAT_HOME%\work\Catalina\localhost  /S /Q

copy target\StudyBuddy.war %TOMCAT_HOME%\webapps
cd %TOMCAT_HOME%\bin
call %TOMCAT_HOME%\bin\startup.bat
cd C:\Donny\workspace\FileUploadExample

