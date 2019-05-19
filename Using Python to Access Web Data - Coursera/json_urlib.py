from urllib.request import urlopen
import ssl
import json

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE
url = 'http://py4e-data.dr-chuck.net/comments_191440.json'

data = urlopen(url, context=ctx).read().decode()

info = json.loads(data)
# print(info)
sm = 0
comments = info['comments']
for d in comments:
	sm += d['count']
	# print(d['count'])
print(sm)
