#!/bin/bash

if [ $# <= 2 ] ; then  
    echo "USAGE: bash cert.sh 域名"
    echo " e.g.: bash cert.sh blog.ihww.cn "
    exit 1;
fi

DOMAIN=$1  
# 生成一个RSA密钥
openssl genrsa -des3 -out ${DOMAIN}.key 1024  
# 拷贝一个不需要输入密码的密钥文件
openssl rsa -in ${DOMAIN}.key -out ${DOMAIN}.nopass.key  
# 生成一个证书请求
openssl req -new -key ${DOMAIN}.key -out ${DOMAIN}.csr -subj "/C=CN/ST=jiangsu/L=suzhou/O=${DOMAIN}/OU=Web Security/CN=${DOMAIN}"  
# 自己签发证书
openssl x509 -req -days 365 -in ${DOMAIN}.csr -signkey ${DOMAIN}.key -out ${DOMAIN}.crt

exit 0  
