DROP DATABASE IF EXISTS PRS;
CREATE DATABASE PRS;
USE PRS;

-- User Table
CREATE TABLE User (
    UserID          INT AUTO_INCREMENT PRIMARY KEY,
    Username        VARCHAR(20) NOT NULL UNIQUE,
    Password        VARCHAR(10) NOT NULL,
    FirstName       VARCHAR(20) NOT NULL,
    LastName        VARCHAR(20) NOT NULL,
    PhoneNumber     VARCHAR(12) NOT NULL,
    Email           VARCHAR(75) NOT NULL,
    Reviewer        BOOLEAN DEFAULT FALSE,
    Admin           BOOLEAN DEFAULT FALSE
);

-- Vendor Table
CREATE TABLE Vendor (
    VendorID        INT AUTO_INCREMENT PRIMARY KEY,
    Code            VARCHAR(10) NOT NULL UNIQUE,
    Name            VARCHAR(255) NOT NULL,
    Address         VARCHAR(255) NOT NULL,
    City            VARCHAR(255) NOT NULL,
    State           VARCHAR(2) NOT NULL,
    Zip             VARCHAR(5) NOT NULL,
    PhoneNumber     VARCHAR(12) NOT NULL,
    Email           VARCHAR(100) NOT NULL
);

-- Product Table
CREATE TABLE Product (
    ProductID       INT AUTO_INCREMENT PRIMARY KEY,
    VendorID        INT NOT NULL,
    PartNumber      VARCHAR(50) NOT NULL,
    ProductName     VARCHAR(150) NOT NULL,
    Price           DECIMAL(10,2) NOT NULL,
    Unit            VARCHAR(255),
    PhotoPath       VARCHAR(255),
    CONSTRAINT vendor_part UNIQUE (VendorID, PartNumber),
    CONSTRAINT FK_Product FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID) ON DELETE CASCADE
);

-- Request Table
CREATE TABLE Request (
    RequestID           INT AUTO_INCREMENT PRIMARY KEY,
    UserID              INT NOT NULL,
    RequestNumber       VARCHAR(20) NOT NULL,
    Description         VARCHAR(100) NOT NULL,
    Justification       VARCHAR(255) NOT NULL,
    DateNeeded          DATE NOT NULL,
    DeliveryMode        VARCHAR(25) NOT NULL,
    Status              VARCHAR(20) DEFAULT 'NEW',
    Total               DECIMAL(10,2) DEFAULT 0.0,
    SubmittedDate       DATETIME,
    ReasonForRejection  VARCHAR(100),
    CONSTRAINT FK_RequestUser FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
);

-- LineItem Table
CREATE TABLE LineItem (
    LineItemID      INT AUTO_INCREMENT PRIMARY KEY,
    RequestID       INT NOT NULL,
    ProductID       INT NOT NULL,
    Quantity        INT NOT NULL,
    CONSTRAINT req_pdt UNIQUE (RequestID, ProductID),
    CONSTRAINT FK_LineItemRequest FOREIGN KEY (RequestID) REFERENCES Request(RequestID) ON DELETE CASCADE,
    CONSTRAINT FK_LineItemProduct FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE
);
