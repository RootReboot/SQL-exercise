select
  'drop table ' || name || ';'
from sqlite_master
where
  type = 'table';
drop table Manufacturers;
drop table Products;
drop table Departments;
drop table Employees;
drop table Warehouses;
drop table Boxes;
drop table Movies;
drop table MovieTheaters;
drop table Pieces;
drop table Providers;
drop table Provides;
drop table Scientists;
drop table Projects;
drop table AssignedTo;
drop table Employee;
drop table Planet;
drop table Shipment;
drop table Has_Clearance;
drop table Client;
drop table Package;
drop table Physician;
drop table Department;
drop table Affiliated_With;
drop table Procedure;
drop table Trained_In;
drop table Patient;
drop table Nurse;
drop table Appointment;
drop table Medication;
drop table Prescribes;
drop table Block;
drop table Room;
drop table On_Call;
drop table Stay;
drop table Undergoes;