import requests
import json

r = requests.get(url='https://www.csdn.net/')
print(r.json())