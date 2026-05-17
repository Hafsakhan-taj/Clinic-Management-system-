-- ============================================================
--  Clinic Management System — DML Script
--  Milestone 5: Data Population, Validation & Manipulation
--  Compatibility: MySQL 8.0+ / OneCompiler / DB Fiddle
-- ============================================================
--  Run this file AFTER ddl.sql has been executed successfully.
--  Tables must already exist before running this script.
-- ============================================================

USE clinic_management;

-- ============================================================
-- SECTION 1: INSERT STATEMENTS
-- Load order: Department → Patient → Doctor → Appointment → Prescription
-- ============================================================

-- ------------------------------------------------------------
-- 1.1  Department  (6 rows)
-- ------------------------------------------------------------
INSERT INTO Department (department_id, department_name, location, phone) VALUES
(1, 'General Medicine',  'Block A, Ground Floor',  '051-1110001'),
(2, 'Cardiology',        'Block B, First Floor',   '051-1110002'),
(3, 'Dermatology',       'Block A, First Floor',   '051-1110003'),
(4, 'Orthopedics',       'Block C, Ground Floor',  '051-1110004'),
(5, 'Gynecology',        'Block D, Second Floor',  '051-1110005'),
(6, 'Pediatrics',        'Block B, Ground Floor',  '051-1110006');

-- ------------------------------------------------------------
-- 1.2  Patient  (15 rows)
-- ------------------------------------------------------------
INSERT INTO Patient (patient_id, first_name, last_name, date_of_birth, gender, phone, email, address, blood_group, registration_date) VALUES
(1,  'Ali',     'Khan',      '1985-03-12', 'Male',   '0301-1234567', 'ali.khan@gmail.com',       'House 12, St 4, Islamabad',    'B+',  '2023-01-05'),
(2,  'Fatima',  'Ahmed',     '1992-07-25', 'Female', '0321-9876543', 'fatima.ahmed@gmail.com',   'House 45, St 9, Rawalpindi',   'A+',  '2023-01-10'),
(3,  'Hassan',  'Malik',     '1978-11-30', 'Male',   '0333-4561234', 'hassan.malik@gmail.com',   'House 7, St 2, Lahore',        'O+',  '2023-02-14'),
(4,  'Ayesha',  'Qureshi',   '2000-05-18', 'Female', '0345-6543210', 'ayesha.q@gmail.com',       'House 88, St 15, Karachi',     'AB+', '2023-02-20'),
(5,  'Usman',   'Sheikh',    '1965-09-01', 'Male',   '0312-7654321', 'usman.sheikh@gmail.com',   'House 3, St 1, Peshawar',      'B-',  '2023-03-08'),
(6,  'Zara',    'Butt',      '1998-12-22', 'Female', '0300-1122334', 'zara.butt@gmail.com',      'House 56, St 6, Multan',       'O-',  '2023-03-15'),
(7,  'Bilal',   'Chaudhry',  '1990-04-10', 'Male',   '0311-9988776', 'bilal.ch@gmail.com',       'House 20, St 11, Faisalabad',  'A-',  '2023-04-01'),
(8,  'Sana',    'Siddiqui',  '1975-08-03', 'Female', '0322-5544332', 'sana.sid@gmail.com',       'House 99, St 3, Quetta',       'AB-', '2023-04-18'),
(9,  'Hamza',   'Akhtar',    '2003-01-28', 'Male',   '0335-6677889', 'hamza.ak@gmail.com',       'House 14, St 8, Islamabad',    'O+',  '2023-05-02'),
(10, 'Maryam',  'Rizvi',     '1988-06-15', 'Female', '0342-3344556', 'maryam.rizvi@gmail.com',   'House 31, St 7, Rawalpindi',   'B+',  '2023-05-20'),
(11, 'Omar',    'Javed',     '1970-02-09', 'Male',   '0304-8899001', 'omar.javed@gmail.com',     'House 62, St 12, Lahore',      'A+',  '2023-06-07'),
(12, 'Hira',    'Nawaz',     '1995-10-14', 'Female', '0316-2233445', 'hira.nawaz@gmail.com',     'House 5, St 5, Karachi',       'O+',  '2023-06-25'),
(13, 'Faisal',  'Abbasi',    '1983-07-07', 'Male',   '0307-5566778', 'faisal.ab@gmail.com',      'House 77, St 14, Peshawar',    'B+',  '2023-07-11'),
(14, 'Nadia',   'Rehman',    '2001-03-30', 'Female', '0318-4455667', 'nadia.rehman@gmail.com',   'House 40, St 10, Islamabad',   'A-',  '2023-07-28'),
(15, 'Asad',    'Mirza',     '1960-12-05', 'Male',   '0329-7788990', 'asad.mirza@gmail.com',     'House 18, St 3, Rawalpindi',   'O-',  '2023-08-14');

-- ------------------------------------------------------------
-- 1.3  Doctor  (10 rows — across 6 departments)
-- ------------------------------------------------------------
INSERT INTO Doctor (doctor_id, first_name, last_name, specialization, phone, email, department_id, consultation_fee, hire_date) VALUES
(1,  'Tariq',   'Mahmood',   'General Physician',   '0300-1112223', 'dr.tariq@clinic.pk',    1, 1000.00, '2015-03-01'),
(2,  'Sadia',   'Farooqi',   'General Physician',   '0311-2223334', 'dr.sadia@clinic.pk',    1,  800.00, '2018-07-15'),
(3,  'Yasir',   'Chaudhry',  'Cardiologist',        '0322-3334445', 'dr.yasir@clinic.pk',    2, 2000.00, '2012-11-20'),
(4,  'Nazia',   'Siddiqui',  'Cardiologist',        '0333-4445556', 'dr.nazia@clinic.pk',    2, 2200.00, '2016-04-10'),
(5,  'Khalid',  'Baig',      'Dermatologist',       '0344-5556667', 'dr.khalid@clinic.pk',   3, 1500.00, '2014-08-05'),
(6,  'Rubina',  'Niazi',     'Orthopedic Surgeon',  '0355-6667778', 'dr.rubina@clinic.pk',   4, 1800.00, '2017-01-22'),
(7,  'Imran',   'Sheikh',    'Orthopedic Surgeon',  '0300-7778889', 'dr.imran@clinic.pk',    4, 1600.00, '2019-09-30'),
(8,  'Humaira', 'Qureshi',   'Gynecologist',        '0311-8889990', 'dr.humaira@clinic.pk',  5, 1600.00, '2013-05-18'),
(9,  'Naveed',  'Abbasi',    'Pediatrician',        '0322-9990001', 'dr.naveed@clinic.pk',   6, 1200.00, '2020-02-14'),
(10, 'Fariha',  'Rehman',    'Pediatrician',        '0333-0001112', 'dr.fariha@clinic.pk',   6, 1000.00, '2021-06-01');

-- ------------------------------------------------------------
-- 1.4  Appointment  (15 rows)
-- ------------------------------------------------------------
INSERT INTO Appointment (appointment_id, patient_id, doctor_id, appointment_date, appointment_time, status, notes) VALUES
(1,  1,  1,  '2023-09-04', '09:00:00', 'Completed', 'Patient complains of fever and body aches.'),
(2,  2,  3,  '2023-09-05', '10:00:00', 'Completed', 'Patient reports chest pain and shortness of breath.'),
(3,  3,  5,  '2023-09-06', '11:00:00', 'Completed', 'Skin rash on arms since last week.'),
(4,  4,  8,  '2023-09-07', '09:30:00', 'Completed', 'Pregnancy follow-up at 20 weeks.'),
(5,  5,  6,  '2023-09-08', '14:00:00', 'Completed', 'Joint pain in left knee for two months.'),
(6,  6,  9,  '2023-09-11', '08:30:00', 'Completed', 'Child vaccination and growth checkup.'),
(7,  7,  2,  '2023-09-12', '12:00:00', 'Completed', 'Routine checkup requested by patient.'),
(8,  8,  4,  '2023-09-13', '10:30:00', 'Completed', 'Blood pressure monitoring and ECG review.'),
(9,  9,  10, '2023-09-14', '09:00:00', 'Completed', 'Child has persistent cough and mild fever.'),
(10, 10, 1,  '2023-09-15', '11:00:00', 'Scheduled', 'Annual health screening appointment.'),
(11, 11, 7,  '2023-09-18', '13:00:00', 'Scheduled', 'Follow-up after knee surgery.'),
(12, 12, 3,  '2023-09-19', '10:00:00', 'Cancelled', 'Patient called to cancel due to travel.'),
(13, 13, 5,  '2023-09-20', '14:30:00', 'No-Show',   'Patient did not arrive for appointment.'),
(14, 14, 8,  '2023-09-21', '09:00:00', 'Scheduled', 'First prenatal visit.'),
(15, 15, 6,  '2023-09-22', '15:00:00', 'Scheduled', 'Back pain assessment and X-ray review.');

-- ------------------------------------------------------------
-- 1.5  Prescription  (9 rows — only for Completed appointments)
-- ------------------------------------------------------------
INSERT INTO Prescription (prescription_id, appointment_id, doctor_id, patient_id, prescribed_date, medicine_name, dosage, duration, notes) VALUES
(1, 1,  1,  1,  '2023-09-04', 'Paracetamol 500mg',         'Twice daily',        '5 days',  'Take after meals. Drink plenty of fluids.'),
(2, 2,  3,  2,  '2023-09-05', 'Aspirin 75mg',               'Once daily',         '1 month', 'Take with water after breakfast. Do not skip doses.'),
(3, 3,  5,  3,  '2023-09-06', 'Clindamycin Gel 1%',         'Apply twice daily',  '2 weeks', 'Apply a thin layer to affected area only.'),
(4, 4,  8,  4,  '2023-09-07', 'Folic Acid 5mg',             'Once daily',         '1 month', 'Take in the morning before breakfast.'),
(5, 5,  6,  5,  '2023-09-08', 'Diclofenac 50mg',            'Twice daily',        '7 days',  'Take after meals. Avoid strenuous activity.'),
(6, 6,  9,  6,  '2023-09-11', 'Amoxicillin Syrup 250mg',    'Three times daily',  '5 days',  'Complete the full course. Store in refrigerator.'),
(7, 7,  2,  7,  '2023-09-12', 'Cetirizine 10mg',            'Once daily',         '10 days', 'Take at bedtime. May cause drowsiness.'),
(8, 8,  4,  8,  '2023-09-13', 'Amlodipine 5mg',             'Once daily',         '1 month', 'Take at the same time each day. Monitor blood pressure.'),
(9, 9,  10, 9,  '2023-09-14', 'Paracetamol Syrup 120mg',    'Three times daily',  '3 days',  'Give after meals. Do not exceed stated dose.');

-- ============================================================
-- SECTION 2: UPDATE STATEMENTS
-- ============================================================

-- UPDATE 1: Mark appointment 10 as Completed after the patient attended
UPDATE Appointment
SET    status = 'Completed',
       notes  = 'Annual health screening completed. All vitals normal.'
WHERE  appointment_id = 10;

-- UPDATE 2: Increase consultation fee by 10% for all Cardiologists
UPDATE Doctor
SET    consultation_fee = consultation_fee * 1.10
WHERE  specialization = 'Cardiologist';

-- UPDATE 3: Update patient phone number (patient changed their contact)
UPDATE Patient
SET    phone = '0301-9999888'
WHERE  patient_id = 5;

-- ============================================================
-- SECTION 3: DELETE STATEMENTS
-- ============================================================

-- DELETE 1: Remove a cancelled appointment (cleanup of cancelled records)
DELETE FROM Appointment
WHERE  status = 'Cancelled'
AND    appointment_id = 12;

-- DELETE 2: Remove a No-Show appointment older than the current records
DELETE FROM Appointment
WHERE  status    = 'No-Show'
AND    appointment_id = 13;

-- ============================================================
-- SECTION 4: VALIDATION QUERIES
-- ============================================================

-- ------------------------------------------------------------
-- 4.1  COUNT(*) — Row count for every table
-- ------------------------------------------------------------
SELECT 'Department'  AS table_name, COUNT(*) AS row_count FROM Department
UNION ALL
SELECT 'Patient',                   COUNT(*)               FROM Patient
UNION ALL
SELECT 'Doctor',                    COUNT(*)               FROM Doctor
UNION ALL
SELECT 'Appointment',               COUNT(*)               FROM Appointment
UNION ALL
SELECT 'Prescription',              COUNT(*)               FROM Prescription;

-- ------------------------------------------------------------
-- 4.2  NULL checks — Verify no NULLs in critical NOT NULL columns
-- ------------------------------------------------------------
SELECT 'Patient - first_name'          AS check_column, COUNT(*) AS null_count
  FROM Patient       WHERE first_name       IS NULL  UNION ALL
SELECT 'Patient - last_name',                          COUNT(*)
  FROM Patient       WHERE last_name        IS NULL  UNION ALL
SELECT 'Patient - date_of_birth',                      COUNT(*)
  FROM Patient       WHERE date_of_birth    IS NULL  UNION ALL
SELECT 'Patient - gender',                             COUNT(*)
  FROM Patient       WHERE gender           IS NULL  UNION ALL
SELECT 'Patient - phone',                              COUNT(*)
  FROM Patient       WHERE phone            IS NULL  UNION ALL
SELECT 'Doctor - first_name',                          COUNT(*)
  FROM Doctor        WHERE first_name       IS NULL  UNION ALL
SELECT 'Doctor - specialization',                      COUNT(*)
  FROM Doctor        WHERE specialization   IS NULL  UNION ALL
SELECT 'Doctor - department_id',                       COUNT(*)
  FROM Doctor        WHERE department_id    IS NULL  UNION ALL
SELECT 'Doctor - consultation_fee',                    COUNT(*)
  FROM Doctor        WHERE consultation_fee IS NULL  UNION ALL
SELECT 'Appointment - patient_id',                     COUNT(*)
  FROM Appointment   WHERE patient_id       IS NULL  UNION ALL
SELECT 'Appointment - doctor_id',                      COUNT(*)
  FROM Appointment   WHERE doctor_id        IS NULL  UNION ALL
SELECT 'Appointment - appointment_date',               COUNT(*)
  FROM Appointment   WHERE appointment_date IS NULL  UNION ALL
SELECT 'Appointment - status',                         COUNT(*)
  FROM Appointment   WHERE status           IS NULL  UNION ALL
SELECT 'Prescription - medicine_name',                 COUNT(*)
  FROM Prescription  WHERE medicine_name    IS NULL  UNION ALL
SELECT 'Prescription - dosage',                        COUNT(*)
  FROM Prescription  WHERE dosage           IS NULL  UNION ALL
SELECT 'Prescription - duration',                      COUNT(*)
  FROM Prescription  WHERE duration         IS NULL;

-- Expected result: ALL null_count values = 0

-- ------------------------------------------------------------
-- 4.3  FK Integrity — JOIN checks (all should return 0 rows)
-- ------------------------------------------------------------

-- Check 1: Doctors referencing a department that does not exist
SELECT d.doctor_id, d.first_name, d.department_id
FROM   Doctor d
LEFT   JOIN Department dep ON d.department_id = dep.department_id
WHERE  dep.department_id IS NULL;

-- Check 2: Appointments referencing a patient that does not exist
SELECT a.appointment_id, a.patient_id
FROM   Appointment a
LEFT   JOIN Patient p ON a.patient_id = p.patient_id
WHERE  p.patient_id IS NULL;

-- Check 3: Appointments referencing a doctor that does not exist
SELECT a.appointment_id, a.doctor_id
FROM   Appointment a
LEFT   JOIN Doctor d ON a.doctor_id = d.doctor_id
WHERE  d.doctor_id IS NULL;

-- Check 4: Prescriptions referencing an appointment that does not exist
SELECT pr.prescription_id, pr.appointment_id
FROM   Prescription pr
LEFT   JOIN Appointment a ON pr.appointment_id = a.appointment_id
WHERE  a.appointment_id IS NULL;

-- Check 5: Prescriptions where doctor_id does not match the appointment's doctor
SELECT pr.prescription_id, pr.appointment_id,
       pr.doctor_id AS presc_doctor, a.doctor_id AS appt_doctor
FROM   Prescription pr
JOIN   Appointment  a ON pr.appointment_id = a.appointment_id
WHERE  pr.doctor_id != a.doctor_id;

-- Check 6: Prescriptions where patient_id does not match the appointment's patient
SELECT pr.prescription_id, pr.appointment_id,
       pr.patient_id AS presc_patient, a.patient_id AS appt_patient
FROM   Prescription pr
JOIN   Appointment  a ON pr.appointment_id = a.appointment_id
WHERE  pr.patient_id != a.patient_id;

-- ------------------------------------------------------------
-- 4.4  Functional JOIN query — Patient appointment history
-- Full view: patient name, doctor name, department, date, status, medicine
-- ------------------------------------------------------------
SELECT
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name)   AS patient_name,
    CONCAT(d.first_name, ' ', d.last_name)   AS doctor_name,
    dep.department_name,
    a.appointment_date,
    a.appointment_time,
    a.status,
    pr.medicine_name,
    pr.dosage,
    pr.duration
FROM       Appointment  a
JOIN       Patient      p   ON a.patient_id    = p.patient_id
JOIN       Doctor       d   ON a.doctor_id     = d.doctor_id
JOIN       Department   dep ON d.department_id = dep.department_id
LEFT  JOIN Prescription pr  ON a.appointment_id = pr.appointment_id
ORDER BY   a.appointment_date ASC;

