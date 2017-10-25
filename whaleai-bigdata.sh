#!/bin/sh
# Author:wangxiaolei 王小雷
# Blog: http://blog.csdn.net/dream_an
# Github: https://github.com/wangxiaoleiai
# Date: 201707
# Organization: https://github.com/whaleai
source /etc/profile
if [ ! -n "$1" ] ;then
    echo "***************************************************"
    echo " 1|start	Hadoop-2.7.3,start..."
    echo " 2|stop     hadoop-2.7.3,stop..."
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
  1|start )
  source /etc/profile
  begin_time=$(date +%s)
  echo "whaleai大数据组件自动开启中..."
  $HADOOP_HOME/sbin/start-dfs.sh
  $HADOOP_HOME/sbin/start-yarn.sh
  $HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver
  $HBASE_HOME/bin/start-hbase.sh
  cd $SQOOP_HOME/
  sqoop2-server start
  
  echo "whaleai大数据组件已开启

  耗时:  $(($(date +%s) - $begin_time)) S

  "
    ;;
  2|stop )
  source /etc/profile
  begin_time=$(date +%s)
  echo "whaleai大数据组件关闭中..."
  $HBASE_HOME/bin/stop-hbase.sh
  $HADOOP_HOME/sbin/stop-dfs.sh
  $HADOOP_HOME/sbin/stop-yarn.sh
  $HADOOP_HOME/sbin/mr-jobhistory-daemon.sh stop historyserver
  cd $SQOOP_HOME
  sqoop2-server stop

  echo "whaleai大数据组件已关闭

  耗时:  $(($(date +%s) - $begin_time)) S

  "
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
