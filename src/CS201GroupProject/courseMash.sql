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

INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 201', 'Principles of Software Development', 'Jeffrey Miller');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 310', 'Software Development', 'Chao Wang');
INSERT INTO Courses(prefix, courseName, professor) VALUES ('CSCI 356', 'Introduction to Computer Systems', 'Mark Redekopp');
