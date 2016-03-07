CREATE TABLE bkmrk
( id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  category VARCHAR(255),
  link VARCHAR(255),
  details VARCHAR(255)
);
SELECT * FROM bkmrk;

CREATE TABLE profile
( id SERIAL8 PRIMARY KEY,
  email VARCHAR(255),
  name VARCHAR(255),
  bkmrks INT8[]
);
SELECT * FROM profile;