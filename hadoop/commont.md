/opt/zookeeper-3.4.10/bin/zkServer.sh start
hdfs namenode -format
/opt/hadoop-2.7.3/sbin/start-dfs.sh
/opt/hadoop-2.7.3/sbin/start-yarn.sh
/opt/hbase-1.3.1/bin/start-hbase.sh
jps

root@ruizhia:/opt/hadoop-2.7.3# jps
3713 SecondaryNameNode
3027 QuorumPeerMain
3883 ResourceManager
4142 Jps
3518 NameNode


/opt/zookeeper-3.4.10/bin/zkServer.sh stop
