-- Owners Table
CREATE TABLE Owners (
    owner_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    address VARCHAR(255)
);

-- Vehicles Table
CREATE TABLE Vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    owner_id INTEGER,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL,
    vin_number VARCHAR(20) UNIQUE NOT NULL,
    current_mileage INTEGER,
    last_service_date DATE,
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
);

-- Service Centers Table
CREATE TABLE Service_Centers (
    center_id INTEGER PRIMARY KEY,
    center_name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    services_offered TEXT
);

-- Service Records Table
CREATE TABLE Service_Records (
    service_id INTEGER PRIMARY KEY,
    vehicle_id INTEGER,
    center_id INTEGER,
    service_date DATE NOT NULL,
    service_type VARCHAR(50) NOT NULL,
    cost MONEY,
    service_details TEXT,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (center_id) REFERENCES Service_Centers(center_id)
);

-- Maintenance Alerts Table
CREATE TABLE Maintenance_Alerts (
    alert_id INTEGER PRIMARY KEY,
    vehicle_id INTEGER,
    alert_date DATE NOT NULL,
    alert_type VARCHAR(50) NOT NULL,
    description TEXT,
    status TEXT CHECK(status IN ('Resolved', 'Pending')) NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);
