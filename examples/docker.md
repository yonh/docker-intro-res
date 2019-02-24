## docker examples
``` bash
# 启动ubuntu容器，设置端口映射 宿主机8080=>容器内80, 设置停止容器后自动删除容器
docker run -it --rm -p 8080:80 ubuntu:16.04
# push容器到docker hub
docker push yonh/php

# 拉取镜像
docker pull python
docker pull ruby
# 查看日志
docker logs -f wekan-app

# 启动容器 mytools
docker start mytools

# 进入容器 mytools
docker exec -it mytools bash
# 重启容器
docker restart dns
# 删除容器 -f强制删除
docker rm -f mytools

# 启动一个mysql实例, 自动重启， root密码为root 端口映射3306=>3306，mysql版本5.6
docker run --name mysql --restart=always -e MYSQL_ROOT_PASSWORD=root -d -p3306:3306 mysql:5.6

# 拷贝容器内的/etc/nginx/nginx.conf文件到当前目录
docker cp mytools:/etc/nginx/nginx.conf ./
# 拷贝nginx.conf到容器内的/etc/nginx/nginx.conf
docker cp ./nginx.conf mytools:/etc/nginx/nginx.conf

# 启动一个php程序,挂载当前目录到容器内/app，设置环境变量WEBAPP_ROOT=public
# 不要用 . 表示当前目录，会挂载失败的
docker run --name=webapp -e "WEBAPP_ROOT=public" \
	-v $PWD:/app -p 80:80 yonh/php:alpine-apache

# 启动mysql容器，设置root密码=root，设置数据库=data_draw， 初始化数据库，mysql版本5.6
docker run -d --name mysql \
	-e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_DATABASE=data_draw \
    -v $PWD/mysql.sql:/docker-entrypoint-initdb.d/dump.sql \
    mysql:5.6

# 启动mysql，挂载mysql数据目录到当前目录data
docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=root -v "$PWD/data":/var/lib/mysql  -p3306:3306  mysql:5.6

# 删除镜像
docker rmi ubuntu:16.04
# 查看镜像
docker images
# 查看所有容器
docker ps -a


# 导出镜像
docker save docker.elastic.co.beats.filebeat:5.5.2 > docker.elastic.co.beats.filebeat_5.5.2.img

# 导入镜像
docker load < ./docker.elastic.co.beats.filebeat_5.5.2.img
```
