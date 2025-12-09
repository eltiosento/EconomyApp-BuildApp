drop database if exists EconomyApp;
create database EconomyApp;
use EconomyApp;

CREATE TABLE Roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Roles(name) VALUES("SUPERADMIN");
INSERT INTO Roles(name) VALUES("ADMIN");
INSERT INTO Roles(name) VALUES("USER");
INSERT INTO Roles(name) VALUES("GUEST");


CREATE TABLE Users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id BIGINT NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    profile_image VARCHAR(250),
	FOREIGN KEY (role_id) REFERENCES Roles(id)
);

INSERT INTO Users (id, username, password, role_id, email) VALUES (1, 'Admin', '$2a$10$Rj/VwhY/JZ.V21WlHXhsPus3uVZNTu2AnHqWjYegG1wdm1Fg5zToO', 1, 'admin@iadmin.es');
/*
La contraseña es admin123
*/

CREATE TABLE Categories (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    icon VARCHAR(255) DEFAULT NULL,
    parent_category_id BIGINT,
	is_saving tinyint(1) NOT NULL DEFAULT '0',
    goal DECIMAL(10,2) DEFAULT NULL,
    FOREIGN KEY (parent_category_id) REFERENCES Categories(id)
);

INSERT INTO `Categories` VALUES 
(1,'Gastos Fijos','Categoría para registrar los gastos del hogar como la luz, el agua, etc.',NULL,NULL,0,NULL),
(2,'Supermercados','Categoría pera registrar los gastos de los supermercados.',NULL,NULL,0,NULL),
(3,'Compras del hogar','Categoría pera registrar los gastos de mobiliario, electrodomésticos, decoración, etc.',NULL,NULL,0,NULL),
(4,'Ocio','Gastos que realizamos en restaurantes y bares, cines, teatros, etc.',NULL,NULL,0,NULL),
(5,'Otors Gastos','Categoría para registrar cualquier gasto que no tenga una periodicidad fija.',NULL,NULL,0,NULL),
(6,'Ahorros','Cateoría para registrar los ahorros que se quieran generar.',NULL,NULL,0,NULL);

CREATE TABLE Expenses (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    expense_date DATE NOT NULL,
    description TEXT,
    created_at datetime(6),
    updated_at datetime(6),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

CREATE TABLE Incomes (
    id BIGINT  AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT  NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    incomes_date DATE NOT NULL,
    description TEXT,
    created_at datetime(6),
    updated_at datetime(6),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

/*
select Expenses.* , Expenses_categories.parent_category_id
from Expenses join Expenses_categories
on Expenses_categories.id = Expenses.category_id
where Expenses_categories.parent_category_id = 1;
*/
