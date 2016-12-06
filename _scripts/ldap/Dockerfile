FROM centos:7
MAINTAINER "Romeo KONE" <Romeo.Kone@fircosoft.com>

# Default configuration: can be overridden at the docker command line
ENV LDAP_ROOTPASS admin
ENV LDAP_ORGANISATION Fircosoft
ENV LDAP_DOMAIN fircosoft.com
ENV LDAP_BASE_DN fircosoft.com

RUN yum update

RUN yum -y install openldap openldap-clients openldap-servers

#RUN cp /usr/share/openldap/DB_CONFIG.example /var/lib/openldap/DB_CONFIG

RUN yum clean all -y

RUN mkdir -p /etc/service/slapd

# Setup Volume (ldap datastore, ldap config)
VOLUME [ "/var/lib/ldap/", "/etc/openldap/"]

EXPOSE 389 636

ADD slapd.sh /etc/service/slapd/run

#CMD ["slapd", "-h", "ldap:/// ldaps:/// ldapi:///", "-u", "openldap" , "-g",  "openldap"]
#CMD ["/usr/sbin/init"]
CMD ["/etc/service/slapd/run"]