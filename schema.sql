-- Active: 1693230983332@@127.0.0.1@5432@vet_clinic
/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;
CREATE TABLE animals (id INT PRIMARY KEY,name varchar(255),date_of_birth date,escape_attempts integer,neutered boolean,weight_kg decimal);

ALTER TABLE animals
ADD
COLUMN species VARCHAR(255);

-- Create the 'owners' table
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
);

-- Create the 'species' table
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Modify the 'animals' table

    ALTER TABLE animals
    DROP COLUMN species,
    ADD COLUMN species_id INTEGER REFERENCES species(id),
    ADD COLUMN owner_id INTEGER REFERENCES owners(id);
