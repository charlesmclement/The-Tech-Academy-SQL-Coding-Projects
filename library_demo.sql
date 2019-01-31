-------------------- Build Database-----------------------------
CREATE DATABASE db_library
GO
USE db_library
GO

CREATE TABLE LIBRARY_BRANCH (
		BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BranchName VARCHAR(50) NOT NULL,
		Address VARCHAR(50) NOT NULL
	);
CREATE TABLE BOOKS (
		BookID INT PRIMARY KEY IDENTITY (10,1),
		Title VARCHAR(75) NOT NULL,
		PublisherName VARCHAR(50),
	);
CREATE TABLE BORROWER (
		CardNo INT PRIMARY KEY IDENTITY (1000,1),
		Name VARCHAR(50) NOT NULL,
		Address VARCHAR(50) NOT NULL,
		Phone VARCHAR(50) NOT NULL
	);
CREATE TABLE BOOK_COPIES (
		BookID INT NOT NULL 
			FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL
			FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		Number_Of_Copies INT NOT NULL,
	);

CREATE TABLE PUBLISHER (
		PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
		Address VARCHAR(50) NOT NULL,
		Phone VARCHAR(50) NOT NULL
	);
CREATE TABLE BOOK_LOANS (
		BookID INT 
			FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL 
			FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo INT NOT NULL 
		FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE, 
		DateOut DATE, 
		DateDue DATE,
	);


CREATE TABLE BOOK_AUTHORS (
		BookID INT 
			FOREIGN KEY REFERENCES BOOKS(BookID),
		AuthorName VARCHAR(50) NOT NULL
	);
	
		
		
		
-------------------- Populate database ------------------------

INSERT INTO LIBRARY_BRANCH
	(BranchName, Address)
	VALUES
	('Sharpstown', '1234 1st street'),
	('Central', '2345 4th street'),
	('Hampton', '3456 8th street'),
	('Denino', '4567 16th street')
	;
	SELECT * FROM LIBRARY_BRANCH;

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('The Assassin''s blade', 'Bloomsbury'),
	('Throne of Glass', 'Bloomsbury'),
	('Crown of Midnight', 'Bloomsbury'),
	('Heir of Fire', 'Bloomsbury'),
	('Queen of Shadows', 'Bloomsbury'),
	('Empire of Storms', 'Bloomsbury'),
	('Tower of Dawn', 'Bloomsbury'),
	('Kingdom of Ash', 'Bloomsbury'),
	('Pet Sematary', 'Simon & Schuster'),
	('Apt Pupil', 'Simon & Schuster'),
	('Dolores Claiborne', 'Simon & Schuster'),
	('Bag of Bones', 'Simon & Schuster'),
	('The Mist', 'Simon & Schuster'),
	('The Body', 'Simon & Schuster'),
	('Four Past Midnight', 'Simon & Schuster'),
	('Ghost Brothers of Darkland County', 'Simon & Schuster'),
	('Desperation', 'Simon & Schuster'),
	('Mr. Mercedes', 'Simon & Schuster'),
	('1922', 'Simon & Schuster'),
	('Cujo', 'Simon & Schuster'),
	('The Long Walk', 'Simon & Schuster'),
	('Different Seasons', 'Simon & Schuster'),
	('Mile 81', 'Simon & Schuster'),
	('Danse Macabre', 'Simon & Schuster'),
	('Blood and Smoke', 'Simon & Schuster'),
	('Building Bridges', 'Simon & Schuster'),
	('Wolves of the Calla', 'Simon & Schuster'),
	('Nineteen Eighty-Four', 'Secker & Warburg'),
	('Animal Farm', 'Harcourt, Brace and Company'),
	('A Game of Thrones', 'Bantom Books'),
	('A Clash of Kings', 'Bantom Books'),
	('A Storm of Swords', 'Bantom Books'),
	('A Feast of Crows', 'Bantom Books'),
	('A Dance with Dragons', 'Bantom Books'),
	('The Cuckoo''s Egg', 'Doubleday'),
	('Hunters of Dune', 'Tor Books'),
	('Legends of Dune', 'Tor Books'),
	('Sisterhood of Dune', 'Tor Books'),
	('Mentats of Dune', 'Tor Books'),
	('The Winds of Dune', 'Tor Books'),
	('Sandworms of Dune', 'Tor Books'),
	('Tales of Dune', 'Tor Books'),
	('The Road to Dune', 'Tor Books'),
	('Ender''s Game', 'Tor Books'),
	('Speaker of the Dead', 'Tor Books'),
	('Xenocide', 'Tor Books'),
	('Children of the Mind', 'Tor Books'),
	('Ender''s Shadow', 'Tor Books'),
	('Shadow of the Hegemon', 'Tor Books'),
	('The Secret Power Within', 'Harmony'),
	('The Hunger Games', 'Scholastic'),
	('Catching Fire', 'Scholastic'),
	('Mockingjay', 'Scholastic'),
	('Thieves'' World', 'Macmillan'),
	('The Lost Tribe', 'Picador')
	;
	SELECT * FROM BOOKS;

SET IDENTITY_INSERT BORROWER ON	
INSERT INTO BORROWER
	(CardNo, Name, Address, Phone)
	VALUES
	(1000, 'Denino Paul', '3935 Wyatt Street', '555-999-1234'),
	(1001, 'Jobs Steve', '1150 Old House Drive', '740-837-6209'),
	(1002, 'Johnson Diane J', '894 Water Street', '925-279-0953'),
	(1003, 'Warren Robert G', '4823 Shinn Avenue', '724-481-6169'),
	(1004, 'Shoup Nenita K', '3297 Maloy Court', '785-422-8603'),
	(1005, 'Thomas Linda', '2410 Poling Farm Road', '402-327-7782'),
	(1006, 'Metzger Michael', '20 Burnside Avenue', '435-731-4749'),
	(1007, 'Seldon Darryl G', '4875 Geneva Street', '917-513-1647'),
	(1008, 'Lundell Andrew C', '4963 Cody Ridge Road', '580-438-0270'),
	(1009, 'Herring James', '2142 Chenoweth Drive', '931-537-5619'),
	(1010, 'McLeod, Jeffery T', '2201 Shady Pines Drive', '276-275-1441'),
	(1011, 'Sachs Todd R', '4865 Ryder Avenue', '425-338-3959')
	;
	SET IDENTITY_INSERT BORROWER OFF
	SELECT * FROM BORROWER
	
INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	(10, 'Maas Sarah J'),
	(11, 'Maas Sarah J'),
	(12, 'Maas Sarah J'),
	(13, 'Maas Sarah J'),
	(14, 'Maas Sarah J'),
	(15, 'Maas Sarah J'),
	(16, 'Maas Sarah J'),
	(17, 'Maas Sarah J'),
	(18, 'King Stephen'),
	(19, 'King Stephen'),
	(20, 'King Stephen'),
	(21, 'King Stephen'),
	(22, 'King Stephen'),
	(23, 'King Stephen'),
	(24, 'King Stephen'),
	(25, 'King Stephen'),
	(26, 'King Stephen'),
	(27, 'King Stephen'),
	(28, 'King Stephen'),
	(29, 'King Stephen'),
	(30, 'King Stephen'),
	(31, 'King Stephen'),
	(32, 'King Stephen'),
	(33, 'King Stephen'),
	(34, 'King Stephen'),
	(35, 'King Stephen'),
	(36, 'King Stephen'),
	(37, 'Orwell George'),
	(38, 'Orwell George'),
	(39, 'Martin George R R'),
	(40, 'Martin George R R'),
	(41, 'Martin George R R'),
	(42, 'Martin George R R'),
	(43, 'Martin George R R'),
	(44, 'Stoll Clifford'),
	(45, 'Herbert Brian, Anderson Kevin J'),
	(46, 'Herbert Brian, Anderson Kevin J'),
	(47, 'Herbert Brian, Anderson Kevin J'),
	(48, 'Herbert Brian, Anderson Kevin J'),
	(49, 'Herbert Brian, Anderson Kevin J'),
	(50, 'Herbert Brian, Anderson Kevin J'),
	(51, 'Herbert Brian, Anderson Kevin J'),
	(52, 'Herbert Brian, Anderson Kevin J'),
	(53, 'Card Orson Scott'),
	(54, 'Card Orson Scott'),
	(55, 'Card Orson Scott'),
	(56, 'Card Orson Scott'),
	(57, 'Card Orson Scott'),
	(58, 'Card Orson Scott'),
	(59, 'Norris Chuck'),
	(60, 'Collins Suzanne'),
	(61, 'Collins Suzanne'),
	(62, 'Collins Suzanne'),
	(63, 'Asprin Robert Lynn'),
	(64, 'Lee Mark')
	
	;
	SELECT * FROM BOOK_AUTHORS
	
INSERT INTO PUBLISHER
	(PublisherName, Address, Phone)
	VALUES
	('Bloomsbury', '1440 Pinewood Drive','847-878-1444'),
	('Simon & Schuster', '172 Bartlett Avenue','248-527-7225'),
	('Secker & Warburg', '4257 Edwards Street','252-651-1318'),
	('Harcourt, Brace and Company', '3027 Wood Duck Drive','906-395-0975'),
	('Bantom Books', '4691 Haven Lane','517-743-2584'),
	('Doubleday', '286 Pearl Street','916-363-3495'),
	('Tor Books', '4668 Hiddenview Drive','215-928-2416'),
	('Harmony', '4894 Aviation Way','213-918-3579'),
	('Scholastic', '3579 Millbrook Road','630-759-3758'),
	('Macmillan', '1093 Matthews Street','815-624-2813'),
	('Picador', '4159 Clearview Drive', '303-727-4337')
	;
	SELECT * FROM PUBLISHER
	
INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(19, 1, 7),
	(22, 1, 7),
	(23, 1, 7),
	(37, 1, 7),
	(38, 1, 7),
	(39, 1, 7),
	(44, 1, 7),
	(45, 1, 7),
	(46, 1, 7),
	(47, 1, 7),
	(48, 1, 7),
	(49, 1, 7),
	(50, 1, 7),
	(51, 1, 7),
	(52, 1, 7),
	(53, 1, 7),
	(59, 1, 7),
	(60, 1, 7),
	(64, 1, 7),
	(10, 2, 7),
	(11, 2, 7),
	(12, 2, 7),
	(13, 2, 7),
	(14, 2, 7),
	(15, 2, 7),
	(16, 2, 7),
	(17, 2, 7),
	(26, 2, 7),
	(28, 2, 7),
	(39, 2, 7),
	(40, 2, 7),
	(44, 2, 7),
	(45, 2, 7),
	(46, 2, 7),
	(47, 2, 7),
	(48, 2, 7),
	(49, 2, 7),
	(50, 2, 7),
	(51, 2, 7),
	(52, 2, 7),
	(53, 2, 7),
	(39, 3, 7),
	(40, 3, 7),
	(41, 3, 7),
	(42, 3, 7),
	(43, 3, 7),
	(44, 3, 7),
	(46, 3, 7),
	(47, 3, 7),
	(48, 3, 7),
	(49, 3, 7),
	(50, 3, 7),
	(51, 3, 7),
	(52, 3, 7),
	(53, 3, 7),
	(54, 3, 7),
	(55, 3, 7),
	(56, 3, 7),
	(57, 3, 7),
	(58, 3, 7),
	(59, 3, 7),
	(37, 4, 7),
	(38, 4, 7),
	(44, 4, 7),
	(45, 4, 7),
	(46, 4, 7),
	(47, 4, 7),
	(48, 4, 7),
	(49, 4, 7),
	(50, 4, 7),
	(51, 4, 7),
	(52, 4, 7),
	(53, 4, 7),
	(59, 4, 7),
	(60, 4, 7),
	(61, 4, 7),
	(62, 4, 7),
	(63, 4, 7),
	(64, 4, 7)	
	;
	SELECT * FROM BOOK_COPIES
	
INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(44, 4, 1000, '2019-01-27', '2019-02-27'),
	(45, 4, 1000, '2019-01-27', '2019-02-27'),
	(60, 4, 1000, '2019-01-27', '2019-02-27'),
	(61, 4, 1000, '2019-01-27', '2019-02-27'),
	(62, 4, 1000, '2019-01-27', '2019-02-27'),
	(64, 1, 1000, '2012-03-13', '2012-04-13'),
	(53, 3, 1003, '2019-01-27', '2019-02-27'),
	(54, 3, 1003, '2019-01-27', '2019-02-27'),
	(55, 3, 1003, '2019-01-27', '2019-02-27'),
	(56, 3, 1003, '2019-01-27', '2019-02-27'),
	(57, 3, 1003, '2019-01-27', '2019-02-27'),
	(58, 3, 1003, '2019-01-27', '2019-02-27'),
	(53, 3, 1005, '2019-01-27', '2019-02-27'),
	(54, 3, 1005, '2019-01-27', '2019-02-27'),
	(55, 3, 1005, '2019-01-27', '2019-02-27'),
	(56, 3, 1005, '2019-01-27', '2019-02-27'),
	(57, 3, 1005, '2019-01-27', '2019-02-27'),
	(58, 3, 1005, '2019-01-27', '2019-02-27'),
	(53, 2, 1006, '2019-01-27', '2019-02-27'),
	(54, 2, 1006, '2019-01-27', '2019-02-27'),
	(55, 2, 1006, '2019-01-27', '2019-02-27'),
	(56, 2, 1006, '2019-01-27', '2019-02-27'),
	(57, 2, 1006, '2019-01-27', '2019-02-27'),
	(58, 2, 1006, '2019-01-27', '2019-02-27'),
	(44, 2, 1006, '2019-01-27', '2019-02-27'),
	(44, 4, 1002, '2019-01-27', '2019-02-27'),
	(45, 4, 1002, '2019-01-27', '2019-02-27'),
	(60, 4, 1002, '2019-01-27', '2019-02-27'),
	(61, 4, 1002, '2019-01-27', '2019-02-27'),
	(62, 4, 1002, '2019-01-27', '2019-02-27'),
	(64, 1, 1002, '2012-03-13', '2012-04-13'),
	(53, 3, 1004, '2019-01-27', '2019-02-27'),
	(54, 3, 1004, '2019-01-27', '2019-02-27'),
	(55, 3, 1004, '2019-01-27', '2019-02-27'),
	(56, 3, 1004, '2019-01-27', '2019-02-27'),
	(57, 3, 1004, '2019-01-27', '2019-02-27'),
	(58, 3, 1004, '2019-01-27', '2019-02-27'),
	(53, 3, 1007, '2019-01-27', '2019-02-27'),
	(54, 3, 1007, '2019-01-27', '2019-02-27'),
	(55, 3, 1007, '2019-01-27', '2019-02-27'),
	(56, 3, 1007, '2019-01-27', '2019-02-27'),
	(57, 3, 1007, '2019-01-27', '2019-02-27'),
	(58, 3, 1007, '2019-01-27', '2019-02-27'),
	(53, 2, 1008, '2019-01-27', '2019-02-27'),
	(54, 2, 1008, '2019-01-27', '2019-02-27'),
	(55, 2, 1008, '2019-01-27', '2019-02-27'),
	(56, 2, 1008, '2019-01-27', '2019-02-27'),
	(57, 2, 1008, '2019-01-27', '2019-02-27'),
	(58, 2, 1008, '2019-01-27', '2019-02-27'),
	(44, 2, 1008, '2019-01-27', '2019-02-27'),
	(44, 2, 1009, '2019-01-27', '2019-02-27')
	
	;
	SELECT * FROM BOOK_LOANS
GO

-- 1 )  How many copies of the book titled "The Lost Tribe"    
-- are owned by the library branch whose name is "Sharpstown"? 
CREATE PROCEDURE dbo.Query1 AS
		SELECT BranchName AS 'Branch:', Title AS 'Title:', Number_Of_Copies AS 'Number of Copies:' FROM BOOKS 
			INNER JOIN BOOK_COPIES ON BOOKS.BookID = BOOK_COPIES.BookID 
			INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
			WHERE Title = 'The Lost Tribe' AND BranchName = 'Sharpstown'
GO

-- 2 )  How many copies of the book titled "The Lost Tribe"
-- are owned by each library branch? 

CREATE PROCEDURE dbo.Query2 AS
		SELECT BranchName AS 'Branch:', Title AS 'Title:', Number_Of_Copies AS 'Number of Copies:' FROM BOOKS 
			INNER JOIN BOOK_COPIES ON BOOKS.BookID = BOOK_COPIES.BookID 
			INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID=BOOK_COPIES.BranchID 
			WHERE Title = 'The Lost Tribe' 
GO

-- 3 ) Retrieve the names of all borrowers who do not have any 
-- books checked out.

CREATE PROCEDURE dbo.Query3 AS
		SELECT Name AS 'No Book Loans:' FROM BORROWER 
			LEFT JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo 
			WHERE BOOK_LOANS.CardNo IS NULL
GO
-- 4 )  For each book that is loaned out from the "Sharpstown" 
-- branch and whose DueDate is today, retrieve the book title, 
-- the borrower's name, and the borrower's address. 

CREATE PROCEDURE dbo.Query4 AS
		SELECT Title, Name, Address FROM BOOK_LOANS 
			LEFT JOIN BORROWER ON BORROWER.CardNo = BOOK_LOANS.CardNo
			INNER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID
			WHERE DateDue = GETDATE() AND BranchID = 1
GO
-- 5 ) For each library branch, retrieve the branch name and 
-- the total number of books loaned out from that branch.

CREATE PROCEDURE dbo.Query5 AS
		SELECT BranchName AS 'Branch:', Count(*) AS 'Total Book Loans:' FROM BOOK_LOANS 
			LEFT JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
			GROUP BY BranchName
GO

-- 6 ) Retrieve the names, addresses, and the number of books 
-- checked out for all borrowers who have more than five books 
-- checked out.


CREATE PROCEDURE dbo.Query6 AS
		SELECT Name, Address, COUNT(*) AS 'Book Loans:' FROM BOOK_LOANS 
			LEFT JOIN BORROWER ON  BOOK_LOANS.CardNo = BORROWER.CardNo
			GROUP BY  Name, Address
GO
-- 7 ) For each book authored (or co-authored) by "Stephen King",
-- retrieve the title and the number of copies owned by the library 
-- branch whose name is "Central".


CREATE PROCEDURE dbo.Query7 AS
		SELECT BranchName AS 'Branch:', Title, Number_Of_Copies AS 'Number of Copies:' FROM BOOK_COPIES
			LEFT JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
			LEFT JOIN BOOK_AUTHORS ON BOOK_AUTHORS.BookID = BOOK_COPIES.BookID
			LEFT JOIN BOOKS ON BOOKS.BookID = BOOK_COPIES.BookID
			WHERE AuthorName LIKE '%King%Stephen%' AND BranchName = 'Central'
GO
	
	
	
	
	
