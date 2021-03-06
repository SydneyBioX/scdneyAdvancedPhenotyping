#!/bin/bash

## docker run -e PASSWORD=pushu -e ROOT=TRUE -p 8787:8787 532cb5cec05a
sudo apt-get update
sudo apt-get install libjpeg-dev

#needed by the velocity R package 
sudo apt-get install -y libboost-dev 
sudo apt-get install -y libboost-all-dev
## sudo apt-get -y install r-base-dev

## Make a tmp folder and git clone
mkdir /home/gittmp/
git clone https://github.com/SydneyBioX/scdneyAdvancedPhenotyping /home/gittmp/

## wget all data files from Google Cloud Storage into /home/CPC/
#wget https://storage.googleapis.com/scp_data/data.zip -P /home/gittmp/
mkdir /home/gittmp/data
wget https://www.dropbox.com/s/91bhx4a2jwj2i63/sce_DentateGyrus_hippocampus.rds -P /home/gittmp/data
wget https://www.dropbox.com/sh/tr4wq88nd4y2fy6/AABs-4wcFgAr56Qt5DCKWFLza --content-disposition -P /home/gittmp/
mkdir /home/gittmp/output
unzip /home/gittmp/output.zip -d /home/gittmp/output

ls /home/
ls /home/gittmp/
  
  ## Set up users
  
sudo groupadd trainees

for((userIndex = 1; userIndex <= 25; userIndex++))
  do
{
  userID=user${userIndex}
  sudo useradd -g trainees -d /home/$userID -m -s /bin/bash $userID
  # sudo cp -r /home/gittmp/* /home/$userID/
  echo $userID:2021 | sudo chpasswd
}
done
