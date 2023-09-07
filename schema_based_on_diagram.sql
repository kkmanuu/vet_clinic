CREATE DATABASE vet_clinic;
\c vet_clinic;

CREATE TABLE patients(
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(150),
    date_of_birth date
);

CREATE TABLE medical_histories(
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp,
    patient_id integer,
    status VARCHAR(50),
    CONSTRAINT fk_patient FOREIGN KEY(patient_id) REFERENCES patients(id) ON DELETE CASCADE
);

CREATE TABLE invoices (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount decimal(10, 2),
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id integer,
    CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE
);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(255),
    name VARCHAR(255)
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL(10, 2),
    quantity INT,
    total_price DECIMAL(10, 2),
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT fk_invoices FOREIGN KEY(invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
    CONSTRAINT fk_treatments FOREIGN KEY(treatment_id) REFERENCES treatments(id) ON DELETE CASCADE
);

CREATE TABLE medical_join_treatments (
    medical_history_id integer,
    treatment_id integer,
    CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE,
    CONSTRAINT fk_treatment FOREIGN KEY(treatment_id) REFERENCES treatments(id) ON DELETE CASCADE
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON medical_join_treatments (medical_history_id);
CREATE INDEX ON medical_join_treatments (treatment_id);
