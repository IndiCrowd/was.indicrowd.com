※ 한글 문제 해결!
설치한 아파치의 server.xml의 설정의 Connector 설정에 URIEncoding="UTF-8" 설정이 들어가게 되면 이 모든 문제가 해결됩니다.

운영자는 admin 아이디를 사용하는 사람입니다.
이클립스에 Spring Source Tool Suite 플러그인을 설치해야 동작합니다. (http://antop.tistory.com/98)
데이터베이스 설정은 src/main/resources/META-INF/config/dev/database.properties에 있습니다.
업로드 파일 경로 설정은 src/main/resources/META-INF/config/dev/userfiles.properties에 있습니다.

IndiCrowd를 한번 실행한 뒤에 종료하고, run-after-creating-table.sql에 작성된 sql문들을 실행해줍니다.


환경
----------
JDK 1.7
Tomcat 7.0
MySQL 5.5.27

프레임워크 (모두 포함)
----------
SiteMesh 2.4.2
Spring Framework 3.1.1.RELEASE
Spring MVC 3.1.1.RELEASE
Spring Security 3.1.1.RELEASE
Spring Roo 1.1.5.RELEASE
Spring Social 1.0.2.RELEASE



# 이하는 서버 설정입니다.

# root 권한
su -

# vsftpd 설치
yum -y install vsftpd
/etc/init.d/vsftpd start

# mysql 설치
yum -y install mysql mysql-server mysql-connector-odbc mysql-devel

# ftp를 통해 /root/에 my.cnf 파일을 올리고 /etc/ 디렉토리에 복사한다.
mv /root/my.cnf /etc/

mysql_install_db && chown -R mysql:mysql /var/lib/mysql/
/etc/rc.d/init.d/mysqld start
mysqladmin -u root password ekfrrhrl
chkconfig --add mysqld
chkconfig --level 2345 mysqld on
chmod 755 /etc/rc.d/init.d/mysqld
service mysqld restart
mysql -u root -p mysql

# mysql 접속후
create database IndiCrowd;
insert into user (host, user, password) values('%', 'IndiCrowd', password('ekfrrhrl'));
insert into user (host, user, password) values('localhost', 'IndiCrowd', password('ekfrrhrl'));
desc db;

# 위 스크립트 row 수 -3개만큼 'Y'를 써준다. 예제는 20개
insert into db values ('%','IndiCrowd','IndiCrowd','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y');
insert into db values ('localhost','IndiCrowd','IndiCrowd','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y');
flush privileges;
exit

# 자바 설치
wget --no-check-certificate --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F" "http://download.oracle.com/otn-pub/java/jdk/7u15-b03/jdk-7u15-linux-i586.tar.gz"
tar xvzf jdk (여기서 탭을 누른다.)
export JAVA_HOME=/root/jdk1.7.0_15
export PATH=$JAVA_HOME/bin:$PATH

# 글로벌 환경변수 추가
$HOME/.bash_profile
JAVA_HOME=/root/jdk1.7.0_15
PATH=$JAVA_HOME/bin:$PATH

# tomcat 설치
wget http://apache.mirror.cdnetworks.com/tomcat/tomcat-7/v7.0.39/bin/apache-tomcat-7.0.39.tar.gz
tar xvzf apache-tomcat-7.0.39.tar.gz

# catalina.sh 수정
vi apache-tomcat-7.0.39/bin/catalina.sh
JAVA_OPTS="$JAVA_OPTS -Xms512m -Xmx4096m -XX:MaxPermSize=512m"

# 톰캣 프로젝트 설정 변경
vi apache-tomcat-7.0.39/conf/server.xml
# 8080 포트를 80 포트로 변경, URIEncoding="UTF-8"
    <Connector executor="tomcatThreadPool"
               port="80" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443" URIEncoding="UTF-8" />
               
    <Connector port="8009" protocol="AJP/1.3" redirectPort="8443" URIEncoding="UTF-8" />
 
# <Host name="localhost" ~ </Host> 부분을 삭제
# 아래 코드 추가
      <Host name="localhost" appBase="webapps/run/"
            unpackWARs="true" autoDeploy="true">
        <Context path="/IndiCrowd-userfiles" docBase="IndiCrowd-userfiles.war"/>
      </Host>

# iptables 설정
vi /etc/sysconfig/iptables
-A INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 9090 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT
/etc/init.d/iptables restart

# 프로젝트 등록 - apache-tomcat-7.0.39/webapps에 war파일 등록
# ftp를 통해 /root/에 IndiCrowd.war와 IndiCrowd-userfiles.war를 올리고 아래 스크립트 실행
mkdir apache-tomcat-7.0.39/webapps/run
mv /root/IndiCrowd.war apache-tomcat-7.0.39/webapps/run/ROOT.war
mv /root/IndiCrowd-userfiles.war apache-tomcat-7.0.39/webapps/run

# 톰캣 실행
apache-tomcat-7.0.39/bin/catalina.sh start

# 톰캣 실시간 로그 보기
tail -60f apache-tomcat-7.0.39/logs/catalina.out
vi apache-tomcat-7.0.39/logs/catalina.out

# 톰캣 종료
apache-tomcat-7.0.39/bin/catalina.sh stop

# 프로젝트를 재등록할때는 ROOT폴더를 삭제해주고 IndiCrowd.war만 옮겨주면 됩니다. (IndiCrowd-userfiles는 사용자가 업로드할 파일들을 가지고 있습니다.)
apache-tomcat-7.0.39/bin/catalina.sh stop
rm -rf apache-tomcat-7.0.39/webapps/run/ROOT
mv /root/IndiCrowd.war apache-tomcat-7.0.39/webapps/run/ROOT.war
overwrite -> y

JAVA_OPTS="$JAVA_OPTS -Xms512m -Xmx4096m -XX:MaxPermSize=512m"
JAVA_HOME=/root/jdk1.7.0_15
PATH=$JAVA_HOME/bin:$PATH
apache-tomcat-7.0.39/bin/catalina.sh start
tail -60f apache-tomcat-7.0.39/logs/catalina.out