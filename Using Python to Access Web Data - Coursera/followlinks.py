from urllib.request import urlopen
from bs4 import BeautifulSoup
import ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE
url = 'http://py4e-data.dr-chuck.net/known_by_Cadance.html'
for i in range(7):
	html = urlopen(url, context=ctx).read()
	bshtml = BeautifulSoup(html, 'html.parser')
	atag = bshtml('a')[17]
	url = atag.get('href')

print(url)
