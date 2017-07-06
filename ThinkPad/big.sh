#!/usr/bin/env bash
. /etc/profile
if [ ! -n "$1" ] ;then
    echo "***************************************************"
    echo " 1|start-all	zookeeper-3.4.10,Hadoop-2.7.2,kafka_2.12-0.10.2.1,Spark-2.1.1,hbase-1.2.6...Enjoy!"
    echo " 2|stop-all   spark-2.0.0 hadoop-2.7.2,stop..."
    echo " 3|jupyter  	Spark Pro on Jupyter,Enjoy!"
    echo " 4|pgadmin4  	pgadmin4,http://localhost:5050"
    echo " 5|ssh     	spark-1.6.2 hadoop-2.6.4,stop..."
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
  1|start-all )
  echo "大数据伪分布式开启中>>>"
  echo "1/4 zookeeper开启中>>>"
  /opt/zookeeper-3.4.10/bin/zkServer.sh start
  echo "1/4 zookeeper<开启成功>"
#   /opt/hadoop-3.0.0/bin/hdfs namenode -format (第一次需要format)
  echo "2/4 hadoop　开启中>>>"
  /opt/hadoop-3.0.0/sbin/start-all.sh
  echo "2/4 hadoop　<开启成功>"
  echo "3/4 spark　开启中>>>"
#  /opt/kafka_2.12-0.10.2.1/bin/kafka-server-start.sh /opt/kafka_2.12-0.10.2.1/config/server.properties
  /opt/spark-2.1.1-bin-hadoop2.7/sbin/start-all.sh
  echo "3/4 spark　<开启成功>"
  echo "4/4 hbase　开启中>>>"
  /opt/hbase-1.2.6/bin/start-hbase.sh
  echo "4/4 hbase　<开启成功>"

  jps
  echo "大数据伪分布式<开启成功>zookeeper-3.4.10,Hadoop-3.0.0,kafka_2.12-0.10.2.1,Spark-2.1.1,hbase-1.2.6...Enjoy!"
    ;;
  2|stop-all )
  echo "大数据伪分布式关闭中>>>"

  /opt/hadoop-3.0.0/sbin/stop-all.sh
  /opt/spark-2.1.1-bin-hadoop2.7/sbin/stop-all.sh
  /opt/hbase-1.2.6/bin/stop-hbase.sh
  /opt/zookeeper-3.4.10/bin/zkServer.sh stop

  jps
  echo "大数据伪分布式<关闭成功>！"
    ;;
  3|jupyspark )
  cd /home/wxl/Projects/PyProjects
  PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS='notebook' pyspark
  echo "Spark Pro on Jupyter,Enjoy!"
    ;;
  4|start )
  echo "pgadmin4 <开启成功>"
  . /etc/profile
  pgadmin4
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
