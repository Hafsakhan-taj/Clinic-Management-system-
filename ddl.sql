-- ============================================================
--  Clinic Management System — DDL Script
--  Milestone 4: Database Setup
--  Compatibility: MySQL 8.0+ / OneCompiler / DB Fiddle
-- ============================================================

-- Drop database if it exists and recreate (for clean testing)
DROP DATABASE IF EXISTS clinic_management;
CREATE DATABASE clinic_management;
USE clinic_management;

-- ============================================================
-- TABLE 1: Department
-- Root table — no foreign key dependencies
-- ============================================================
CREATE TABLE Department (
    department_id    INT           NOT NULL AUTO_INCREMENT,
    department_name  VARCHAR(100)  NOT NULL,
    location         VARCHAR(150)  NOT NULL,
    phone            VARCHAR(15)   NOT NULL,

    CONSTRAINT pk_department     PRIMARY KEY (department_id),
    CONSTRAINT uq_dept_name      UNIQUE      (department_name),
    CONSTRAINT uq_dept_phone     UNIQUE      (phone)
);

-- ============================================================
-- TABLE 2: Patient
-- Root table — no foreign key dependencies
-- ============================================================
CREATE TABLE Patient (
    patient_id         INT          NOT NULL AUTO_INCREMENT,
    first_name         VARCHAR(80)  NOT NULL,
    last_name          VARCHAR(80)  NOT NULL,
    date_of_birth      DATE         NOT NULL,
    gender             VARCHAR(10)  NOT NULL,
    phone              VARCHAR(15)  NOT NULL,
    email              VARCHAR(150)     NULL,
    address            VARCHAR(255)     NULL,
    blood_group        VARCHAR(5)       NULL,
    registration_date  DATE         NOT NULL DEFAULT (CURRENT_DATE),

    CONSTRAINT pk_patient        PRIMARY KEY (patient_id),
    CONSTRAINT uq_patient_email  UNIQUE      (email),
    CONSTRAINT chk_patient_gender
        CHECK (gender IN ('Male', 'Female', 'Other'))
);

-- ============================================================
-- TABLE 3: Doctor
-- References: Department
-- ============================================================
CREATE TABLE Doctor (
    doctor_id          INT           NOT NULL AUTO_INCREMENT,
    first_name         VARCHAR(80)   NOT NULL,
    last_name          VARCHAR(80)   NOT NULL,
    specialization     VARCHAR(120)  NOT NULL,
    phone              VARCHAR(15)   NOT NULL,
    email              VARCHAR(150)      NULL,
    department_id      INT           NOT NULL,
    consultation_fee   DECIMAL(8,2)  NOT NULL,
    hire_date          DATE          NOT NULL,

    CONSTRAINT pk_doctor          PRIMARY KEY (doctor_id),
    CONSTRAINT uq_doctor_email    UNIQUE      (email),
    CONSTRAINT fk_doctor_dept     FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_doctor_fee
        CHECK (consultation_fee >= 0)
);

-- ============================================================
-- TABLE 4: Appointment
-- References: Patient, Doctor
-- ============================================================
CREATE TABLE Appointment (
    appointment_id    INT          NOT NULL AUTO_INCREMENT,
    patient_id        INT          NOT NULL,
    doctor_id         INT          NOT NULL,
    appointment_date  DATE         NOT NULL,
    appointment_time  TIME         NOT NULL,
    status            VARCHAR(20)  NOT NULL DEFAULT 'Scheduled',
    notes             TEXT             NULL,

    CONSTRAINT pk_appointment     PRIMARY KEY (appointment_id),
    CONSTRAINT fk_appt_patient    FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_appt_doctor     FOREIGN KEY (doctor_id)
        REFERENCES Doctor(doctor_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT uq_appt_slot       UNIQUE (doctor_id, appointment_date, appointment_time),
    CONSTRAINT chk_appt_status
        CHECK (status IN ('Scheduled', 'Completed', 'Cancelled', 'No-Show'))
);

-- ============================================================
-- TABLE 5: Prescription
-- References: Appointment, Doctor, Patient
-- ============================================================
CREATE TABLE Prescription (
    prescription_id   INT           NOT NULL AUTO_INCREMENT,
    appointment_id    INT           NOT NULL,
    doctor_id         INT           NOT NULL,
    patient_id        INT           NOT NULL,
    prescribed_date   DATE          NOT NULL,
    medicine_name     VARCHAR(200)  NOT NULL,
    dosage            VARCHAR(100)  NOT NULL,
    duration          VARCHAR(50)   NOT NULL,
    notes             TEXT              NULL,

    CONSTRAINT pk_prescription    PRIMARY KEY (prescription_id),
    CONSTRAINT fk_presc_appt      FOREIGN KEY (appointment_id)
        REFERENCES Appointment(appointment_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_presc_doctor    FOREIGN KEY (doctor_id)
        REFERENCES Doctor(doctor_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_presc_patient   FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT uq_presc_appt      UNIQUE (appointment_id)
);

-- ============================================================
-- INDEXES
-- ============================================================

-- Department
CREATE INDEX idx_dept_name        ON Department(department_name);

-- Patient
CREATE INDEX idx_patient_name     ON Patient(last_name, first_name);
CREATE INDEX idx_patient_dob      ON Patient(date_of_birth);

-- Doctor
CREATE INDEX idx_doctor_dept      ON Doctor(department_id);
CREATE INDEX idx_doctor_name      ON Doctor(last_name, first_name);
CREATE INDEX idx_doctor_spec      ON Doctor(specialization);

-- Appointment
CREATE INDEX idx_appt_patient     ON Appointment(patient_id);
CREATE INDEX idx_appt_doctor      ON Appointment(doctor_id);
CREATE INDEX idx_appt_date        ON Appointment(appointment_date);
CREATE INDEX idx_appt_status      ON Appointment(status);

-- Prescription
CREATE INDEX idx_presc_appt       ON Prescription(appointment_id);
CREATE INDEX idx_presc_doctor     ON Prescription(doctor_id);
CREATE INDEX idx_presc_patient    ON Prescription(patient_id);
CREATE INDEX idx_presc_date       ON Prescription(prescribed_date);

-- ============================================================
-- VERIFICATION QUERIES
-- ============================================================
SHOW TABLES;
DESCRIBE Department;
DESCRIBE Patient;
DESCRIBE Doctor;
DESCRIBE Appointment;
DESCRIBE Prescription;
