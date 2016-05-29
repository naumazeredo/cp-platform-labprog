# Tomcat

To install Tomcat just visit http://tomcat.apache.org/ go to Downloads
(Tomcat 8 or 9 is recommended) and download the Core Binary Distribution
and extract to wherever you like (way too simple).

# Database - MySQL

MySQL access should be `root` with password `123456`. If you need to use other
credentials alter _FabricaConexoes.java_.

Create a database named **sophos** and import _sophos.sql_ (`mysql -p sophos < sophos.sql`).

# Sophos platform

Download this [repository](https://github.com/naumazeredo/cp-platform-proto).

Copy `ROOT` to `<Tomcat install folder>/webapps`.

# Running

Go to `bin` folder in Tomcat install location and run `./startup.sh` (on Windows
run `startup.bat`).

Now open your browser and visit the url `http://localhost:8080`.

# Build

To build Servlet .java files you first need to have an environment variable
`CLASSPATH` containing the value: `<Tomcat install folder>/lib/servlet-api.jar`.

Use `make` (or build by hand) to build all source codes in `src` folder
to `ROOT/WEB-INF/classes` folder.

If you don't want to set `CLASSPATH`, you can modify `compile.sh` and run using
`./compile.sh`.

# Contributing

Create/modify the Servlet java source files in `src` folder. See `Build` to know
how to compile the source files.

Create/modify interface files (.html, .jsp, etc) in `ROOT` folder.

Copy all modifications from `ROOT` to Tomcat webapps.

If you modify classes while running Tomcat you ~probably~ have to shutdown Tomcat and
startup again (`./shutdown.sh && ./startup.sh`, or use .bat files on Windows).
