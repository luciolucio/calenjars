#!/usr/bin/env bash

LIB_NAME="calenjars"

echo Creating uberjar: "${LIB_NAME}.jar"
clojure -A:depstar -m hf.depstar.jar "${LIB_NAME}.jar"

echo Updating pom with latest dependecies
clojure -Spom

echo Deploying to clojars
mvn deploy:deploy-file -Dfile="${LIB_NAME}.jar" -DpomFile=pom.xml -DrepositoryId=clojars -Durl=https://clojars.org/repo
