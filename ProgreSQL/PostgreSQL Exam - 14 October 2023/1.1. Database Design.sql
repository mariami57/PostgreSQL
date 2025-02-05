CREATE TABLE towns(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE stadiums(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    capacity INT NOT NULL check ( capacity > 0 ),
    town_id INT REFERENCES towns ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
);

CREATE TABLE teams(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    established DATE NOT NULL,
    fan_base INT DEFAULT 0 check ( fan_base >= 0 ) NOT NULL ,
    stadium_id INT REFERENCES stadiums ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
);

CREATE TABLE coaches (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    salary NUMERIC(10,2) DEFAULT 0 NOT NULL check ( salary >= 0 ),
    coach_level INT DEFAULT 0 NOT NULL check ( coach_level >= 0 )
);

CREATE TABLE skills_data (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dribbling INT DEFAULT 0  check ( dribbling >= 0 ),
    pace INT DEFAULT 0  check ( pace >= 0 ),
    passing INT DEFAULT 0  check ( passing >= 0 ),
    shooting INT DEFAULT 0  check ( shooting >= 0 ),
    speed INT DEFAULT 0  check ( speed >= 0 ),
    strength INT DEFAULT 0  check ( strength >= 0 )
);

CREATE TABLE players (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INT NOT NULL DEFAULT 0 CHECK ( age >= 0 ),
    position CHAR(1) NOT NULL,
    salary NUMERIC(10,2) DEFAULT 0 NOT NULL check ( salary >= 0 ),
    hire_date TIMESTAMP,
    skills_data_id INT REFERENCES skills_data ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    team_id INT REFERENCES teams ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE players_coaches(
    player_id INT REFERENCES players ON UPDATE CASCADE ON DELETE CASCADE,
    coach_id INT REFERENCES coaches ON UPDATE CASCADE ON DELETE CASCADE