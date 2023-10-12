 CREATE TABLE abshotel.HOTEL
(permissionID VARCHAR(5) NOT NULL, 
hotelName VARCHAR(15) NOT NULL,
CONSTRAINT HOTELl_PK PRIMARY KEY (permissionID) 
);
CREATE TABLE abshotel.EMPLOYEE
(employeeID VARCHAR(5)NOT NULL,
fName VARCHAR(20) NOT NULL,
lName VARCHAR(20) NOT NULL,
job VARCHAR(30) NOT NULL,
dateOfBirth VARCHAR(15) NOT NULL,
supervisorID VARCHAR(5) ,
permissionID VARCHAR(5) NOT NULL,
CONSTRAINT EMPLOYEE_PK PRIMARY KEY (employeeID),
CONSTRAINT EMPLOYEE_FK1 FOREIGN KEY (permissionID) REFERENCES HOTEL(permissionID),
CONSTRAINT EMPLOYEE_FK2 FOREIGN KEY (supervisorID) REFERENCES EMPLOYEE(employeeID)
);
CREATE TABLE abshotel.ROOM
(roomNo VARCHAR(5) NOT NULL,
roomType VARCHAR(20) NOT NULL,
noOfBeds INT(1) NOT NULL,
permissionID VARCHAR(5) ,
CONSTRAINT ROOM_PK PRIMARY KEY (roomNo),
CONSTRAINT ROOM_FK1 FOREIGN KEY (permissionID) REFERENCES HOTEL(permissionID)
);
CREATE TABLE abshotel.GUEST
(guestID VARCHAR(5) NOT NULL,
fName VARCHAR(15) NOT NULL,
lName VARCHAR(15),
resevationPeriod VARCHAR(10) NOT NULL,
age INT(2) ,
permissionID VARCHAR(5), 
roomNo VARCHAR(5),
CONSTRAINT Guest_PK PRIMARY KEY (guestID),
CONSTRAINT Guest_FK1 FOREIGN KEY (roomNo) REFERENCES ROOM(roomNo),
CONSTRAINT Guest_FK2 FOREIGN KEY (permissionID) REFERENCES HOTEL(permissionID)
);
CREATE TABLE abshotel.HOTEL_ADDRESS
( hotelName VARCHAR(15) ,
city VARCHAR(15),
street VARCHAR(15),
CONSTRAINT HOTEL_ADDRESS_PK PRIMARY KEY (hotelName)
);
CREATE TABLE abshotel.RESTURANT
(nameOfFood VARCHAR(20) NOT NULL,
typeOfFood VARCHAR(20) NOT NULL,
CONSTRAINT RESTURANT_PK PRIMARY KEY (nameOfFood,typeOfFood)
);
CREATE TABLE abshotel.FOOD_PRICE
( nameOfFood VARCHAR(20) NOT NULL,
price INT(3) NOT NULL ,
CONSTRAINT FOOD_PRICE_PK PRIMARY KEY (nameOfFood)
);
CREATE TABLE abshotel.HOTEL_phone
(permissionID VARCHAR(5),
phoneNumber VARCHAR(10) , 
CONSTRAINT HOTEL_phone_PK PRIMARY KEY (permissionID,phoneNumber)
);
CREATE TABLE abshotel.GUEST_PHONE
(guestID VARCHAR(5)  ,
phoneNumber VARCHAR(10) ,
CONSTRAINT GUEST_PHONE_PK PRIMARY KEY (guestID,phoneNumber),
CONSTRAINT GUEST_PHONE_FK FOREIGN KEY (guestID) REFERENCES GUEST(guestID)
);
CREATE TABLE abshotel.EMPLOYEE_PHONE
(employeeID VARCHAR(5) ,
phoneNumber VARCHAR(10) ,
CONSTRAINT EEMPLOYEE_PHONE_PK PRIMARY KEY (employeeID,phoneNumber),
CONSTRAINT EMPLOYEE_PHONEe_FK FOREIGN KEY (employeeID) REFERENCES EMPLOYEE(employeeID)
);
CREATE TABLE abshotel.WORK_IN
(employeeID VARCHAR(5),
roomNo VARCHAR(5) ,
nameOfFood VARCHAR(20) ,
typeOfFood VARCHAR(20) ,
CONSTRAINT WORK_IN_PK PRIMARY KEY (employeeID,roomNo,nameOfFood,typeOfFood)
);

#HOTEL
INSERT INTO abshotel.HOTEL (permissionID,hotelName)
VALUES ("G9051","ABS HOTEL 1");
INSERT INTO abshotel.HOTEL (permissionID,hotelName)
VALUES ("G9052","ABS HOTEL 2");
INSERT INTO abshotel.HOTEL (permissionID,hotelName)
VALUES ("G9053","ABS HOTEL 3");
INSERT INTO abshotel.HOTEL (permissionID,hotelName)
VALUES ("G9054","ABS HOTEL 4");
INSERT INTO abshotel.HOTEL (permissionID,hotelName)
VALUES ("G9055","ABS HOTEL 5");

#EMPLOYEE
INSERT INTO abshotel.EMPLOYEE (employeeID ,fName, lName,job,dateOfBirth,permissionID)
VALUES ("E1001" , "Noha","Saleh","Waiter","2-2-1990","G9051");
INSERT INTO abshotel.EMPLOYEE (employeeID ,fName, lName,job,dateOfBirth,supervisorID,permissionID)
VALUES ("E1002" , "Ahmad","Zain","Waiter","22-9-1988","E1001","G9051");
INSERT INTO abshotel.EMPLOYEE (employeeID ,fName, lName,job,dateOfBirth,permissionID)
VALUES ("E1003" , "Saleh","Waleed","Chef","21-11-1993","G9052");
INSERT INTO abshotel.EMPLOYEE (employeeID ,fName, lName,job,dateOfBirth,supervisorID,permissionID)
VALUES ("E1004" , "Bader","salem","Chef","1-12-1989","E1003","G9052");
INSERT INTO abshotel.EMPLOYEE (employeeID ,fName, lName,job,dateOfBirth,permissionID)
VALUES ("E1009" , "Majed","Khaled","Resceptionist","17-7-1996","G9053");
INSERT INTO abshotel.EMPLOYEE (employeeID ,fName, lName,job,dateOfBirth,permissionID)
VALUES ("E1006" , "Mathyo","Keven","CleanWorker","28-10-1998","G9054");
INSERT INTO abshotel.EMPLOYEE (employeeID ,fName, lName,job,dateOfBirth,supervisorID,permissionID)
VALUES ("E1005" , "Joe","Maikel","CleanWorker","3-8-1986","E1006","G9054");
INSERT INTO abshotel.EMPLOYEE (employeeID ,fName, lName,job,dateOfBirth,permissionID)
VALUES ("E1007" , "Jamse","Joe","RoomServiceOfficer","30-11-1997","G9055");
INSERT INTO abshotel.EMPLOYEE (employeeID ,fName, lName,job,dateOfBirth,supervisorID,permissionID)
VALUES ("E1008" , "Malkom","Kareem","RoomServiceOfficer","2-1-1985","E1007","G9055");

#ROOM
INSERT INTO abshotel.ROOM(roomNo,roomType,noOfBeds,permissionID)
VALUES ("F30","Suite",2,"G9051");
INSERT INTO abshotel.ROOM(roomNo,roomType,noOfBeds,permissionID)
VALUES ("F39","VIP Suite",1,"G9052");
INSERT INTO abshotel.ROOM(roomNo,roomType,noOfBeds,permissionID)
VALUES ("F37","Suite",2,"G9054");
INSERT INTO abshotel.ROOM(roomNo,roomType,noOfBeds,permissionID)
VALUES ("F38","VIP Suite",1,"G9053");
INSERT INTO abshotel.ROOM(roomNo,roomType,noOfBeds,permissionID)
VALUES ("F31","Suite",2,"G9055");

#RESTURANT
INSERT INTO abshotel.RESTURANT(nameOfFood,typeOfFood)
VALUES ("Pitza", "Italian");
INSERT INTO abshotel.RESTURANT(nameOfFood,typeOfFood)
VALUES ("Spring Rolls", "Chinese");
INSERT INTO abshotel.RESTURANT(nameOfFood,typeOfFood)
VALUES ("Sea Fruit Salad", "Sea Food");
INSERT INTO abshotel.RESTURANT(nameOfFood,typeOfFood)
VALUES ("Chicken Burger", "Fast Food");
INSERT INTO abshotel.RESTURANT(nameOfFood,typeOfFood)
VALUES ("Biryani", "Indian");

#GUEST
INSERT INTO abshotel.GUEST(guestID,fName,lName,resevationPeriod,age,permissionID,roomNo)
VALUES ("U3999" , "Adam", "show","4 Days", 55,"G9051" ,"F30");
INSERT INTO abshotel.GUEST(guestID,fName,lName,resevationPeriod,age,permissionID,roomNo)
VALUES ("U7989" , "AbdUllah", "Saleh","2 Days", 35,"G9052" ,"F39");
INSERT INTO abshotel.GUEST(guestID,fName,lName,resevationPeriod,age,permissionID,roomNo)
VALUES ("U4009" , "Htem", "Albert","9 Days", 28,"G9053" ,"F37");
INSERT INTO abshotel.GUEST(guestID,fName,lName,resevationPeriod,age,permissionID,roomNo)
VALUES ("U6876" , "Sam", "Simbson","7 Days", 55,"G9054" ,"F38");
INSERT INTO abshotel.GUEST(guestID,fName,lName,resevationPeriod,age,permissionID,roomNo)
VALUES ("U1178" , "Sharlok", "Jems","1 Day", 55,"G9055" ,"F31");

#HOTEL_ADDRESS
INSERT INTO abshotel.HOTEL_ADDRESS (hotelName,city,street)
VALUES ( "ABS HOTEL 1","Makkah","AL-HAJE ");
INSERT INTO abshotel.HOTEL_ADDRESS (hotelName,city,street)
VALUES ("ABS HOTEL 2", "Jeddah","AL-aziziah ");
INSERT INTO abshotel.HOTEL_ADDRESS (hotelName,city,street)
VALUES ("ABS HOTEL 3", "Riyad","AL-aziziah");
INSERT INTO abshotel.HOTEL_ADDRESS (hotelName,city,street)
VALUES ("ABS HOTEL 4", "Dammam","AL-aziziah ");
INSERT INTO abshotel.HOTEL_ADDRESS (hotelName,city,street)
VALUES ("ABS HOTEL 5", "Madenah","AL-aziziah ");

#FOOD_PRICE
INSERT INTO abshotel.FOOD_PRICE(nameOfFood,price)
VALUES ("Pitza",30);
INSERT INTO abshotel.FOOD_PRICE(nameOfFood,price)
VALUES ("Spring Rolls",20);
INSERT INTO abshotel.FOOD_PRICE(nameOfFood,price)
VALUES ("Sea Fruit Salad",40);
INSERT INTO abshotel.FOOD_PRICE(nameOfFood,price)
VALUES ("Chicken Burger",28);
INSERT INTO abshotel.FOOD_PRICE(nameOfFood,price)
VALUES ("Biryani",60);

#HOTEL_phone
INSERT INTO abshotel.HOTEL_phone(permissionID,phoneNumber)
VALUES ("G9051" , "0555-6789");
INSERT INTO abshotel.HOTEL_phone(permissionID,phoneNumber)
VALUES ("G9052" , "0534-2189");
INSERT INTO abshotel.HOTEL_phone(permissionID,phoneNumber)
VALUES ("G9053" , "0876-4221");
INSERT INTO abshotel.HOTEL_phone(permissionID,phoneNumber)
VALUES ("G9054" , "0345-1339");
INSERT INTO abshotel.HOTEL_phone(permissionID,phoneNumber)
VALUES ("G9055" , "0788-7932");

#GUEST_PHONE
INSERT INTO abshotel.GUEST_PHONE(guestID,phoneNumber)
VALUES ("U3999" ,"0564-3229");
INSERT INTO abshotel.GUEST_PHONE(guestID,phoneNumber)
VALUES ("U7989","0564-3777");
INSERT INTO abshotel.GUEST_PHONE(guestID,phoneNumber)
VALUES ("U4009","0585-6229");
INSERT INTO abshotel.GUEST_PHONE(guestID,phoneNumber)
VALUES ("U6876","0598-7359");
INSERT INTO abshotel.GUEST_PHONE(guestID,phoneNumber)
VALUES ("U1178","0543-2980");
INSERT INTO abshotel.GUEST_PHONE(guestID,phoneNumber)
VALUES ("U4009","0567-5342");

#EMPLOYEE_PHONE
INSERT INTO abshotel.EMPLOYEE_PHONE(employeeID,phoneNumber)
VALUES("E1001","0555-5432");
INSERT INTO abshotel.EMPLOYEE_PHONE(employeeID,phoneNumber)
VALUES("E1002","0511-1114");
INSERT INTO abshotel.EMPLOYEE_PHONE(employeeID,phoneNumber)
VALUES("E1003","0554-3212");
INSERT INTO abshotel.EMPLOYEE_PHONE(employeeID,phoneNumber)
VALUES("E1004","0587-5422");
INSERT INTO abshotel.EMPLOYEE_PHONE(employeeID,phoneNumber)
VALUES("E1005","0543-2002");
INSERT INTO abshotel.EMPLOYEE_PHONE(employeeID,phoneNumber)
VALUES("E1006","0590-0875");
INSERT INTO abshotel.EMPLOYEE_PHONE(employeeID,phoneNumber)
VALUES("E1007","0522-3322");
INSERT INTO abshotel.EMPLOYEE_PHONE(employeeID,phoneNumber)
VALUES("E1008","0555-5332");
INSERT INTO abshotel.EMPLOYEE_PHONE(employeeID,phoneNumber)
VALUES("E1001","0577-7772");
INSERT INTO abshotel.EMPLOYEE_PHONE(employeeID,phoneNumber)
VALUES("E1009","0555-5552");

#WORK_IN
INSERT INTO abshotel.WORK_IN(employeeID,roomNo,nameOfFood,typeOfFood)
VALUES("E1001","F30","Pitza","Italian");
INSERT INTO abshotel.WORK_IN(employeeID,roomNo,nameOfFood,typeOfFood)
VALUES("E1002","F39","Spring Rolls", "Chinese");
INSERT INTO abshotel.WORK_IN(employeeID,roomNo,nameOfFood,typeOfFood)
VALUES("E1008","F37","Sea Fruit Salad", "Sea Food");
INSERT INTO abshotel.WORK_IN(employeeID,roomNo,nameOfFood,typeOfFood)
VALUES("E1009","F38","Chicken Burger", "Fast Food");
INSERT INTO abshotel.WORK_IN(employeeID,roomNo,nameOfFood,typeOfFood)
VALUES("E1006","F31","Biryani", "Indian");

SELECT *
FROM HOTEL;

SELECT *
FROM EMPLOYEE;

SELECT *
FROM GUEST;

SELECT *
FROM ROOM;

SELECT *
FROM RESTURANT;

SELECT *
FROM HOTEL_ADDRESS;

SELECT *
FROM FOOD_PRICE;

SELECT *
FROM WORK_IN;

SELECT *
FROM HOTEL_PHONE;

SELECT *
FROM EMPLOYEE_PHONE;

SELECT *
FROM GUEST_PHONE;

update food_price
set price=price*1.05
where price <60;


delete from hotel_address 
where city='Dammam';

select hotel.permissionID,hotelName,employeeID,fName,lName,job
from hotel,employee
where hotel.permissionID=employee.permissionID
order by hotel.permissionID desc;

select guestID,fName,lName,age
from guest
where age<=(select avg(age) from guest);

select guestID,resevationPeriod
from guest 
where resevationPeriod >=6;


select roomNo,roomType,noOfBeds
from room
where roomType='Suite' AND noOfBeds=2 ;


select phoneNumber,guestID
from guest_phone
order by  guestID desc;


select  roomType,count(permissionID)as count
from room
group by roomType
having count(permissionID)>=1;

select *
from room
where roomNo =(select roomNo
			 from guest
             where resevationPeriod<=1
             and age>=55);

select job,count(employeeID)as NumEmployees
from employee
group by job
order by employeeID asc;

select nameOfFood,price
from food_price
where price between 22 And 40;


select typeOfFood
from resturant
where nameOfFood='Biryani' OR nameOfFood='Sea Fruit Salad';