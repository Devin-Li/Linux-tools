#This script reference to Aliyun offical document: https://opsx.alibaba.com/mirror->帮助

#CentOS Linux release 7.5.1804 (Core)
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.back
echo -e "\033[31mCannot find original repo resource or it has been renamed \033[0m"
release=`cat /etc/centos-release|cut -d " " -f 4|cut -c 1`
curl -o /etc/yum.repos.d/CentOS-Base.repo -L http://mirrors.aliyun.com/repo/Centos-${release}.repo

#cache is in /var/cache/yum, need to be clean after updating yum resource.
echo -e "\033[31m Clean the yum cache...\033[0m"
sudo yum clean all
echo -e "\033[31mRebuild yum cache\033[0m"
sudo yum makecache

#when I push this the first repo to github, I got the issue as below:
#Peer reports incompatible or unsupported protocol version.
#yum update -y nss curl libcurl solved my problem, and some guys say that yum update -y also can solve this issue.
