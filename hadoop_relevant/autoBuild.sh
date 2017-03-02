#!/bin/sh

HADOOP_TMP_HOME=/home/hadoop_tmp
HADOOP_HOME=/home/sorttest/hadoop
HADOOP_WORKSPACE=/home/sorttest
HADOOP_VERSION=$2

rm -rf $HADOOOP_TMP_HOME
scp int1:$1 ${HADOOP_TMP_HOME}/hadoop_tmp.tar.gz
cd $HADOOP_TMP_HOME
tar -xzf hadoop_tmp.tar.gz

HADOOP_DIR=`ls -d hadoop* | grep -v ".gz"`
if [ ${#HADOOP_DIR[*]} -lt 1 ]; then
        echo "ERROR: Please supply a hadoop!"
        exit
fi

${HADOOP_HOME}/sbin/stop-yarn.sh
${HADOOP_HOME}/sbin/stop-dfs.sh
cd ${HADOOP_WORKSPACE}
./deployHadoop.sh ${HADOOP_TMP_HOME}/${HADOOP_VERSION} ${HADOOP_WORKSPACE}/bins/hadoop-3.0.0-current_running_packet
