# docker-centos-oracle
oracle 11g express edition docker image based on centos

prior building this docker image you need to download the oracle 11g express edition 
find the link under opt/rpm/oracle-xe-11.2.0-1.0.x86_64.rpm.lnk

you only need to extract 
    folder upgrade
    file oracle-xe-11.2.0-1.0.x86_64.rpm 

into folder opt/rpm/

after having extracted above files, you can run 

    docker build -t <imagename> .




