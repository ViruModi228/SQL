use ac

-- -----------------------------------------------------
-- Schema acquisition_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `staff`
-- -----------------------------------------------------
DROP TABLE staff CASCADE CONSTRAINTS;

CREATE TABLE staff (
  acq_staff_id NUMBER NOT NULL,
  c_staff_id VARCHAR(10) NULL,
  staff_family_name VARCHAR(30) NOT NULL,
  staff_other_names VARCHAR(45) NULL,
  staff_phone VARCHAR(10) NOT NULL,
  staff_street_address VARCHAR(45) NULL,
  staff_suburb VARCHAR(20) NULL,
  staff_state VARCHAR(5) NULL,
  staff_postcode NUMBER NULL,
  PRIMARY KEY (acq_staff_id));


-- -----------------------------------------------------
-- Table `manager`
-- -----------------------------------------------------
DROP TABLE manager  CASCADE CONSTRAINTS;

CREATE TABLE  manager (
  acq_staff_id NUMBER NOT NULL,
  mgr_start_date DATE NOT NULL,
  mgr_review_date DATE NULL,
  PRIMARY KEY (acq_staff_id),
  CONSTRAINT fk_manager_staff1
    FOREIGN KEY (acq_staff_id)
    REFERENCES staff (acq_staff_id));


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE location  CASCADE CONSTRAINTS;

CREATE TABLE location (
  loc_id NUMBER NOT NULL,
  centre_id INT NULL,
  loc_street_address VARCHAR(45) NULL,
  loc_suburb VARCHAR(20) NULL,
  loc_state VARCHAR(5) NULL,
  loc_postcode NUMBER NULL,
  loc_size NUMBER(8,2) NOT NULL,
  hasSeating NUMBER DEFAULT 0 NULL,
  PRIMARY KEY (loc_id));


-- -----------------------------------------------------
-- Table `store`
-- -----------------------------------------------------
DROP TABLE store  CASCADE CONSTRAINTS;

CREATE TABLE store (
  acq_store_id NUMBER NOT NULL,
  c_store_id VARCHAR(10) NULL,
  store_name VARCHAR(45) NULL,
  store_loc_id NUMBER NULL,
  company_id NUMBER NOT NULL,
  store_mgr_id NUMBER NULL,
  PRIMARY KEY (acq_store_id),
  CONSTRAINT fk_store_manager1
    FOREIGN KEY (store_mgr_id)
    REFERENCES manager (acq_staff_id),
  CONSTRAINT fk_store_location1
    FOREIGN KEY (store_loc_id)
    REFERENCES location (loc_id));


-- -----------------------------------------------------
-- Table `contract`
-- -----------------------------------------------------
DROP TABLE contract  CASCADE CONSTRAINTS;

CREATE TABLE contract (
  contract_id NUMBER NOT NULL,
  staff_id NUMBER NOT NULL,
  company_id NUMBER NOT NULL,
  contract_start_date DATE NOT NULL,
  PRIMARY KEY (contract_id),
  CONSTRAINT fk_contract_staff1
    FOREIGN KEY (staff_id)
    REFERENCES staff (acq_staff_id));


-- -----------------------------------------------------
-- Table `ft_contract`
-- -----------------------------------------------------
DROP TABLE ft_contract  CASCADE CONSTRAINTS;

CREATE TABLE ft_contract (
  contract_id INT NOT NULL,
  ft_salary INT NULL,
  ft_super_amt DECIMAL(8,2) NULL,
  PRIMARY KEY (contract_id),
  CONSTRAINT fk_ft_contract_contract1
    FOREIGN KEY (contract_id)
    REFERENCES contract (contract_id));


-- -----------------------------------------------------
-- Table `pt_contract`
-- -----------------------------------------------------
DROP TABLE pt_contract  CASCADE CONSTRAINTS;

CREATE TABLE pt_contract (
  contract_id INT NOT NULL,
  pt_hours_per_wk INT NULL,
  pt_hourly_rate DECIMAL(5,2) NULL,
  pt_super_amt DECIMAL(8,2) NULL,
  PRIMARY KEY (contract_id),
  CONSTRAINT fk_pt_contract_contract1
    FOREIGN KEY (contract_id)
    REFERENCES contract (contract_id));


-- -----------------------------------------------------
-- Data for table `staff`
-- -----------------------------------------------------
INSERT INTO staff (acq_staff_id, c_staff_id, staff_family_name, staff_other_names, staff_phone, staff_street_address, staff_suburb, staff_state, staff_postcode) VALUES (1, '001', 'Freedman', 'Jeremy', '0477122226', '11 Quimby St', 'Springfield', 'TAS', 7112);
INSERT INTO staff (acq_staff_id, c_staff_id, staff_family_name, staff_other_names, staff_phone, staff_street_address, staff_suburb, staff_state, staff_postcode) VALUES (2, '002', 'Bellows', 'Rory B', '0412836227', '62 Kearney St', 'Springfield', 'TAS', 7123);
INSERT INTO staff (acq_staff_id, c_staff_id, staff_family_name, staff_other_names, staff_phone, staff_street_address, staff_suburb, staff_state, staff_postcode) VALUES (3, '006', 'Kurtofsky', 'Herschel S', '0411888222', '33 Kearney St', 'Springfield', 'TAS', 7123);
INSERT INTO staff (acq_staff_id, c_staff_id, staff_family_name, staff_other_names, staff_phone, staff_street_address, staff_suburb, staff_state, staff_postcode) VALUES (4, NULL, 'MacNeille', 'Cora', '0428474679', '42 Montgomery Park', 'Springfield', 'VIC', 3777);
INSERT INTO staff (acq_staff_id, c_staff_id, staff_family_name, staff_other_names, staff_phone, staff_street_address, staff_suburb, staff_state, staff_postcode) VALUES (5, 'L003', 'Risotto', 'Luigi', '0471333355', '7 Burnside Street', 'Montgomery', 'VIC', 3104);



-- -----------------------------------------------------
-- Data for table 'manager'
-- -----------------------------------------------------
INSERT INTO manager (acq_staff_id, mgr_start_date, mgr_review_date) VALUES (2, '28-FEB-2020', '02-NOV-2022');
INSERT INTO manager (acq_staff_id, mgr_start_date, mgr_review_date) VALUES (4, '01-NOV-2021', '16-DEC-2022');
INSERT INTO manager (acq_staff_id, mgr_start_date, mgr_review_date) VALUES (5, '23-JAN-2020', '21-NOV-2022');


-- -----------------------------------------------------
-- Data for table 'location'
-- -----------------------------------------------------
INSERT INTO location (loc_id, centre_id, loc_street_address, loc_suburb, loc_state, loc_postcode, loc_size, hasSeating) VALUES (1, NULL, '6 Springfield Blvd', 'Springfield', 'TAS', 7533, 138, 1);
INSERT INTO location (loc_id, centre_id, loc_street_address, loc_suburb, loc_state, loc_postcode, loc_size, hasSeating) VALUES (2, 2, 'Shop 6', 'Chadstone', 'VIC', 3113, 54, 0);
INSERT INTO location (loc_id, centre_id, loc_street_address, loc_suburb, loc_state, loc_postcode, loc_size, hasSeating) VALUES (3, NULL, '15 Springfield Blvd', 'Springfield', 'TAS', 7772, 116, 1);
INSERT INTO location (loc_id, centre_id, loc_street_address, loc_suburb, loc_state, loc_postcode, loc_size, hasSeating) VALUES (4, NULL, '23 3rd St', 'Springfield', 'TAS', 7111, 203, 1);
INSERT INTO location (loc_id, centre_id, loc_street_address, loc_suburb, loc_state, loc_postcode, loc_size, hasSeating) VALUES (5, 1, 'Shop 112', 'Macquarie Park', 'NSW', 2113, 46, 0);
INSERT INTO location (loc_id, centre_id, loc_street_address, loc_suburb, loc_state, loc_postcode, loc_size, hasSeating) VALUES (6, 3, 'Shop B03', 'Parramatta', 'NSW', 2150, 37, 0);


-- -----------------------------------------------------
-- Data for table 'store'
-- -----------------------------------------------------
INSERT INTO store (acq_store_id, c_store_id, store_name, store_loc_id, company_id, store_mgr_id) VALUES (1, 'TAS01', 'Springfield Boulevard', 1, 1, 2);
INSERT INTO store (acq_store_id, c_store_id, store_name, store_loc_id, company_id, store_mgr_id) VALUES (2, 'VIC01', 'Chadstone', 2, 1, NULL);
INSERT INTO store (acq_store_id, c_store_id, store_name, store_loc_id, company_id, store_mgr_id) VALUES (3, NULL, 'Springfield', 3, 2, 4);
INSERT INTO store (acq_store_id, c_store_id, store_name, store_loc_id, company_id, store_mgr_id) VALUES (4, NULL, 'Luigi''s', 4, 3, 5);
INSERT INTO store (acq_store_id, c_store_id, store_name, store_loc_id, company_id, store_mgr_id) VALUES (5, 'S001', 'Macquarie Park', 5, 4, NULL);
INSERT INTO store (acq_store_id, c_store_id, store_name, store_loc_id, company_id, store_mgr_id) VALUES (6, 'S002', 'Parramatta', 6, 4, NULL);



-- -----------------------------------------------------
-- Data for table 'contract'
-- -----------------------------------------------------
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (1, 1, 1, '12-DEC-2020');
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (2, 1, 1, '01-OCT-2021');
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (3, 1, 1, '22-FEB-2022');
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (4, 2, 1, '01-SEP-2017');
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (5, 3, 1, '23-JUN-2019');
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (6, 2, 1, '28-FEB-2020');
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (7, 4, 2, '01-NOV-2021');
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (8, 5, 3, '23-JAN-2020');
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (9, 4, 2, '23-FEB-2020');
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (10, 2, 2, '23-APR-2020');
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (11, 3, 1, '13-MAY-2020');
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (12, 2, 3, '23-FEB-2020');
INSERT INTO contract (contract_id, staff_id, company_id, contract_start_date) VALUES (13, 5, 1, '02-MAR-2020');


-- -----------------------------------------------------
-- Data for table 'ft_contract'
-- -----------------------------------------------------
INSERT INTO ft_contract (contract_id, ft_salary, ft_super_amt) VALUES (3, 50000, 5250);
INSERT INTO ft_contract (contract_id, ft_salary, ft_super_amt) VALUES (7, 48500, 5000);
INSERT INTO ft_contract (contract_id, ft_salary, ft_super_amt) VALUES (8, 51000, 5375);


-- -----------------------------------------------------
-- Data for table 'pt_contract'
-- -----------------------------------------------------
INSERT INTO pt_contract (contract_id, pt_hours_per_wk, pt_hourly_rate, pt_super_amt) VALUES (2, 20, 22.31, 1780);
INSERT INTO pt_contract (contract_id, pt_hours_per_wk, pt_hourly_rate, pt_super_amt) VALUES (4, 15, 23.12, 1383.73);
INSERT INTO pt_contract (contract_id, pt_hours_per_wk, pt_hourly_rate, pt_super_amt) VALUES (5, 25, 25.77, 2570.56);


-- -----------------------------------------------------
-- Adding date of birth columm and inserting the values
-- -----------------------------------------------------
ALTER TABLE staff
ADD dob DATE;

UPDATE staff
SET dob = '12-MAR-1982'
WHERE acq_staff_id = 1;

UPDATE staff
SET dob = '21-JUL-1986'
WHERE acq_staff_id = 2;

UPDATE staff
SET dob = '15-MAR-1981'
WHERE acq_staff_id = 3;

UPDATE staff
SET dob = '26-OCT-1990'
WHERE acq_staff_id = 4;

UPDATE staff
SET dob = '07-NOV-1977'
WHERE acq_staff_id = 5;

-- -----------------------------------------------------
-- Adding email columm and inserting the values
-- -----------------------------------------------------
ALTER TABLE staff
ADD email VARCHAR(30);

UPDATE staff
SET email = 'freedman@mymail.com.au'
WHERE acq_staff_id = 1;

UPDATE staff
SET email = 'rbb@yahooooo.com.au'
WHERE acq_staff_id = 2;

UPDATE staff
SET email = 'hersc_k@googly.com'
WHERE acq_staff_id = 3;

UPDATE staff
SET email = 'cora_mn@springfield.net.au'
WHERE acq_staff_id = 4;

UPDATE staff
SET email = 'l.risotto@luigispizza.com'
WHERE acq_staff_id = 5;


-- -----------------------------------------------------
-- Table `food_company`
-- -----------------------------------------------------
DROP TABLE food_company  CASCADE CONSTRAINTS;

CREATE TABLE  food_company (
  acqcom_id NUMBER NOT NULL,
  fcom_name VARCHAR(20),
  fcom_amount NUMBER NOT NULL,
  fcom_datepurchase DATE NOT NULL,
   PRIMARY KEY (acqcom_id));




-- -----------------------------------------------------
-- Table `casual_contract`
-- -----------------------------------------------------
DROP TABLE casual_contract  CASCADE CONSTRAINTS;

CREATE TABLE  casual_contract (
  contract_id NUMBER NOT NULL,
  base_payrate NUMBER(6,2) NULL,
  loading_percentage NUMBER(6,2) NULL,
    PRIMARY KEY (contract_id),
    FOREIGN KEY (contract_id) REFERENCES contract (contract_id));


INSERT INTO food_company (acqcom_id,fcom_name, fcom_amount, fcom_datepurchase) VALUES (1,'Mad Mexx', 234400, '12-JAN-2018');
INSERT INTO food_company (acqcom_id,fcom_name, fcom_amount, fcom_datepurchase) VALUES (2,'GyG', 353800, '16-MAR-2018');
INSERT INTO food_company (acqcom_id,fcom_name, fcom_amount, fcom_datepurchase) VALUES (3,'Domidos', 512400, '09-SEP-2019');
INSERT INTO food_company (acqcom_id,fcom_name, fcom_amount, fcom_datepurchase) VALUES (4,'Pizzza Hut', 456500, '28-OCT-2019');
INSERT INTO food_company (acqcom_id,fcom_name, fcom_amount, fcom_datepurchase) VALUES (5,'Mad Toppingss', 120300, '16-NOV-2019');
INSERT INTO food_company (acqcom_id,fcom_name, fcom_amount, fcom_datepurchase) VALUES (6,'Max Brennerr', 640600, '16-DEC-2019');


INSERT INTO casual_contract (contract_id,base_payrate, loading_percentage) VALUES (1, 30.25, 6.5);
INSERT INTO casual_contract (contract_id,base_payrate, loading_percentage) VALUES (6, 28.25, 5.5);
INSERT INTO casual_contract (contract_id,base_payrate, loading_percentage) VALUES (9, 32.25, 7.5);
INSERT INTO casual_contract (contract_id,base_payrate, loading_percentage) VALUES (10, 26.25, 4.5);
INSERT INTO casual_contract (contract_id,base_payrate, loading_percentage) VALUES (11, 32.25, 8.5);
INSERT INTO casual_contract (contract_id,base_payrate, loading_percentage) VALUES (12, 24.25, 4.5);
INSERT INTO casual_contract (contract_id,base_payrate, loading_percentage) VALUES (13, 34.25, 8.5);