#Tạo Database
CREATE DATABASE FoodWaste_Staging;
CREATE DATABASE FoodWaste_DW;

# Tạo bảng tại Database Stagin
USE FoodWaste_Staging;
GO

CREATE TABLE Stg_FoodWaste (
    Country NVARCHAR(100),
    Region NVARCHAR(100),
    Year INT,
    Population BIGINT,
    Income_Group NVARCHAR(100),
    GDP_Billion_USD DECIMAL(18,2),
    GDP_per_Capita_USD DECIMAL(18,2),
    Food_Types NVARCHAR(100),
    Total_Waste_Tons DECIMAL(18,2),
    Food_Economic_Loss_Million_USD DECIMAL(18,2),
    Household_Waste_Percent DECIMAL(18,2),
    Total_Household_Waste_Tons DECIMAL(18,2),
    Total_Commercial_Waste_Tons DECIMAL(18,2),
    Avg_Waste_per_Capita_Kg DECIMAL(18,2),
    Economic_Loss_per_Capita_USD DECIMAL(18,2)
);

# Tạo bảng chiều (Dimension Tables)
USE FoodWaste_DW;
GO

CREATE TABLE Dim_Country (
    Country_Key INT IDENTITY(1,1) PRIMARY KEY,
    Country_Name NVARCHAR(100)
);

CREATE TABLE Dim_Region (
    Region_Key INT IDENTITY(1,1) PRIMARY KEY,
    Region_Name NVARCHAR(100)
);

CREATE TABLE Dim_Time (
    Year_Key INT IDENTITY(1,1) PRIMARY KEY,
    Year INT
);

CREATE TABLE Dim_IncomeGroup (
    IncomeGroup_Key INT IDENTITY(1,1) PRIMARY KEY,
    IncomeGroup_Name NVARCHAR(100)
);

CREATE TABLE Dim_FoodType (
    FoodType_Key INT IDENTITY(1,1) PRIMARY KEY,
    FoodType_Name NVARCHAR(100)
);

# Tạo bảng sự kiện (Fact Table)
CREATE TABLE Fact_FoodWaste (
    FoodWaste_ID INT IDENTITY(1,1) PRIMARY KEY,
    Country_Key INT,
    Region_Key INT,
    Year_Key INT,
    IncomeGroup_Key INT,
    FoodType_Key INT,
    Population BIGINT,
    GDP_Billion_USD DECIMAL(18,2),
    GDP_per_Capita_USD DECIMAL(18,2),
    Total_Waste_Tons DECIMAL(18,2),
    Food_Economic_Loss_Million_USD DECIMAL(18,2),
    Household_Waste_Percent DECIMAL(18,2),
    Total_Household_Waste_Tons DECIMAL(18,2),
    Total_Commercial_Waste_Tons DECIMAL(18,2),
    Avg_Waste_per_Capita_Kg DECIMAL(18,2),
    Economic_Loss_per_Capita_USD DECIMAL(18,2),

    -- Định nghĩa các khóa ngoại (Foreign Keys)
    FOREIGN KEY (Country_Key) REFERENCES Dim_Country(Country_Key),
    FOREIGN KEY (Region_Key) REFERENCES Dim_Region(Region_Key),
    FOREIGN KEY (Year_Key) REFERENCES Dim_Time(Year_Key),
    FOREIGN KEY (IncomeGroup_Key) REFERENCES Dim_IncomeGroup(IncomeGroup_Key),
    FOREIGN KEY (FoodType_Key) REFERENCES Dim_FoodType(FoodType_Key)
);