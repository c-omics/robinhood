FROM comics/centos
MAINTAINER Ian Merrick <MerrickI@Cardiff.ac.uk>

##############################################################
# Software:             robinhood
# Software Version:     3.1
# Software Website:     https://github.com/cea-hpc/robinhood
# Description:          Robinhood Policy Engine : a versatile tool to monitor filesystem contents and schedule actions on filesystem entries.
##############################################################

ENV APP_NAME=robinhood
ENV VERSION=3.1

RUN yum install -y \
       https://downloads.sourceforge.net/project/robinhood/robinhood/${VERSION}/RPMS/posix_fs/robinhood-posix-${VERSION}-1.el7.centos.x86_64.rpm \
       https://downloads.sourceforge.net/project/robinhood/robinhood/${VERSION}/RPMS/robinhood-adm-${VERSION}-1.noarch.x86_64.rpm \
       https://downloads.sourceforge.net/project/robinhood/robinhood/${VERSION}/RPMS/robinhood-webgui-${VERSION}-1.noarch.x86_64.rpm ; \
    yum clean all
CMD ["/bin/bash"]

