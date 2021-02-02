#!/bin/bash
# 定义镜像和容器的名称
# name=(flask_redis flask_web)
name=(root_web_1 test_web_1 test_redis_1 root_redis_1 e54b3083d79b_root_web_1)
# 判断是否容器存在
for i in  ${name[*]}; do
# echo "$i"
docker ps -a | grep $i > /dev/null
if [ $? -eq 0 ]
then
    echo $name" is up,we will stop and remove it!!!"
    docker stop $i
    docker rm $i
else
    echo $i" is not up!!!"
fi
done



# #判断是否镜像存在
# docker images | grep $name &> /dev/null
# #如果存在，删除该镜像
# if [ $? -eq 0 ]
# then
#     echo $name" image is existed,we will remove it!!!"
#     docker rmi $(docker images | grep $name | awk "{print $3}")
# else
#     echo $name" image is not existed!!!"
# fi