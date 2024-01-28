cat sqli_part10.txt | rush -k -j 8 'bash -c "ghauri --url \"{}\" --confirm --timeout 20 --threads 60 --level 3 --flush-session --fresh-queries --technique BT --batch"'
