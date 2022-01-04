#!/bin/bash
# ----------------------------------------------------------------------------
# A script for getting JFRs of a specific java application in a defined time limit
# ----------------------------------------------------------------------------
record_time= 60
jfrdump_name="JFR-recording"

function jfrrecord() {
  for (( i=1; i <= 5; i++ ))
  do
    java -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:StartFlightRecording=duration=$record_time,filename=filename="$jfrdump_name-$now.jfr" -jar Demo-Java-Analyser.jar &
    MyPID=$!
    starttime = `date +%s`
    while [ $(( $(date +%s) - 60 )) -lt $starttime ]; do
      now=`date +%Y_%m_%d_%H_%M_%S`
      echo "$now: Getting a JFR record from Java application $name"
      # Dump
    done
    kill MyPID
done
}


jfrrecord
