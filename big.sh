#!/usr/bin/env bash
if [ ! -n "$1" ] ;then
    echo "***************************************************"
    echo " 1|start-all	Spark-2.0.0,Hadoop-2.7.2,start..."
    echo " 2|stop-new     spark-2.0.0 hadoop-2.7.2,stop..."
    echo " 3|jupyter  	Spark Pro on Jupyter,Enjoy!"
    echo " 4|start    	spark-1.6.2 hadoop-2.6.4,start..."
    echo " 5|stop     	spark-1.6.2 hadoop-2.6.4,stop..."
    echo " 6|HBase 	HBase-1.2.2,start..."
    echo "***************************************************"
    echo " 9|changed-to-spark-2.0.0	environment changed"
    echo " 10|changed-to-spark-1.6.2	environment changed"
    echo "***************************************************"
    read -p "input a keyword :" keyword
else
    echo "The input parameter is $1"
    keyword=$1
fi
case $keyword in
  1|start-new )
  echo "Spark-2.0.0,Hadoop-2.7.2...Enjoy!"
  /opt/zookeeper-3.4.10/bin/zkServer.sh start
  /opt/hadoop-2.8.0/bin/hdfs namenode -format
  /opt/hadoop-2.7.3/sbin/start-all.sh
  /opt/spark-2.1.0-bin-hadoop2.7/sbin/start-all.sh
  /opt/hbase-1.2.6/bin/start-hbase.sh
  jps
  echo "Spark-2.0.0,Hadoop-2.7.2...Enjoy!"
    ;;
  2|stop-new )
  echo "spark-2.0.0 hadoop-2.7.2 hbase-1.2.2 zookeeper-3.4.8,stop..."
  /opt/hadoop-2.7.2/sbin/stop-all.sh
  /opt/spark-2.0.0-bin-hadoop2.7/sbin/stop-all.sh
  /opt/hbase/bin/stop-hbase.sh
  /opt/zookeeper/bin/zkServer.sh stop
  jps
  echo "Stopped"
    ;;
  3|jupyspark )
  cd /home/wxl/Projects/PyProjects
  PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS='notebook' pyspark
  echo "Spark Pro on Jupyter,Enjoy!"
    ;;
  4|start )
  echo "spark-1.6.2 hadoop-2.6.4,start..."
  /opt/hadoop-2.6.4/bin/hdfs namenode -format
  /opt/hadoop-2.6.4/bin/hdfs namenode -format
  /opt/hadoop-2.6.4/sbin/start-all.sh
  /opt/spark-1.6.2-bin-hadoop2.6/sbin/start-all.sh
  jps
  echo "spark-1.6.2 hadoop-2.6.4,started"
    ;;

  5|stop)
  echo "spark-1.6.2 hadoop-2.6.4 hbase-1.2.2 zookeeper-3.4.8,stop..."
  /opt/hadoop-2.6.4/sbin/stop-all.sh
  /opt/spark-1.6.2-bin-hadoop2.6/sbin/stop-all.sh
  /opt/hbase/bin/stop-hbase.sh
  /opt/zookeeper/bin/zkServer.sh stop
  jps
  echo "Stopped"
    ;;

  6|HBase)
  echo "HBase-1.2.2,start..."
  /opt/hbase-1.2.2/bin/start-hbase.sh
  jps
  echo "HBase-1.2.2,start..."
    ;;
  9|changed-to-spark-2.0.0 )
  sudo mv /etc/profile.d/hadoop-2.7.2.sh.bac /etc/profile.d/hadoop-2.7.2.sh
  sudo mv /etc/profile.d/hadoop-2.6.4.sh /etc/profile.d/hadoop-2.6.4.sh.bac
  sudo mv /etc/profile.d/spark-2.0.0.sh.bac /etc/profile.d/spark-2.0.0.sh
  sudo mv /etc/profile.d/spark-1.6.2.sh /etc/profile.d/spark-1.6.2.sh.bac
  echo "Spark-2.0.0,Enjoy!Please reboot or logout!"
    ;;
  10|changed-to-spark-1.6.2 )
  sudo mv /etc/profile.d/hadoop-2.7.2.sh /etc/profile.d/hadoop-2.7.2.sh.bac
  sudo mv /etc/profile.d/hadoop-2.6.4.sh.bac /etc/profile.d/hadoop-2.6.4.sh
  sudo mv /etc/profile.d/spark-2.0.0.sh /etc/profile.d/spark-2.0.0.sh.bac
  sudo mv /etc/profile.d/spark-1.6.2.sh.bac /etc/profile.d/spark-1.6.2.sh
  echo "Spark-1.6.2,Enjoy!Please reboot or logout!"
    ;;
  * )
  echo "Invalid parameter has quit."
    ;;
esac
