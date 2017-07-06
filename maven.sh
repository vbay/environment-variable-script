

#!/bin/sh
# Author:wangxiaolei 王小雷
# Blog:http://blog.csdn.net/dream_an
# Github:https://github.com/wxiaolei
# Date:20161027
# Path:/etc/profile.d/apache-maven-3.3.9.sh

export M2_HOME=/opt/apache-maven-3.3.9
export PATH=${M2_HOME}/bin:${PATH}

export M2_HOME=/opt/maven-3.3.9
export MAVEN_OPTS="-Xmx1024m"                          #避免内存溢出错误（可选）
export PATH=${M2_HOME}/bin:${PATH}


export PATH=/opt/apache-maven-3.3.9/bin:$PATH
export JAVA_HOME=/opt/jdk1.8.0_112
export _JAVA_OPTIONS="-Xmx2048m -XX:MaxPermSize=512m -Djava.awt.headless=true"
