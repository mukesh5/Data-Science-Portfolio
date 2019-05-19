from urllib.request import urlopen
from bs4 import BeautifulSoup
import ssl

# Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE


html = urlopen('http://py4e-data.dr-chuck.net/comments_191437.html', context=ctx).read()
soup = BeautifulSoup(html, "html.parser")

# Retrieve all of the anchor tags
tags = soup('span')
sm = 0
for tag in tags:
    # Look at the parts of a tag
    # print('TAG:', tag)
    sm += int(tag.contents[0])

print(sm)