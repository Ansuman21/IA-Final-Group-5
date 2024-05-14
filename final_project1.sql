-- Create Database and Use It
CREATE DATABASE IF NOT EXISTS final_project1;
USE final_project1;

-- Pedestrian Dimension Table
CREATE TABLE PedestrianDim (
    pedestrianid VARCHAR(255) PRIMARY KEY,
    pedestriantype VARCHAR(250) -- Consider specifying a default value if applicable
);

-- Vehicle Dimension Table
CREATE TABLE VehicleDim (
    vehicleid VARCHAR(255) PRIMARY KEY,
    vehiclemake VARCHAR(250),
    vehiclemodel VARCHAR(250),
    vehicleyear INT,
    vehiclebodytype VARCHAR(250)
);

-- Location Dimension Table
CREATE TABLE LocationDim (
    crossstreetname VARCHAR(100) PRIMARY KEY,
    weather VARCHAR(255),
    light VARCHAR(255),
    speedlimit INT
);

-- Driver Dimension Table
CREATE TABLE DriverDim (
    driverid VARCHAR(255) PRIMARY KEY,
    driverslicensestate VARCHAR(250) -- Consistency: Remove redundant PRIMARY KEY specification
);

-- Crash Fact Table with Foreign Keys and Indexes
CREATE TABLE CrashFact (
    reportnumber VARCHAR(255) PRIMARY KEY,
    driverid VARCHAR(255),
    vehicleid VARCHAR(255),
    pedestrianid VARCHAR(255),
    crossstreetname VARCHAR(100), 
    crashdate VARCHAR(255),
    agencyname VARCHAR(255),
    localcasenumber VARCHAR(250), -- Optional: Add a UNIQUE constraint if required
    acrsreporttype VARCHAR(255),
    collisiontype VARCHAR(255),
    trafficcontrol VARCHAR(255),
    driversubstanceabuse VARCHAR(250),
    nonmotoristsubstanceabuse VARCHAR(250),
    driversinjuryseverity VARCHAR(250),
    pedestriansinjuryseverity VARCHAR(250),
    FOREIGN KEY (driverid) REFERENCES DriverDim(driverid),
    FOREIGN KEY (vehicleid) REFERENCES VehicleDim(vehicleid),
    FOREIGN KEY (pedestrianid) REFERENCES PedestrianDim(pedestrianid),
    FOREIGN KEY (crossstreetname) REFERENCES LocationDim(crossstreetname),
    INDEX (driverid),  -- Add index for fast joins
    INDEX (vehicleid), -- Add index for fast joins
    INDEX (pedestrianid), -- Add index for fast joins
    INDEX (crossstreetname) -- Add index for fast joins
);

SELECT * FROM PedestrianDim;
SELECT * FROM VehicleDim;
SELECT * FROM LocationDim;
SELECT * FROM DriverDim;
SELECT * FROM CrashFact;