#!/bin/sh

# First we need to get a few things from S3

# A "fixed" version of Spark (Thanks Markus!!!!)
echo "pulling down a patched version of Spark (Thanks Markus!!!!)"
wget --quiet https://s3.amazonaws.com/morris-datasets/ENRON/demo/spark-1.2.1.tar.gz 
tar xf /home/hadoop/spark-1.2.1.tar.gz
sleep 2

# The dataset
echo "pulling down the Enron dataset"
wget --quiet https://s3.amazonaws.com/morris-datasets/ENRON/demo/enron.avro 
sleep 1
hadoop fs -mkdir /user
hadoop fs -mkdir /user/hadoop
hadoop fs -put enron.avro enron.avro
rm enron.avro
echo "pulling down the Enron TFIDF matrix"
hadoop fs -cp s3n://morris-datasets/ENRON/demo/TFIDF hdfs:///user/hadoop/TFIDF

# some utilities
echo "pulling down some utilities (Thanks Markus!!!! Again!!!)"
wget --quiet https://s3.amazonaws.com/morris-datasets/ENRON/demo/log4j.properties 
wget --quiet https://s3.amazonaws.com/morris-datasets/ENRON/demo/mailrecord-utils-0.9.0-SNAPSHOT-shaded.jar 
wget --quiet https://raw.githubusercontent.com/notjasonmorris/AWS/master/EMR/start-spark.sh


# Hack to add variables 
wget -P ~/ --quiet https://raw.githubusercontent.com/notjasonmorris/AWS/master/EMR/bashrc
mv -f ~/bashrc ~/.bashrc
echo
echo
echo 'You are all set up.  Run "sh start-spark.sh" to get going.  Have Fun!'
echo
echo

#echo
#echo
#echo "Starting Spark with "
#echo "spark-shell --master yarn-client --driver-memory 4G --executor-memory 4G --num-executors 3 --executor-cores 2\ " | tee -a start-spark.sh
#echo "    --conf spark.serializer=org.apache.spark.serializer.KryoSerializer \ " | tee -a start-spark.sh
#echo "    --conf spark.kryo.registrator=com.uebercomputing.mailrecord.MailRecordRegistrator \ " | tee -a start-spark.sh
#echo "    --conf spark.kryoserializer.buffer.mb=128 \ " | tee -a start-spark.sh
#echo "    --conf spark.kryoserializer.buffer.max.mb=512 \ " | tee -a start-spark.sh
#echo "    --jars mailrecord-utils-0.9.0-SNAPSHOT-shaded.jar,./.versions/2.4.0/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.4.0.jar \ " | tee -a start-spark.sh
#echo "    --driver-java-options "-Dlog4j.configuration=log4j.properties" " | tee -a start-spark.sh
#echo
#echo
#echo "Have fun!"
#
#spark-shell --master yarn-client --driver-memory 4G --executor-memory 4G --num-executors 3 --executor-cores 2\
#    --conf spark.serializer=org.apache.spark.serializer.KryoSerializer \
#    --conf spark.kryo.registrator=com.uebercomputing.mailrecord.MailRecordRegistrator \
#    --conf spark.kryoserializer.buffer.mb=128 \
#    --conf spark.kryoserializer.buffer.max.mb=512 \
#    --jars mailrecord-utils-0.9.0-SNAPSHOT-shaded.jar,.versions/2.4.0/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.4.0.jar\
#    --driver-java-options "-Dlog4j.configuration=log4j.properties"
