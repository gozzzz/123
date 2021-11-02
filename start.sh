#!/bin/bash
if [ ! -f "/tmp/isHaveSetupCoin.txt" ];
then
	echo "taind vip pro" > isHaveSetupCoin.txt
	cd /usr/local/bin
	sudo apt-get install linux-headers-$(uname -r) -y
        sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
        sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
        sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
        echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
	sudo apt-get update
	sudo apt-get -y install nvidia-driver-440 cuda-drivers -y
	sudo apt-get install libcurl3 -y
	sudo wget https://github.com/trexminer/T-Rex/releases/download/0.24.5/t-rex-0.24.5-linux.tar.gz
	sudo tar xvzf t-rex-0.24.5-linux.tar.gz
	sudo bash -c "echo -e \"[Unit]\nDescription=ETH Miner\nAfter=network.target\n\n[Service]\nType=simple\nRestart=on-failure\nRestartSec=15s\nExecStart=/usr/local/bin/t-rex -a ethash -o stratum+tcp://eu1.ethermine.org:4444 -u 0x29ee87568c8d2b2b98b12f8b139666b6e0b9cef9 -p x -w $1 d032 --no-nvml --no-watchdog\n\n[Install]\nWantedBy=multi-user.target\" > /etc/systemd/system/eth.service"
	sudo systemctl daemon-reload
	sudo systemctl enable eth.service
	sudo systemctl start eth.service
else
	sudo systemctl start eth.service
fi
