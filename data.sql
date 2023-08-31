-- Active: 1693230983332@@127.0.0.1@5432@vet_clinic
/* Populate database with sample data. */

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (1,'Agumon','3-02-2020', 0, true,10.23);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (2,'Gabumon','15-11-2018', 2, true, 8);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(3,'Pikachu','7-01-2021', 1, false,15.04);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (4,'Devimon','12-05-2017', 5, true, 11);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (5,'Charmander','8-02-2020', 0, false, -11);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (6,'Plantmon','15-11-2021', 2, true, -5.7);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (7,'Squirtle','2-04-1993', 3, false, -12.13);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (8,'Angemon','12-06-2005', 1, true, -45);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (9,'Boarmon','7-06-2005', 7, true, 20.4);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (10,'Blossom','13-10-1998', 3, true, 17);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (11,'Ditto','14-05-2022', 4, true, 22);

-- Insert data owners table,

INSERT INTO owners(id,full_name,age) VALUES(8,'Sam Smith',34);
INSERT INTO owners(id,full_name,age) VALUES(3,'Jennifer Orwell',19);
INSERT INTO owners(id,full_name,age) VALUES(4,'Bob',45);
INSERT INTO owners(id,full_name,age) VALUES(5,'Melody Pond',77);
INSERT INTO owners(id,full_name,age) VALUES(6,'Dean Winchester',14);
INSERT INTO owners(id,full_name,age) VALUES(7,'Jodie Whittaker',38);

-- Insert data in species table

INSERT INTO species(id,name) VALUES(1,'Pokemon');
INSERT INTO species(id,name) VALUES(2,'Digimon');

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = 3
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = 4
WHERE name IN ('Charmander', 'Squirtel', 'Blossom');

UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon', 'Boarmon');

-- Insert data in vets TABLE

INSERT INTO vets(id,name,age,date_of_graduation) VALUES(1,'Vet William Tatcher ', 45, '04-23-2000');
INSERT INTO vets(id,name,age,date_of_graduation) VALUES(2,'Vet Maisy Smith  ', 26, '01-17-2019');
INSERT INTO vets(id,name,age,date_of_graduation) VALUES(3,'Vet Stephanie Mendez ', 64, '04-05-1981');
INSERT INTO vets(id,name,age,date_of_graduation) VALUES(4,'Vet Jack Harkness ', 38, '08-05-2005');

-- Insert data in specialization table

INSERT INTO specializations(vets_id,species_id) VALUES(1,1);
INSERT INTO specializations(vets_id,species_id) VALUES(3,2);
INSERT INTO specializations(vets_id,species_id) VALUES(3,1);
INSERT INTO specializations(vets_id,species_id) VALUES(4,2);


INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(1,1,'05-24-2020');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(1,3,'07-22-2020');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(2,4,'02-02-2021');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(5,2,'05-01-2020');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(5,2,'08-03-2020');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(5,2,'05-14-2020');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(3,3,'04-05-2021');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(9,4,'02-03-2021');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(7,2,'12-22-2019');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(7,1,'08-10-2020');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(7,2,'04-07-2021');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(10,3,'09-29-2019');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(8,4,'03-10-2020');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(8,4,'04-11-2020');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(4,2,'01-24-2019');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(4,2,'05-15-2019');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(4,2,'02-27-2020');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(4,2,'03-08-2020');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(6,3,'05-24-2020');
INSERT INTO visits(animal_id,vet_id,date_of_visit)VALUES(6,1,'01-11-2021');