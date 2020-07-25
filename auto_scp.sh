#!/bin/sh
#auto change server files
#sRC=/etc/

if  [ ! -f ip.txt ];then
    echo -e "\033[31mplease create ip.txt files,the ip.txt contents as follows: \033[0m"
cat <<EOF
192.168.0.2
192.168.0.3
EOF
    exit
fi

if

  [ -z "$1" ];then
  echo -e "\033[31musage: $0 command ,example{src_files|src_dir des_dir} \033[0m"
  exit
fi

count=`cat ip.txt |wc-l`
rm -rf ip.txt.swp
i=0
while ((i< $count))
do

i=`expr $i +1`

sed "$(1)s/^/&${i} /g" ip.txt >>ip.txt.swp

IP=`awk -v I="$i" '{if(I==$i)print $2}' ip.txt.swp`
scp -r $i root@${IP}:$2

#rsync -aP --delete $1 root@${IP}:$2

done
