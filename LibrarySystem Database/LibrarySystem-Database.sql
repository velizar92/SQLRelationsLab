IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'LibrarySystem')
  CREATE DATABASE LibrarySystem
GO

USE LibrarySystem
GO

CREATE TABLE Authors(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
	[Biography] NVARCHAR(2000),
)

CREATE TABLE PublisherAddresses(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Street] NVARCHAR(100),
	[City] NVARCHAR(100) NOT NULL,
	[State] NVARCHAR(100) NOT NULL,
	[PostalCode] VARCHAR(20),
	[Country] NVARCHAR(100) NOT NULL,
)

CREATE TABLE Publishers(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
	[AddressId] INT UNIQUE,
	FOREIGN KEY([AddressId])
	REFERENCES PublisherAddresses([Id]),
)

CREATE TABLE Books(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Title] NVARCHAR(150) NOT NULL,
	[PublisherId] INT,
	FOREIGN KEY([PublisherId]) REFERENCES Publishers([Id]),
)

CREATE TABLE AuthorsBooks(
	[AuthorId] INT,
	[BookId] INT, 
	PRIMARY KEY([AuthorId], [BookId]),
	FOREIGN KEY ([AuthorId]) REFERENCES Authors([Id]),
	FOREIGN KEY ([BookId]) REFERENCES Books([Id]),
)

CREATE TABLE Members(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
	[Email] NVARCHAR(100) UNIQUE,
)

CREATE TABLE Loans(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[BookId] INT,
	[MemberId] INT,
	[LoanDate] DATE,
	[ReturnDate] DATE,
	FOREIGN KEY(BookId) REFERENCES Books(Id),
	FOREIGN KEY(MemberId) REFERENCES Members(Id),
)

CREATE TABLE Categories(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(100),
)

CREATE TABLE BooksCategories(
	BookId INT,
	CategoryId INT,
	PRIMARY KEY([BookId], [CategoryId]),
	FOREIGN KEY([BookId]) REFERENCES Books([Id]),
	FOREIGN KEY([CategoryId]) REFERENCES Categories([Id]),
)
 
CREATE TABLE Events(
    [Id] INT PRIMARY KEY IDENTITY NOT NULL,
    [BookId] INT,
    [EventName] NVARCHAR(200),
    [EventDate] DATE,
    [Location] NVARCHAR(200),
    FOREIGN KEY ([BookId]) REFERENCES Books([Id])
 )


 INSERT INTO PublisherAddresses (Street, City, State, PostalCode, Country)
VALUES 
('123 Main St', 'Vancouver', 'BC', 'V5K0A1', 'Canada'),
('456 Elm St', 'Toronto', 'ON', 'M5H2N2', 'Canada'),
('789 Oak St', 'Montreal', 'QC', 'H2Y1C6', 'Canada'),
('101 Maple St', 'Calgary', 'AB', 'T2P1J9', 'Canada'),
('202 Pine St', 'Ottawa', 'ON', 'K1A0B1', 'Canada'),
('303 Cedar St', 'Edmonton', 'AB', 'T5J2N2', 'Canada'),
('404 Birch St', 'Winnipeg', 'MB', 'R3C4T3', 'Canada'),
('505 Spruce St', 'Halifax', 'NS', 'B3J3K5', 'Canada'),
('606 Fir St', 'Victoria', 'BC', 'V8W1N6', 'Canada'),
('707 Willow St', 'Quebec City', 'QC', 'G1R4P5', 'Canada'),
('808 Aspen St', 'Regina', 'SK', 'S4P3Y2', 'Canada'),
('909 Poplar St', 'St. John', 'NL', 'A1C5W2', 'Canada'),
('1010 Redwood St', 'Fredericton', 'NB', 'E3B5H8', 'Canada'),
('1111 Cypress St', 'Charlottetown', 'PEI', 'C1A7N8', 'Canada'),
('1212 Sequoia St', 'Yellowknife', 'NT', 'X1A2P3', 'Canada'),
('1313 Pinecone St', 'Whitehorse', 'YT', 'Y1A3T4', 'Canada'),
('1414 Mapleleaf St', 'Iqaluit', 'NU', 'X0A0H0', 'Canada'),
('1515 Oakleaf St', 'Saskatoon', 'SK', 'S7K3J8', 'Canada'),
('1616 Cedarleaf St', 'Thunder Bay', 'ON', 'P7B6T7', 'Canada'),
('1717 Birchleaf St', 'Hamilton', 'ON', 'L8P4W9', 'Canada');

-- Insert records into Publishers table
INSERT INTO Publishers (Name, AddressId)
VALUES 
('Penguin Random House Canada Ltd.', 1),
('HarperCollins Canada Ltd.', 2),
('Simon & Schuster Canada Ltd.', 3),
('Macmillan Publishers Canada Ltd.', 4),
('Hachette Livre Canada Ltd.', 5),
('Scholastic Canada Ltd.', 6),
('Oxford University Press Canada Ltd.', 7),
('McGraw-Hill Ryerson Ltd.', 8),
('Pearson Canada Inc.', 9),
('Nelson Education Ltd.', 10),
('House of Anansi Press Inc.', 11),
('Dundurn Press Ltd.', 12),
('ECW Press Ltd.', 13),
('Coach House Books Ltd.', 14),
('University of Toronto Press Inc.', 15),
('Wilfrid Laurier University Press Ltd.', 16),
('Broadview Press Ltd.', 17),
('University of British Columbia Press Ltd.', 18),
('University of Alberta Press Ltd.', 19),
('University of Manitoba Press Ltd.', 20);

-- Insert records into Authors table
INSERT INTO Authors (Name, Biography)
VALUES 
('J.K. Rowling', 'British author, best known for the Harry Potter series.'),
('George R.R. Martin', 'American novelist and short story writer, best known for A Song of Ice and Fire.'),
('J.R.R. Tolkien', 'English writer, poet, philologist, and academic, best known for The Lord of the Rings.'),
('Agatha Christie', 'English writer known for her sixty-six detective novels and fourteen short story collections.'),
('Stephen King', 'American author of horror, supernatural fiction, suspense, and fantasy novels.'),
('Margaret Atwood', 'Canadian poet, novelist, literary critic, essayist, teacher, environmental activist, and inventor.'),
('Alice Munro', 'Canadian short story writer who won the Nobel Prize in Literature in 2013.'),
('Michael Ondaatje', 'Sri Lankan-born Canadian poet, fiction writer, essayist, novelist, editor and filmmaker.'),
('Yann Martel', 'Canadian author best known for his Man Booker Prize-winning novel Life of Pi.'),
('Mordecai Richler', 'Canadian writer known for The Apprenticeship of Duddy Kravitz and Barney Version.'),
('Robertson Davies', 'Canadian novelist, playwright, critic, journalist, and professor.'),
('Leonard Cohen', 'Canadian singer-songwriter, poet and novelist.'),
('Douglas Coupland', 'Canadian novelist and artist best known for his novel Generation X: Tales for an Accelerated Culture.'),
('Margaret Laurence', 'Canadian novelist and short story writer who was one of the major figures in Canadian literature.'),
('Farley Mowat', 'Canadian writer and environmentalist who wrote about his experiences in the Canadian wilderness.'),
('Lucy Maud Montgomery', 'Canadian author best known for a series of novels beginning with Anne of Green Gables.'),
('Rohinton Mistry', 'Indian-born Canadian writer who won the Neustadt International Prize for Literature in 2012.'),
('Joseph Boyden', 'Canadian novelist and short story writer who won the Scotiabank Giller Prize in 2008.'),
('Alistair MacLeod', 'Canadian novelist and short story writer who won the International IMPAC Dublin Literary Award in 2001.'),
('Gail Bowen', 'Canadian playwright and writer best known for her mystery novels featuring Joanne Kilbourn.');

-- Insert records into Books table
INSERT INTO Books (Title, PublisherId)
VALUES 
('Harry Potter and the Philosophers Stone', 1),
('A Game of Thrones', 2),
('The Fellowship of the Ring', 3),
('Murder on the Orient Express', 4),
('The Shining', 5),
('The Handmaid Tale', 6),
('Dear Life', 7),
('The English Patient', 8),
('Life of Pi', 9),
('Barney Version', 10),
('Fifth Business', 11),
('Beautiful Losers', 12),
('Generation X: Tales for an Accelerated Culture', 13),
('The Stone Angel', 14),
('Never Cry Wolf', 15),
('Anne of Green Gables', 16),
('A Fine Balance', 17),
('Through Black Spruce', 18),
('No Great Mischief', 19),
('The Glass Coffin', 20);

-- Insert records into AuthorsBooks table
INSERT INTO AuthorsBooks (AuthorId, BookId)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- Insert records into Members table
INSERT INTO Members (Name, Email)
VALUES 
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Smith', 'bob.smith@example.com'),
('Charlie Brown', 'charlie.brown@example.com'),
('David Wilson', 'david.wilson@example.com'),
('Eva Green', 'eva.green@example.com'),
('Frank Harris', 'frank.harris@example.com'),
('Grace Lee', 'grace.lee@example.com'),
('Hannah White', 'hannah.white@example.com'),
('Ian Black', 'ian.black@example.com'),
('Jackie Blue', 'jackie.blue@example.com'),
('Karen Young', 'karen.young@example.com'),
('Liam King', 'liam.king@example.com'),
('Mia Scott', 'mia.scott@example.com'),
('Noah Adams', 'noah.adams@example.com'),
('Olivia Clark', 'olivia.clark@example.com'),
('Paul Walker', 'paul.walker@example.com'),
('Quinn Hall', 'quinn.hall@example.com'),
('Rachel Green', 'rachel.green@example.com'),
('Sam Brown', 'sam.brown@example.com'),
('Tina Turner', 'tina.turner@example.com');


INSERT INTO Loans (BookId, MemberId, LoanDate, ReturnDate)
VALUES 
(1, 1, '2023-01-01', '2023-01-15'),
(2, 2, '2023-02-01', '2023-02-15'),
(3, 3, '2023-03-01', '2023-03-15'),
(4, 4, '2023-04-01', '2023-04-15'),
(5, 5, '2023-05-01', '2023-05-15'),
(6, 6, '2023-06-01', '2023-06-15'),
(7, 7, '2023-07-01', '2023-07-15'),
(8, 8, '2023-08-01', '2023-08-15'),
(9, 9, '2023-09-01', '2023-09-15'),
(10, 10, '2023-10-01', '2023-10-15'),
(11, 11, '2023-11-01', '2023-11-15'),
(12, 12, '2023-12-01', '2023-12-15'),
(13, 13, '2024-01-01', '2024-01-15'),
(14, 14, '2024-02-01', '2024-02-15'),
(15, 15, '2024-03-01', '2024-03-15'),
(16, 16, '2024-04-01', '2024-04-15'),
(17, 17, '2024-05-01', '2024-05-15'),
(18, 18, '2024-06-01', '2024-06-15'),
(19, 19, '2024-07-01', '2024-07-15'),
(20, 20, '2024-08-01', '2024-08-15');