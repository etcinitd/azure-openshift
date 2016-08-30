#!/bin/bash

RESOURCEGROUP=$1
USERNAME=$2
SSHPRIVATEDATA=${3}
SSHPUBLICDATA=${4}
SSHPUBLICDATA2=${5}
SSHPUBLICDATA3=${6}

export OSEUSERNAME=$2

ps -ef | grep bastion.sh > cmdline.out

mkdir -p /home/$USERNAME/.ssh
echo $SSHPUBLICDATA $SSHPUBLICDATA2 $SSHPUBLICDATA3 >  /home/$USERNAME/.ssh/id_rsa.pub
echo $SSHPRIVATEDATA | base64 --d > /home/$USERNAME/.ssh/id_rsa
chown $USERNAME /home/$USERNAME/.ssh/id_rsa.pub
chmod 600 /home/$USERNAME/.ssh/id_rsa.pub
chown $USERNAME /home/$USERNAME/.ssh/id_rsa
chmod 600 /home/$USERNAME/.ssh/id_rsa

mkdir -p /root/.ssh
echo $SSHPRIVATEDATA | base64 --d > /root/.ssh/id_rsa
echo $SSHPUBLICDATA $SSHPUBLICDATA2 $SSHPUBLICDATA3   >  /root/.ssh/id_rsa.pub
chown root /root/.ssh/id_rsa.pub
chmod 600 /root/.ssh/id_rsa.pub
chown root /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa


yum -y update
yum -y install targetcli
yum -y install lvm2
systemctl start target
systemctl enable target
systemctl restart target.service
sfdisk /dev/sdc << EOF
;
EOF
sfdisk /dev/sdd << EOF
;
EOF
sfdisk /dev/sde << EOF
;
EOF
sfdisk /dev/sdf << EOF
;
EOF
sfdisk /dev/sdg << EOF
;
EOF
sfdisk /dev/sdh << EOF
;
EOF
sfdisk /dev/sdi << EOF
;
EOF
sfdisk /dev/sdj << EOF
;
EOF
pvcreate /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1 /dev/sdg1 /dev/sdh1 /dev/sdi1 /dev/sdj1
vgcreate vg1 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1 /dev/sdg1 /dev/sdh1 /dev/sdi1 /dev/sdj1
cat <<EOF | base64 --decode >  ~/ose_pvcreate_lun
IyEvYmluL2Jhc2gKCiMgJDEgPSB2b2x1bWVncm91cAojICQyID0gc2l6ZQojICMzID0gY291bnQKCmlmIFtbIC16ICR7c3RyaXBzaXplK3h9IF1dOyB0aGVuCiAgIHN0cmlwc2l6ZT04CiAgIGZpCgppZiBbICQjIC1lcSAwIF07IHRoZW4KICAgZWNobyAicHZjcmVhdGVsdW4gdm9sZ3JvdXAgc2l6ZSBjb3VudCIKICAgZWNobyAiICAgIHZvbGdyb3VwIGlzIHRoZSB2b2xncm91cCBhcyBjcmVhdGVkIGJ5IHZnY3JlYXRlIgogICBlY2hvICIgICAgc2l6ZSAtIGV4YW1wbGUgMUciCiAgIGVjaG8gIiAgICBjb3VudCAtIE9wdGlvbmFsIC0gTnVtYmVyIG9mIGx1bnMgdG8gY3JlYXRlIgogICBleGl0IDAKICAgZmkKIyBDYWxsIG91cnNlbHZlcyByZWN1cnNpdmVseSB0byBkbyByZXBlYXRzCmlmIFsgJCMgLWVxIDMgXTsgdGhlbgogICBmb3IgKChpPTA7aSA8ICQzO2krKykpCiAgICAgICBkbwogICAgICAuL29zZV9wdmNyZWF0ZV9sdW4gJDEgJDIKICAgICAgZG9uZQogICAgZXhpdCAwCiAgIGZpCgpMVU5GSUxFPX4vLm9zZWx1bmNvdW50LmNudApUQUc9JDAKCmlmIFsgLWUgJHtMVU5GSUxFfSBdOyB0aGVuCiAgICBjb3VudD0kKGNhdCAke0xVTkZJTEV9KQplbHNlCiAgICB0b3VjaCAiJExVTkZJTEUiCiAgICBjb3VudD0wCmZpCgooKGNvdW50KyspKQoKZWNobyAke2NvdW50fSA+ICR7TFVORklMRX0KCmV4cG9ydCB2b2xuYW1lPW9zZSIkY291bnQieCIkMiIKCmx2Y3JlYXRlIC1MICQyIC1pJHN0cmlwc2l6ZSAtSTY0IC1uICR2b2xuYW1lICQxIHwgbG9nZ2VyIC0tdGFnICRUQUcKbWtmcy5leHQ0IC1xIC1GIF9GIC9kZXYvdmcxLyR2b2xuYW1lIDI+JjEgfCBsb2dnZXIgLS10YWcgJFRBRwppZiBbICR7Y291bnR9IC1lcSAxIF07IHRoZW4KICAgICBlY2hvICJTZXR1cCBkZXZpY2UiCiAgICAgdGFyZ2V0Y2xpIC9pc2NzaSBjcmVhdGUgaXFuLjIwMTYtMDIubG9jYWwuc3RvcmUxOnQxIHwgIGxvZ2dlciAtLXRhZyAkVEFHCiAgICAgdGFyZ2V0Y2xpIC9pc2NzaS9pcW4uMjAxNi0wMi5sb2NhbC5zdG9yZTE6dDEvdHBnMS9hY2xzIGNyZWF0ZSBpcW4uMjAxNi0wMi5sb2NhbC5henVyZS5ub2RlcyB8IGxvZ2dlciAtLXRhZyAkVEFHCiAgICAgdGFyZ2V0Y2xpIC9pc2NzaS9pcW4uMjAxNi0wMi5sb2NhbC5zdG9yZTE6dDEvdHBnMS8gc2V0IGF0dHJpYnV0ZSBhdXRoZW50aWNhdGlvbj0wIHwgbG9nZ2VyIC0tdGFnICRUQUcKICAgICB0YXJnZXRjbGkgc2F2ZWNvbmZpZwpmaQp0YXJnZXRjbGkgYmFja3N0b3Jlcy9ibG9jay8gY3JlYXRlICIkdm9sbmFtZSIgL2Rldi92ZzEvIiR2b2xuYW1lIiB8ICBsb2dnZXIgLS10YWcgJFRBRwp0YXJnZXRjbGkgL2lzY3NpL2lxbi4yMDE2LTAyLmxvY2FsLnN0b3JlMTp0MS90cGcxL2x1bnMgY3JlYXRlIC9iYWNrc3RvcmVzL2Jsb2NrLyIkdm9sbmFtZSIgfCBsb2dnZXIgLS10YWcgJFRBRwoKdGFyZ2V0Y2xpIHNhdmVjb25maWcgfCBsb2dnZXIgLS10YWcgJFRBRwoKCg==

EOF
firewall-cmd --permanent --add-port=3260/tcp
firewall-cmd --reload
chmod +x ~/ose_pvcreate_lun
cd ~
while true
do
  STATUS=$(curl -k -s -o /dev/null -w '%{http_code}' https://master1:8443/api)
  if [ $STATUS -eq 200 ]; then
    echo "Got 200! All done!"
    break
  else
    echo "."
  fi
  sleep 10
done

./ose_pvcreate_lun vg1 1G 400 
./ose_pvcreate_lun vg1 10G 20 
./ose_pvcreate_lun vg1 50G 4 
systemctl restart target.service
