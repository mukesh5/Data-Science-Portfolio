import urllib.request, urllib.parse, urllib.error
import json
import ssl

service_url = 'http://py4e-data.dr-chuck.net/json?'

# ignore ssl certificate errors

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

api_key = 42
while True:
	address = input('ENter location: ')
	if len(address) < 1:
		break

	parms = dict()
	parms['address'] = address
	parms['key'] = api_key

	url = service_url + urllib.parse.urlencode(parms)
	print(url)

	data = urllib.request.urlopen(url, context=ctx)
	info = data.read().decode()
	print(len(info))

	try:
		js = json.loads(info)
	except:
		js = None

	if not js or 'status' not in js or js['status'] != 'OK':
		print('Failure')
		print(data)
		continue

	print(json.dumps(js, indent=4))

	print('-'*30)
	results = js['results']
	print(results[0]['place_id'])