# Tomcat

To install Tomcat just visit http://tomcat.apache.org/ go to Downloads
(Tomcat 8 or 9 is recommended) and download the Core Binary Distribution
and extract to wherever you like (way too simple).

# Sophos platform

Download this [repository](https://github.com/naumazeredo/cp-platform-proto).

Copy `web.xml` and `classes` to `<Tomcat install folder>/webapps/ROOT/WEB-INF`.

Copy `sophos-interface` to `<Tomcat install folder>/webapps/ROOT`.

# Running

Go to `bin` folder in Tomcat install location and run `./startup.sh` (on Windows
run `startup.bat`). Now open your browser and visit the url `http://localhost:8080/sophos`.
