import requests
import re
import sys

target_url = sys.argv[1]
ulist_fname = sys.argv[2]
res_fname = sys.argv[3]

with open(ulist_fname, "r") as furls:
    for url in furls:
        regx_url=re.sub(r'https?:\/', '', url.strip())
        
        response = requests.get(target_url+regx_url)
        if response.status_code == 200:
            with open(res_fname, "a") as f:
                f.write(regx_url)
                f.write("\n")
        else:
            continue