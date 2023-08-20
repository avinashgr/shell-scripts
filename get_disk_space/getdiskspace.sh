
a=$(df -H /dev/sda8)
b=$(df -H /mnt/avinash_backup)
c=${a}+${b}
#c=${a}
d='pics(bkp):'$(find /mnt/avinash_backup/home/avinash/Pictures -type f|wc -l)
e='pics(src):'$(find /home/avinash/Pictures -type f|wc -l)
d=${c}-${d}-${e}
echo "checked the space"
echo $d| sed -e 's/Filesystem\ Size\ Used\ Avail\ Use%//g'|
awk '{print "\x22" $0 "\x22"}'|xargs  /usr/local/bin/node /home/avinash/development/node-workspace/mailsender/sendmail.js
