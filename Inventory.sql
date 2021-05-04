
-- SETUP

create table manufacturers (
    id integer PRIMARY KEY,
    name varchar
);

-- import data into the table
.mode csv
.import manufacturers.csv manufacturers















-- make id column in parts table the primary key
-- Write a constraint that forms a relationship between parts and manufacturers that ensures that all parts have a valid manufacturer.
CREATE TABLE parts (
    id integer PRIMARY KEY,
    description character varying NOT NULL,
    code character varying NOT NULL,
    manufacturer_id  integer,
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id)
);

-- import data into the table
.mode csv
.import parts.csv parts 
























-- add a constraint that ensures that each value in qty is greater than 0
-- ensure that locations records only one row for each combination of location and part.
-- Let’s ensure that for a part to be stored in locations, it must already be registered in parts. Write a constraint that forms the relationship. 
CREATE TABLE locations (
    id integer,
    part_id integer,
    location varchar(3),
    qty integer,
    CHECK (qty > 0),
    UNIQUE (part_id, location),
    FOREIGN KEY (part_id) REFERENCES parts (id)
);

-- import data into the table
.mode csv
.import locations.csv locations

















-- implement a check that ensures that price_usd and quantity are both NOT NULL
-- implement a check that ensures that price_usd and quantity are both positive.
-- Add a constraint to reorder_options that limits price per unit to within that range
-- Form a relationship between parts and reorder_options that ensures all parts in reorder_options 
create table reorder_options (
  id integer PRIMARY KEY,
  part_id integer,
  price_usd numeric(8,2) NOT NULL,
  quantity integer NOT NULL,
  CHECK (price_usd > 0 AND quantity > 0),
  CHECK (price_usd/quantity > .02 AND price_usd/quantity < 25.00),
  FOREIGN KEY (part_id) REFERENCES parts (id)
);

-- import data into the table
.mode csv
.import reorder_options.csv reorder_options























-- write a query to inspect the first 10 rows of parts
SELECT *
FROM parts
LIMIT 10;
















-- The parts table is missing values in the description column. 
-- Alter the table so that all rows have a value for description.
UPDATE parts
SET description = 'need_description'
WHERE description = ' ';
-- or
UPDATE parts
SET description = 'need_description'
WHERE description IS NULL;






















-- Test the constraint by trying to insert a row into parts
INSERT INTO parts (id, code, manufacturer_id)
VALUES (54, 'V1-009', 9);
-- you should get an ERROR
--Error: NOT NULL constraint failed: parts.description

INSERT INTO parts (id, description, code, manufacturer_id)
VALUES (54, 'need_description', 'V1-009', 9);






















-- Create a new manufacturer in manufacturers with an id=11
INSERT INTO manufacturers 
VALUES (11, 'Pip-NNC Industrial');



-- Update the old manufacturers’ parts in 'parts' to 
-- reference the new company you’ve just added to 'manufacturers
UPDATE parts
SET manufacturer_id = 11
WHERE manufacturer_id IN (5, 6);




