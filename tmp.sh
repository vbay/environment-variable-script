# 正式
```
docker run --name xiaolei-postgresql --network=host -v /home/xiaolei/projects/dockerpro/postgres:/root -e POSTGRES_PASSWORD=123456 -d postgres:latest

docker run --name xialei-ngphp -p 9980:80 -v /home/xiaolei/Projects/Html:/var/www/html:ro -d richarvey/nginx-php-fpm

docker network create -d bridge --subnet 172.25.0.0/16 bigdata_net

docker run -p 8880:80 --name xiaolei-nginxphp -v /home/xiaolei/Projects/dockerpro/nginxphp:/var/www/html -d richarvey/nginx-php-fpm

docker run --name xiaolei-mongo -v /home/xiaolei/Projects/dockerpro/mongo:/data/db -d mongo
docker run --name xiaolei-bigmongo -p 27017:27017 -v /home/xiaolei/Projects/dockerpro/bigmongo:/data/db -d mongo


docker run -it --rm \
    --name xiaolei-mongo-express \
    --link xiaolei-mongo:mongo \
    -p 8081:8081 \
    -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance" \
    -e ME_CONFIG_BASICAUTH_USERNAME="xiaolei" \
    -e ME_CONFIG_BASICAUTH_PASSWORD="123456" \
    mongo-express

docker run -it  \
    --name xiaolei-mongo-express \
    --link xiaolei-mongo:mongo \
    -p 8081:8081 \
    -e ME_CONFIG_OPTIONS_EDITORTHEME="ambiance" \
    -e ME_CONFIG_BASICAUTH_USERNAME="xiaolei" \
    -e ME_CONFIG_BASICAUTH_PASSWORD="123456" \
    mongo-express

db.createUser(
{
user: "testuser",
pwd: "testuser",
roles: [ "root" ]
}
)

```
```
docker run -it --rm testimages:16.04 bash
docker build .
```






docker run --name ruizhi-postgresql --network=host -v /root/docker/postgresql:/root -e POSTGRES_PASSWORD=RZdt@1024 -d postgres:latest

docker run --name docker-postgresql -v ~/Documents/coderz/www:/root:ro -e POSTGRES_PASSWORD=123456 -d postgres
docker run --name docker-postgresql -p 5432:5432 -v /home/xiaolei/Projects/dockerpro/postgresql:/root -e POSTGRES_PASSWORD=123456 -d postgres

docker run --name docker-nginx-php -v ~/Documents/coderz/www:/var/www/html:ro -d richarvey/nginx-php-fpm
docker run --name xialei-ngphp -p 9980:80 -v /home/xiaolei/Projects/Html:/var/www/html:ro -d richarvey/nginx-php-fpm


docker run --name docker-redis -v ~/Documents/coderz/www:/data:ro -d redis

docker run --name docker-redis -v ~/Documents/coderz/www:/data:ro -d redis redis-server --appendonly yes

xiaolei@wang:~$ docker run --name docker-redis -d redis redis-server --appendonly yes

docker run --name ruizhi-mongo -v ~/Docker/databases/mongo/mongo-web:/data/db -d mongo
docker run --name ruizhi-nginx -v ~/Data/DC/DockerData/NginxData/html:/usr/share/nginx/html -d -p 9998:80 nginx

docker run --name xiaolei-pgadmin4 \
           -p 5050:5050 \
           -d fenglc/pgadmin4

docker run --name xiaolei-tensorflows -it -p 8888:8888 -v ~/Data/DC/DockerData/TensorflowData:/notebooks/data tensorflow/tensorflow

docker run -p 8880:80 --name xiaolei-nginxphp -v /home/xiaolei/Data/DC/DockerData/RZnginxphp:/var/www/html -d richarvey/nginx-php-fpm

docker run --name xiaolei-tomcat  -v /home/xiaolei/Princess/max/bookcot.cn/_site:/usr/local/tomcat/webapps/ROOT -p 8888:8080 -d  tomcat

tmp############

docker run --name ruizhi-nginx -v ~/docker/data/nginx:/usr/share/nginx/html -d -p 9998:80

docker run --name tmpnginx -v ~/docker/data/nginxtmp/:/usr/share/nginx/html/data -d -p 9998:80

docker run  -p 8810:80 --name xiaolei-tmp3 -v ~/Data/DC/DockerData/tmp3:/app -d webdevops/php-nginx


docker run --name xiaolei-phpini -v "$pwd":/root -d -p 8881:80  webdevops/php-nginx

docker run -d -p 80:80 --name xiaolei-php -v "$pwd":/var/www/html php:7.0-apache
docker run -d -p 9980:80 --name xiaolei-phpnginx1 -v "$pwd":/var/www/html

docker run -d -p 9980:80 --name xiaolei-phpnginx1 -v "$pwd":/var/www/html
docker run -d -p 8810:80 --name xiaolei-8810 -v /home/xiaolei/Data/DC/DockerData/rep:/var/www/html

```
mongo admin
db.createUser({ user: 'xiaolei', pwd: '123456', roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] });
```
```
log信息
Successfully added user: {
    "user" : "xiaolei",
    "roles" : [
        {
            "role" : "userAdminAnyDatabase",
            "db" : "admin"
        }
    ]
}
```

$ docker run --name docker-mariadb -v ~/Documents/coderz/www/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mariadb

```
server
生成签名证书
$ mkdir -p ~/registry/certs && cd ~/registry/certs

openssl req -x509 -days 3650 -subj '/CN=reg.rzdocker.com/' -nodes -newkey rsa:2048 -keyout registry.key -out registry.crt

生成用户名和密码
mkdir -p ~/registry/auth && cd ~/registry/auth
docker run --rm --entrypoint htpasswd registry -Bbn testuser password > ./htpasswd

创建证书目录
sudo mkdir -p /etc/docker/certs.d/reg.rzdocker.com:5000
sudo cp ~/registry/certs/registry.crt /etc/docker/certs.d/reg.rzdocker.com:500

启动私有仓库容器
docker run -d -p 5000:5000 --name=registry --restart=always -v ~/registry/auth:/auth -v ~/registry/certs:/certs -v /docker/registry:/var/lib/registry -e REGISTRY_AUTH=htpasswd -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/registry.crt -e REGISTRY_HTTP_TLS_KEY=/certs/registry.key registry


cline

sudo mkdir -p /etc/docker/certs.d/reg.rzdocker.com:5000

sudo scp -r ruizhi@192.168.0.160:/home/ruizhi/registry/certs/registry.crt /etc/docker/certs.d/reg.rzdocker.com:5000

```
xiaolei@wang:~$ docker exec -it docker-mariadb bash

镜像
docker run -i -t postgres /bin/bash
docker run --name
容器
docker start dockername
docker stop docekrname
````
docker link


##镜像下载，从hub.docker.com中下载最新版本的postgres
```
docker pull postgres
```
##首次启动一个容器，名称为``--name docker-postgresql ``，把容器/root文件挂在到 ~/codehub下 ```-v ~/codehub:/root:ro ```,设置postgres密码为123456```-e POSTGRES_PASSWORD=123456 ```
```
docker run --name docker-postgresql -v ~/codehub:/root:ro -e POSTGRES_PASSWORD=123456 -d postgres
```
##开启容器
```
docker start docker-postgresql
```
##执行容器（已经开启的）并进入容器内部命令行
```
docker exec -it docker-postgresql bash
```
##停止容器
```
docker stop docker-postgresql
```
##查看所有容器（包含启动或者未启动的）
```
docker ps -a
```
##删除某个容器
```
docker rm docker-postgresql
```
##查看正在运行的容器
```
docker ps
```
##查看已经下载的镜像
```
docker images
```
##查看容器详情
```
docker inspect docker-postgresql
```
