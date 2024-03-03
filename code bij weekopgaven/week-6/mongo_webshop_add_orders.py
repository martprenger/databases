#
# mongoimport --db=webshop --collection=orders --file=bestellingen.json
# db.orders.find().sort( {artikel_naam:1} ).explain("executionstats")
# db.orders.createIndex( {artikel_naam:1} )
#

import random, decimal, string

# randint(a, b) returns a random integer N with a <= N <= b 

def random_str(l):
    # allow repeating characters
    return ''.join(random.choice(string.ascii_letters) for i in range(l))

def aantal_items():
    n = random.randint(1,10)
    if n < 5: #1234
        return 1
    if n < 8: #567
        return 2
    if n < 10: #89
        return 3
    else:
        return 4
# create appr. 100.000 json-documents and save them in bestellingen.json
with open ('bestellingen.json', 'w') as f:
    order_id = 0
    for i in range(50000):
        order_id = order_id + 1
        volgnr = 1
        for k in range(aantal_items()):
            artikel_nr = random.randint(1,10000)
            artikel_naam = random_str(25)
            aantal = random.randint(1,5)
            bedrag = random.randint(5, 500) + random.random() # int +  value in [0.0, 1.0) 
            # json: double quotes, and {{ is to escape
            s = '{{\"order_id\": {0}, \"volgnr\": {1}, \"artikelnr\": {2}, \"artikel_naam\": \"{3}\", \"aantal\": {4}, \"bedrag\": {5:.2f}}}\n'.format(order_id, volgnr, artikel_nr, artikel_naam, aantal, bedrag)
            f.write(s);
            volgnr = volgnr + 1

