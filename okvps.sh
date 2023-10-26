#!/bin/bash -i

#Creating tools directory if not exist
sudo mkdir -p /root/OK-VPS/tools /root/OK-VPS/tools/file /root/wordlist /root/templates;
clear;

mkdir -p $HOME/BB
mkdir -p $HOME/BB/wordlist

	echo -e ${BLUE}"[ENVIRONMENT]" ${RED}"Packages required installation in progress ...";
	
    	apt-get update -y > /dev/null 2>&1;
    	sudo apt update && sudo apt upgrade -y
     	sudo apt install curl -y
	sudo apt install wget > /dev/null 2>&1;
	curl -fsSLo- https://s.id/golang-linux | bash

	cd $HOME/BB
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/$USER/.bashrc
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	brew doctor
	brew install gcc
 	brew install git
  	brew install python3
	brew install cmake
 	brew install proxychains-ng
  	brew install node
   	brew install python-tk
    	brew install jadx
  	brew install geckodriver
  	brew tap owasp-amass/amass
   	brew install amass
  	brew install trufflesecurity/trufflehog/trufflehog
   	brew install ffmpeg
    	brew install gitleaks
  
	apt-get install unzip > /dev/null 2>&1;
	apt install curl -y > /dev/null 2>&1;
	pip3 install colored  > /dev/null 2>&1;
	pip3 install jsbeautifier > /dev/null 2>&1;
	apt install snap -y > /dev/null 2>&1;
	apt install jq -y > /dev/null 2>&1;
	apt install python-pip -y > /dev/null 2>&1;
	apt install snapd -y > /dev/null 2>&1;
	apt install python3-pip -y > /dev/null 2>&1;
 	sudo apt-get install expect -y
	sudo apt-get install python3-venv -y
	sudo apt install -y snapd
	sudo apt-get install -y parallel
	sudo rm /etc/parallel/config
	sudo apt-get --assume-yes install git make gcc
	sudo apt-get install -y grepcidr
	sudo apt install -y wkhtmltopdf
	sudo apt install -y libpcap-dev
	sudo apt install -y zip
	sudo apt install -y dos2unix
 	sudo apt install -y software-properties-common
  	sudo apt-get install -y gnome-terminal
	pip3 install requests beautifulsoup4
	pip3 install aiohttp aiofiles jsbeautifier
 	pip3 install weasyprint
  	pip3 install --upgrade urllib3
   	pip3 install --upgrade requests
   	pip3 install parth
    	pip3 install sortedcontainers
     	pip3 install slack_sdk
      	pip3 install tree_sitter
      	pip3 install selenium
        pip3 install uddup
	pip3 install Faker
  	pip3 install browsermob-proxy
   	pip3 install fake-useragent
    	pip3 install static-ffmpeg
     	pip3 install selenium-recaptcha-solver
      	pip3 install pytesseract
       	pip3 install redmail
	pip3 install postleaksNg
 	pip3 install -U duckduckgo_search

   	sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
	sudo apt update -y
	sudo apt-get install docker-ce docker-ce-cli containerd.io -y
 	sudo usermod -aG docker ${USER}
  	sudo docker pull ghcr.io/praetorian-inc/noseyparker:latest
  	

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
	sudo make && sudo make install
	
	go install github.com/lc/subjs@latest
	sudo cp $HOME/go/bin/subjs /usr/local/bin

	go install github.com/lc/gau/v2/cmd/gau@latest
	sudo cp $HOME/go/bin/gau /usr/local/bin
 	wget https://raw.githubusercontent.com/lc/gau/master/.gau.toml -O $HOME/.gau.toml

	go install github.com/hakluke/haklistgen@latest
	sudo cp $HOME/go/bin/haklistgen /usr/local/bin
	sudo pip3 install dnsgen
	
	go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
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
   
   	go install github.com/shenwei356/rush@latest
   	sudo cp $HOME/go/bin/rush /usr/local/bin
    
    	go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
    	sudo cp $HOME/go/bin/dnsx /usr/local/bin

     	go install github.com/tomnomnom/waybackurls@latest
     	sudo cp $HOME/go/bin/waybackurls /usr/local/bin
      	
       	go install ktbs.dev/mubeng/cmd/mubeng@latest
	sudo cp $HOME/go/bin/mubeng /usr/local/bin

 	go install github.com/dwisiswant0/gfx@latest
  	sudo cp $HOME/go/bin/gfx /usr/local/bin

   	go install github.com/projectdiscovery/katana/cmd/katana@latest
      	sudo cp $HOME/go/bin/katana /usr/local/bin

	go install github.com/jsageryd/urlquery@latest
 	sudo cp $HOME/go/bin/urlquery /usr/local/bin

	go install github.com/lanrat/certgraph@latest
	sudo cp $HOME/go/bin/certgraph /usr/local/bin

 	go install -v github.com/projectdiscovery/notify/cmd/notify@latest
  	sudo cp $HOME/go/bin/notify /usr/local/bin
  
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
	
	cd $HOME/BB
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

	cd $HOME/BB
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
	
	cd $HOME/BB
	git clone https://github.com/Nishantbhagat57/SubDomz.git
	cd SubDomz 
	chmod +x install.sh SubDomz
	./install.sh

 	cd $HOME/BB
  	mkdir dorker
   	cd dorker
 	npm install axios puppeteer puppeteer-extra puppeteer-extra-plugin-recaptcha node-fetch fs url async puppeteer-extra-plugin-stealth unirest cheerio request-promise --save
	npm audit fix --force
 	npm install axios puppeteer puppeteer-extra puppeteer-extra-plugin-recaptcha node-fetch fs url async puppeteer-extra-plugin-stealth unirest cheerio request-promise --save
	npm audit fix --force
 
	cd $HOME/BB
	git clone https://github.com/laramies/theHarvester
	cd theHarvester
	sudo python3 -m pip install -r requirements/base.txt
 	pip3 install netaddr
  	pip3 install ujson
	pip3 install aiomultiprocess
 	pip3 install aiodns
  	pip3 install shodan
   	pip3 install aiosqlite
    	pip3 install pyppeteer
    	pip3 install uvloop
     	pip3 install git+https://github.com/xnl-h4ck3r/knoxnl.git
     
	cd $HOME/BB
	git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git
	cd xnLinkFinder
	sudo python3 setup.py install
		
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
  	git clone https://github.com/emadshanab/Gf-Patterns-Collection.git
	cd $HOME/BB/Gf-Patterns-Collection
 	sudo chmod 777 *
  	./set-all.sh
  
   	cd $HOME/BB
  	git clone https://github.com/ameenmaali/urldedupe.git
   	cd urldedupe
    	cmake CMakeLists.txt
     	make

	cd $HOME/BB
	pip3 install git+https://github.com/xnl-h4ck3r/urless.git
   	pip3 install pyyaml
    	pip3 install termcolor

   	cd $HOME/BB
    	git clone https://github.com/1ndianl33t/Gf-Patterns
     	mkdir ~/.gf
      	mv Gf-Patterns/*.json ~/.gf
	
 	cd $HOME/BB
        git clone https://github.com/rarecoil/unwebpack-sourcemap.git
	sudo chmod 777 $HOME/BB/unwebpack-sourcemap/*
	
 	cd $HOME/BB
	git clone https://github.com/vladko312/SSTImap.git
	sudo chmod 777 $HOME/BB/SSTImap/*
 	cd $HOME/BB/SSTImap
  	pip3 install -r requirements.txt
   	pip3 install --upgrade requests
    	pip3 list --outdated | cut -d ' ' -f1 | xargs -n1 pip3 install -U
   
	cd $HOME/BB
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/mklist -O $HOME/BB/mklist/mklist
 	sudo chmod 777 $HOME/BB/mklist/*
 
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/jaeles1.json -O $HOME/.axiom/modules/jaeles1.json
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/openredirex0.json -O $HOME/.axiom/modules/openredirex0.json
	
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri1.sh -O $HOME/BB/ghauri1.sh
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri2.sh -O $HOME/BB/ghauri2.sh
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri3.sh -O $HOME/BB/ghauri3.sh
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri4.sh -O $HOME/BB/ghauri4.sh
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri5.sh -O $HOME/BB/ghauri5.sh
   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri6.sh -O $HOME/BB/ghauri6.sh
   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri7.sh -O $HOME/BB/ghauri7.sh
   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri8.sh -O $HOME/BB/ghauri8.sh
   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri9.sh -O $HOME/BB/ghauri9.sh
   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri10.sh -O $HOME/BB/ghauri10.sh

   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/hbsqli.json -O $HOME/.axiom/modules/hbsqli.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/dnsreaper.json -O $HOME/.axiom/modules/dnsreaper.json
     	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffuf_postprocess.json -O $HOME/.axiom/modules/ffufpp.json
      	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufapi.json -O $HOME/.axiom/modules/ffufapi.json
      	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/arjun1.json -O $HOME/.axiom/modules/arjun1.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/arjun2.json -O $HOME/.axiom/modules/arjun2.json
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/arjun3.json -O $HOME/.axiom/modules/arjun3.json
       	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/acunetix.json -O $HOME/.axiom/modules/acunetix.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/getjs.json -O $HOME/.axiom/modules/getjs.json
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ppfuzz.json -O $HOME/.axiom/modules/ppfuzz.json
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/x8.json -O $HOME/.axiom/modules/x8.json
   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri.json -O $HOME/.axiom/modules/ghauri.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/xnlinkfinder1.json -O $HOME/.axiom/modules/xn1.json
     	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/xnlinkfinder2.json -O $HOME/.axiom/modules/xn2.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/requify.json -O $HOME/.axiom/modules/requify.json
     	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/paramspider1.json -O $HOME/.axiom/modules/paramspider1.json
     	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/mubeng.json -O $HOME/.axiom/modules/mubeng.json
      	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/linkfinder_jsurls.json -O $HOME/.axiom/modules/linkfinderjs.json
       	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/linkfinder_domain.json -O $HOME/.axiom/modules/linkfinderd.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/heaptruffle.json -O $HOME/.axiom/modules/heaptruffle.json
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/x8_custom.json -O $HOME/.axiom/modules/x8_custom.json
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/403bypass.json -O $HOME/.axiom/modules/403bypass.json
   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/chameleon.json -O $HOME/.axiom/modules/chameleon.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/http2smugl.json -O $HOME/.axiom/modules/http2smugl.json
     	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/certgraph_http.json -O $HOME/.axiom/modules/certgraph_http.json
     	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/certgraph_crt.json -O $HOME/.axiom/modules/certgraph_crt.json
      	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/sstimap.json -O $HOME/.axiom/modules/sstimap.json
       	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/subzy.json -O $HOME/.axiom/modules/subzy.json
     	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/cloudrecon.json -O $HOME/.axiom/modules/cloudrecon.json
      	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/bxss.json -O $HOME/.axiom/modules/bxss.json
      
      	sudo chmod 777 $HOME/.axiom/modules/*
     	cd $HOME/BB
	git clone https://github.com/Nishantbhagat57/jsleaks.git
	cd jsleaks
	unzip assets.zip

 	cd $HOME/BB
 	git clone https://github.com/Nishantbhagat57/backup-gen.git
  	cd backup-gen
   	pip3 install cytoolz
    	sudo chmod 777 *

 	cd $HOME/BB
     	git clone https://github.com/devanshbatham/heaptruffle
 	cd $HOME/BB/heaptruffle
  	sudo chmod 777 *
	sudo docker build -t heaptruffle .
	sudo mv heaptruffle /usr/local/bin/heaptruffle

 	cd $HOME/BB/jsmonitor
  	git clone https://github.com/tree-sitter/tree-sitter-javascript.git
  
 	sudo chmod 777 $HOME/BB/*
  	sudo chmod 777 $HOME/BB/*/*
   	sudo chmod 777 $HOME/BB/*/*/*
    	sudo chmod 777 $HOME/BB/*/*/*/*
     
     	sudo apt install snapd
	sudo snap install core
 	sudo snap install ark
	
 	export TMPDIR=/tmp
  	subfinder
