FROM centos
MAINTAINER Lubo Ivanovic <luboi75@googlemail.com>

ADD opt/ /opt/

RUN yum -y install libaio bc initscripts net-tools \
	&& yum clean all \
	&& yum -y localinstall /opt/rpm/oracle-xe-11.2.0-1.0.x86_64.rpm \
	&& rm -f /opt/rpm/oracle-xe-11.2.0-1.0.x86_64.rpm \
	&& export MEMORY_TARGET=32M \
	&& export MEMORY_MAX_TARGET=64M \
	&& export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe \
	&& export ORACLE_SID=XE \
	&& export PATH=$ORACLE_HOME/bin:$PATH \
	&& rm -f /u01/app/oracle/product/11.2.0/xe/config/scripts/init.ora \
		/u01/app/oracle/product/11.2.0/xe/config/scripts/initXETemp.ora \
	&& cp /opt/config/* \
		/u01/app/oracle/product/11.2.0/xe/config/scripts \
	&& chown oracle:dba /u01/app/oracle/product/11.2.0/xe/config/scripts/* \
	&& chmod 755 /u01/app/oracle/product/11.2.0/xe/config/scripts/* \
	&& /etc/init.d/oracle-xe configure \
		responseFile=/u01/app/oracle/product/11.2.0/xe/config/scripts/xe.rsp 

EXPOSE 1521 8080

CMD /u01/app/oracle/product/11.2.0/xe/config/scripts/start.sh

###############################################################################
# optional environment variables to set after images is built 
###############################################################################
# ENV MEMORY_TARGET 32M
# ENV MEMORY_MAX_TARGET 64M
ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
ENV ORACLE_SID XE
ENV PATH $ORACLE_HOME/bin:$PATH

