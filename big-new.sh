#!/usr/bin/env bash
if [ ! -n "$1" ] ;then
    echo "***************************************************"
    echo " 1|start-new	Spark-2.0.2,Hadoop-2.7.3,zookeeper,start..."
    echo " 2|stop-new     spark-2.0.2 hadoop-2.7.3,zookeeper,stop..."
    echo " 3|jupyter notebook 	Spark Pro on Jupyter,Enjoy!"

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
  /opt/hadoop-2.7.3/sbin/start-all.sh
  /opt/spark-2.0.2-bin-hadoop2.7/sbin/start-all.sh
  /opt/zookeeper-3.4.9/bin/zkServer.sh start
  jps
  echo "Spark-2.0.2,Hadoop-2.7.3...Enjoy!"
    ;;
  2|stop-new )
  echo "spark-2.0.0 hadoop-2.7.3 hbase-1.2.2 zookeeper-3.4.8,stop..."
  /opt/hadoop-2.7.3/sbin/stop-all.sh
  /opt/spark-2.0.2-bin-hadoop2.7/sbin/stop-all.sh
  /opt/zookeeper-3.4.9/bin/zkServer.sh stop
  jps
  echo "Stopped"
    ;;
  3|jupyspark )
  PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS='notebook' /opt/spark-2.0.2-bin-hadoop2.7/bin/pyspark
  echo "Spark Pro on Jupyter,Enjoy!"
    ;;


  6|HBase)
  echo "HBase-1.2.4,start..."
  /opt/hbase-1.2.2/bin/start-hbase.sh
  jps
  echo "HBase-1.2.4,start..."
    ;;

  * )
  echo "Invalid parameter has quit."
    ;;
esac
