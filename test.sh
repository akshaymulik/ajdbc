#.bash_history delete/alter
#!/bin/bash
#1
#short-method
#cal $(date +"%m %Y") | awk 'NF {DAYS = $NF}; END {print DAYS}'
#long-method
#echo "Enter the Month's Seq. No eg: For Dec it's 12"
#read mm
#echo "The No of Days are:"
#case $mm in
#  "1"|"3"|"5"|"7"|"8"|"10"|"12") echo "31"
#    ;;
#  "2") echo "28/29"
#      ;;
#  "4"|"6"|"9"|"11") echo "30"
#        ;;
#   *)echo "bad input"
#esac
#2
#echo "Enter a number"
#read n
#sum=0
#a=$n
#while(($n >0))
#do
#x=`expr $n % 10`
#sum=`expr $sum + $x`
#n=`expr $n / 10`
#done
#echo "the sum of $a is $sum"
#3
#echo "Enter the year"
#read yy
#year=$yy
#yy=$(( $yy % 4 ))
#if [ $yy -eq 0 ]
#then
#    echo "$year is Leap Year!"
#else
#    echo "$year is not a Leap Year!"
#fi
#4
#read -p "Enter three numbers: " a b c
#if [ $a -gt $b -a $a -gt $c ]
#then
#  echo "$a is greatest"
#elif [ $b -gt $a -a $b -gt $c ]
#then
#  echo "$b is greatest"
#else
#  echo "$c is greatest"
#fi
#5
#read -p "Enter a number: " num
#fact=1
#i=1
#until [ $i -gt $num ]
#do
#  fact=`expr $fact \* $i`
#  i=`expr $i + 1`
#done
#echo "Factorial is $fact"
#6
#read -p "Enter operation (+ - * /): " op
#case "$op" in
#  "+")
#    res=`expr $a + $b`
#    echo "Addition is $res"
#    ;;
#  "-")
#    res=`expr $a - $b`
#    echo "Subtraction is $res"
#    ;;
#  "*")
#    res=`expr $a \* $b`
#    echo "Multiplication is $res"
#    ;;
#  "/")
#    res=`expr $a / $b`
#    echo "Division is $res"
#    ;;
#  *)
#    echo "Invalid operation"
#    ;;
#esac
#7
#for i in {1..10}
#do
#  echo "$i"
#done
#8
#i=10
#until [[ $i -eq 0 ]]; do
#  echo "$i"
#  i=`expr $i - 1`
#done
#9
#avg_fc(){
#  sum=`expr $1 + $2 + $3`
# avg=`expr $sum / 3`
# echo "Average is $avg"
#}
#read -p "Enter three numbers: " a b c
#avg_fc $a $b $c
#10
#read -p "Enter a number" a
#b=`expr $a % 2`
#if [[ $b -eq 0 ]]; then
#  echo "Number is Even"
#else
#  echo "Number is Odd"
#fi
#11
#1.1-3Fwd
#for (( i = 1; i < 4; i++ )); do
#  for (( j = 1; j <=$i; j++ )); do
#    echo -n "$j"
#  done
#  echo ""
#done
#2.Asterick 1-3Fwd
#for (( i = 1; i < 4; i++ )); do
#  for (( j = 1; j <=$i; j++ )); do
#    echo -n "*"
#  done
#  echo ""
#done
#3.Asterick 3-1Rwd
#for (( i = 3; i > 0; i-- )); do
#  for (( j = 1; j <=$i; j++ )); do
#    echo -n "*"
#  done
#  echo ""
#done
#4.A-CFwd
#chars=( {A..Z} )
#for (( i=0; i < 3 ; i++ )); do
#  for (( j = 0; j <=$i; j++ )); do
#    echo -n "${chars[j]}"
#  done
#  echo ""
#done
#Linux-Program
#1. ls -1 file_name
#2. cat > a.txt for empty file
#3. top or ps -A for process_list.
#4. tar -cvpzf backup.tar.gz prax/ | ls | cpio -ov > directory.cpio
#5. fdisk -l;create_mount_point sudo  mkdir /media/usb; sudo mount /dev/sdb1 /media/usb; umount /media/usb
#6. adduser username; usermod -u 2005 foo; groupmod -u 2005 foo /etc passwd
#7. # groupadd engineering ; # usermod -aG groupname username
#8.ifconfig eth0,ping, traceroute,netstat -r, dig, nslookup, host,route, arp,ethtool,hostname
#9sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
#iptables -A INPUT -s 127.0.0.1 -j ACCEPT
#iptables -A OUTPUT -s 127.0.0.1 -j ACCEPT
#10. sudo apt-get install vsftpd| write_enable=YES local_umask=022
#   openssh-server /etc/ssh/sshd_config
#11.sudo apt-get install xinetd telnetd; sudo /etc/init.d/xinetd status; $telnet serverip;
#/etc/services with the line; telnet        23/tcp sudo /etc/init.d/xinetd restart
#12. http://tecadmin.net/install-sendmail-server-on-centos-rhel-server/

#Sendmail is a MTA (Mail Transfer Agent) server used for transferring email from between different hosts. Sendmail uses SMTP (Simple Mail Transfer Protocol) protocol. Most of system administrators preferred to use Sendmail server as MTA than other MTAs.
#RHEL 5 or its earlier versions were using Sendmail as default mail server, But newer version’s of RHEL based systems adapted postfix as default mail server. Most of users are familiar with Sendmail and want to use it with version 6 also. This article will help that users for installing Sendmail server on RHEL 7/6/5 or with minimal configuration.

#Installing Required Packages

#If you don’t have installed Sendmail using following command to install Sendmail with other required packages using yum package manager.

# yum install sendmail sendmail-cf m4
#Configure Sendmail Server

#Before starting configuration we must know about various Sendmail configuration files exists in /etc/mail directory.

#access — Allow/Deny other systems to use Sendmail for outbound emails.
#domaintable — Used for domain name mapping for Sendmail.
#local-host-names — Used to define aliases for the host.
#mailertable — Defined the instructions that override routing for particular domains.
#virtusertable — Specifies a domain-specific form of aliasing, allowing multiple virtual domains to be hosted on one machine.
#2.1 Comment out below line in /etc/mail/sendmail.mc to allow receiving email from anywhere. To comment a line in sendmail.mc, just put dnl at start of line.

#dnl DAEMON_OPTIONS(`Port=smtp,Addr=127.0.0.1, Name=MTA')dnl
#2.2 Add this line also in sendmail.mc above ‘MAILER’ option

#FEATURE(`relay_hosts_only')dnl
#2.3 Add your PC’s full hostname in this file.

# hostname >> /etc/mail/relay-domains
#Recompile Sendmail Configuration

#m4 ia a macro processor to compile the Sendmail configuration files. m4 is stream-based, that is, it doesn’t understand about lines.

# m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf
#Restart Sendmail service

# /etc/init.d/sendmail restart
#Configure Domain based E-mail Routing

#As we read above that virtusertable file used for aliasing, allowing multiple virtual domains to be hosted on one machine.

#1. All emails addressed to @example.com domain delivered to support@mydomain.com

#@example.com support@mydomain.com
#2. All emails addressed to support@mydomain.com will forward to local user jack.

#support@mydomain.com  jack
#3. All emails addressed to @mydomain.com will forward to domain @otherdomain.com with corresponding usernames.

#@mydomain.com    %1@otherdomain.com
#4. All emails addressed to @otherdomain.com will be rejected my mail server with acknowledging sender with message

#@otherdomain.com 	 error:nouser User unknown
#After making all changes in virtusertable execute following command to create updated virtusertable.db file containing the new configuration.

# makemap hash /etc/mail/virtusertable < /etc/mail/virtusertable
#Now restart Sendmail service

# /etc/init.d/sendmail restart
#Thanks for reading this article. I hope this article will help you to configure Sendmail on CentOS and Red Hat systems..
