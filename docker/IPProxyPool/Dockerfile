FROM hub.c.163.com/library/ubuntu:16.04
MAINTAINER ihuangweiwei ihuangweiwei@163.com

RUN apt-get update \
    && apt-get install -y  python-lxml git sqlite3 python-pip \
    && pip install requests chardet web.py sqlalchemy gevent psutil pymongo \
    && cd /usr/local/ && git clone https://github.com/qiyeboy/IPProxyPool.git

ENV DB_CONNECT_TYPE sqlalchemy
ENV DB_CONNECT_STRING sqlite:///user/local/IPProxyPool/data/proxy.db


EXPOSE 8000

ENTRYPOINT [ "sh", "-c", "cd /usr/local/IPProxyPool && python IPProxy.py" ]




