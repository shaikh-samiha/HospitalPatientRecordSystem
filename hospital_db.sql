-- hospital_db.sql

CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;

-- Patients table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    contact VARCHAR(15),
    address TEXT
);

-- Doctors table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialty VARCHAR(100),
    contact VARCHAR(15)
);

-- Appointments table
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Treatments table
CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    treatment_description TEXT,
    treatment_date DATE,
    prescribed_medicine TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Sample data
INSERT INTO Patients (name, age, gender, contact, address)
VALUES ('Amit Sharma', 32, 'Male', '9876543210', 'Delhi');

INSERT INTO Doctors (name, specialty, contact)
VALUES ('Dr. Neha Verma', 'General Physician', '9123456789');

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, reason)
VALUES (1, 1, '2025-08-06', 'Fever and cough');

INSERT INTO Treatments (patient_id, treatment_description, treatment_date, prescribed_medicine)
VALUES (1, 'Diagnosed with flu', '2025-08-06', 'Paracetamol');


