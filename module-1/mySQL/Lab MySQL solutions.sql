CREATE TABLE cars (
	car_id			INT AUTO_INCREMENT PRIMARY KEY,
	VIN				VARCHAR(20),
	manufacturer	VARCHAR(30),
	model			VARCHAR(30),
	year			INT,
	color			VARCHAR(20),
	store_name		VARCHAR(200)
	)


CREATE TABLE customers(	
	customer_id			INT AUTO_INCREMENT PRIMARY KEY,
	customer_name		VARCHAR(30),
	store_name			VARCHAR(200),
	staff_id			INT,
	staff_name			VARCHAR(30),
	phone				VARCHAR(30),
	email				VARCHAR(30),
	address				VARCHAR(200),
	city				VARCHAR(20),
	state				VARCHAR(20),
	country				VARCHAR(20),
	zip_code. 			VARCHAR(10)
	);
# The customers here are not CRM data, but those customers bring sales closed-won 


CREATE TABLE salespersons(
	staff_id		INT AUTO_INCREMENT PRIMARY KEY,
	staff_name		VARCHAR(30),
	store_name		VARCHAR(30)
);
	
	
CREATE TABLE invoices(
	invoice_id		BIGINT AUTO_INCREMENT PRIMARY KEY,
	invoice_date	DATE,	
	car_id			INT,
	VIN				VARCHAR(20),			
	customer_id		INT,
	customer_name	VARCHAR(30),
	staff_id		INT,
	staff_name		VARCHAR(30)
);



INSERT INTO cars(VIN,manufacturer,model,year,color)
VALUES 
('3K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue'),
('ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
('RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'WhiteH'),
('KNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver'),
('DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray'),
('DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country',2019,'Gray');


INSERT INTO customers(customer_id,customer_name,phone,address,city,state,country,zip_code)
VALUES
(10001,'Pablo Picasso','+34 636 17 63 82','Paseo de la Chopera, 14','Madrid','Madrid', 'Spain',28045),
(20001,'Abraham Lincoln','+1 305 907 7086','120 SW 8th St','Miami','Florida','United States',33130),
(30001,'Napoléon Bonaparte','+33 1 79 75 40 00','40 Rue du Colisée','Paris','Île-de-France','France',75008);


INSERT INTO salespersons(staff_id,staff_name,store_name)
VALUES
(00001,'Petey Cruiser','Madrid'),
(00002,'Anna Sthesia','Barcelona'),
(00003,'Paul Molive','Berlin'),
(00004,'Gail Forcewind','Paris'),
(00005,'Paige Turner','Mimia'),
(00006,'Bob Frapples','Mexico City'),
(00007,'Walter Melon','Amsterdam'),
(00008,'Shonda Leer','São Paulo');


INSERT INTO invoices(invoice_id,invoice_date,car_id,customer_id,staff_id)
VALUES
(852399038,22-08-2018,0,1,3),
(731166526,31-12-2018,3,0,5),
(271135104,22-01-2019,2,2,7);
