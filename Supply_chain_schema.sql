CREATE TABLE orders (
    Order_ID SERIAL PRIMARY KEY,
    Order_Date DATE,
    Origin_Port VARCHAR(50),
    Carrier VARCHAR(50),
    TPT VARCHAR(20),
    Service_Level VARCHAR(50),
    Ship_ahead_day_count INT,
    Ship_late_day_count INT,
    Customer VARCHAR(50),
    Product_ID VARCHAR(20),
    Plant_Code VARCHAR(20),
    Destination_Port VARCHAR(50),
    Unit_quantity INT,
    Weight DECIMAL(10,2),
    FOREIGN KEY (Product_ID, Plant_Code) REFERENCES productpercost (Product_ID, Plant_Code)
);
CREATE TABLE whcapacities (
    Plant_ID VARCHAR(20) PRIMARY KEY,
    Daily_Capacity INT
);

CREATE TABLE whcosts (
    WH VARCHAR(20),
    Cost_per_unit DECIMAL(10,2)
);

CREATE TABLE productpercost (
    Plant_Code VARCHAR(20),
    Product_ID VARCHAR(20),
    PRIMARY KEY (Plant_Code, Product_ID)   
);

SELECT * FROM whcapacities;
SELECT * from whcosts;
SELECT * FROM orders;
SELECT * FROM productperplant;





