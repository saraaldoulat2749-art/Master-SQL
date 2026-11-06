/* CarePlus: fresh database with 37 tables and demo records.
   Run ONCE in SSMS on a SQL Server instance where CarePlusSystemDB does not exist.
   INSERT INTO ... VALUES follows each CREATE TABLE.
   The database name is CarePlusSystemDB (not CarePlusDB).
*/



--CREATE DATABASE CarePlusSystemDB;
GO
USE CarePlusSystemDB;
GO

-- 01-09: Accounts, verification, providers and specialties

CREATE TABLE [Role] (
    RoleID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Role PRIMARY KEY,
    RoleName NVARCHAR(40) NOT NULL CONSTRAINT UQ_Role_RoleName UNIQUE
);
GO

-- Role (5 records)
INSERT INTO [Role] ([RoleName])
VALUES
    (N'Patient'),
    (N'Doctor'),
    (N'Nurse'),
    (N'Pharmacy'),
    (N'Admin');
GO


CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_User PRIMARY KEY,
    RoleID INT NOT NULL,
    FullName NVARCHAR(150) NOT NULL,
    Email NVARCHAR(254) NOT NULL,
    PasswordHash NVARCHAR(500) NOT NULL,
    Phone NVARCHAR(30) NULL,
    IsActive BIT NOT NULL CONSTRAINT DF_User_IsActive DEFAULT (1),
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_User_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_User_Role FOREIGN KEY (RoleID) REFERENCES [Role](RoleID)
);
GO
CREATE UNIQUE INDEX UX_User_Email ON [User](Email);
GO

-- User (41 records)
INSERT INTO [User] ([RoleID], [FullName], [Email], [PasswordHash], [Phone])
VALUES
    (1, N'Demo Patient 1', N'careplus.demo1@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000001'),
    (1, N'Demo Patient 2', N'careplus.demo2@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000002'),
    (1, N'Demo Patient 3', N'careplus.demo3@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000003'),
    (1, N'Demo Patient 4', N'careplus.demo4@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000004'),
    (1, N'Demo Patient 5', N'careplus.demo5@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000005'),
    (1, N'Demo Patient 6', N'careplus.demo6@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000006'),
    (1, N'Demo Patient 7', N'careplus.demo7@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000007'),
    (1, N'Demo Patient 8', N'careplus.demo8@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000008'),
    (1, N'Demo Patient 9', N'careplus.demo9@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000009'),
    (1, N'Demo Patient 10', N'careplus.demo10@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000010'),
    (2, N'Demo Doctor 1', N'careplus.demo11@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000011'),
    (2, N'Demo Doctor 2', N'careplus.demo12@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000012'),
    (2, N'Demo Doctor 3', N'careplus.demo13@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000013'),
    (2, N'Demo Doctor 4', N'careplus.demo14@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000014'),
    (2, N'Demo Doctor 5', N'careplus.demo15@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000015'),
    (2, N'Demo Doctor 6', N'careplus.demo16@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000016'),
    (2, N'Demo Doctor 7', N'careplus.demo17@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000017'),
    (2, N'Demo Doctor 8', N'careplus.demo18@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000018'),
    (2, N'Demo Doctor 9', N'careplus.demo19@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000019'),
    (2, N'Demo Doctor 10', N'careplus.demo20@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000020'),
    (3, N'Demo Nurse 1', N'careplus.demo21@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000021'),
    (3, N'Demo Nurse 2', N'careplus.demo22@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000022'),
    (3, N'Demo Nurse 3', N'careplus.demo23@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000023'),
    (3, N'Demo Nurse 4', N'careplus.demo24@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000024'),
    (3, N'Demo Nurse 5', N'careplus.demo25@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000025'),
    (3, N'Demo Nurse 6', N'careplus.demo26@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000026'),
    (3, N'Demo Nurse 7', N'careplus.demo27@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000027'),
    (3, N'Demo Nurse 8', N'careplus.demo28@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000028'),
    (3, N'Demo Nurse 9', N'careplus.demo29@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000029'),
    (3, N'Demo Nurse 10', N'careplus.demo30@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000030'),
    (4, N'Demo Pharmacy 1', N'careplus.demo31@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000031'),
    (4, N'Demo Pharmacy 2', N'careplus.demo32@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000032'),
    (4, N'Demo Pharmacy 3', N'careplus.demo33@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000033'),
    (4, N'Demo Pharmacy 4', N'careplus.demo34@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000034'),
    (4, N'Demo Pharmacy 5', N'careplus.demo35@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000035'),
    (4, N'Demo Pharmacy 6', N'careplus.demo36@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000036'),
    (4, N'Demo Pharmacy 7', N'careplus.demo37@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000037'),
    (4, N'Demo Pharmacy 8', N'careplus.demo38@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000038'),
    (4, N'Demo Pharmacy 9', N'careplus.demo39@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000039'),
    (4, N'Demo Pharmacy 10', N'careplus.demo40@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0790000040'),
    (5, N'Demo Administrator', N'careplus.admin@example.com', N'DEMO_HASH_NOT_FOR_LOGIN', N'0799999999');
GO


CREATE TABLE [Address] (
    AddressID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Address PRIMARY KEY,
    UserID INT NOT NULL,
    AddressLabel NVARCHAR(50) NULL,
    City NVARCHAR(80) NOT NULL,
    Area NVARCHAR(100) NOT NULL,
    Street NVARCHAR(150) NULL,
    BuildingNumber NVARCHAR(30) NULL,
    AdditionalDetails NVARCHAR(500) NULL,
    IsDefault BIT NOT NULL CONSTRAINT DF_Address_IsDefault DEFAULT (0),
    CONSTRAINT FK_Address_User FOREIGN KEY (UserID) REFERENCES [User](UserID)
);
GO
CREATE UNIQUE INDEX UX_Address_OneDefaultPerUser ON [Address](UserID) WHERE IsDefault = 1;
GO

-- Address (10 records)
INSERT INTO [Address] ([UserID], [AddressLabel], [City], [Area], [Street], [BuildingNumber], [AdditionalDetails], [IsDefault])
VALUES
    (1, N'Home', N'Amman', N'Area 1', N'Street 1', N'1', N'Demo address', 1),
    (2, N'Home', N'Amman', N'Area 2', N'Street 2', N'2', N'Demo address', 1),
    (3, N'Home', N'Amman', N'Area 3', N'Street 3', N'3', N'Demo address', 1),
    (4, N'Home', N'Amman', N'Area 4', N'Street 4', N'4', N'Demo address', 1),
    (5, N'Home', N'Amman', N'Area 5', N'Street 5', N'5', N'Demo address', 1),
    (6, N'Home', N'Amman', N'Area 6', N'Street 6', N'6', N'Demo address', 1),
    (7, N'Home', N'Amman', N'Area 7', N'Street 7', N'7', N'Demo address', 1),
    (8, N'Home', N'Amman', N'Area 8', N'Street 8', N'8', N'Demo address', 1),
    (9, N'Home', N'Amman', N'Area 9', N'Street 9', N'9', N'Demo address', 1),
    (10, N'Home', N'Amman', N'Area 10', N'Street 10', N'10', N'Demo address', 1);
GO


CREATE TABLE [Specialty] (
    SpecialtyID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Specialty PRIMARY KEY,
    SpecialtyName NVARCHAR(120) NOT NULL CONSTRAINT UQ_Specialty_Name UNIQUE
);
GO

-- Specialty (10 records)
INSERT INTO [Specialty] ([SpecialtyName])
VALUES
    (N'Cardiology'),
    (N'Dermatology'),
    (N'Pediatrics'),
    (N'Neurology'),
    (N'Ophthalmology'),
    (N'Orthopedics'),
    (N'ENT'),
    (N'Internal Medicine'),
    (N'Family Medicine'),
    (N'Psychiatry');
GO


CREATE TABLE [ProfessionalApplication] (
    ApplicationID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ProfessionalApplication PRIMARY KEY,
    UserID INT NOT NULL,
    RequestedRoleID INT NOT NULL,
    Status NVARCHAR(35) NOT NULL CONSTRAINT DF_ProfessionalApplication_Status DEFAULT N'Draft',
    UniversityName NVARCHAR(200) NULL,
    GraduationYear SMALLINT NULL,
    LicenseNumber NVARCHAR(100) NULL,
    LicenseExpiresAt DATE NULL, -- NULL: credential has no declared expiry
    ReviewReason NVARCHAR(1000) NULL,
    ReviewedByUserID INT NULL,
    ReviewedAt DATETIME2(0) NULL,
    SubmittedAt DATETIME2(0) NULL,
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_ProfessionalApplication_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_ProfessionalApplication_User FOREIGN KEY (UserID) REFERENCES [User](UserID),
    CONSTRAINT FK_ProfessionalApplication_RequestedRole FOREIGN KEY (RequestedRoleID) REFERENCES [Role](RoleID),
    CONSTRAINT FK_ProfessionalApplication_Reviewer FOREIGN KEY (ReviewedByUserID) REFERENCES [User](UserID),
    CONSTRAINT CK_ProfessionalApplication_Status CHECK (Status IN
        (N'Draft', N'Pending Verification', N'Additional Documents Required', N'Approved', N'Rejected')),
    CONSTRAINT CK_ProfessionalApplication_GraduationYear CHECK (GraduationYear IS NULL OR GraduationYear BETWEEN 1900 AND 2200)
);
GO

-- ProfessionalApplication (10 records)
INSERT INTO [ProfessionalApplication] ([UserID], [RequestedRoleID], [Status], [UniversityName], [GraduationYear], [LicenseNumber], [LicenseExpiresAt], [SubmittedAt])
VALUES
    (11, 2, N'Approved', N'Demo University', 2020, N'DOC-1', N'2029-12-31', N'2026-11-01 10:00:00'),
    (12, 2, N'Approved', N'Demo University', 2020, N'DOC-2', N'2029-12-31', N'2026-11-01 10:00:00'),
    (13, 2, N'Approved', N'Demo University', 2020, N'DOC-3', N'2029-12-31', N'2026-11-01 10:00:00'),
    (14, 2, N'Approved', N'Demo University', 2020, N'DOC-4', N'2029-12-31', N'2026-11-01 10:00:00'),
    (15, 2, N'Approved', N'Demo University', 2020, N'DOC-5', N'2029-12-31', N'2026-11-01 10:00:00'),
    (16, 2, N'Approved', N'Demo University', 2020, N'DOC-6', N'2029-12-31', N'2026-11-01 10:00:00'),
    (17, 2, N'Approved', N'Demo University', 2020, N'DOC-7', N'2029-12-31', N'2026-11-01 10:00:00'),
    (18, 2, N'Approved', N'Demo University', 2020, N'DOC-8', N'2029-12-31', N'2026-11-01 10:00:00'),
    (19, 2, N'Approved', N'Demo University', 2020, N'DOC-9', N'2029-12-31', N'2026-11-01 10:00:00'),
    (20, 2, N'Approved', N'Demo University', 2020, N'DOC-10', N'2029-12-31', N'2026-11-01 10:00:00');
GO


CREATE TABLE [Document] (
    DocumentID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Document PRIMARY KEY,
    ApplicationID INT NOT NULL,
    DocumentType NVARCHAR(80) NOT NULL,
    FileUrl NVARCHAR(1000) NOT NULL,
    VerificationStatus NVARCHAR(25) NOT NULL CONSTRAINT DF_Document_VerificationStatus DEFAULT N'Pending',
    UploadedAt DATETIME2(0) NOT NULL CONSTRAINT DF_Document_UploadedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_Document_ProfessionalApplication FOREIGN KEY (ApplicationID) REFERENCES [ProfessionalApplication](ApplicationID),
    CONSTRAINT CK_Document_VerificationStatus CHECK (VerificationStatus IN (N'Pending', N'Approved', N'Rejected'))
);
GO

-- Document (10 records)
INSERT INTO [Document] ([ApplicationID], [DocumentType], [FileUrl], [VerificationStatus])
VALUES
    (1, N'Practice License', N'/demo/license-1.pdf', N'Approved'),
    (2, N'Practice License', N'/demo/license-2.pdf', N'Approved'),
    (3, N'Practice License', N'/demo/license-3.pdf', N'Approved'),
    (4, N'Practice License', N'/demo/license-4.pdf', N'Approved'),
    (5, N'Practice License', N'/demo/license-5.pdf', N'Approved'),
    (6, N'Practice License', N'/demo/license-6.pdf', N'Approved'),
    (7, N'Practice License', N'/demo/license-7.pdf', N'Approved'),
    (8, N'Practice License', N'/demo/license-8.pdf', N'Approved'),
    (9, N'Practice License', N'/demo/license-9.pdf', N'Approved'),
    (10, N'Practice License', N'/demo/license-10.pdf', N'Approved');
GO


CREATE TABLE [DoctorProfile] (
    DoctorID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DoctorProfile PRIMARY KEY,
    UserID INT NOT NULL CONSTRAINT UQ_DoctorProfile_User UNIQUE,
    SpecialtyID INT NOT NULL,
    ClinicName NVARCHAR(160) NOT NULL,
    ClinicAddress NVARCHAR(500) NOT NULL,
    ConsultationFee DECIMAL(12,2) NOT NULL,
    IsAvailable BIT NOT NULL CONSTRAINT DF_DoctorProfile_IsAvailable DEFAULT (1),
    CONSTRAINT FK_DoctorProfile_User FOREIGN KEY (UserID) REFERENCES [User](UserID),
    CONSTRAINT FK_DoctorProfile_Specialty FOREIGN KEY (SpecialtyID) REFERENCES [Specialty](SpecialtyID),
    CONSTRAINT CK_DoctorProfile_ConsultationFee CHECK (ConsultationFee >= 0)
);
GO

-- DoctorProfile (10 records)
INSERT INTO [DoctorProfile] ([UserID], [SpecialtyID], [ClinicName], [ClinicAddress], [ConsultationFee])
VALUES
    (11, 1, N'Demo Clinic 1', N'Amman, Street 1', 21),
    (12, 2, N'Demo Clinic 2', N'Amman, Street 2', 22),
    (13, 3, N'Demo Clinic 3', N'Amman, Street 3', 23),
    (14, 4, N'Demo Clinic 4', N'Amman, Street 4', 24),
    (15, 5, N'Demo Clinic 5', N'Amman, Street 5', 25),
    (16, 6, N'Demo Clinic 6', N'Amman, Street 6', 26),
    (17, 7, N'Demo Clinic 7', N'Amman, Street 7', 27),
    (18, 8, N'Demo Clinic 8', N'Amman, Street 8', 28),
    (19, 9, N'Demo Clinic 9', N'Amman, Street 9', 29),
    (20, 10, N'Demo Clinic 10', N'Amman, Street 10', 30);
GO


CREATE TABLE [NurseProfile] (
    NurseID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_NurseProfile PRIMARY KEY,
    UserID INT NOT NULL CONSTRAINT UQ_NurseProfile_User UNIQUE,
    ServiceArea NVARCHAR(200) NULL,
    HourlyRate DECIMAL(12,2) NOT NULL,
    IsAvailable BIT NOT NULL CONSTRAINT DF_NurseProfile_IsAvailable DEFAULT (1),
    CONSTRAINT FK_NurseProfile_User FOREIGN KEY (UserID) REFERENCES [User](UserID),
    CONSTRAINT CK_NurseProfile_HourlyRate CHECK (HourlyRate >= 0)
);
GO

-- NurseProfile (10 records)
INSERT INTO [NurseProfile] ([UserID], [ServiceArea], [HourlyRate])
VALUES
    (21, N'Amman', 9),
    (22, N'Amman', 10),
    (23, N'Amman', 11),
    (24, N'Amman', 12),
    (25, N'Amman', 13),
    (26, N'Amman', 14),
    (27, N'Amman', 15),
    (28, N'Amman', 16),
    (29, N'Amman', 17),
    (30, N'Amman', 18);
GO


CREATE TABLE [Pharmacy] (
    PharmacyID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Pharmacy PRIMARY KEY,
    UserID INT NOT NULL CONSTRAINT UQ_Pharmacy_User UNIQUE,
    PharmacyName NVARCHAR(200) NOT NULL,
    AddressText NVARCHAR(500) NOT NULL,
    IsOpen BIT NOT NULL CONSTRAINT DF_Pharmacy_IsOpen DEFAULT (0),
    IsActive BIT NOT NULL CONSTRAINT DF_Pharmacy_IsActive DEFAULT (1),
    CONSTRAINT FK_Pharmacy_User FOREIGN KEY (UserID) REFERENCES [User](UserID)
);
GO

-- 10-17: Appointments, care, nurses

-- Pharmacy (10 records)
INSERT INTO [Pharmacy] ([UserID], [PharmacyName], [AddressText], [IsOpen])
VALUES
    (31, N'Demo Pharmacy 1', N'Amman, Area 1', 1),
    (32, N'Demo Pharmacy 2', N'Amman, Area 2', 1),
    (33, N'Demo Pharmacy 3', N'Amman, Area 3', 1),
    (34, N'Demo Pharmacy 4', N'Amman, Area 4', 1),
    (35, N'Demo Pharmacy 5', N'Amman, Area 5', 1),
    (36, N'Demo Pharmacy 6', N'Amman, Area 6', 1),
    (37, N'Demo Pharmacy 7', N'Amman, Area 7', 1),
    (38, N'Demo Pharmacy 8', N'Amman, Area 8', 1),
    (39, N'Demo Pharmacy 9', N'Amman, Area 9', 1),
    (40, N'Demo Pharmacy 10', N'Amman, Area 10', 1);
GO


CREATE TABLE [DoctorSchedule] (
    ScheduleID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DoctorSchedule PRIMARY KEY,
    DoctorID INT NOT NULL,
    DayOfWeek TINYINT NOT NULL, -- 1=Monday ... 7=Sunday
    StartTime TIME(0) NOT NULL,
    EndTime TIME(0) NOT NULL,
    BreakStart TIME(0) NULL,
    BreakEnd TIME(0) NULL,
    CONSTRAINT FK_DoctorSchedule_Doctor FOREIGN KEY (DoctorID) REFERENCES [DoctorProfile](DoctorID),
    CONSTRAINT UQ_DoctorSchedule_DoctorDayStart UNIQUE (DoctorID, DayOfWeek, StartTime),
    CONSTRAINT CK_DoctorSchedule_Day CHECK (DayOfWeek BETWEEN 1 AND 7),
    CONSTRAINT CK_DoctorSchedule_Hours CHECK (StartTime < EndTime),
    CONSTRAINT CK_DoctorSchedule_Break CHECK (
        (BreakStart IS NULL AND BreakEnd IS NULL) OR
        (BreakStart IS NOT NULL AND BreakEnd IS NOT NULL AND StartTime <= BreakStart AND BreakStart < BreakEnd AND BreakEnd <= EndTime))
);
GO

-- DoctorSchedule (10 records)
INSERT INTO [DoctorSchedule] ([DoctorID], [DayOfWeek], [StartTime], [EndTime], [BreakStart], [BreakEnd])
VALUES
    (1, 1, N'09:00', N'17:00', N'12:00', N'13:00'),
    (2, 1, N'09:00', N'17:00', N'12:00', N'13:00'),
    (3, 1, N'09:00', N'17:00', N'12:00', N'13:00'),
    (4, 1, N'09:00', N'17:00', N'12:00', N'13:00'),
    (5, 1, N'09:00', N'17:00', N'12:00', N'13:00'),
    (6, 1, N'09:00', N'17:00', N'12:00', N'13:00'),
    (7, 1, N'09:00', N'17:00', N'12:00', N'13:00'),
    (8, 1, N'09:00', N'17:00', N'12:00', N'13:00'),
    (9, 1, N'09:00', N'17:00', N'12:00', N'13:00'),
    (10, 1, N'09:00', N'17:00', N'12:00', N'13:00');
GO


CREATE TABLE [DoctorTimeOff] (
    TimeOffID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DoctorTimeOff PRIMARY KEY,
    DoctorID INT NOT NULL,
    StartAt DATETIME2(0) NOT NULL,
    EndAt DATETIME2(0) NOT NULL,
    Reason NVARCHAR(300) NULL,
    CONSTRAINT FK_DoctorTimeOff_Doctor FOREIGN KEY (DoctorID) REFERENCES [DoctorProfile](DoctorID),
    CONSTRAINT CK_DoctorTimeOff_Range CHECK (StartAt < EndAt)
);
GO

-- DoctorTimeOff (10 records)
INSERT INTO [DoctorTimeOff] ([DoctorID], [StartAt], [EndAt], [Reason])
VALUES
    (1, N'2027-03-01 09:00:00', N'2027-03-02 09:00:00', N'Demo leave'),
    (2, N'2027-03-02 09:00:00', N'2027-03-03 09:00:00', N'Demo leave'),
    (3, N'2027-03-03 09:00:00', N'2027-03-04 09:00:00', N'Demo leave'),
    (4, N'2027-03-04 09:00:00', N'2027-03-05 09:00:00', N'Demo leave'),
    (5, N'2027-03-05 09:00:00', N'2027-03-06 09:00:00', N'Demo leave'),
    (6, N'2027-03-06 09:00:00', N'2027-03-07 09:00:00', N'Demo leave'),
    (7, N'2027-03-07 09:00:00', N'2027-03-08 09:00:00', N'Demo leave'),
    (8, N'2027-03-08 09:00:00', N'2027-03-09 09:00:00', N'Demo leave'),
    (9, N'2027-03-09 09:00:00', N'2027-03-10 09:00:00', N'Demo leave'),
    (10, N'2027-03-10 09:00:00', N'2027-03-11 09:00:00', N'Demo leave');
GO


CREATE TABLE [Appointment] (
    AppointmentID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Appointment PRIMARY KEY,
    PatientUserID INT NOT NULL,
    DoctorID INT NOT NULL,
    StartsAt DATETIME2(0) NOT NULL,
    EndsAt DATETIME2(0) NOT NULL,
    ConsultationFee DECIMAL(12,2) NOT NULL,
    DepositAmount DECIMAL(12,2) NOT NULL CONSTRAINT DF_Appointment_Deposit DEFAULT (0),
    PaymentDueAt DATETIME2(0) NULL,
    Status NVARCHAR(25) NOT NULL CONSTRAINT DF_Appointment_Status DEFAULT N'Pending',
    CancelledAt DATETIME2(0) NULL,
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_Appointment_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_Appointment_Patient FOREIGN KEY (PatientUserID) REFERENCES [User](UserID),
    CONSTRAINT FK_Appointment_Doctor FOREIGN KEY (DoctorID) REFERENCES [DoctorProfile](DoctorID),
    CONSTRAINT CK_Appointment_Time CHECK (StartsAt < EndsAt),
    CONSTRAINT CK_Appointment_Fees CHECK (ConsultationFee >= 0 AND DepositAmount >= 0 AND DepositAmount <= ConsultationFee),
    CONSTRAINT CK_Appointment_Status CHECK (Status IN (N'Pending', N'Accepted', N'Awaiting Payment', N'Confirmed', N'Rejected', N'Cancelled', N'Expired', N'Completed'))
);
GO
CREATE INDEX IX_Appointment_DoctorTime ON [Appointment](DoctorID, StartsAt, EndsAt) INCLUDE (Status);
GO

-- Appointment (10 records)
INSERT INTO [Appointment] ([PatientUserID], [DoctorID], [StartsAt], [EndsAt], [ConsultationFee], [DepositAmount], [PaymentDueAt], [Status])
VALUES
    (1, 1, N'2027-04-01 10:00:00', N'2027-04-01 11:00:00', 21, 5, N'2027-04-01 09:00:00', N'Confirmed'),
    (2, 2, N'2027-04-02 10:00:00', N'2027-04-02 11:00:00', 22, 5, N'2027-04-01 09:00:00', N'Confirmed'),
    (3, 3, N'2027-04-03 10:00:00', N'2027-04-03 11:00:00', 23, 5, N'2027-04-01 09:00:00', N'Confirmed'),
    (4, 4, N'2027-04-04 10:00:00', N'2027-04-04 11:00:00', 24, 5, N'2027-04-01 09:00:00', N'Confirmed'),
    (5, 5, N'2027-04-05 10:00:00', N'2027-04-05 11:00:00', 25, 5, N'2027-04-01 09:00:00', N'Confirmed'),
    (6, 6, N'2027-04-06 10:00:00', N'2027-04-06 11:00:00', 26, 5, N'2027-04-01 09:00:00', N'Confirmed'),
    (7, 7, N'2027-04-07 10:00:00', N'2027-04-07 11:00:00', 27, 5, N'2027-04-01 09:00:00', N'Confirmed'),
    (8, 8, N'2027-04-08 10:00:00', N'2027-04-08 11:00:00', 28, 5, N'2027-04-01 09:00:00', N'Confirmed'),
    (9, 9, N'2027-04-09 10:00:00', N'2027-04-09 11:00:00', 29, 5, N'2027-04-01 09:00:00', N'Confirmed'),
    (10, 10, N'2027-04-10 10:00:00', N'2027-04-10 11:00:00', 30, 5, N'2027-04-01 09:00:00', N'Confirmed');
GO


CREATE TABLE [NurseSchedule] (
    NurseScheduleID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_NurseSchedule PRIMARY KEY,
    NurseID INT NOT NULL,
    DayOfWeek TINYINT NOT NULL,
    StartTime TIME(0) NOT NULL,
    EndTime TIME(0) NOT NULL,
    CONSTRAINT FK_NurseSchedule_Nurse FOREIGN KEY (NurseID) REFERENCES [NurseProfile](NurseID),
    CONSTRAINT UQ_NurseSchedule_NurseDayStart UNIQUE (NurseID, DayOfWeek, StartTime),
    CONSTRAINT CK_NurseSchedule_Day CHECK (DayOfWeek BETWEEN 1 AND 7),
    CONSTRAINT CK_NurseSchedule_Time CHECK (StartTime < EndTime)
);
GO

-- NurseSchedule (10 records)
INSERT INTO [NurseSchedule] ([NurseID], [DayOfWeek], [StartTime], [EndTime])
VALUES
    (1, 2, N'08:00', N'18:00'),
    (2, 2, N'08:00', N'18:00'),
    (3, 2, N'08:00', N'18:00'),
    (4, 2, N'08:00', N'18:00'),
    (5, 2, N'08:00', N'18:00'),
    (6, 2, N'08:00', N'18:00'),
    (7, 2, N'08:00', N'18:00'),
    (8, 2, N'08:00', N'18:00'),
    (9, 2, N'08:00', N'18:00'),
    (10, 2, N'08:00', N'18:00');
GO


CREATE TABLE [CareService] (
    CareServiceID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_CareService PRIMARY KEY,
    ServiceName NVARCHAR(150) NOT NULL,
    Description NVARCHAR(1000) NULL,
    IsActive BIT NOT NULL CONSTRAINT DF_CareService_IsActive DEFAULT (1)
);
GO

-- CareService (10 records)
INSERT INTO [CareService] ([ServiceName], [Description])
VALUES
    (N'Demo Care Service 1', N'Home care demonstration'),
    (N'Demo Care Service 2', N'Home care demonstration'),
    (N'Demo Care Service 3', N'Home care demonstration'),
    (N'Demo Care Service 4', N'Home care demonstration'),
    (N'Demo Care Service 5', N'Home care demonstration'),
    (N'Demo Care Service 6', N'Home care demonstration'),
    (N'Demo Care Service 7', N'Home care demonstration'),
    (N'Demo Care Service 8', N'Home care demonstration'),
    (N'Demo Care Service 9', N'Home care demonstration'),
    (N'Demo Care Service 10', N'Home care demonstration');
GO


CREATE TABLE [CareRequest] (
    CareRequestID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_CareRequest PRIMARY KEY,
    PatientUserID INT NOT NULL,
    CareServiceID INT NOT NULL,
    PreferredNurseID INT NULL,
    AddressID INT NULL,
    VisitAddressSnapshot NVARCHAR(700) NOT NULL,
    ElderlyName NVARCHAR(150) NOT NULL,
    ElderlyAge SMALLINT NULL,
    PreferredStartAt DATETIME2(0) NOT NULL,
    DurationHours DECIMAL(5,2) NOT NULL,
    QuotedTotal DECIMAL(12,2) NOT NULL,
    Status NVARCHAR(25) NOT NULL CONSTRAINT DF_CareRequest_Status DEFAULT N'Pending',
    CancelledAt DATETIME2(0) NULL,
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_CareRequest_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_CareRequest_Patient FOREIGN KEY (PatientUserID) REFERENCES [User](UserID),
    CONSTRAINT FK_CareRequest_Service FOREIGN KEY (CareServiceID) REFERENCES [CareService](CareServiceID),
    CONSTRAINT FK_CareRequest_PreferredNurse FOREIGN KEY (PreferredNurseID) REFERENCES [NurseProfile](NurseID),
    CONSTRAINT FK_CareRequest_Address FOREIGN KEY (AddressID) REFERENCES [Address](AddressID),
    CONSTRAINT CK_CareRequest_Age CHECK (ElderlyAge IS NULL OR ElderlyAge BETWEEN 0 AND 130),
    CONSTRAINT CK_CareRequest_MoneyTime CHECK (DurationHours > 0 AND QuotedTotal >= 0),
    CONSTRAINT CK_CareRequest_Status CHECK (Status IN (N'Pending', N'Accepted', N'Awaiting Payment', N'Confirmed', N'Rejected', N'Cancelled', N'Expired', N'In Progress', N'Completed'))
);
GO

-- CareRequest (10 records)
INSERT INTO [CareRequest] ([PatientUserID], [CareServiceID], [PreferredNurseID], [AddressID], [VisitAddressSnapshot], [ElderlyName], [ElderlyAge], [PreferredStartAt], [DurationHours], [QuotedTotal], [Status])
VALUES
    (1, 1, 1, 1, N'Amman, Demo Address 1', N'Elder 1', 71, N'2027-05-01 09:00:00', 3, 31, N'Confirmed'),
    (2, 2, 2, 2, N'Amman, Demo Address 2', N'Elder 2', 72, N'2027-05-02 09:00:00', 3, 32, N'Confirmed'),
    (3, 3, 3, 3, N'Amman, Demo Address 3', N'Elder 3', 73, N'2027-05-03 09:00:00', 3, 33, N'Confirmed'),
    (4, 4, 4, 4, N'Amman, Demo Address 4', N'Elder 4', 74, N'2027-05-04 09:00:00', 3, 34, N'Confirmed'),
    (5, 5, 5, 5, N'Amman, Demo Address 5', N'Elder 5', 75, N'2027-05-05 09:00:00', 3, 35, N'Confirmed'),
    (6, 6, 6, 6, N'Amman, Demo Address 6', N'Elder 6', 76, N'2027-05-06 09:00:00', 3, 36, N'Confirmed'),
    (7, 7, 7, 7, N'Amman, Demo Address 7', N'Elder 7', 77, N'2027-05-07 09:00:00', 3, 37, N'Confirmed'),
    (8, 8, 8, 8, N'Amman, Demo Address 8', N'Elder 8', 78, N'2027-05-08 09:00:00', 3, 38, N'Confirmed'),
    (9, 9, 9, 9, N'Amman, Demo Address 9', N'Elder 9', 79, N'2027-05-09 09:00:00', 3, 39, N'Confirmed'),
    (10, 10, 10, 10, N'Amman, Demo Address 10', N'Elder 10', 80, N'2027-05-10 09:00:00', 3, 40, N'Confirmed');
GO


CREATE TABLE [CareAssignment] (
    AssignmentID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_CareAssignment PRIMARY KEY,
    CareRequestID INT NOT NULL,
    NurseID INT NOT NULL,
    Decision NVARCHAR(20) NOT NULL CONSTRAINT DF_CareAssignment_Decision DEFAULT N'Pending',
    DecidedAt DATETIME2(0) NULL,
    DepositDueAt DATETIME2(0) NULL,
    CONSTRAINT FK_CareAssignment_Request FOREIGN KEY (CareRequestID) REFERENCES [CareRequest](CareRequestID),
    CONSTRAINT FK_CareAssignment_Nurse FOREIGN KEY (NurseID) REFERENCES [NurseProfile](NurseID),
    CONSTRAINT UQ_CareAssignment_RequestNurse UNIQUE (CareRequestID, NurseID),
    CONSTRAINT CK_CareAssignment_Decision CHECK (Decision IN (N'Pending', N'Accepted', N'Rejected', N'Cancelled'))
);
GO
CREATE UNIQUE INDEX UX_CareAssignment_OneAccepted ON [CareAssignment](CareRequestID) WHERE Decision = N'Accepted';
GO

-- CareAssignment (10 records)
INSERT INTO [CareAssignment] ([CareRequestID], [NurseID], [Decision], [DecidedAt], [DepositDueAt])
VALUES
    (1, 1, N'Accepted', N'2026-11-02 10:00:00', N'2027-05-01 10:00:00'),
    (2, 2, N'Accepted', N'2026-11-02 10:00:00', N'2027-05-01 10:00:00'),
    (3, 3, N'Accepted', N'2026-11-02 10:00:00', N'2027-05-01 10:00:00'),
    (4, 4, N'Accepted', N'2026-11-02 10:00:00', N'2027-05-01 10:00:00'),
    (5, 5, N'Accepted', N'2026-11-02 10:00:00', N'2027-05-01 10:00:00'),
    (6, 6, N'Accepted', N'2026-11-02 10:00:00', N'2027-05-01 10:00:00'),
    (7, 7, N'Accepted', N'2026-11-02 10:00:00', N'2027-05-01 10:00:00'),
    (8, 8, N'Accepted', N'2026-11-02 10:00:00', N'2027-05-01 10:00:00'),
    (9, 9, N'Accepted', N'2026-11-02 10:00:00', N'2027-05-01 10:00:00'),
    (10, 10, N'Accepted', N'2026-11-02 10:00:00', N'2027-05-01 10:00:00');
GO


CREATE TABLE [CareVisit] (
    VisitID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_CareVisit PRIMARY KEY,
    AssignmentID INT NOT NULL CONSTRAINT UQ_CareVisit_Assignment UNIQUE,
    StartedAt DATETIME2(0) NULL,
    EndedAt DATETIME2(0) NULL,
    Status NVARCHAR(20) NOT NULL CONSTRAINT DF_CareVisit_Status DEFAULT N'Not Started',
    CONSTRAINT FK_CareVisit_Assignment FOREIGN KEY (AssignmentID) REFERENCES [CareAssignment](AssignmentID),
    CONSTRAINT CK_CareVisit_Times CHECK (EndedAt IS NULL OR (StartedAt IS NOT NULL AND EndedAt >= StartedAt)),
    CONSTRAINT CK_CareVisit_Status CHECK (Status IN (N'Not Started', N'In Progress', N'Completed', N'Cancelled'))
);
GO

-- 18-24: Pharmacy medicines, store catalog and carts

-- CareVisit (10 records)
INSERT INTO [CareVisit] ([AssignmentID], [StartedAt], [EndedAt], [Status])
VALUES
    (1, NULL, NULL, N'Not Started'),
    (2, NULL, NULL, N'Not Started'),
    (3, NULL, NULL, N'Not Started'),
    (4, NULL, NULL, N'Not Started'),
    (5, NULL, NULL, N'Not Started'),
    (6, NULL, NULL, N'Not Started'),
    (7, NULL, NULL, N'Not Started'),
    (8, NULL, NULL, N'Not Started'),
    (9, NULL, NULL, N'Not Started'),
    (10, NULL, NULL, N'Not Started');
GO


CREATE TABLE [Medicine] (
    MedicineID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Medicine PRIMARY KEY,
    MedicineName NVARCHAR(200) NOT NULL,
    Strength NVARCHAR(80) NULL,
    DosageForm NVARCHAR(80) NULL,
    IsActive BIT NOT NULL CONSTRAINT DF_Medicine_IsActive DEFAULT (1)
);
GO
CREATE INDEX IX_Medicine_Name ON [Medicine](MedicineName);
GO

-- Medicine (10 records)
INSERT INTO [Medicine] ([MedicineName], [Strength], [DosageForm])
VALUES
    (N'Paracetamol', N'500 mg', N'Tablet'),
    (N'Ibuprofen', N'500 mg', N'Tablet'),
    (N'Amoxicillin', N'500 mg', N'Tablet'),
    (N'Cetirizine', N'500 mg', N'Tablet'),
    (N'Omeprazole', N'500 mg', N'Tablet'),
    (N'Metformin', N'500 mg', N'Tablet'),
    (N'Loratadine', N'500 mg', N'Tablet'),
    (N'Vitamin C', N'500 mg', N'Tablet'),
    (N'Aspirin', N'500 mg', N'Tablet'),
    (N'Saline Solution', N'500 mg', N'Tablet');
GO


CREATE TABLE [PharmacyMedicine] (
    PharmacyMedicineID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_PharmacyMedicine PRIMARY KEY,
    PharmacyID INT NOT NULL,
    MedicineID INT NOT NULL,
    UnitPrice DECIMAL(12,2) NOT NULL,
    IsListed BIT NOT NULL CONSTRAINT DF_PharmacyMedicine_IsListed DEFAULT (1),
    CONSTRAINT FK_PharmacyMedicine_Pharmacy FOREIGN KEY (PharmacyID) REFERENCES [Pharmacy](PharmacyID),
    CONSTRAINT FK_PharmacyMedicine_Medicine FOREIGN KEY (MedicineID) REFERENCES [Medicine](MedicineID),
    CONSTRAINT UQ_PharmacyMedicine_Offer UNIQUE (PharmacyID, MedicineID),
    CONSTRAINT CK_PharmacyMedicine_Price CHECK (UnitPrice >= 0)
);
GO

-- PharmacyMedicine (10 records)
INSERT INTO [PharmacyMedicine] ([PharmacyID], [MedicineID], [UnitPrice])
VALUES
    (1, 1, 3),
    (2, 2, 4),
    (3, 3, 5),
    (4, 4, 6),
    (5, 5, 7),
    (6, 6, 8),
    (7, 7, 9),
    (8, 8, 10),
    (9, 9, 11),
    (10, 10, 12);
GO


CREATE TABLE [InventoryBatch] (
    BatchID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_InventoryBatch PRIMARY KEY,
    PharmacyMedicineID INT NOT NULL,
    BatchNumber NVARCHAR(100) NOT NULL,
    ExpiresAt DATE NOT NULL,
    QuantityAvailable INT NOT NULL CONSTRAINT DF_InventoryBatch_Quantity DEFAULT (0),
    CONSTRAINT FK_InventoryBatch_Offer FOREIGN KEY (PharmacyMedicineID) REFERENCES [PharmacyMedicine](PharmacyMedicineID),
    CONSTRAINT UQ_InventoryBatch_OfferBatch UNIQUE (PharmacyMedicineID, BatchNumber),
    CONSTRAINT CK_InventoryBatch_Quantity CHECK (QuantityAvailable >= 0)
);
GO

-- InventoryBatch (10 records)
INSERT INTO [InventoryBatch] ([PharmacyMedicineID], [BatchNumber], [ExpiresAt], [QuantityAvailable])
VALUES
    (1, N'BATCH-1', N'2028-12-31', 51),
    (2, N'BATCH-2', N'2028-12-31', 52),
    (3, N'BATCH-3', N'2028-12-31', 53),
    (4, N'BATCH-4', N'2028-12-31', 54),
    (5, N'BATCH-5', N'2028-12-31', 55),
    (6, N'BATCH-6', N'2028-12-31', 56),
    (7, N'BATCH-7', N'2028-12-31', 57),
    (8, N'BATCH-8', N'2028-12-31', 58),
    (9, N'BATCH-9', N'2028-12-31', 59),
    (10, N'BATCH-10', N'2028-12-31', 60);
GO


CREATE TABLE [Category] (
    CategoryID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Category PRIMARY KEY,
    CategoryName NVARCHAR(120) NOT NULL CONSTRAINT UQ_Category_Name UNIQUE
);
GO

-- Category (10 records)
INSERT INTO [Category] ([CategoryName])
VALUES
    (N'First Aid'),
    (N'Medical Devices'),
    (N'Personal Care'),
    (N'Vitamins'),
    (N'Mobility'),
    (N'Hygiene'),
    (N'Baby Care'),
    (N'Skincare'),
    (N'Home Care'),
    (N'Wellness');
GO


CREATE TABLE [Product] (
    ProductID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Product PRIMARY KEY,
    CategoryID INT NOT NULL,
    ProductName NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    UnitPrice DECIMAL(12,2) NOT NULL,
    StockQuantity INT NOT NULL CONSTRAINT DF_Product_Stock DEFAULT (0),
    IsActive BIT NOT NULL CONSTRAINT DF_Product_IsActive DEFAULT (1),
    CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryID) REFERENCES [Category](CategoryID),
    CONSTRAINT CK_Product_UnitPrice CHECK (UnitPrice >= 0),
    CONSTRAINT CK_Product_Stock CHECK (StockQuantity >= 0)
);
GO

-- Product (10 records)
INSERT INTO [Product] ([CategoryID], [ProductName], [Description], [UnitPrice], [StockQuantity])
VALUES
    (1, N'Demo Product 1', N'Demo medical store product', 11, 101),
    (2, N'Demo Product 2', N'Demo medical store product', 12, 102),
    (3, N'Demo Product 3', N'Demo medical store product', 13, 103),
    (4, N'Demo Product 4', N'Demo medical store product', 14, 104),
    (5, N'Demo Product 5', N'Demo medical store product', 15, 105),
    (6, N'Demo Product 6', N'Demo medical store product', 16, 106),
    (7, N'Demo Product 7', N'Demo medical store product', 17, 107),
    (8, N'Demo Product 8', N'Demo medical store product', 18, 108),
    (9, N'Demo Product 9', N'Demo medical store product', 19, 109),
    (10, N'Demo Product 10', N'Demo medical store product', 20, 110);
GO


CREATE TABLE [ProductImage] (
    ProductImageID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ProductImage PRIMARY KEY,
    ProductID INT NOT NULL,
    ImageUrl NVARCHAR(1000) NOT NULL,
    IsPrimary BIT NOT NULL CONSTRAINT DF_ProductImage_IsPrimary DEFAULT (0),
    SortOrder INT NOT NULL CONSTRAINT DF_ProductImage_SortOrder DEFAULT (0),
    CONSTRAINT FK_ProductImage_Product FOREIGN KEY (ProductID) REFERENCES [Product](ProductID),
    CONSTRAINT CK_ProductImage_SortOrder CHECK (SortOrder >= 0)
);
GO
CREATE UNIQUE INDEX UX_ProductImage_OnePrimary ON [ProductImage](ProductID) WHERE IsPrimary = 1;
GO

-- ProductImage (10 records)
INSERT INTO [ProductImage] ([ProductID], [ImageUrl], [IsPrimary], [SortOrder])
INSERT INTO [ProductImage] ([ProductID], [ImageUrl], [IsPrimary], [SortOrder])
VALUES
    (1, N'/demo/product-1.jpg', 1, 0),
    (2, N'/demo/product-2.jpg', 1, 0),
    (3, N'/demo/product-3.jpg', 1, 0),
    (4, N'/demo/product-4.jpg', 1, 0),
    (5, N'/demo/product-5.jpg', 1, 0),
    (6, N'/demo/product-6.jpg', 1, 0),
    (7, N'/demo/product-7.jpg', 1, 0),
    (8, N'/demo/product-8.jpg', 1, 0),
    (9, N'/demo/product-9.jpg', 1, 0),
    (10, N'/demo/product-10.jpg', 1, 0);
GO


CREATE TABLE [Cart] (
    CartID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Cart PRIMARY KEY,
    UserID INT NOT NULL CONSTRAINT UQ_Cart_User UNIQUE,
    UpdatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_Cart_UpdatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_Cart_User FOREIGN KEY (UserID) REFERENCES [User](UserID)
);
GO

-- Cart (10 records)
INSERT INTO [Cart] ([UserID])
VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10);
GO


CREATE TABLE [CartItem] (
    CartItemID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_CartItem PRIMARY KEY,
    CartID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT FK_CartItem_Cart FOREIGN KEY (CartID) REFERENCES [Cart](CartID),
    CONSTRAINT FK_CartItem_Product FOREIGN KEY (ProductID) REFERENCES [Product](ProductID),
    CONSTRAINT UQ_CartItem_CartProduct UNIQUE (CartID, ProductID),
    CONSTRAINT CK_CartItem_Quantity CHECK (Quantity > 0)
);
GO

-- 25-28: Pharmacy and store orders

-- CartItem (10 records)
INSERT INTO [CartItem] ([CartID], [ProductID], [Quantity])
VALUES
    (1, 1, 1),
    (2, 2, 1),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 1),
    (6, 6, 1),
    (7, 7, 1),
    (8, 8, 1),
    (9, 9, 1),
    (10, 10, 1);
GO


CREATE TABLE [PharmacyOrder] (
    PharmacyOrderID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_PharmacyOrder PRIMARY KEY,
    PatientUserID INT NOT NULL,
    PharmacyID INT NOT NULL,
    AddressID INT NULL,
    DeliveryAddressSnapshot NVARCHAR(700) NOT NULL,
    TotalAmount DECIMAL(12,2) NOT NULL,
    Status NVARCHAR(25) NOT NULL CONSTRAINT DF_PharmacyOrder_Status DEFAULT N'Pending',
    DeliveryStatus NVARCHAR(25) NOT NULL CONSTRAINT DF_PharmacyOrder_DeliveryStatus DEFAULT N'Not Started',
    DeliveredAt DATETIME2(0) NULL,
    CancelledAt DATETIME2(0) NULL,
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_PharmacyOrder_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_PharmacyOrder_Patient FOREIGN KEY (PatientUserID) REFERENCES [User](UserID),
    CONSTRAINT FK_PharmacyOrder_Pharmacy FOREIGN KEY (PharmacyID) REFERENCES [Pharmacy](PharmacyID),
    CONSTRAINT FK_PharmacyOrder_Address FOREIGN KEY (AddressID) REFERENCES [Address](AddressID),
    CONSTRAINT CK_PharmacyOrder_Total CHECK (TotalAmount >= 0),
    CONSTRAINT CK_PharmacyOrder_Status CHECK (Status IN (N'Pending', N'Accepted', N'Rejected', N'Cancelled', N'Preparing', N'Out for Delivery', N'Completed')),
    CONSTRAINT CK_PharmacyOrder_Delivery CHECK (DeliveryStatus IN (N'Not Started', N'Preparing', N'Out for Delivery', N'Delivered', N'Cancelled'))
);
GO

-- PharmacyOrder (10 records)
INSERT INTO [PharmacyOrder] ([PatientUserID], [PharmacyID], [AddressID], [DeliveryAddressSnapshot], [TotalAmount], [Status], [DeliveryStatus])
VALUES
    (1, 1, 1, N'Amman, Demo Address 1', 3, N'Accepted', N'Preparing'),
    (2, 2, 2, N'Amman, Demo Address 2', 4, N'Accepted', N'Preparing'),
    (3, 3, 3, N'Amman, Demo Address 3', 5, N'Accepted', N'Preparing'),
    (4, 4, 4, N'Amman, Demo Address 4', 6, N'Accepted', N'Preparing'),
    (5, 5, 5, N'Amman, Demo Address 5', 7, N'Accepted', N'Preparing'),
    (6, 6, 6, N'Amman, Demo Address 6', 8, N'Accepted', N'Preparing'),
    (7, 7, 7, N'Amman, Demo Address 7', 9, N'Accepted', N'Preparing'),
    (8, 8, 8, N'Amman, Demo Address 8', 10, N'Accepted', N'Preparing'),
    (9, 9, 9, N'Amman, Demo Address 9', 11, N'Accepted', N'Preparing'),
    (10, 10, 10, N'Amman, Demo Address 10', 12, N'Accepted', N'Preparing');
GO


CREATE TABLE [PharmacyOrderItem] (
    PharmacyOrderItemID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_PharmacyOrderItem PRIMARY KEY,
    PharmacyOrderID INT NOT NULL,
    PharmacyMedicineID INT NOT NULL,
    BatchID INT NULL, -- batch set when pharmacy accepts and allocates stock
    Quantity INT NOT NULL,
    UnitPriceAtOrder DECIMAL(12,2) NOT NULL,
    CONSTRAINT FK_PharmacyOrderItem_Order FOREIGN KEY (PharmacyOrderID) REFERENCES [PharmacyOrder](PharmacyOrderID),
    CONSTRAINT FK_PharmacyOrderItem_Offer FOREIGN KEY (PharmacyMedicineID) REFERENCES [PharmacyMedicine](PharmacyMedicineID),
    CONSTRAINT FK_PharmacyOrderItem_Batch FOREIGN KEY (BatchID) REFERENCES [InventoryBatch](BatchID),
    CONSTRAINT CK_PharmacyOrderItem_QtyPrice CHECK (Quantity > 0 AND UnitPriceAtOrder >= 0)
);
GO

-- PharmacyOrderItem (10 records)
INSERT INTO [PharmacyOrderItem] ([PharmacyOrderID], [PharmacyMedicineID], [BatchID], [Quantity], [UnitPriceAtOrder])
VALUES
    (1, 1, 1, 1, 3),
    (2, 2, 2, 1, 4),
    (3, 3, 3, 1, 5),
    (4, 4, 4, 1, 6),
    (5, 5, 5, 1, 7),
    (6, 6, 6, 1, 8),
    (7, 7, 7, 1, 9),
    (8, 8, 8, 1, 10),
    (9, 9, 9, 1, 11),
    (10, 10, 10, 1, 12);
GO


CREATE TABLE [StoreOrder] (
    StoreOrderID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_StoreOrder PRIMARY KEY,
    PatientUserID INT NOT NULL,
    AddressID INT NULL,
    DeliveryAddressSnapshot NVARCHAR(700) NOT NULL,
    TotalAmount DECIMAL(12,2) NOT NULL,
    Status NVARCHAR(25) NOT NULL CONSTRAINT DF_StoreOrder_Status DEFAULT N'Pending',
    DeliveryStatus NVARCHAR(25) NOT NULL CONSTRAINT DF_StoreOrder_DeliveryStatus DEFAULT N'Not Started',
    DeliveredAt DATETIME2(0) NULL,
    CancelledAt DATETIME2(0) NULL,
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_StoreOrder_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_StoreOrder_Patient FOREIGN KEY (PatientUserID) REFERENCES [User](UserID),
    CONSTRAINT FK_StoreOrder_Address FOREIGN KEY (AddressID) REFERENCES [Address](AddressID),
    CONSTRAINT CK_StoreOrder_Total CHECK (TotalAmount >= 0),
    CONSTRAINT CK_StoreOrder_Status CHECK (Status IN (N'Pending', N'Confirmed', N'Cancelled', N'Preparing', N'Out for Delivery', N'Completed')),
    CONSTRAINT CK_StoreOrder_Delivery CHECK (DeliveryStatus IN (N'Not Started', N'Preparing', N'Out for Delivery', N'Delivered', N'Cancelled'))
);
GO

-- StoreOrder (10 records)
INSERT INTO [StoreOrder] ([PatientUserID], [AddressID], [DeliveryAddressSnapshot], [TotalAmount], [Status], [DeliveryStatus])
VALUES
    (1, 1, N'Amman, Demo Address 1', 11, N'Confirmed', N'Preparing'),
    (2, 2, N'Amman, Demo Address 2', 12, N'Confirmed', N'Preparing'),
    (3, 3, N'Amman, Demo Address 3', 13, N'Confirmed', N'Preparing'),
    (4, 4, N'Amman, Demo Address 4', 14, N'Confirmed', N'Preparing'),
    (5, 5, N'Amman, Demo Address 5', 15, N'Confirmed', N'Preparing'),
    (6, 6, N'Amman, Demo Address 6', 16, N'Confirmed', N'Preparing'),
    (7, 7, N'Amman, Demo Address 7', 17, N'Confirmed', N'Preparing'),
    (8, 8, N'Amman, Demo Address 8', 18, N'Confirmed', N'Preparing'),
    (9, 9, N'Amman, Demo Address 9', 19, N'Confirmed', N'Preparing'),
    (10, 10, N'Amman, Demo Address 10', 20, N'Confirmed', N'Preparing');
GO


CREATE TABLE [StoreOrderItem] (
    StoreOrderItemID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_StoreOrderItem PRIMARY KEY,
    StoreOrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPriceAtOrder DECIMAL(12,2) NOT NULL,
    CONSTRAINT FK_StoreOrderItem_Order FOREIGN KEY (StoreOrderID) REFERENCES [StoreOrder](StoreOrderID),
    CONSTRAINT FK_StoreOrderItem_Product FOREIGN KEY (ProductID) REFERENCES [Product](ProductID),
    CONSTRAINT CK_StoreOrderItem_QtyPrice CHECK (Quantity > 0 AND UnitPriceAtOrder >= 0)
);
GO

-- 29-32: AI usage, payments and commissions

-- StoreOrderItem (10 records)
INSERT INTO [StoreOrderItem] ([StoreOrderID], [ProductID], [Quantity], [UnitPriceAtOrder])
VALUES
    (1, 1, 1, 11),
    (2, 2, 1, 12),
    (3, 3, 1, 13),
    (4, 4, 1, 14),
    (5, 5, 1, 15),
    (6, 6, 1, 16),
    (7, 7, 1, 17),
    (8, 8, 1, 18),
    (9, 9, 1, 19),
    (10, 10, 1, 20);
GO


CREATE TABLE [AIUsage] (
    AIUsageID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_AIUsage PRIMARY KEY,
    UserID INT NOT NULL CONSTRAINT UQ_AIUsage_User UNIQUE,
    FreeSendsUsed INT NOT NULL CONSTRAINT DF_AIUsage_FreeSends DEFAULT (0),
    PaidAccessExpiresAt DATETIME2(0) NULL,
    UpdatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_AIUsage_UpdatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_AIUsage_User FOREIGN KEY (UserID) REFERENCES [User](UserID),
    CONSTRAINT CK_AIUsage_FreeSends CHECK (FreeSendsUsed >= 0)
);
GO

-- AIUsage (10 records)
INSERT INTO [AIUsage] ([UserID], [FreeSendsUsed])
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 3),
    (5, 3),
    (6, 3),
    (7, 3),
    (8, 3),
    (9, 3),
    (10, 3);
GO


CREATE TABLE [Payment] (
    PaymentID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Payment PRIMARY KEY,
    UserID INT NOT NULL,
    AppointmentID INT NULL,
    CareRequestID INT NULL,
    PharmacyOrderID INT NULL,
    StoreOrderID INT NULL,
    AIUsageID INT NULL,
    Amount DECIMAL(12,2) NOT NULL,
    PaymentMethod NVARCHAR(40) NULL,
    Status NVARCHAR(20) NOT NULL CONSTRAINT DF_Payment_Status DEFAULT N'Pending',
    ProviderReference NVARCHAR(160) NULL,
    PaidAt DATETIME2(0) NULL,
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_Payment_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_Payment_User FOREIGN KEY (UserID) REFERENCES [User](UserID),
    CONSTRAINT FK_Payment_Appointment FOREIGN KEY (AppointmentID) REFERENCES [Appointment](AppointmentID),
    CONSTRAINT FK_Payment_CareRequest FOREIGN KEY (CareRequestID) REFERENCES [CareRequest](CareRequestID),
    CONSTRAINT FK_Payment_PharmacyOrder FOREIGN KEY (PharmacyOrderID) REFERENCES [PharmacyOrder](PharmacyOrderID),
    CONSTRAINT FK_Payment_StoreOrder FOREIGN KEY (StoreOrderID) REFERENCES [StoreOrder](StoreOrderID),
    CONSTRAINT FK_Payment_AIUsage FOREIGN KEY (AIUsageID) REFERENCES [AIUsage](AIUsageID),
    CONSTRAINT CK_Payment_Amount CHECK (Amount >= 0),
    CONSTRAINT CK_Payment_Status CHECK (Status IN (N'Pending', N'Succeeded', N'Failed', N'Cancelled')),
    CONSTRAINT CK_Payment_OneTarget CHECK (
      (CASE WHEN AppointmentID IS NOT NULL THEN 1 ELSE 0 END) +
      (CASE WHEN CareRequestID IS NOT NULL THEN 1 ELSE 0 END) +
      (CASE WHEN PharmacyOrderID IS NOT NULL THEN 1 ELSE 0 END) +
      (CASE WHEN StoreOrderID IS NOT NULL THEN 1 ELSE 0 END) +
      (CASE WHEN AIUsageID IS NOT NULL THEN 1 ELSE 0 END) = 1)
);
GO
CREATE UNIQUE INDEX UX_Payment_ProviderReference ON [Payment](ProviderReference) WHERE ProviderReference IS NOT NULL;
GO

-- Payment (10 records)
INSERT INTO [Payment] ([UserID], [AppointmentID], [Amount], [PaymentMethod], [Status], [ProviderReference], [PaidAt])
VALUES
    (1, 1, 5, N'Demo Card', N'Succeeded', N'DEMO-PAY-1', N'2026-11-03 10:00:00'),
    (2, 2, 5, N'Demo Card', N'Succeeded', N'DEMO-PAY-2', N'2026-11-03 10:00:00'),
    (3, 3, 5, N'Demo Card', N'Succeeded', N'DEMO-PAY-3', N'2026-11-03 10:00:00'),
    (4, 4, 5, N'Demo Card', N'Succeeded', N'DEMO-PAY-4', N'2026-11-03 10:00:00'),
    (5, 5, 5, N'Demo Card', N'Succeeded', N'DEMO-PAY-5', N'2026-11-03 10:00:00'),
    (6, 6, 5, N'Demo Card', N'Succeeded', N'DEMO-PAY-6', N'2026-11-03 10:00:00'),
    (7, 7, 5, N'Demo Card', N'Succeeded', N'DEMO-PAY-7', N'2026-11-03 10:00:00'),
    (8, 8, 5, N'Demo Card', N'Succeeded', N'DEMO-PAY-8', N'2026-11-03 10:00:00'),
    (9, 9, 5, N'Demo Card', N'Succeeded', N'DEMO-PAY-9', N'2026-11-03 10:00:00'),
    (10, 10, 5, N'Demo Card', N'Succeeded', N'DEMO-PAY-10', N'2026-11-03 10:00:00');
GO


CREATE TABLE [CommissionRule] (
    CommissionRuleID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_CommissionRule PRIMARY KEY,
    ServiceType NVARCHAR(40) NOT NULL,
    ProviderUserID INT NULL, -- NULL = general rule for this service
    RatePercent DECIMAL(5,2) NOT NULL,
    EffectiveFrom DATETIME2(0) NOT NULL CONSTRAINT DF_CommissionRule_EffectiveFrom DEFAULT SYSUTCDATETIME(),
    IsActive BIT NOT NULL CONSTRAINT DF_CommissionRule_IsActive DEFAULT (1),
    CONSTRAINT FK_CommissionRule_Provider FOREIGN KEY (ProviderUserID) REFERENCES [User](UserID),
    CONSTRAINT CK_CommissionRule_Rate CHECK (RatePercent BETWEEN 0 AND 100)
);
GO
CREATE INDEX IX_CommissionRule_Lookup ON [CommissionRule](ServiceType, ProviderUserID, IsActive, EffectiveFrom DESC);
GO

-- CommissionRule (10 records)
INSERT INTO [CommissionRule] ([ServiceType], [ProviderUserID], [RatePercent], [IsActive])
VALUES
    (N'Appointment', 11, 10, 1),
    (N'Appointment', 12, 10, 1),
    (N'Appointment', 13, 10, 1),
    (N'Appointment', 14, 10, 1),
    (N'Appointment', 15, 10, 1),
    (N'Appointment', 16, 10, 1),
    (N'Appointment', 17, 10, 1),
    (N'Appointment', 18, 10, 1),
    (N'Appointment', 19, 10, 1),
    (N'Appointment', 20, 10, 1);
GO


CREATE TABLE [Commission] (
    CommissionID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Commission PRIMARY KEY,
    PaymentID INT NOT NULL CONSTRAINT UQ_Commission_Payment UNIQUE,
    CommissionRuleID INT NULL,
    RateApplied DECIMAL(5,2) NOT NULL,
    CommissionAmount DECIMAL(12,2) NOT NULL,
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_Commission_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_Commission_Payment FOREIGN KEY (PaymentID) REFERENCES [Payment](PaymentID),
    CONSTRAINT FK_Commission_Rule FOREIGN KEY (CommissionRuleID) REFERENCES [CommissionRule](CommissionRuleID),
    CONSTRAINT CK_Commission_Rate CHECK (RateApplied BETWEEN 0 AND 100 AND CommissionAmount >= 0)
);
GO

-- 33-37: AI conversations, notifications, audit

-- Commission (10 records)
INSERT INTO [Commission] ([PaymentID], [CommissionRuleID], [RateApplied], [CommissionAmount])
VALUES
    (1, 1, 10, 0.5),
    (2, 2, 10, 0.5),
    (3, 3, 10, 0.5),
    (4, 4, 10, 0.5),
    (5, 5, 10, 0.5),
    (6, 6, 10, 0.5),
    (7, 7, 10, 0.5),
    (8, 8, 10, 0.5),
    (9, 9, 10, 0.5),
    (10, 10, 10, 0.5);
GO


CREATE TABLE [AIConversation] (
    ConversationID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_AIConversation PRIMARY KEY,
    UserID INT NOT NULL,
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_AIConversation_CreatedAt DEFAULT SYSUTCDATETIME(),
    LastMessageAt DATETIME2(0) NULL,
    CONSTRAINT FK_AIConversation_User FOREIGN KEY (UserID) REFERENCES [User](UserID)
);
GO

-- AIConversation (10 records)
INSERT INTO [AIConversation] ([UserID], [LastMessageAt])
VALUES
    (1, N'2026-11-04 10:00:00'),
    (2, N'2026-11-04 10:00:00'),
    (3, N'2026-11-04 10:00:00'),
    (4, N'2026-11-04 10:00:00'),
    (5, N'2026-11-04 10:00:00'),
    (6, N'2026-11-04 10:00:00'),
    (7, N'2026-11-04 10:00:00'),
    (8, N'2026-11-04 10:00:00'),
    (9, N'2026-11-04 10:00:00'),
    (10, N'2026-11-04 10:00:00');
GO


CREATE TABLE [AIMessage] (
    MessageID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_AIMessage PRIMARY KEY,
    ConversationID INT NOT NULL,
    SenderRole NVARCHAR(20) NOT NULL,
    MessageText NVARCHAR(MAX) NOT NULL,
    SentAt DATETIME2(0) NOT NULL CONSTRAINT DF_AIMessage_SentAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_AIMessage_Conversation FOREIGN KEY (ConversationID) REFERENCES [AIConversation](ConversationID),
    CONSTRAINT CK_AIMessage_Sender CHECK (SenderRole IN (N'User', N'Assistant', N'System'))
);
GO

-- AIMessage (10 records)
INSERT INTO [AIMessage] ([ConversationID], [SenderRole], [MessageText])
VALUES
    (1, N'User', N'Demo question 1'),
    (2, N'User', N'Demo question 2'),
    (3, N'User', N'Demo question 3'),
    (4, N'User', N'Demo question 4'),
    (5, N'User', N'Demo question 5'),
    (6, N'User', N'Demo question 6'),
    (7, N'User', N'Demo question 7'),
    (8, N'User', N'Demo question 8'),
    (9, N'User', N'Demo question 9'),
    (10, N'User', N'Demo question 10');
GO


CREATE TABLE [Notification] (
    NotificationID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Notification PRIMARY KEY,
    UserID INT NOT NULL,
    Title NVARCHAR(200) NOT NULL,
    Message NVARCHAR(1500) NOT NULL,
    IsRead BIT NOT NULL CONSTRAINT DF_Notification_IsRead DEFAULT (0),
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_Notification_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_Notification_User FOREIGN KEY (UserID) REFERENCES [User](UserID)
);
GO

-- Notification (10 records)
INSERT INTO [Notification] ([UserID], [Title], [Message])
VALUES
    (1, N'Demo Notification 1', N'This is a test notification.'),
    (2, N'Demo Notification 2', N'This is a test notification.'),
    (3, N'Demo Notification 3', N'This is a test notification.'),
    (4, N'Demo Notification 4', N'This is a test notification.'),
    (5, N'Demo Notification 5', N'This is a test notification.'),
    (6, N'Demo Notification 6', N'This is a test notification.'),
    (7, N'Demo Notification 7', N'This is a test notification.'),
    (8, N'Demo Notification 8', N'This is a test notification.'),
    (9, N'Demo Notification 9', N'This is a test notification.'),
    (10, N'Demo Notification 10', N'This is a test notification.');
GO


CREATE TABLE [ActivityLog] (
    ActivityLogID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ActivityLog PRIMARY KEY,
    ActorUserID INT NULL,
    Action NVARCHAR(150) NOT NULL,
    TargetType NVARCHAR(80) NULL,
    TargetID INT NULL,
    Details NVARCHAR(MAX) NULL,
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_ActivityLog_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_ActivityLog_Actor FOREIGN KEY (ActorUserID) REFERENCES [User](UserID)
);
GO

-- ActivityLog (10 records)
INSERT INTO [ActivityLog] ([ActorUserID], [Action], [TargetType], [TargetID], [Details])
VALUES
    (41, N'DemoCreate', N'User', 1, N'Test activity'),
    (41, N'DemoCreate', N'User', 2, N'Test activity'),
    (41, N'DemoCreate', N'User', 3, N'Test activity'),
    (41, N'DemoCreate', N'User', 4, N'Test activity'),
    (41, N'DemoCreate', N'User', 5, N'Test activity'),
    (41, N'DemoCreate', N'User', 6, N'Test activity'),
    (41, N'DemoCreate', N'User', 7, N'Test activity'),
    (41, N'DemoCreate', N'User', 8, N'Test activity'),
    (41, N'DemoCreate', N'User', 9, N'Test activity'),
    (41, N'DemoCreate', N'User', 10, N'Test activity');
GO

-- Check rows in any table:
-- SELECT * FROM [User];
-- SELECT * FROM [DoctorProfile];
-- SELECT * FROM [Appointment];

-- Verify results
SELECT DB_NAME() AS DatabaseName;
SELECT COUNT(*) AS TotalTables FROM sys.tables;
SELECT * FROM [User];
