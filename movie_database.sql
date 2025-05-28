-- 1) Create the database
CREATE DATABASE IF NOT EXISTS movie_database;
USE movie_database;

-- 2) Independent tables first

CREATE TABLE Actor (
    ActorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    BirthDate DATE,
    Gender VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Director (
    DirectorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Experience INT,
    Bio TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Studio (
    StudioID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Headquarters VARCHAR(255),
    Country VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Producer (
    ProducerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Company VARCHAR(255),
    Title VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Rating (
    RatingID INT PRIMARY KEY AUTO_INCREMENT,
    RatingName VARCHAR(10) NOT NULL,
    Description TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `User` (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(100) NOT NULL UNIQUE,
    Email VARCHAR(255) NOT NULL UNIQUE,
    JoinDate DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Genre (
    GenreID INT PRIMARY KEY AUTO_INCREMENT,
    GenreName VARCHAR(100) NOT NULL,
    Description TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3) Core “Movie” table

CREATE TABLE Movie (
    MovieID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    Duration INT NOT NULL,
    StudioID INT,
    DirectorID INT,
    RatingID INT,
    FOREIGN KEY (StudioID)   REFERENCES Studio(StudioID),
    FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID),
    FOREIGN KEY (RatingID)   REFERENCES Rating(RatingID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4) Dependent tables

CREATE TABLE BoxOffice (
    BoxOfficeID INT PRIMARY KEY AUTO_INCREMENT,
    MovieID INT UNIQUE,
    Budget DECIMAL(15,2),
    DomesticGross DECIMAL(15,2),
    InternationalGross DECIMAL(15,2),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Award (
    AwardID INT PRIMARY KEY AUTO_INCREMENT,
    AwardName VARCHAR(255) NOT NULL,
    AwardYear INT NOT NULL,
    Category VARCHAR(255),
    MovieID INT,
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Review (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    RatingID INT,
    MovieID INT,
    ReviewText TEXT,
    ReviewDate DATE,
    RatingScore DECIMAL(3,1),
    FOREIGN KEY (RatingID) REFERENCES Rating(RatingID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Note: “Character” is a reserved word, so we wrap it in backticks
CREATE TABLE `Character` (
    Name VARCHAR(255),
    Salary DECIMAL(15,2),
    MovieID INT NOT NULL,
    PRIMARY KEY (Name, MovieID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Acts (
    ActorID INT,
    CharacterName VARCHAR(255),
    MovieID INT,
    PRIMARY KEY (ActorID, CharacterName, MovieID),
    FOREIGN KEY (ActorID) REFERENCES Actor(ActorID),
    FOREIGN KEY (CharacterName, MovieID) REFERENCES `Character`(Name, MovieID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Belongs (
    MovieID INT,
    GenreID INT,
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Has` (
    MovieID INT,
    ReviewID INT UNIQUE,
    RatingID INT UNIQUE,
    BoxOfficeID INT UNIQUE,
    PRIMARY KEY (MovieID),
    FOREIGN KEY (MovieID)     REFERENCES Movie(MovieID),
    FOREIGN KEY (ReviewID)    REFERENCES Review(ReviewID),
    FOREIGN KEY (RatingID)    REFERENCES Rating(RatingID),
    FOREIGN KEY (BoxOfficeID) REFERENCES BoxOffice(MovieID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Writes (
    UserID INT,
    ReviewID INT,
    PRIMARY KEY (UserID, ReviewID),
    FOREIGN KEY (UserID)   REFERENCES `User`(UserID),
    FOREIGN KEY (ReviewID) REFERENCES Review(ReviewID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
