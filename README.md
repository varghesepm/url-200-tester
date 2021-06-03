# url-200-tester

To check 200 response for given url and store those in a file.

## Requirements
```
python3
```

install via pip

```
pip install -r requirements.txt
```

usage:
# run bash script with arguments
./run.sh -u http://localhost -l urls.txt -f result-url.txt

# directly run python 
python3 get-200-urls.py http://localhost urls.txt result-url.txt