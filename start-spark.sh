/home/hadoop/spark-1.2.1-hadoop2.4/bin/spark-shell --master yarn-client --driver-memory 4G --executor-memory 4G --num-executors 3 --executor-cores 2\
    --conf spark.serializer=org.apache.spark.serializer.KryoSerializer \
    --conf spark.kryo.registrator=com.uebercomputing.mailrecord.MailRecordRegistrator \
    --conf spark.kryoserializer.buffer.mb=128 \
    --conf spark.kryoserializer.buffer.max.mb=512 \
    --jars mailrecord-utils-0.9.0-SNAPSHOT-shaded.jar,.versions/2.4.0/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.4.0.jar\
    --driver-java-options "-Dlog4j.configuration=log4j.properties"
