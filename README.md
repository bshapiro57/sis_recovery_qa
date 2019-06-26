

#To Install

cd /home/pi
git clone https://github.com/subCdteOso/sis_recovery_qa.git
cd /etc/init.d
sudo ln -s /home/pi/sis_recovery_qa/qa.sh sis_qa.sh
sudo update-rc.d -f sis_qa.sh defaults


