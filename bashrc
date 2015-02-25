# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Environment variables required by hadoop
export JAVA_HOME=/usr/java/latest
export HADOOP_HOME_WARN_SUPPRESS=true
export HADOOP_HOME=/home/hadoop
export HADOOP_PREFIX=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_CONF_DIR=$HADOOP_HOME/conf
export YARN_CONF_DIR=$HADOOP_HOME/conf
export MAHOUT_HOME=$HADOOP_HOME/mahout
export MAHOUT_CONF_DIR=$MAHOUT_HOME/conf
export MAHOUT_LOG_DIR=/mnt/var/log/apps

# Hive
export HIVE_HOME=$HADOOP_HOME/hive
export HIVE_CONF_DIR=$HIVE_HOME/conf

# HBase
export HBASE_HOME=$HADOOP_HOME/hbase
export HBASE_CONF_DIR=$HBASE_HOME/conf

# Impala
export IMPALA_HOME=$HADOOP_HOME/impala
export IMPALA_CONF_DIR=$IMPALA_HOME/conf

export PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$MAHOUT_HOME/bin:$HIVE_HOME/bin:$HBASE_HOME/bin:$IMPALA_HOME/bin:$PATH
umask 022

# Cuda
export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native:/usr/lib64:/usr/local/cuda/lib64:/usr/local/cuda/lib:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda/bin:$PATH

# Required to make ruby gem working without adding "require 'rubygems'"
export RUBYOPT=rubygems

# required by the AWS CLI
export AWS_DEFAULT_REGION=$(curl --retry 5 --silent --connect-timeout 2 http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')
# CASCADING
CASCADING_SDK_HOME=/home/hadoop/cascading
source ${CASCADING_SDK_HOME}/etc/setenv.sh
# PIG
export PIG_HOME=${HADOOP_HOME}/pig
export PIG_CONF_DIR=${PIG_HOME}/conf
export PIG_CLASSPATH=${PIG_HOME}/lib
export PATH=${PIG_HOME}/bin:${PATH}
export SCALA_HOME=/home/hadoop/.versions/scala-2.10.3
# Spark
export SPARK_HOME=/home/hadoop/spark-1.2.1-hadoop2.4
export PATH=$SPARK_HOME/bin:$PATH
