#!/bin/bash

Diy_n1() {
KERNEL_VERSION="5.4.105-flippy-55+o"
VERSION="5.4.105"
TIME="20210312"
mkdir opt
chmod  -R 777 opt
wget https://github.com/haohaoget/N1/releases/download/${VERSION}/mk_openwrt_src_${TIME}.tar.gz
tar -xzvf mk_openwrt_src_${TIME}.tar.gz -C opt
cp openwrt/bin/targets/armvirt/*/*.tar.gz opt/openwrt    
cd opt
mkdir imgs
chmod  -R 777 imgs
echo "PATH2=${GITHUB_WORKSPACE}/opt/imgs" >> $GITHUB_ENV
cd imgs
pathimg=$PWD
wget https://github.com/haohaoget/N1/releases/download/${VERSION}/Armbian_20.10_Aml-s9xxx_buster_${KERNEL_VERSION}.img.xz
unxz Armbian_20.10_Aml-s9xxx_buster_${KERNEL_VERSION}.img.xz
cd ../
cd openwrt
sed -i "s%WHOAMI=flippy%WHOAMI=HaoHao%g" mk_s905d_n1.sh
sed -i "s%/opt/imgs%${pathimg}%g" mk_s905d_n1.sh
chmod +x mk_s905d_n1.sh
sudo ./mk_s905d_n1.sh
sudo chmod  -R 777 tmp
}
