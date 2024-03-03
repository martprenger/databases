import random, decimal, string

# randint(a, b) returns a random integer N with a <= N <= b 
# INSERT INTO orderregel VALUES (2300, 1, 412, 2, 234.67);

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

with open ('orderregel_add_rows.sql', 'w') as f:
    
    f.write('use webshop;\n')
    
    f.write('#\n# add appr. 100.000 rows ------------- \n#\n') # sql comment
    orderregel_id = 1
    order_id = 0
    for i in range(50):
        f.write('start transaction;\n') # this will turn off autocommit
        for j in range(1000):
            volgnr = 1
            order_id = order_id + 1
            for k in range(aantal_items()):
                artikel_nr = random.randint(1,10000)
                artikel_naam = random_str(25)
                aantal = random.randint(1,5)
                bedrag = random.randint(5, 500) + random.random() # int +  value in [0.0, 1.0) 
                s = 'INSERT INTO orderregel VALUES ({0}, {1}, {2}, {3}, \'{4}\', {5}, {6:.2f});\n'.format(orderregel_id, order_id, volgnr, artikel_nr, artikel_naam, aantal, bedrag)
                f.write(s);
                volgnr = volgnr + 1
                orderregel_id = orderregel_id + 1
        f.write('commit;\n')

# mysql -u root -p < orderregel_add_rows.sql
# analyze table orderregel
