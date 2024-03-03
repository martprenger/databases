USE webshop;
SELECT COUNT(*) FROM orderregel WHERE bedrag > 0;
SELECT COUNT(*) FROM orderregel WHERE bedrag > 50;
SELECT COUNT(*) FROM orderregel WHERE bedrag > 100;
SELECT COUNT(*) FROM orderregel WHERE bedrag > 150;
SELECT COUNT(*) FROM orderregel WHERE bedrag > 200;
SELECT COUNT(*) FROM orderregel WHERE bedrag > 250;
SELECT COUNT(*) FROM orderregel WHERE bedrag > 300;
SELECT COUNT(*) FROM orderregel WHERE bedrag > 350;
SELECT COUNT(*) FROM orderregel WHERE bedrag > 400;
SELECT COUNT(*) FROM orderregel WHERE bedrag > 450;

#
# SELECT * FROM Orderregel ORDER BY bedrag DESC LIMIT 10;
#