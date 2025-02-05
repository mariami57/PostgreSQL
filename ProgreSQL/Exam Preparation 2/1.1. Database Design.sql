CREATE TABLE addresses(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE categories(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(10) NOT NULL
);

CREATE TABLE clients (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE drivers (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    age INT NOT NULL check ( age > 0 ),
    rating NUMERIC(3,2) DEFAULT 5.5
);

CREATE TABLE cars (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    make VARCHAR(20) NOT NULL,
    model VARCHAR(20),
    year INT DEFAULT 1 check ( year > 0 ) NOT NULL,
    mileage INT DEFAULT 1 check ( mileage > 0 ),
    condition CHAR(1) NOT NULL,
    category_id INT REFERENCES categories ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
);

CREATE TABLE courses (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    from_address_id INT REFERENCES addresses ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    start TIMESTAMP NOT NULL,
    bill NUMERIC(10,2) DEFAULT 10 check ( bill > 0 ),
    car_id INT REFERENCES cars ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    client_id INT REFERENCES clients ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
);

CREATE TABLE cars_drivers (
    car_id INT REFERENCES cars ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    driver_id INT REFERENCES drivers ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
)