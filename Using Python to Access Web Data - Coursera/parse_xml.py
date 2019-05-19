from urllib.request import urlopen
import ssl
import xml.etree.ElementTree as ET

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

url = 'http://py4e-data.dr-chuck.net/comments_191439.xml'

xml = urlopen(url, context=ctx).read()


parsed = ET.fromstring(xml)

comments = parsed.findall('.//count')
# print(comments)

sm=0
for comment in comments:
	sm += int(comment.text)

print(sm)
