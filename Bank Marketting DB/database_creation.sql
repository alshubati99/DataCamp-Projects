
-- Create the 'client' table
CREATE TABLE client (
    id SERIAL PRIMARY KEY,
    age INTEGER,
    job TEXT,
    marital TEXT,
    education TEXT,
    credit_default BOOLEAN,
    housing BOOLEAN,
    loan BOOLEAN
);

-- Create the 'campaign' table
CREATE TABLE campaign (
    campaign_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES client(id),
    number_contacts INTEGER,
    duration INTEGER,
    pdays INTEGER,
    previous_campaign_contacts INTEGER,
    previous_outcome BOOLEAN,
    campaign_outcome BOOLEAN,
    last_contact_date DATE
);

-- Create the 'economics' table
CREATE TABLE economics (
    client_id INTEGER REFERENCES client(id),
    emp_var_rate FLOAT,
    cons_price_idx FLOAT,
    euribor_three_months FLOAT,
    number_employed FLOAT
);

-- Populate the 'client' table
COPY client FROM 'client.csv' WITH CSV HEADER;

-- Populate the 'campaign' table
COPY campaign FROM 'campaign.csv' WITH CSV HEADER;

-- Populate the 'economics' table
COPY economics FROM 'economics.csv' WITH CSV HEADER;
