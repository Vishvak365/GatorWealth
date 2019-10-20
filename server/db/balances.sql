CREATE TABLE IF NOT EXISTS BALANCES (
    accounts_account_id VARCHAR(37) NULL,
    accounts_balances_available INT NULL,
    accounts_balances_current INT NULL,
    accounts_balances_iso_currency_code VARCHAR(3) NULL,
    accounts_balances_limit INT NULL,
    accounts_mask INT NULL,
    accounts_name VARCHAR(18) NULL,
    accounts_official_name VARCHAR(51) NULL,
    accounts_subtype VARCHAR(12) NULL,
    accounts_type VARCHAR(10) NULL,
    item_available_products VARCHAR(14) NULL,
    item_billed_products VARCHAR(12) NULL,
    item_institution_id VARCHAR(5) NULL,
    item_item_id VARCHAR(37) NULL,
    item_webhook VARCHAR(0) NULL,
    request_id VARCHAR(15) NULL
);

INSERT INTO BALANCES VALUES
("bGwdAMz8mGFAvWzyAKA3TMj1APewWWcVl1145",100,110,"USD",NULL,0,"Plaid Checking","Plaid Gold Standard 0% Interest Checking","checking","depository","assets","transactions","ins_1","mGa1zKXr8GFa9V7yaRaDhJAak1dreWCLvr1yL","","eMY2Edv4z7Cb76U"),
("mGa1zKXr8GFa9V7yaRaDhJAan3mP88uLEnnvE",200,210,"USD",NULL,1111,"Plaid Saving","Plaid Silver Standard 0.1% Interest Saving","savings","depository","auth",NULL,NULL,NULL,NULL,NULL),
("W7p6QxyKP7hQ9J74QoQEheo6DroBv1ulR77mb",NULL,1000,"USD",NULL,2222,"Plaid CD","Plaid Bronze Standard 0.2% Interest CD","cd","depository","balance",NULL,NULL,NULL,NULL,NULL),
("AZ47GPkqBZhJREbWJNJnidjq4Gj83yc18llXj",NULL,410,"USD",2000,3333,"Plaid Credit Card","Plaid Diamond 12.5% APR Interest Credit Card","credit card","credit","credit_details",NULL,NULL,NULL,NULL,NULL),
("GgRLlMxjNgilBawJlLlxTkexV1e8JrU1aXXe9",43200,43200,"USD",NULL,4444,"Plaid Money Market","Plaid Platinum Standard 1.85% Interest Money Market","money market","depository","identity",NULL,NULL,NULL,NULL,NULL),
("nGbLkrQB8GF4mWEd4l46fQR4BLRG3pI6oNNyR",NULL,320,"USD",NULL,5555,"Plaid IRA",NULL,"ira","investment","income",NULL,NULL,NULL,NULL,NULL),
("bGwdAMz8mGFAvWzyAKA3TMjyDkjxQzsVl114e",NULL,23631,"USD",NULL,6666,"Plaid 401k",NULL,"401k","investment","liabilities",NULL,NULL,NULL,NULL,NULL),
("mGa1zKXr8GFa9V7yaRaDhJA45gA6XWcLEnnvl",NULL,65262,"USD",NULL,7777,"Plaid Student Loan",NULL,"student","loan",NULL,NULL,NULL,NULL,NULL,NULL);