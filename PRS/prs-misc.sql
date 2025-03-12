USE PRS;

-- Query to join tables (adjusted for MySQL)
SELECT *
FROM User U 
JOIN Request R ON U.UserID = R.UserID
JOIN LineItem LI ON LI.RequestID = R.RequestID
JOIN Product P ON P.ProductID = LI.ProductID
JOIN Vendor V ON V.VendorID = P.VendorID;

-- Insert Users
INSERT INTO User (Username, Password, FirstName, LastName, PhoneNumber, Email, Reviewer, Admin) VALUES
    ('CAP', 'America', 'Steve', 'Rogers', '121-111-1111', 'iluvamerica@gmail.com', TRUE, TRUE),
    ('Spidey', 'webbed', 'Peter', 'Parker', '111-222-1222', 'spideysense@gmail.com', FALSE, FALSE),
    ('MFDOOM', 'kookies', 'Victor V.', 'DOOM', '111-222-3334', 'Doomsday@gmail.com', TRUE, TRUE),
    ('THEBrains', 'smash', 'Bruce', 'Banner', '111-212-3211', 'HulkSmash@gmail.com', FALSE, TRUE);

-- Insert Vendors
INSERT INTO Vendor (Code, Name, Address, City, State, Zip, PhoneNumber, Email) VALUES
    ('AVNGR', 'Avengers Co.', '1234 Sunset Drive', 'Manhattan', 'NY', '10005', '948-294-3945', 'AvengersOfc@gmail.com'),
    ('DOOM', 'Doctor Doom Labs', '1234 Vaudeville Drive', 'Chicago', 'IL', '60018', '321-643-8455', 'DOOMTech@gmail.com'),
    ('JSTLG', 'Justice League', '1234 Krillin Ct.', 'Detroit', 'MI', '48201', '543-654-2422', 'JustLeague@gmail.com');

-- Insert Products
INSERT INTO Product (VendorID, PartNumber, ProductName, Price, Unit, PhotoPath) VALUES
    (3, '342', 'Fake Kryptonite', 2.99, 'Thing', NULL),
    (1, '654', 'Shield', 299.99, 'Thing', NULL),
    (2, '543', 'DOOM Mask', 5000.01, 'Thing', NULL),
    (1, '111', 'Iron Man Gauntlet', 999.99, 'Thing', NULL),
    (1, '227', 'Mjolnir Replica', 149.99, 'Thing', NULL),
    (2, '781', 'Doom’s Ray Cannon', 4999.00, 'Thing', NULL),
    (2, '999', 'Latverian Armor', 3499.95, 'Thing', NULL),
    (3, '123', 'Batarang Deluxe Set', 79.99, 'Thing', NULL),
    (3, '888', 'Lasso of Truth Replica', 199.95, 'Thing', NULL);

-- Insert Request
INSERT INTO Request (UserID, RequestNumber, Description, Justification, DateNeeded, DeliveryMode, Status, Total, SubmittedDate, ReasonForRejection) VALUES
    (2, '22', 'DOOM Mask', 'Looks cool', '2025-02-03', 'pickup', 'New', 5000.01, NOW(), NULL);

-- Insert Line Items
INSERT INTO LineItem (RequestID, ProductID, Quantity) VALUES
    (1, 3, 2);
