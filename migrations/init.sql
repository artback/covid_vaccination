CREATE TABLE appointment
(
    id         SERIAL PRIMARY KEY NOT NULL,
    client_id  SERIAL,
    start_time TIMESTAMP,
    end_time   TIMESTAMP,
    FOREIGN KEY (client_id)
        REFERENCES client (id)
);

create table client
(
    id            SERIAL PRIMARY KEY NOT NULL,
    name          TEXT,
    contact_email TEXT
        CONSTRAINT proper_email CHECK (contact_email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);

create table location
(
    id   SERIAL PRIMARY KEY NOT NULL,
    name TEXT UNIQUE
);
create table schedule
(
    id          SERIAL PRIMARY KEY NOT NULL,
    location_id SERIAL,
    open_time        time,
    close_time       time,
    weekday     INT,
    FOREIGN KEY (location_id)
        REFERENCES location (id)
);

INSERT INTO location (name)
VALUES ('vaccination_1');
INSERT INTO location (name)
VALUES ('vaccination_2');

INSERT INTO schedule(location_id, open_time, close_time, weekday)
VALUES ('vaccination_1', '08:00', '17:00', 1);
INSERT INTO schedule(location_id, open_time, close_time, weekday)
VALUES ('vaccination_1', '08:00', '17:00', 2);
INSERT INTO schedule(location_id, open_time, close_time, weekday)
VALUES ('vaccination_1', '08:00', '17:00', 3);
INSERT INTO schedule(location_id, open_time, close_time, weekday)
VALUES ('vaccination_1', '08:00', '17:00', 4);
INSERT INTO schedule(location_id, open_time, close_time, weekday)
VALUES ('vaccination_1', '08:00', '17:00', 5);
INSERT INTO schedule(location_id, open_time, close_time, weekday)
VALUES ('vaccination_2', '09:00', '16:00', 1);
