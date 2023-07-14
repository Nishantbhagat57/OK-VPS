#!/bin/bash -i

#Creating tools directory if not exist
sudo mkdir -p /root/OK-VPS/tools /root/OK-VPS/tools/file /root/wordlist /root/templates;
clear;

ENVIRONMENT () {
	echo -e ${BLUE}"[ENVIRONMENT]" ${RED}"Packages required installation in progress ...";
	
    	apt-get update -y > /dev/null 2>&1;
	sudo apt install wget > /dev/null 2>&1;
	curl -fsSLo- https://s.id/golang-linux | bash
	apt-get install python > /dev/null 2>&1;
	apt-get install python2 > /dev/null 2>&1;
	apt-get install python3 -y > /dev/null 2>&1;
	apt-get install pip -y > /dev/null 2>&1;
	apt-get install unzip > /dev/null 2>&1;
	apt install curl -y > /dev/null 2>&1;
	pip3 install colored  > /dev/null 2>&1;
	pip3 install jsbeautifier > /dev/null 2>&1;
	apt install snap -y > /dev/null 2>&1;
	apt install jq -y > /dev/null 2>&1;
	apt install python-pip -y > /dev/null 2>&1;
	apt install snapd -y > /dev/null 2>&1;
	apt install python3-pip -y > /dev/null 2>&1;
	sudo apt-get install python3-venv -y
	sudo apt install snapd
	sudo apt-get install parallel
	sudo rm /etc/parallel/config
	sudo apt-get --assume-yes install git make gcc
	sudo apt-get install -y grepcidr
	sudo apt install wkhtmltopdf
	sudo apt install -y libpcap-dev
	sudo apt install zip
	sudo apt install -y dos2unix
	pip3 install requests beautifulsoup4
	pip3 install aiohttp aiofiles jsbeautifier
 	pip3 install weasyprint
  	pip3 install requests
   	pip3 install parth
}

DNS_RESOLVER () {
	#MassDNS
	echo -e ${BLUE}"[DNS RESOLVER]" ${RED}"MassDNS installation in progress ...";
	su root -c "cd /root/OK-VPS/tools && git clone https://github.com/blechschmidt/massdns.git > /dev/null 2>&1 && cd massdns && make && make install > /dev/null 2>&1 && ln -s /root/OK-VPS/tools/massdns/bin/massdns /usr/local/bin/;"
	echo -e ${BLUE}"[DNS RESOLVER]" ${GREEN}"MassDNS installation is done !"; echo "";
	#PureDNS
	echo -e ${BLUE}"[DNS RESOLVER]" ${RED}"PureDNS installation in progress ...";
	GO111MODULE=on go install github.com/d3mondev/puredns/v2@latest > /dev/null 2>&1 && ln -s ~/go/bin/puredns /usr/local/bin;
	echo -e ${BLUE}"[DNS RESOLVER]" ${GREEN}"PureDNS installation is done !"; echo "";
	
	cd $HOME/BB
	sudo apt-get --assume-yes install git make gcc
	git clone https://github.com/robertdavidgraham/masscan
	cd masscan
	sudo make
	sudo make install
	
	cd $HOME/BB
	git clone https://github.com/Nishantbhagat57/jsleaks.git
	cd jsleaks
	unzip assets.zip
	
	cd $HOME/BB
	su nishant57

	go install -v github.com/owasp-amass/amass/v3/...@master
	sudo cp $HOME/go/bin/amass /usr/local/bin
	
	go install github.com/lc/subjs@latest
	sudo cp $HOME/go/bin/subjs /usr/local/bin

	go install github.com/lc/gau/v2/cmd/gau@latest
	sudo cp $HOME/go/bin/gau /usr/local/bin

	go install github.com/hakluke/haklistgen@latest
	sudo cp $HOME/go/bin/haklistgen /usr/local/bin
	sudo pip3 install dnsgen
	
	go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
	sudo cp $HOME/go/bin/nuclei /usr/local/bin
	
	go install github.com/tomnomnom/hacks/tok@master
	sudo cp $HOME/go/bin/tok /usr/local/bin
	
	go install github.com/tomnomnom/assetfinder@latest
	sudo cp $HOME/go/bin/assetfinder /usr/local/bin
	
	go install github.com/tomnomnom/httprobe@master
	sudo cp $HOME/go/bin/httprobe /usr/bin/
	
	go install github.com/haccer/subjack@latest
	sudo cp $HOME/go/bin/subjack /usr/bin/
	
	go install github.com/sensepost/gowitness@latest
	sudo cp $HOME/go/bin/gowitness /usr/local/bin
	
	go install github.com/hakluke/hakrawler@latest
	sudo cp $HOME/go/bin/hakrawler /usr/local/bin

	go install github.com/Josue87/gotator@latest
	sudo cp $HOME/go/bin/gotator /usr/local/bin
	
	go install -v github.com/tomnomnom/anew@latest
	sudo cp $HOME/go/bin/anew /usr/local/bin
	
	go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
	sudo cp $HOME/go/bin/httpx /usr/local/bin

	go install github.com/jaeles-project/gospider@latest
	sudo cp $HOME/go/bin/gospider /usr/local/bin

	go install github.com/tomnomnom/unfurl@latest
	sudo cp $HOME/go/bin/unfurl /usr/local/bin
	
	go install github.com/OJ/gobuster/v3@latest
	sudo cp $HOME/go/bin/gobuster /usr/local/bin

	go install github.com/ffuf/ffuf/v2@latest
	sudo cp $HOME/go/bin/ffuf /usr/local/bin

	go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
	sudo cp $HOME/go/bin/subfinder /usr/local/bin
	
	go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
	sudo cp $HOME/go/bin/naabu /usr/local/bin
	
	go install -v github.com/projectdiscovery/wappalyzergo/cmd/update-fingerprints@latest
	sudo cp $HOME/go/bin/wappalyzergo /usr/local/bin
	
	go install github.com/projectdiscovery/alterx/cmd/alterx@latest
	sudo cp $HOME/go/bin/alterx /usr/local/bin
	
	go install github.com/trickest/mksub@latest
	sudo cp $HOME/go/bin/mksub /usr/local/bin
	
	go install github.com/hakluke/hakcheckurl@latest
	sudo cp $HOME/go/bin/hakcheckurl /usr/local/bin

 	go install -v github.com/Hackmanit/Web-Cache-Vulnerability-Scanner@latest
	sudo cp $HOME/go/bin/Web-Cache-Vulnerability-Scanner /usr/local/bin

 	go install github.com/tomnomnom/gf@latest
 	sudo cp $HOME/go/bin/gf /usr/local/bin

  	go install github.com/tomnomnom/qsreplace@latest
   	sudo cp $HOME/go/bin/qsreplace /usr/local/bin
    
    	go install github.com/Damian89/ffufPostprocessing@master
  	sudo cp $HOME/go/bin/ffufPostprocessing /usr/local/bin
   
 	cd $HOME/BB
 	git clone https://github.com/Hackmanit/Web-Cache-Vulnerability-Scanner.git
  
	cd $HOME/BB
	git clone https://github.com/vortexau/dnsvalidator.git
	cd dnsvalidator
	sudo pip3 install -r requirements.txt
	sudo python3 setup.py install
	
	cd $HOME
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source $HOME/.cargo/env
	rustup update
	sudo apt install cargo
	
	cd $HOME
	git clone https://github.com/findomain/findomain.git
	cd findomain
	cargo build --release
	sudo cp target/release/findomain /usr/bin/
	
	cd $HOME/BB
	git clone https://github.com/Josue87/AnalyticsRelationships.git
	cd AnalyticsRelationships/
	go build -ldflags "-s -w"
	
	cd $HOME/BB
	git clone https://github.com/SpiderLabs/HostHunter.git
	cd HostHunter
	sudo pip3 install -r requirements.txt

	cd $HOME
	cargo install ripgen
	
	cd $HOME/BB
	
	git clone https://github.com/shmilylty/OneForAll.git
	cd OneForAll/
	sudo python3 -m pip install -U pip setuptools wheel
	sudo pip3 install -r requirements.txt
	
	cd $HOME/BB
	git clone https://github.com/dariusztytko/vhosts-sieve.git
	sudo pip3 install -r vhosts-sieve/requirements.txt
	
	cd $HOME/BB
	git clone https://github.com/punk-security/dnsReaper.git
	cd dnsReaper
	sudo pip3 install -r requirements.txt
	
	cd $HOME
	git clone https://github.com/Nishantbhagat57/SubDomz.git
	cd SubDomz 
	chmod +x install.sh SubDomz
	./install.sh
	
	cd $HOME/BB
	git clone https://github.com/laramies/theHarvester
	cd theHarvester
	sudo python3 -m pip install -r requirements/base.txt
	
	cd $HOME/BB
	git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git
	cd xnLinkFinder
	sudo python3 setup.py install
	
	sudo rm -rf /usr/local/go 
	
	sudo wget https://raw.githubusercontent.com/Azathothas/BugGPT-Tools/main/linky/linky.sh -O /usr/local/bin/linky && sudo chmod +xwr /usr/local/bin/linky && linky --help
	
	cd $HOME
	pip3 install gdown
	pip3 install wafw00f
 	pip3 install uro
	
	cd $HOME/BB
	git clone https://github.com/Nishantbhagat57/OPleaks.git
	
	cd $HOME/BB
	wget https://github.com/Nishantbhagat57/My-Bug-Hunting-Repo/raw/main/phpmyadmin-setup.yaml
	
	cd $HOME/BB
	wget https://github.com/Nishantbhagat57/My-Bug-Hunting-Repo/raw/main/phpmyadmin-server-import.yaml
	
	cd $HOME/BB
	wget https://github.com/Nishantbhagat57/My-Bug-Hunting-Repo/raw/main/swagger.yaml
	
	cd $HOME/BB
	wget https://github.com/Nishantbhagat57/My-Bug-Hunting-Repo/raw/main/sqli-symfony.yaml
	
	cd $HOME/BB
	wget https://github.com/Nishantbhagat57/My-Bug-Hunting-Repo/raw/main/symfony-profiler.yaml
	
	cd $HOME/BB
	wget https://github.com/Nishantbhagat57/My-Bug-Hunting-Repo/raw/main/CVE-2015-4050.yaml
	
	cd $HOME/BB
	dos2unix *.sh
	
	cd $HOME/BB
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/$USER/.bashrc
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	brew doctor
	brew install gcc
 	brew install git
	brew install cmake
 	brew install proxychains-ng
  	brew install node
   	brew install python-tk
    	brew install jadx
  
   	cd $HOME/BB
  	git clone https://github.com/ameenmaali/urldedupe.git
   	cd urldedupe
    	cmake CMakeLists.txt
     	make

	cd $HOME/BB
	git clone https://github.com/xnl-h4ck3r/urless.git
 	cd urless
  	sudo python3 setup.py install
   	pip3 install pyyaml
    	pip3 install termcolor

   	cd $HOME/BB
    	git clone https://github.com/1ndianl33t/Gf-Patterns
     	mkdir ~/.gf
      	mv Gf-Patterns/*.json ~/.gf

	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/jaeles1.json -O $HOME/.axiom/modules/jaeles1.json
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/openredirex0.json -O $HOME/.axiom/modules/openredirex0.json
	
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri1.sh -O $HOME/BB/ghauri1.sh
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri2.sh -O $HOME/BB/ghauri2.sh
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri3.sh -O $HOME/BB/ghauri3.sh

   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/hbsqli.json -O $HOME/.axiom/modules/hbsqli.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/dnsreaper.json -O $HOME/.axiom/modules/dnsreaper.json

}

ENVIRONMENT && DNS_RESOLVER;
