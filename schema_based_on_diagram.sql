CREATE DATABASE vet_clinic;
\c vet_clinic;

CREATE TABLE patients (
    id serial PRIMARY KEY,
    name VARCHAR(150),
    date_of_birth DATE
);

CREATE TABLE medical_histories (
    id serial PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id integer,
    status VARCHAR(50),
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients (id) ON DELETE CASCADE
);

CREATE TABLE invoices (
    id serial PRIMARY KEY,
    total_amount DECIMAL(10, 2),
    generated_at TIMESTAMP,
    paid_at TIMESTAMP,
    medical_history_id integer,
    CONSTRAINT fk_medical_history FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id) ON DELETE CASCADE
);

CREATE TABLE treatments (
    id serial PRIMARY KEY,
    type VARCHAR(255),
    name VARCHAR(255)
);

CREATE TABLE invoice_items (
    id serial PRIMARY KEY,
    unit_price DECIMAL(10, 2),
    quantity INT,
    total_price DECIMAL(10, 2),
    invoice_id integer,
    treatment_id integer,
    CONSTRAINT fk_invoice FOREIGN KEY (invoice_id) REFERENCES invoices (id) ON DELETE CASCADE,
    CONSTRAINT fk_treatment FOREIGN KEY (treatment_id) REFERENCES treatments (id) ON DELETE CASCADE
);

CREATE TABLE medical_history_treatments (
    medical_history_id integer,
    treatment_id integer,
    CONSTRAINT fk_medical_history FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id) ON DELETE CASCADE,
    CONSTRAINT fk_treatment FOREIGN KEY (treatment_id) REFERENCES treatments (id) ON DELETE CASCADE
);
