-- Creating tables 
create table actor(
    act_id varchar(10),
    act_name varchar(20),
    act_gender varchar(10),
    PRIMARY KEY(act_id)
); 

desc actor;

create table director(
    dir_id varchar(10),
    dir_name varchar(20),
    dir_phone varchar(10),
    PRIMARY KEY(dir_id)
);

desc director;

create table movies(
    mov_id varchar(10),
    mov_title varchar(50),
    mov_year int,
    mov_lang varchar(10),
    dir_id varchar(10),
    PRIMARY KEY(mov_id),
    FOREIGN KEY (dir_id) REFERENCES director (dir_id) on DELETE CASCADE
);

desc movies;

create table movie_cast(
    act_id varchar(10),
    mov_id varchar(10),
    role varchar(10),
    PRIMARY KEY (act_id,mov_id),
    FOREIGN KEY (act_id) REFERENCES actor (act_id) on DELETE CASCADE,
    FOREIGN key (mov_id) REFERENCES  movies (mov_id) ON DELETE CASCADE
);

desc movie_cast; 

create table rating(
    rat_id varchar(10),
    mov_id varchar(10),
    rev_stars int,
    PRIMARY KEY(rat_id),
    FOREIGN KEY (mov_id) REFERENCES  movies (mov_id) on DELETE CASCADE
);

desc rating; 


-- Adding data to tables 

INSERT INTO actor VALUES
("A101" , "Raj" , "M"),
("A102" , "Johny" , "M"),
("A103" , "Leo" , "M"),
("A104" , "Saru" , "F"),
("A105" , "Jasmine" , "F"),
("A106" , "Anthony Perkins" , "M"),
("A107" , "Harrison Ford" , "M");

select *from actor;

INSERT INTO director VALUES
("D01","'Hitchcock","8747096532"),
("D02","Steven Spielberg","8896547236"),
("D03","Rajamouli","9745621538"),
("D04","NRaj","9916531779"),
("D05","Pawan","8745691238");

select *from director;

INSERT INTO movies VALUES
("M10","Psycho",1960,"English","D01"),
("M11","Tomorrowcomesnow",2017,"English","D04"),
("M12","It's a crime",1999,"English","D04"),
("M13","Indian Jones and the temples of doom",1984,"English","D02"),
("M14","Hello Hello",2016,"English","D04"),
("M15","E.T",1982,"English","D02");

select *from movies;

INSERT INTO movie_cast VALUES
("A101","M11","M_lead"),
("A104","M11","F_lead"),
("A101","M12","M_lead"),
("A106","M10","Negative"),
("A107","M13","M_lead"),
("A104","M14","F_lead"),
("A107","M14","Support");

select *from movie_cast;

INSERT INTO rating VALUES
("R1","M11",4),
("R2","M10",4),
("R3","M11",3),
("R4","M12",4),
("R5","M13",4),
("R6","M15",3),
("R7","M13",3);

select *from rating;
