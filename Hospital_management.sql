-- Active: 1734542122293@@127.0.0.1@3306@hospital_management

-- create first table called departments 
CREATE TABLE departments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(30)
);


-- testing query for insert data
INSERT INTO departments (name, location) VALUES('Medicine', 'Sector-A');

-- insert all pending datas in once
INSERT INTO departments (name, location) VALUES('Cardiology', 'Sector-B'), ('Orthopedics', 'Sector-C'), ('Neurologist', 'Sector-D'), ('Gastroenterologist', 'Sector-E');


-- create first table called doctors
CREATE TABLE doctors (
    doctorID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    specialization VARCHAR(20),
    phone VARCHAR(20),
    departmentID INT,
    Foreign Key (departmentID) REFERENCES departments(id) 
    on delete RESTRICT on update CASCADE
);

-- insert query for testing
INSERT INTO doctors (name, specialization, phone, departmentID) VALUES
('Md. Hasan Mahmud', 'MBBS Health', '+8801298763456', 1);

-- insert all pending datas in one query 
INSERT INTO doctors (name, specialization, phone, departmentID) VALUES
('Md. Abu Bakar', 'Surgery', '+8801955478965', 2),
('Md. Abdullah Al Mamun', 'Surgery', '+8801765432109', 3),
('Dr. Kamruzzaman', 'MBBS FCPS', '+8801631144556', 4),
('Touhidul Islam', 'MBBS', '+8801444466662', 5);


-- create another table called appointment
CREATE TABLE patients (
    patientID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15)
)

-- testing data entry 
INSERT INTO patients (name, age, gender, phone) VALUES ('Rahim', 22, 'male', '+8801546497312');

-- insert all pending datas in one query
INSERT INTO patients (name, age, gender, phone) VALUES 
('Karim', 23, 'male', '+880114253698'),
('Jorina', 26, 'female', '+880125857496'),
('Manina', 24, 'female', '+880142536178'),
('Chinina', 27, 'female', '+880184956251')



-- create another table called appointment
CREATE TABLE appointments (
    appointmentID INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    time TIME,
    status VARCHAR(50),
    doctorID INT,
    FOREIGN KEY (doctorID) REFERENCES Doctors(DoctorID) ON DELETE RESTRICT ON UPDATE CASCADE,
    patientID INT,
    FOREIGN KEY (patientID) REFERENCES patients(patientID) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- testing data entry  
INSERT INTO appointments (doctorID, date, time, status, patientID) VALUES(1, '2024-12-22', '09:00:00', 'booked', 1)


-- insert all pending datas in one query
INSERT INTO appointments (doctorID, date, time, status, patientID) VALUES
(1, '2024-12-23', '10:00:00', 'cancel', 3),
(1, '2024-12-19', '18:00:00', 'done', 5),
(1, '2024-12-21', '21:00:00', 'booked', 2),
(1, '2024-12-23', '05:00:00', 'booked', 4)


