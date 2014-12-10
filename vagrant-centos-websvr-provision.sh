#=========================
# INSTALL EXTRA SOFTWARE:
#=========================
#
# Tools:
#-------------------
yum -y install vim-enhanced elinks lsof

# Python dev stack:
#-------------------
yum -y install python-py python-setuptools
wget --no-check-certificate -O /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
chmod +x /tmp/get-pip.py
/tmp/get-pip.py
pip install virtualenv
pip install flask

# LEMP stack:
#-------------------
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
yum -y install mysql mysql-server
yum --enablerepo=remi install php-fpm php-mysql
sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php.ini
yum -y install nginx




#=========================
# CREATE THE MOTD FILE:
#=========================
#

motd_msg=`cat <<__END__


### WELCOME! ############################

Installed:
===========
- Extra repos:
   epel-release-6-8.noarch.rpm
   remi-release-6.rpm (for php-fpm)
- Packages (plus their deps):
   nginx
   mysql-server, mysql
   php-fpm, php-mysql
- Python development stuff:
   pip, virtualenv, flask

MySQL setup:
==============
- no setup has been done, perhaps you should run: /usr/bin/mysql_secure_installation

Nginx setup:
==============


#########################################

__END__
`
