import random, string

def random_str(l):
    # allow repeating characters
    return ''.join(random.choice(string.ascii_letters) for i in range(l))

with open ('add_many_rows.sql', 'w') as f:
    
    f.write('use sakila;\n')
    
    # add up to 40.000 actors
    f.write('#\n# add 40.000 actors ------------- \n#\n') # sql comment
    actor_id = 201
    for i in range(40):
        f.write('start transaction;\n') # this will turn off autocommit
        for j in range(1000):
            first_name = random_str(10)
            last_name = first_name # not important
            s = 'insert into actor values ({0}, \'{1}\', \'{2}\', \'2017-05-01 11:22:33\');\n'.format(actor_id, first_name, last_name)
            f.write(s);
            actor_id = actor_id + 1      
        f.write('commit;\n')

    # add up to 5.000 films (film_id is smallint 0..65535 unsigned)
    f.write('#\n# add 5.000 films and link each film to a category ------------- \n#\n') # sql comment
    film_id = 1001;
    for i in range(5):
        f.write('start transaction;\n')
        for j in range(1000):
            rating = random.choice(['G', 'PG', 'PG-13', 'R', 'NC-17'])
            title = random_str(10)
            descr = random_str(10)
            category_id = random.randint(1,16)
            s = 'insert into film values ({0}, \'{1}\', \'{2}\', 2017, 1, NULL, 1, 1, 100, 10, \'{3}\', \'Deleted Scenes\', \'2017-05-01 11:11:11\');\n'.format(film_id, title, descr, rating)
            f.write(s);
            s = 'insert into film_category values ({0}, \'{1}\', \'2017-05-01 11:22:33\');\n'.format(film_id, category_id)
            f.write(s);
            film_id = film_id + 1      
        f.write('commit;\n')

    # link every film to 4 actors
    f.write('#\n# link each new film to 4 actors ------------- \n#\n') # sql comment
    film_id = 1001;
    for i in range(5):
        f.write('start transaction;\n')
        for j in range(1000):
            for k in range(4):
                actor_id = random.randint(1,40000)
                s = 'insert into film_actor values ({0}, {1}, \'2017-05-01 11:22:33\');\n'.format(actor_id, film_id)
                f.write(s);
            film_id = film_id + 1      
        f.write('commit;\n')


# DELETE FROM film WHERE film_id > 1000;
# mysql -u root -p < add_many_rows.sql
# analyze table film
# analyze table film_category
# analyze table film_actor
