first, start ssh local host:
sudo service ssh start
ssh localhost
sudo service ssh status -> not important

then start hadoop:
./hadoop-3.4.0/sbin/start-all.sh

use jps, to see if everything(including datanode) is running:
jps

nuclei error: https://stackoverflow.com/questions/68414746/what-ist-the-reason-for-the-error-message-error-function-nucleus-ascii-alrea
    if still doesnt get datanode:
    hdfs --daemon stop datanode
    rm -rf /home/hdoop/dfsdata/datanode/*
    hdfs --daemon start datanode



then, initialize derby:
schematool -dbType derby -initSchema
    if derby causes some error, then try doing:
    mv metastore_db metastore_db.tmp

then go for hive:
hive


===========================================================================
for stopping:

quit; -> in hive

then, stop hadoop:
./hadoop-3.4.0/sbin/stop-all.sh

use jps, to see if everything(including datanode) has stopped:
jps

then, stop ssh:
sudo systemctl stop ssh (or) sudo service sshd stop
sudo service ssh status

=============================================================================

running commands:
source /home/hdoop/Desktop/NoSQL_Assignment_3/<filename>.hql;


=============================================================================
to run the UDF, put this into grunt:
pig -f pig_2.pig