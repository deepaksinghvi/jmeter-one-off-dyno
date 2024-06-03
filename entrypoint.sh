#!/bin/bash
#export JAVA_HOME=./openjdk_17.0.10.0.101_17.49.16_x64
#export PATH=$PATH:${JAVA_HOME}/bin
export JMETER_HOME=./apache-jmeter-5.6.3
export PATH=$PATH:${JMETER_HOME}/bin
echo "*****PATH******"
echo $PATH
echo $SCRIPT_FILE_PATH
echo $SCRIPT_NAME

#curl https://raw.githubusercontent.com/deepaksinghvi/jmeter-base-image/main/tests/Demo_Test_Plan.jmx > ./test/Demo_Test_Plan.jmx
curl $SCRIPT_FILE_PATH > ./test/$SCRIPT_NAME
jmeter -n -t ./test/$SCRIPT_NAME -l ./csvreport/reports.csv  -e -o ./htmlreport

echo "*****RESULT START******"
echo "reports.csv generated in csvreport"
ls -lrt ./csvreport

cat ./csvreport/reports.csv

echo "html report generated in htmlreport"
ls -lrt ./htmlreport

echo "Execution Completed"
echo "*****RESULT END******"