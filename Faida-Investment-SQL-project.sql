create schema FAIDA_INVESTMENT_FIRM; 
show databases;
use FAIDA_INVESTMENT_FIRM;


CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL, -- Increased length in case you decide to hash later
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
desc Users;

-- Optional: You might want an index on Email for faster logins
CREATE INDEX idx_email ON Users (Email);

create table Clients_Table
(
Client_ID int primary key not null,
Client_Name varchar(50) not null,
Gender varchar(6) not null,
Email varchar(50) not null,
Phone_Number int unique,
Registration_Date date not null
);
desc Clients_Table;

create table Investments_Table 
(
Investments_ID int primary key not null,
Investment_name varchar(50) not null,
Investment_Type varchar(20) not null,
Risk_Level varchar(10) not null,
Annual_Return decimal  not null,
Minimun_Investment decimal  not null
);
desc Investments_Table;

create table Portfolio_Table
(
Portfolio_ID int primary key not null,
Portfolio_Name varchar(50) not null,
Total_value decimal not null,
Client_ID int not null,
foreign key(Client_ID) references Clients_Table (Client_ID)
);
desc Portfolio_Table;

create table Portfolio_Investments
(
Portfolio_Investments_ID  int  primary key  null,
Investment_amount decimal not null,
Investment_ID int not null,
Portfolio_ID int not null, 
foreign key(Investment_ID) references Investments_Table(Investments_ID)
);
alter table Portfolio_Investements add foreign key(Portfolio_ID) references Portfolio_Table(Portfolio_ID);
desc Portfolio_Investments;

#alter table Portfolio_Investments modify Portfolio_Investments_ID   AUTO_INCREMENT;

alter table Portfolio_Investements rename to  Portfolio_Investments;
desc Portfolio_Investments;

INSERT INTO Clients_Table (Client_ID, Client_Name, Gender, Email, Phone_Number, Registration_Date) 
VALUES 
(1, 'James Mwangi', 'Male', 'james.mwangi@gmail.com', '0712345678', '2024-01-15'),
(2, 'Akinyi Otieno', 'Female', 'akinyi.otieno@gmail.com', '0723456789', '2024-02-20'),
(3, 'Kamau Njoroge', 'Male', 'kamau.njoroge@gmail.com', '0734567890', '2024-03-10'),
(4, 'Wanjiru Muthoni', 'Female', 'wanjiru.muthoni@gmail.com', '0745678901', '2024-04-05'),
(5, 'Mutua Musyoka', 'Male', 'mutua.musyoka@gmail.com', '0756789012', '2024-05-12');
select*from clients_table;

INSERT INTO Investments_Table (Investments_ID, Investment_Name, Investment_Type, Risk_Level, Annual_Return, Minimun_Investment) 
VALUES 
(1, 'Treasury Bonds', 'Fixed Income', 'Low', 9.50, 50000.00),
(2, 'Treasury Bills', 'Fixed Income', 'Low', 8.00, 100000.00),
(3, 'Sacco Savings', 'Savings', 'Low', 7.00, 20000.00),
(4, 'Unit Trust Fund', 'Mutual Fund', 'Medium', 12.00, 5000.00),
(5, 'Real Estate REITs', 'Real Estate', 'Medium', 15.50, 100000.00),
(6, 'Stocks NSE', 'Equities', 'High', 20.00, 1000.00),
(7, 'Cryptocurrency', 'Digital Asset', 'High', 30.00, 500.00);
select*from investments_table;

INSERT INTO Portfolio_Table (Portfolio_ID, Portfolio_Name, Total_Value, Client_ID) 
VALUES 
(1, 'James Mwangi Growth Fund', 250000.00, 1),
(2, 'Akinyi Otieno Retirement Fund', 150000.00, 2),
(3, 'Kamau Njoroge Wealth Portfolio', 500000.00, 3),
(4, 'Wanjiru Muthoni Family Fund', 100000.00, 4),
(5, 'Mutua Musyoka Investment Plan', 300000.00, 5);
select*from portfolio_table;

INSERT INTO Portfolio_Investments (Portfolio_Investments_ID, Investment_Amount, Investment_ID, Portfolio_ID) 
VALUES 
(1, 100000.00, 1, 1), #James Mwangi investing in Treasury Bonds
(2, 50000.00, 2, 2),  #Akinyi Otieno investing in Treasury Bills
(3, 200000.00, 3, 3), #Kamau Njoroge investing in SACCO Savings
(4, 75000.00, 4, 4),  #Wanjiru Muthoni investing in Unit Trust Fund
(5, 120000.00, 5, 5), #Mutua Musyoka investing in Real Estate REITs
(6, 30000.00, 6, 1),  #James Mwangi investing in NSE Stocks
(7, 15000.00, 7, 2);  #Akinyi Otieno investing in Cryptocurrency
select*from portfolio_investments;


#VIEWS

CREATE VIEW Client_portfolios_view AS
SELECT 
c.Client_ID,
c.Client_Name,
p.Portfolio_Name,
p.Total_value
FROM
 Clients_Table c ,
 Portfolio_Table p
 WHERE 
 c.Client_ID = p.Client_ID;



CREATE VIEW portfolio_investment_breakdown AS
SELECT
p.portfolio_ID,
p.portfolio_Name,
i.Investments_ID,
i.Investment_name,
i.Investment_Type,
pi.Investment_amount
FROM 
Portfolio_Investments pi,
Investments_Table i,
Portfolio_Table p
WHERE
pi.portfolio_id = p.portfolio_id
AND
i.Investments_ID = pi.Investment_ID;

CREATE VIEW High_value_portfolios AS 
SELECT 
c.Client_ID,
c.Client_Name,
p.Portfolio_Name,
p.Total_value
FROM 
clients_Table c,
Portfolio_Table p
WHERE 
c.Client_ID = p.Client_ID
AND
p.Total_value > 100000;

CREATE VIEW Portfoilo_risk_level AS
SELECT
p.Portfolio_ID,
p.Portfolio_name,
i.Investments_ID,
i.Investment_name,
i.Risk_Level,
pi.Investment_amount
FROM 
Portfolio_Investments pi,
Investments_Table i,
Portfolio_Table p
WHERE 
pi.Portfolio_ID = p.Portfolio_ID
AND pi.Investment_ID = i.Investments_ID;

CREATE VIEW Client_contact_information AS
SELECT
c.Client_ID,
c.Client_NAME,
c.Email,
c.Phone_Number
FROM 
Clients_TAble c;

SELECT * FROM  Client_portfolios_view;
SELECT * FROM portfolio_investment_breakdown;
SELECT * FROM High_value_portfolios ;
SELECT * FROM Portfoilo_risk_level;
SELECT * FROM  Client_contact_information;






