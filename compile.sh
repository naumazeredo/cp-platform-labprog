#!/bin/bash

export CLASSPATH='/home/naum/Documents/tomcat9/lib/servlet-api.jar'
echo "Compiling..."
javac src/*.java -d ROOT/WEB-INF/classes
echo "Done!"
