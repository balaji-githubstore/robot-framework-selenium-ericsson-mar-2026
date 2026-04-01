import requests


response=requests.get("https://petstore.swagger.io/v2/pet/5")
print(response)



print(response.status_code)

print(response.headers)

print(response.text)

print(response.json())
print(response.json()['id'])
print(response.json()['name'])

print(response.json()['category']['id'])