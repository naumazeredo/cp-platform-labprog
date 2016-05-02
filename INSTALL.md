# Tomcat

To install Tomcat just visit http://tomcat.apache.org/ go to Downloads
(Tomcat 8 or 9 is recommended) and download the Core Binary Distribution
and extract to wherever you like (way too simple).

# Sophos platform

Download this [repository](https://github.com/naumazeredo/cp-platform-proto).

Copy `ROOT` to `<Tomcat install folder>/webapps`.

# Running

Go to `bin` folder in Tomcat install location and run `./startup.sh` (on Windows
run `startup.bat`).

Now open your browser and visit the url `http://localhost:8080/sophos`.

# Contributing

Create/modify the Servlet java source files in `src` folder. Use `make` (or build by hand)
to build all source codes in `src` folder to `ROOT/WEB-INF/classes` folder.

Create/modify interface files (.html, .jsp, etc) in `ROOT` folder.

Copy all modifications from `ROOT` to Tomcat webapps.

If you modify classes while running Tomcat you ~probably~ have to shutdown Tomcat and
startup again (`./shutdown.sh && ./startup.sh`, or use .bat files on Windows).
