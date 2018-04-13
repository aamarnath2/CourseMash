DROP DATABASE if exists CourseMash;
CREATE DATABASE CourseMash;
USE CourseMash;

CREATE TABLE Users (

       userID INTEGER PRIMARY KEY not null auto_increment,
           fname VARCHAR(255) not null,
	       lname VARCHAR(255) not null,
	           email VARCHAR(255),
		       password VARCHAR(255) not null
		       );

CREATE TABLE Courses (

       courseID INTEGER PRIMARY KEY not null auto_increment,
           prefix VARCHAR(255) not null,
	       courseName VARCHAR(255) not null,
	           professor VARCHAR(255) not null
		   );

CREATE TABLE CourseUsers (
       courseID INTEGER not null,
           userID INTEGER not null,
	       FOREIGN KEY fk1(courseID) REFERENCES Courses(courseID),
	           FOREIGN KEY fk2(userID) REFERENCES Users(userID)
		   );

CREATE TABLE Posts (

       postID INTEGER PRIMARY KEY not null auto_increment,
           courseID INTEGER not null,
	       userID INTEGER not null,
	           title VARCHAR(255) not null,
		       body VARCHAR(255) not null,
		           FOREIGN KEY fk1(userID) references Users(userID),
			       FOREIGN KEY fk2(courseID) references Courses(courseID)
			       );

CREATE TABLE PostFollowers (

       postID INTEGER not null,
           userID INTEGER not null,
	       FOREIGN KEY fk1(postID) REFERENCES Posts(postID),
	           FOREIGN KEY fk2(userID) REFERENCES Users(userID)
		   );

CREATE TABLE Replies (

       replyID INTEGER PRIMARY KEY not null auto_increment,
           userID INTEGER not null,
	       postID INTEGER not null,
	           reply VARCHAR(255) not null,
		       FOREIGN KEY fk1(userID) references Users(userID),
		           FOREIGN KEY fk2(postID) references Posts(postID)
			   );

INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 100', 'Explorations in Computing', 'Sathyanaraya Raghavachary');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 102', 'Fundamentals of Computation', 'Mark Redekopp');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 103', 'Introduction to Programming', 'Andrew Goodney; Olivera Grujic');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 104', 'Data Structures and Object Oriented Design', 'Aaron Cote; Sandra Batista');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 109', 'Introduction to Computer Science', 'Andrew Goodney');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 170', 'Discrete Methods in Computer Science', 'Aaron Cote; Sandra Batista');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 201', 'Principles of Software Development', 'Jeffrey Miller');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 270', 'Introduction to Algorithms and Theory of Computing', 'Michael Shindler');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 310', 'Software Development', 'Chao Wang');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 350', 'Introduction to Operating Systems', 'Tanya Ryutov');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 353', 'Introduction to Internetworking', 'Tanya Ryutov');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 356', 'Introduction to Computer Systems', 'Mark Redekopp');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 360', 'Introduction to Artificial Intelligence', 'Sven Koenig');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 401', 'Capstone: Design and Construction of Large Software Systems', 'Jeffrey Miller');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 402', 'Operating Systems', 'William Cheng');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 420', 'Computer Graphics', 'Hao Li');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 426', 'Game Prototyping', 'Scott Easley');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 455', 'Introduction to Programming Systems Design', 'N/A');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 467', 'Introduction to Machine Learning', 'Michael Shindler');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 490', 'Directed Research', 'N/A');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 491', 'Final Game Project', 'Scott Easley');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 499', 'Special Topics', 'William Halfond');
