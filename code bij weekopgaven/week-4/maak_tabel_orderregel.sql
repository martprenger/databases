CREATE TABLE Orderregel (
    orderregel_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    volgnr INTEGER NOT NULL,
    artikelnr INTEGER NOT NULL,
    artikel_naam VARCHAR(30),
    aantal INTEGER NOT NULL,
    bedrag NUMERIC(6 , 2 ),
    PRIMARY KEY (orderregel_id)
);

#
# later:
# ALTER TABLE orderregel ADD INDEX idx (artikel_naam);
# DROP INDEX idx ON orderregel;
#
