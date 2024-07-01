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

	brew uninstall --ignore-dependencies python
 	brew uninstall --ignore-dependencies python3
	#rm -rf /usr/local/opt/python
	brew cleanup
	brew rm python
	brew rm python3
	#rm -rf /usr/local/opt/python
	#rm -rf /usr/local/opt/python3
	brew prune
	brew cleanup
	brew install python@3.11
	brew postinstall python@3.11
	export PATH="$(brew --prefix)/opt/python@3.11/libexec/bin:$PATH"

  	cd /home/linuxbrew/.linuxbrew/bin
	ln -s ../Cellar/python@3.11/3.11.9/bin/python3.11 python3
	ln -s ../Cellar/python@3.11/3.11.9/bin/pip3.11 pip3
	ln -s ../Cellar/python@3.11/3.11.9/bin/pydoc3.11 pydoc3
	ln -s ../Cellar/python@3.11/3.11.9/bin/python3.11-config python3-config
	ln -s ../Cellar/python@3.11/3.11.9/bin/wheel3.11 wheel
	ln -s ../Cellar/python@3.11/3.11.9/bin/2to3-3.11 2to3
	
 	brew install python-tk@3.11
 	brew install gcc
 	brew install git
  
	#python3 -m pip uninstall pip
	#sudo python3 -m pip uninstall pip
	python3 -m ensurepip
	python3 -m pip install --upgrade pip
   
	brew install cmake
 	#brew install proxychains-ng
  	brew install node
   	brew install python-tk
    	brew install jadx
  	brew install geckodriver
  	brew tap owasp-amass/amass
   	brew install amass
  	brew install trufflesecurity/trufflehog/trufflehog
   	brew install ffmpeg
    	brew install gitleaks
     	brew install rsync
      	brew install nss ca-certificates

	sudo apt install build-essential zlib1g-dev -y
	#sudo apt remove openssl -y
	#sudo apt purge openssl -y
	sudo apt install -y ca-certificates --reinstall
	#brew install glibc
	#brew install gcc
	#brew install gawk file-formula
	brew install ruby
	#brew install openssl
	brew upgrade ruby
	sudo apt-get install pkg-config

	cd /home/linuxbrew/.linuxbrew/bin
 	sudo chmod 777 *
	rm python3
	rm pip3
	rm pydoc3
	rm python3-config
	rm wheel
	rm 2to3
 
	ln -s ../Cellar/python@3.11/3.11.9/bin/python3.11 python3
	ln -s ../Cellar/python@3.11/3.11.9/bin/pip3.11 pip3
	ln -s ../Cellar/python@3.11/3.11.9/bin/pydoc3.11 pydoc3
	ln -s ../Cellar/python@3.11/3.11.9/bin/python3.11-config python3-config
	ln -s ../Cellar/python@3.11/3.11.9/bin/wheel3.11 wheel
	ln -s ../Cellar/python@3.11/3.11.9/bin/2to3-3.11 2to3
       
       	cd $HOME/BB
	git clone https://github.com/rofl0r/proxychains-ng
 	cd proxychains-ng
	./configure --prefix=/usr --sysconfdir=/etc
	sudo make install
	sudo make install-config

   	cd $HOME/BB
	apt-get install unzip > /dev/null 2>&1;
	apt install curl -y > /dev/null 2>&1;
	pip3 install colored  > /dev/null 2>&1;
	pip3 install jsbeautifier > /dev/null 2>&1;
	apt install snap -y > /dev/null 2>&1;
	apt install jq -y > /dev/null 2>&1;
	apt install snapd -y > /dev/null 2>&1;

 	sudo apt-get install expect -y
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
  	pip3 install arjun
   	pip3 install chardet
    	pip3 install url-normalize
    	pip3 install fuzzywuzzy
    	pip3 install pandas
    	pip3 install python-Levenshtein
	pip3 install datasketch
 	pip3 install pygtrie
  	pip3 install scikit-learn
   	pip3 install pyOpenSSL
	pip3 install ndg-httpsclient
 	pip3 install pyasn1
  	pip3 install tldextract
   	pip3 install tqdm
    	pip3 install pandas
     	pip3 install aiofile
      	pip3 install pybloom-live
       	pip3 install cython
       	pip3 install pybloomfiltermmap3
	pip3 install hfinder
 	pip3 install playwright
 	pip3 install playwright-stealth
  	playwright install
   	pip3 install bbot
    	bbot --help --ignore-failed-deps
 
   	sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
	sudo apt update -y
	sudo apt-get install docker-ce docker-ce-cli containerd.io -y
 	sudo usermod -aG docker ${USER}
  	sudo docker pull ghcr.io/praetorian-inc/noseyparker:latest
   	sudo apt update && sudo apt -y install font-manager
  	

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
	pip3 install dnsgen
	
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

   	go install github.com/ffuf/pencode/cmd/pencode@latest
  	sudo cp $HOME/go/bin/pencode /usr/local/bin
	
	go install github.com/BishopFox/jsluice/cmd/jsluice@latest
	sudo cp $HOME/go/bin/jsluice /usr/local/bin

  	go install github.com/c3l3si4n/quickcert@HEAD
	sudo cp $HOME/go/bin/quickcert /usr/local/bin

 	go install github.com/hakluke/haktrails@latest
  	sudo cp $HOME/go/bin/haktrails /usr/local/bin

	npm install -g @llllvvuu/dl-webapp-sources
 	npm install webcrack --global
    
  	cd $HOME/BB
 	git clone https://github.com/Hackmanit/Web-Cache-Vulnerability-Scanner.git
  
	cd $HOME/BB
	git clone https://github.com/vortexau/dnsvalidator.git
	cd dnsvalidator
	sudo pip3 install -r requirements.txt
	sudo python3 setup.py install
	pip3 install -r requirements.txt
	python3 setup.py install

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
	pip3 install -r requirements.txt
	
	cd $HOME/BB
	cargo install ripgen
	
	cd $HOME/BB
	git clone https://github.com/shmilylty/OneForAll.git
	cd OneForAll/
	sudo python3 -m pip install -U pip setuptools wheel
	python3 -m pip install -U pip setuptools wheel
	sudo pip3 install -r requirements.txt
	pip3 install -r requirements.txt

	cd $HOME/BB
	git clone https://github.com/dariusztytko/vhosts-sieve.git
	sudo pip3 install -r vhosts-sieve/requirements.txt
	pip3 install -r vhosts-sieve/requirements.txt
	
	cd $HOME/BB
	git clone https://github.com/punk-security/dnsReaper.git
	cd dnsReaper
	sudo pip3 install -r requirements.txt
	pip3 install -r requirements.txt

	cd $HOME/BB
	git clone https://github.com/Nishantbhagat57/SubDomz.git
	cd SubDomz 
	chmod +x install.sh SubDomz
	./install.sh

	cd $HOME/BB
	git clone https://github.com/fyoorer/ShadowClone.git
	cd ShadowClone
	pip3 install -r requirements.txt
 	pip3 install lithops
  	brew install awscli

 	cd $HOME/BB
  	mkdir dorker
   	cd $HOME/BB/dorker
    	npm install axios puppeteer puppeteer-extra puppeteer-extra-plugin-recaptcha request-promise-core node-fetch fs url async puppeteer-extra-plugin-stealth unirest cheerio base-64 utf8 base64url request-promise request request-promise-native path fs string-similarity axios --save
	npm audit fix --force
  	sudo chmod 777 *
  
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
	pip3 install git+https://github.com/xnl-h4ck3r/xnLinkFinder.git -v

 	sudo pip3 install argparse requests psutil pyyaml termcolor urlparse3 beautifulsoup4 lxml html5lib urllib3 --break-system-packages
	pip3 install argparse requests psutil pyyaml termcolor urlparse3 beautifulsoup4 lxml html5lib urllib3 --break-system-packages
 	pip3 install --upgrade setuptools pip --break-system-packages
	sudo pip3 install --upgrade setuptools pip --break-system-packages
 	sudo python3 setup.py install
	python3 setup.py install
		
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
 	git clone https://github.com/Nishantbhagat57/uniqueurls.git
  	cd $HOME/BB/uniqueurls
   	pip3 install -r requirements.txt
	
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
   	pip3 install pyyaml
    	pip3 install termcolor
    	pip3 install git+https://github.com/xnl-h4ck3r/urless.git

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

   	go install github.com/erickfernandox/slicepathsurl@latest
 
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
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri11.sh -O $HOME/BB/ghauri11.sh
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri12.sh -O $HOME/BB/ghauri12.sh

   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/hbsqli.json -O $HOME/.axiom/modules/hbsqli.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/dnsreaper.json -O $HOME/.axiom/modules/dnsreaper.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffuf_postprocess.json -O $HOME/.axiom/modules/ffufpp.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufapi.json -O $HOME/.axiom/modules/ffufapi.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/arjun1.json -O $HOME/.axiom/modules/arjun1.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/arjun2.json -O $HOME/.axiom/modules/arjun2.json
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/arjun3.json -O $HOME/.axiom/modules/arjun3.json
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/arjun4.json -O $HOME/.axiom/modules/arjun4.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/acunetix.json -O $HOME/.axiom/modules/acunetix.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/getjs.json -O $HOME/.axiom/modules/getjs.json
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ppfuzz.json -O $HOME/.axiom/modules/ppfuzz.json
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/x8.json -O $HOME/.axiom/modules/x8.json
   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ghauri.json -O $HOME/.axiom/modules/ghauri.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/xnlinkfinder1.json -O $HOME/.axiom/modules/xn1.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/xnlinkfinder2.json -O $HOME/.axiom/modules/xn2.json
     	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/waymore1.json -O $HOME/.axiom/modules/waymore1.json
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
     	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/dnstake.json -O $HOME/.axiom/modules/dnstake.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/cloudrecon.json -O $HOME/.axiom/modules/cloudrecon.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/bxss.json -O $HOME/.axiom/modules/bxss.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/katana1.json -O $HOME/.axiom/modules/katana1.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/httpx1.json -O $HOME/.axiom/modules/httpx1.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/dnsresolver.json -O $HOME/.axiom/modules/dnsresolver.json
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/massdns1.json -O $HOME/.axiom/modules/massdns1.json
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/dalfox1.json -O $HOME/.axiom/modules/dalfox1.json
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffuflfi1.json -O $HOME/.axiom/modules/ffuflfi1.json
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffuflfi2.json -O $HOME/.axiom/modules/ffuflfi2.json
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufpp1.json -O $HOME/.axiom/modules/ffufpp1.json
   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufpp2.json -O $HOME/.axiom/modules/ffufpp2.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufpp3.json -O $HOME/.axiom/modules/ffufpp3.json
     	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufpp4.json -O $HOME/.axiom/modules/ffufpp4.json
      	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufpp5.json -O $HOME/.axiom/modules/ffufpp5.json
       	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufpp6.json -O $HOME/.axiom/modules/ffufpp6.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufpp7.json -O $HOME/.axiom/modules/ffufpp7.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufpp8.json -O $HOME/.axiom/modules/ffufpp8.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufpp9.json -O $HOME/.axiom/modules/ffufpp9.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufpp10.json -O $HOME/.axiom/modules/ffufpp10.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/ffufpp11.json -O $HOME/.axiom/modules/ffufpp11.json
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/uniqueurls.json -O $HOME/.axiom/modules/uniqueurls.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/x8_custom2.json -O $HOME/.axiom/modules/x8_custom2.json
	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/dsxs.json -O $HOME/.axiom/modules/dsxs.json
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/blc1.json -O $HOME/.axiom/modules/blc1.json
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/xssscanner.json -O $HOME/.axiom/modules/xssscanner.json
   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/vhostfind.json -O $HOME/.axiom/modules/vhostfind.json
    	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/bbotsub.json -O $HOME/.axiom/modules/bbotsub.json
     	sudo rm $HOME/.axiom/interact/axiom-exec
      	sudo rm $HOME/.axiom/interact/axiom-scan
 	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/axiom-exec -O $HOME/.axiom/interact/axiom-exec
  	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/axiom-scan -O $HOME/.axiom/interact/axiom-scan
   	wget https://raw.githubusercontent.com/Nishantbhagat57/OK-VPS/main/axiom-proxy1 -O $HOME/.axiom/interact/axiom-proxy1
      
    	sudo chmod 777 $HOME/.axiom/modules/*
     	sudo chmod 777 $HOME/.axiom/interact/*
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

 	mkdir -p $HOME/BB/jsmonitor
 	cd $HOME/BB/jsmonitor
  	git clone https://github.com/tree-sitter/tree-sitter-javascript.git

 	cd $HOME/BB
   	git clone https://github.com/r0oth3x49/ghauri.git
    	cd $HOME/BB/ghauri
    	python3 -m pip install --upgrade -r requirements.txt
    	python3 -m pip install -e .

 	cd $HOME/BB
	git clone https://github.com/maliciousgroup/getdirs.git
  
 	sudo chmod 777 $HOME/BB/*
  	sudo chmod 777 $HOME/BB/*/*
   	sudo chmod 777 $HOME/BB/*/*/*
    	sudo chmod 777 $HOME/BB/*/*/*/*
     
    	sudo apt install snapd
	sudo snap install core
 	sudo snap install ark
	
 	export TMPDIR=/tmp
  	subfinder
   	echo "SUCCESSFULLY DONE OKVPS"
