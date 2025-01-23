IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'HospitalSystem')
  CREATE DATABASE HospitalSystem
GO

USE HospitalSystem
GO

CREATE TABLE Patients(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[FirstName] NVARCHAR(100) NOT NULL,
	[LastName] NVARCHAR(100) NOT NULL,
	[DateOfBirth] DATE NOT NULL,
	[Gender] VARCHAR(10) NOT NULL,
	[ContactNumber] VARCHAR(20),
	[Address] NVARCHAR(200),
)

CREATE TABLE Departments(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[DepartmentName] NVARCHAR(100) NOT NULL,
	[Location] NVARCHAR(100),
)


CREATE TABLE Doctors(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[FirstName] NVARCHAR(100) NOT NULL,
	[LastName] NVARCHAR(100) NOT NULL,
	[Specialization] NVARCHAR(100),
	[ContactNumber] VARCHAR(20),
	[Email] VARCHAR(80) UNIQUE,
	[DepartmentId] INT,
	FOREIGN KEY([DepartmentId]) REFERENCES Departments([Id]),
)

CREATE TABLE Appointments(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[PatientId] INT,
	FOREIGN KEY([PatientId]) REFERENCES Patients([Id]),
	[DoctorId] INT,
	FOREIGN KEY([DoctorId]) REFERENCES Doctors([Id]),
	[AppointmentDate] DATE NOT NULL,
	[AppointmentTime] DATETIME,
	[Status] NVARCHAR(50) NOT NULL,
)

CREATE TABLE ClinicalRecords(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[PatientId] INT,
	FOREIGN KEY([PatientId]) REFERENCES Patients([Id]),
	[DoctorId] INT,
	FOREIGN KEY([DoctorId]) REFERENCES Doctors([Id]),
	[Diagnosis] NVARCHAR(300),
	[Treatment] NVARCHAR(300),
	[Date] DATE,
)

CREATE TABLE StaffEmployees(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[FirstName] NVARCHAR(100) NOT NULL,
	[LastName] NVARCHAR(100) NOT NULL,
	[Role] NVARCHAR(30) NOT NULL,
	[ContactNumber] VARCHAR(20),
	[Email] VARCHAR(80) NOT NULL,
	[DepartmentID] INT,
    FOREIGN KEY ([DepartmentID]) REFERENCES Departments([Id])
)

CREATE TABLE Billings(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[PatientId] INT,
	FOREIGN KEY([PatientId]) REFERENCES Patients([Id]),
	[Amount] DECIMAL(10,3) NOT NULL,
	[Date] DATE,
	[Status] VARCHAR(20),
)


INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, ContactNumber, Address) VALUES
('John', 'Doe', '1980-01-01', 'Male', '1234567890', '123 Main St'),
('Jane', 'Smith', '1985-02-02', 'Female', '0987654321', '456 Elm St'),
('Alice', 'Johnson', '1990-03-03', 'Female', '1112223333', '789 Oak St'),
('Bob', 'Brown', '1975-04-04', 'Male', '4445556666', '101 Pine St'),
('Charlie', 'Davis', '2000-05-05', 'Male', '7778889999', '202 Maple St'),
('Diana', 'Miller', '1995-06-06', 'Female', '1231231234', '303 Cedar St'),
('Eve', 'Wilson', '1988-07-07', 'Female', '3213214321', '404 Birch St'),
('Frank', 'Moore', '1972-08-08', 'Male', '5556667777', '505 Walnut St'),
('Grace', 'Taylor', '1993-09-09', 'Female', '6667778888', '606 Chestnut St'),
('Hank', 'Anderson', '1983-10-10', 'Male', '7778889990', '707 Spruce St'),
('Ivy', 'Thomas', '1998-11-11', 'Female', '8889990001', '808 Fir St'),
('Jack', 'Jackson', '1977-12-12', 'Male', '9990001112', '909 Redwood St'),
('Karen', 'White', '1982-01-13', 'Female', '0001112223', '1010 Cypress St'),
('Leo', 'Harris', '1991-02-14', 'Male', '1112223334', '1111 Palm St'),
('Mia', 'Martin', '1986-03-15', 'Female', '2223334445', '1212 Willow St'),
('Nina', 'Garcia', '1994-04-16', 'Female', '3334445556', '1313 Poplar St'),
('Oscar', 'Martinez', '1979-05-17', 'Male', '4445556667', '1414 Ash St'),
('Paul', 'Robinson', '1987-06-18', 'Male', '5556667778', '1515 Beech St'),
('Quinn', 'Clark', '1992-07-19', 'Female', '6667778889', '1616 Pine St'),
('Rita', 'Lewis', '1981-08-20', 'Female', '7778889991', '1717 Elm St');


INSERT INTO Departments (DepartmentName, Location) VALUES
('Cardiology', 'Building A'),
('Neurology', 'Building B'),
('Orthopedics', 'Building C'),
('Pediatrics', 'Building D'),
('Radiology', 'Building E'),
('Oncology', 'Building F'),
('Dermatology', 'Building G'),
('Gastroenterology', 'Building H'),
('Urology', 'Building I'),
('Gynecology', 'Building J'),
('Ophthalmology', 'Building K'),
('ENT', 'Building L'),
('Psychiatry', 'Building M'),
('Pulmonology', 'Building N'),
('Nephrology', 'Building O'),
('Endocrinology', 'Building P'),
('Hematology', 'Building Q'),
('Rheumatology', 'Building R'),
('Infectious Diseases', 'Building S'),
('General Surgery', 'Building T');


INSERT INTO Doctors (FirstName, LastName, Specialization, ContactNumber, Email, DepartmentId) VALUES
('Emily', 'Clark', 'Cardiology', '1234567890', 'emily.clark@hospital.com', 1),
('Michael', 'Smith', 'Neurology', '0987654321', 'michael.smith@hospital.com', 2),
('Sarah', 'Johnson', 'Orthopedics', '1112223333', 'sarah.johnson@hospital.com', 3),
('David', 'Brown', 'Pediatrics', '4445556666', 'david.brown@hospital.com', 4),
('Laura', 'Davis', 'Radiology', '7778889999', 'laura.davis@hospital.com', 5),
('James', 'Miller', 'Oncology', '1231231234', 'james.miller@hospital.com', 6),
('Anna', 'Wilson', 'Dermatology', '3213214321', 'anna.wilson@hospital.com', 7),
('Robert', 'Moore', 'Gastroenterology', '5556667777', 'robert.moore@hospital.com', 8),
('Linda', 'Taylor', 'Urology', '6667778888', 'linda.taylor@hospital.com', 9),
('William', 'Anderson', 'Gynecology', '7778889990', 'william.anderson@hospital.com', 10),
('Jessica', 'Thomas', 'Ophthalmology', '8889990001', 'jessica.thomas@hospital.com', 11),
('Charles', 'Jackson', 'ENT', '9990001112', 'charles.jackson@hospital.com', 12),
('Karen', 'White', 'Psychiatry', '0001112223', 'karen.white@hospital.com', 13),
('Daniel', 'Harris', 'Pulmonology', '1112223334', 'daniel.harris@hospital.com', 14),
('Sophia', 'Martin', 'Nephrology', '2223334445', 'sophia.martin@hospital.com', 15),
('Matthew', 'Garcia', 'Endocrinology', '3334445556', 'matthew.garcia@hospital.com', 16),
('Olivia', 'Martinez', 'Hematology', '4445556667', 'olivia.martinez@hospital.com', 17),
('Joshua', 'Robinson', 'Rheumatology', '5556667778', 'joshua.robinson@hospital.com', 18),
('Emma', 'Clark', 'Infectious Diseases', '6667778889', 'emma.clark@hospital.com', 19),
('Andrew', 'Lewis', 'General Surgery', '7778889991', 'andrew.lewis@hospital.com', 20);


INSERT INTO Appointments (PatientId, DoctorId, AppointmentDate, AppointmentTime, Status) VALUES
(1, 1, '2025-01-01', '2025-01-01 09:00:00', 'Scheduled'),
(2, 2, '2025-01-02', '2025-01-02 10:00:00', 'Completed'),
(3, 3, '2025-01-03', '2025-01-03 11:00:00', 'Cancelled'),
(4, 4, '2025-01-04', '2025-01-04 12:00:00', 'Scheduled'),
(5, 5, '2025-01-05', '2025-01-05 13:00:00', 'Completed'),
(6, 6, '2025-01-06', '2025-01-06 14:00:00', 'Scheduled'),
(7, 7, '2025-01-07', '2025-01-07 15:00:00', 'Completed'),
(8, 8, '2025-01-08', '2025-01-08 16:00:00', 'Cancelled'),
(9, 9, '2025-01-09', '2025-01-09 17:00:00', 'Scheduled'),
(10, 10, '2025-01-10', '2025-01-10 18:00:00', 'Completed'),
(11, 11, '2025-01-11', '2025-01-11 09:00:00', 'Scheduled'),
(12, 12, '2025-01-12', '2025-01-12 10:00:00', 'Completed'),
(13, 13, '2025-01-13', '2025-01-13 11:00:00', 'Cancelled'),
(14, 14, '2025-01-14', '2025-01-14 12:00:00', 'Scheduled'),
(15, 15, '2025-01-15', '2025-01-15 13:00:00', 'Completed'),
(16, 16, '2025-01-16', '2025-01-16 14:00:00', 'Scheduled'),
(17, 17, '2025-01-17', '2025-01-17 15:00:00', 'Completed'),
(18, 18, '2025-01-18', '2025-01-18 16:00:00', 'Cancelled'),
(19, 19, '2025-01-19', '2025-01-19 17:00:00', 'Scheduled'),
(20, 20, '2025-01-20', '2025-01-20 18:00:00', 'Completed');


INSERT INTO ClinicalRecords (PatientId, DoctorId, Diagnosis, Treatment, Date) VALUES
(1, 1, 'Flu', 'Rest and fluids', '2025-01-01'),
(2, 2, 'Migraine', 'Pain relief medication', '2025-01-02'),
(3, 3, 'Fractured Arm', 'Cast and rest', '2025-01-03'),
(4, 4, 'Chickenpox', 'Antiviral medication', '2025-01-04'),
(5, 5, 'Asthma', 'Inhaler', '2025-01-05'),
(6, 6, 'Diabetes', 'Insulin therapy', '2025-01-06'),
(7, 7, 'Hypertension', 'Blood pressure medication', '2025-01-07'),
(8, 8, 'Allergy', 'Antihistamines', '2025-01-08'),
(9, 9, 'Bronchitis', 'Antibiotics', '2025-01-09'),
(10, 10, 'Sprained Ankle', 'Physical therapy', '2025-01-10'),
(11, 11, 'Pneumonia', 'Antibiotics', '2025-01-11'),
(12, 12, 'Sinusitis', 'Decongestants', '2025-01-12'),
(13, 13, 'Eczema', 'Topical steroids', '2025-01-13'),
(14, 14, 'Gastritis', 'Antacids', '2025-01-14'),
(15, 15, 'Arthritis', 'Pain relief medication', '2025-01-15'),
(16, 16, 'Conjunctivitis', 'Eye drops', '2025-01-16'),
(17, 17, 'Tonsillitis', 'Antibiotics', '2025-01-17'),
(18, 18, 'Otitis Media', 'Antibiotics', '2025-01-18'),
(19, 19, 'Dermatitis', 'Topical ointments', '2025-01-19'),
(20, 20, 'Hypertension', 'Lifestyle changes', '2025-01-20');


INSERT INTO StaffEmployees (FirstName, LastName, Role, ContactNumber, Email, DepartmentID) VALUES
('Alice', 'Brown', 'Nurse', '1234567890', 'alice.brown@hospital.com', 1),
('Bob', 'Smith', 'Technician', '0987654321', 'bob.smith@hospital.com', 2),
('Carol', 'Johnson', 'Receptionist', '1112223333', 'carol.johnson@hospital.com', 3),
('David', 'Williams', 'Pharmacist', '4445556666', 'david.williams@hospital.com', 4),
('Eve', 'Jones', 'Lab Technician', '7778889999', 'eve.jones@hospital.com', 5),
('Frank', 'Garcia', 'Nurse', '1231231234', 'frank.garcia@hospital.com', 6),
('Grace', 'Martinez', 'Technician', '3213214321', 'grace.martinez@hospital.com', 7),
('Hank', 'Rodriguez', 'Receptionist', '5556667777', 'hank.rodriguez@hospital.com', 8),
('Ivy', 'Lopez', 'Pharmacist', '6667778888', 'ivy.lopez@hospital.com', 9),
('Jack', 'Gonzalez', 'Lab Technician', '7778889990', 'jack.gonzalez@hospital.com', 10),
('Karen', 'Wilson', 'Nurse', '8889990001', 'karen.wilson@hospital.com', 11),
('Leo', 'Anderson', 'Technician', '9990001112', 'leo.anderson@hospital.com', 12),
('Mia', 'Thomas', 'Receptionist', '0001112223', 'mia.thomas@hospital.com', 13),
('Nina', 'Taylor', 'Pharmacist', '1112223334', 'nina.taylor@hospital.com', 14),
('Oscar', 'Moore', 'Lab Technician', '2223334445', 'oscar.moore@hospital.com', 15),
('Paul', 'Jackson', 'Nurse', '3334445556', 'paul.jackson@hospital.com', 16),
('Quinn', 'White', 'Technician', '4445556667', 'quinn.white@hospital.com', 17),
('Rita', 'Harris', 'Receptionist', '5556667778', 'rita.harris@hospital.com', 18),
('Sam', 'Martin', 'Pharmacist', '6667778889', 'sam.martin@hospital.com', 19),
('Tina', 'Clark', 'Lab Technician', '7778889991', 'tina.clark@hospital.com', 20);


INSERT INTO Billings (PatientId, Amount, Date, Status) VALUES
(1, 150.00, '2025-01-01', 'Paid'),
(2, 200.50, '2025-01-02', 'Pending'),
(3, 300.75, '2025-01-03', 'Paid'),
(4, 400.00, '2025-01-04', 'Pending'),
(5, 250.25, '2025-01-05', 'Paid'),
(6, 350.50, '2025-01-06', 'Pending'),
(7, 450.75, '2025-01-07', 'Paid'),
(8, 500.00, '2025-01-08', 'Pending'),
(9, 600.25, '2025-01-09', 'Paid'),
(10, 700.50, '2025-01-10', 'Pending'),
(11, 800.75, '2025-01-11', 'Paid'),
(12, 900.00, '2025-01-12', 'Pending'),
(13, 1000.25, '2025-01-13', 'Paid'),
(14, 1100.50, '2025-01-14', 'Pending'),
(15, 1200.75, '2025-01-15', 'Paid'),
(16, 1300.00, '2025-01-16', 'Pending'),
(17, 1400.25, '2025-01-17', 'Paid'),
(18, 1500.50, '2025-01-18', 'Pending'),
(19, 1600.75, '2025-01-19', 'Paid'),
(20, 1700.00, '2025-01-20', 'Pending');