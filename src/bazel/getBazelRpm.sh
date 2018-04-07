#!/bin/bash

# set repo file
repofile="vbatts-bazel-epel-7.repo"

# download repo file
wget https://copr.fedorainfracloud.org/coprs/vbatts/bazel/repo/epel-7/$repofile
if [ ! -f $repofile ] ;  then
    echo "Download error"
    exit
fi

# disable for yum 
sed -i 's/enabled=1/enabled=0/' $repofile

# add repofile to local yum repo list 
/bin/cp $repofile /etc/yum.repos.d/

# download bazel RPM
yum --enablerepo=vbatts-bazel list bazel
yumdownloader --enablerepo=vbatts-bazel  bazel

# remove repofile from local yum repo list 
/bin/rm /etc/yum.repos.d/$repofile
