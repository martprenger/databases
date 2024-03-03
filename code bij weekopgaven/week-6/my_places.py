import pymongo
from pprint import pprint
from pymongo import MongoClient

# default host and port
client = MongoClient('localhost', 27017)
db = client.places
col = db.Groningen

print ('Number of places: ', col.count_documents({}))
print()

# locatie Martini-toren:
lon = 6.568099978162406 
lat = 53.219414866425936

# query = ???

cursor = col.find(query)

for document in cursor:
    print(document['name'], ': ' , document['type'])
