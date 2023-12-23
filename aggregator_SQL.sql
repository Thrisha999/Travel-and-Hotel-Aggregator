create database aggegator

CREATE TABLE Users (
  user_id INTEGER PRIMARY KEY,
  username VARCHAR(50),
  password VARCHAR(100),
  email VARCHAR(100),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone_number VARCHAR(20)
);

CREATE TABLE Hotels (
  hotel_id INTEGER PRIMARY KEY,
  hotel_name VARCHAR(100),
  address VARCHAR(200),
  city VARCHAR(50),
  state VARCHAR(50),
  country VARCHAR(50),
  postal_code VARCHAR(10),
  star_rating INTEGER,
  amenities TEXT,
  description TEXT
);

CREATE TABLE Hotel_Images (
  image_id INTEGER PRIMARY KEY,
  hotel_id INTEGER,
  image_url VARCHAR(200),
  FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);

CREATE TABLE Rooms (
  room_id INTEGER PRIMARY KEY,
  hotel_id INTEGER,
  room_type VARCHAR(50),
  max_occupancy INTEGER,
  price_per_night DECIMAL(10, 2),
  FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);

CREATE TABLE Bookings (
  booking_id INTEGER PRIMARY KEY,
  user_id INTEGER,
  room_id INTEGER,
  check_in_date DATE,
  check_out_date DATE,
  total_price DECIMAL(10, 2),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE Reviews (
  review_id INTEGER PRIMARY KEY,
  user_id INTEGER,
  hotel_id INTEGER,
  rating DECIMAL(3, 2),
  comment TEXT,
  date DATE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);

CREATE TABLE Flights (
  flight_id INTEGER PRIMARY KEY,
  airline VARCHAR(100),
  departure_airport VARCHAR(50),
  arrival_airport VARCHAR(50),
  departure_date DATE,
  arrival_date DATE,
  price DECIMAL(10, 2)
);

CREATE TABLE Car_Rentals (
  rental_id INTEGER PRIMARY KEY,
  car_rental_company VARCHAR(100),
  pickup_location VARCHAR(200),
  dropoff_location VARCHAR(200),
  pickup_date DATE,
  dropoff_date DATE,
  price DECIMAL(10, 2)
);

CREATE TABLE Flight_Bookings (
  flight_booking_id INTEGER PRIMARY KEY,
  user_id INTEGER,
  flight_id INTEGER,
  passengers INTEGER,
  total_price DECIMAL(10, 2),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

CREATE TABLE Car_Rental_Bookings (
  car_rental_booking_id INTEGER PRIMARY KEY,
  user_id INTEGER,
  rental_id INTEGER,
  total_price DECIMAL(10, 2),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (rental_id) REFERENCES Car_Rentals(rental_id)
);

CREATE TABLE Payments (
  payment_id INTEGER PRIMARY KEY,
  user_id INTEGER,
  booking_id INTEGER,
  flight_booking_id INTEGER,
  car_rental_booking_id INTEGER,
  payment_date DATE,
  payment_amount DECIMAL(10, 2),
  payment_method VARCHAR(50),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
  FOREIGN KEY (flight_booking_id) REFERENCES Flight_Bookings(flight_booking_id),
  FOREIGN KEY (car_rental_booking_id) REFERENCES Car_Rental_Bookings(car_rental_booking_id)
);

CREATE TABLE Room_Images (
  image_id INTEGER PRIMARY KEY,
  room_id INTEGER,
  image_url VARCHAR(200),
  FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE Promotions (
  promotion_id INTEGER PRIMARY KEY,
  promotion_name VARCHAR(100),
  start_date DATE,
  end_date DATE,
  discount DECIMAL(5, 2),
  promotion_type VARCHAR(50)
);

/*users:*/
INSERT INTO Users VALUES (1, 'Thrisha', 'password123', 'Thrisha@example.com', 'Thrisha', 'Doe', '123-456-7890')
INSERT INTO Users VALUES (2, 'Sailaja', 'p@ssw0rd', 'Sailaja@example.com', 'Sailaja', 'Smith', '987-654-3210')
INSERT INTO Users VALUES(3, 'Mahesh', 'securepass', 'Mahesh@example.com', 'Mahesh', 'Johnson', '555-123-4567')
INSERT INTO Users VALUES(4, 'Chaturya', 'pass123', 'Chaturya@example.com', 'Chaturya', 'Williams', '111-222-3333')
INSERT INTO Users VALUES(5, 'vyshnavi', 'qwerty', 'vyshnavi@example.com', 'vyshnavi', 'Davis', '444-555-6666')
INSERT INTO Users VALUES(6, 'hari', 'abc123', 'hari@example.com', 'hari', 'Brown', '777-888-9999')
INSERT INTO Users VALUES(7, 'pavan', 'letmein', 'pavan@example.com', 'pavan', 'Taylor', '222-333-4444')
INSERT INTO Users VALUES(8, 'vijay', 'password', 'vijay@example.com', 'vijay', 'Wilson', '999-888-7777')
INSERT INTO Users VALUES(9, 'hema', 'ilovecoding', 'hema@example.com', 'hema', 'Clark', '111-999-8888')
INSERT INTO Users VALUES(10, 'poornima', 'pooripass', 'poornima@example.com', 'poornima', 'Robinson', '888-777-6666')
INSERT INTO Users VALUES(11, 'abhi', 'abhipass', 'abhi@example.com', 'abhi', 'Adams', '444-555-6666')
INSERT INTO Users VALUES(12, 'avinash', 'avinamini', 'avinash@example.com', 'avinash', 'Lee', '222-333-4444')
INSERT INTO Users VALUES(13, 'abhinay', 'binapass', 'abhinay@example.com', 'abhinay', 'Garcia', '555-666-7777')
INSERT INTO Users VALUES(14, 'abhishek', 'abhishekpass', 'abhishek@example.com', 'abhishek', 'Hernandez', '999-888-7777')
INSERT INTO Users VALUES(15, 'vasu', 'vasupass', 'vasu@example.com', 'vasu', 'Lopez', '333-444-5555')
INSERT INTO Users VALUES(16, 'pallavi', 'avapass', 'pallavi@example.com', 'pallavi', 'Gonzalez', '777-666-5555')
INSERT INTO Users VALUES(17, 'keerthi', 'keerthipass', 'keerthi@example.com', 'keerthi', 'Perez', '666-777-8888')
INSERT INTO Users VALUES(18, 'kumar', 'kumarpass', 'kumar@example.com', 'kumar', 'Taylor', '444-555-6666')
INSERT INTO Users VALUES(19, 'venu', 'venupass', 'venu@example.com', 'venu', 'Smith', '222-333-4444')
INSERT INTO Users VALUES(20, 'tharun', 'tharunpass', 'tharun@example.com', 'tharun', 'Johnson', '555-666-7777')
INSERT INTO Users VALUES(21, 'hruthik', 'hruthikpass', 'hruthik@example.com', 'hruthik', 'Davis', '888-999-0000')
INSERT INTO Users VALUES(22, 'teja', 'tejapass', 'teja@example.com', 'teja', 'Wilson', '111-222-3333')
INSERT INTO Users VALUES(23, 'rajitha', 'rajithapass', 'rajitha@example.com', 'rajitha', 'Thompson', '777-888-9999')
INSERT INTO Users VALUES(24, 'bhansi', 'bhansipass', 'bhansi@example.com', 'bhansi', 'Harris', '555-666-7777')
INSERT INTO Users VALUES(25, 'akshu', 'akshupass', 'akshu@example.com', 'akshu', 'Anderson', '222-333-4444');
select * from Users

/*HOTELS*/
 INSERT INTO Hotels VALUES(1, 'Grand Hotel', '123 Main Street', 'New York', 'NY', 'USA', '10001', 4, 'Pool, Gym, Spa', 'Luxurious hotel in the heart of the city')
 INSERT INTO Hotels VALUES(2, 'Seaside Resort', '456 Ocean Avenue', 'Los Angeles', 'CA', 'USA', '90001', 5, 'Beachfront, Restaurant, Bar', 'Stunning resort with breathtaking ocean views')
 INSERT INTO Hotels VALUES(3, 'Mountain Lodge', '789 Pine Road', 'Denver', 'CO', 'USA', '80014', 3, 'Hiking Trails, Fireplace', 'Cozy lodge nestled in the scenic mountains')
 INSERT INTO Hotels VALUES(4, 'Cityscape Hotel', '321 Downtown Boulevard', 'Chicago', 'IL', 'USA', '60601', 4, 'City View, Rooftop Bar', 'Modern hotel with panoramic city views')
 INSERT INTO Hotels VALUES(5, 'Tropical Paradise Resort', '555 Palm Beach Road', 'Miami', 'FL', 'USA', '33139', 5, 'Private Beach, Spa, Golf Course', 'Exquisite resort surrounded by palm trees and crystal-clear waters')
 INSERT INTO Hotels VALUES(6, 'Historic Inn', '111 Heritage Lane', 'Boston', 'MA', 'USA', '02108', 4, 'Antique Furnishings, Fine Dining', 'Charming inn located in a historic district')
 INSERT INTO Hotels VALUES(7, 'Ski Lodge', '777 Snowy Peaks Drive', 'Aspen', 'CO', 'USA', '81611', 4, 'Ski-in/Ski-out, Hot Tub', 'Ideal lodge for winter sports enthusiasts')
 INSERT INTO Hotels VALUES(8, 'Urban Boutique Hotel', '222 Fashion Avenue', 'San Francisco', 'CA', 'USA', '94102', 3, 'Art Gallery, Lounge', 'Trendy hotel with a contemporary design')
 INSERT INTO Hotels VALUES(9, 'Coastal Retreat', '456 Beachfront Road', 'Seattle', 'WA', 'USA', '98101', 3, 'Ocean View, Outdoor Activities', 'Relaxing retreat by the seaside')
 INSERT INTO Hotels VALUES(10, 'Countryside Inn', '999 Meadow Lane', 'Nashville', 'TN', 'USA', '37201', 3, 'Garden, Barbecue Area', 'Tranquil inn surrounded by picturesque countryside')
 INSERT INTO Hotels VALUES(11, 'The Royal Palace', '111 Kings Street', 'London', 'England', 'UK', 'SW1A_1AA', 5, 'Spa, Michelin Star Restaurant', 'Opulent palace hotel fit for royalty')
 INSERT INTO Hotels VALUES(12, 'Alpine Chalet', '222 Mountain View Road', 'Zermatt', 'Valais', 'Switzerland', '3920', 5, 'Ski Access, Fireplace', 'Luxury chalet nestled in the Swiss Alps')
 INSERT INTO Hotels VALUES(13, 'Beachfront Resort', '333 Sandy Beach Lane', 'Cancun', 'Quintana Roo', 'Mexico', '77500', 4, 'Infinity Pool, Water Sports', 'Vibrant resort located on a pristine beach')
 INSERT INTO Hotels VALUES(14, 'Rustic Cabin', '444 Woodland Trail', 'Banff', 'AB', 'Canada', 'T1L 1B3', 3, 'Nature Trails, Campfire Area', 'Quaint cabin surrounded by nature')
 INSERT INTO Hotels VALUES(15, 'Seaside Resort', '777 Beachfront Avenue', 'Miami', 'FL', 'USA', '33101', 4, 'Private Beach, Pool, Spa', 'Relaxing resort located right on the sandy shores of Miami')
 INSERT INTO Hotels VALUES(16, 'Historic Mansion', '777 Heritage Avenue', 'Charleston', 'SC', 'USA', '29401', 5, 'Gardens, Fine Dining', 'Elegant mansion offering a glimpse into the past')
 INSERT INTO Hotels VALUES(17, 'Desert Oasis Resort', '123 Sand Dune Road', 'Dubai', 'Dubai', 'UAE', '12345', 4, 'Spa, Pool, Camel Rides', 'Luxurious resort amidst the Arabian desert')
 INSERT INTO Hotels VALUES(18, 'Rainforest Retreat', '456 Jungle Trail', 'Cairns', 'QLD', 'Australia', '4870', 4, 'Tropical Rainforest, Wildlife', 'Secluded retreat surrounded by lush rainforest')
 INSERT INTO Hotels VALUES(19, 'Historic Plaza Hotel', '789 Main Square', 'Santa Fe', 'NM', 'USA', '87501', 3, 'Courtyard, Adobe Architecture', 'Charming hotel in the heart of Santa Fe\s historic district')
 INSERT INTO Hotels VALUES(20, 'Urban Loft', '321 Loft Street', 'Berlin', 'Berlin', 'Germany', '10178', 4, 'Modern Design, Rooftop Terrace', 'Stylish loft hotel with a vibrant city atmosphere')
 INSERT INTO Hotels VALUES(21, 'Beachside Bungalow', '555 Shoreline Avenue', 'Sydney', 'NSW', 'Australia', '2000', 3, 'Beach Access, Outdoor Barbecue', 'Quaint bungalow steps away from the sandy shores')
 INSERT INTO Hotels VALUES(22, 'Treetop Eco Resort', '111 Canopy Road', 'Bali', 'Bali', 'Indonesia', '12345', 4, 'Sustainable Practices, Yoga Studio', 'Eco-friendly resort nestled in the treetops')
 INSERT INTO Hotels VALUES(23, 'Historic Castle Hotel', '222 Castle Hill', 'Edinburgh', 'Scotland', 'UK', 'EH1 2NG', 5, 'Castle Grounds, Fine Dining', 'Magnificent castle hotel steeped in history')
 INSERT INTO Hotels VALUES(24, 'Lakeside Retreat', '333 Lakeview Drive', 'Queenstown', 'Otago', 'New Zealand', '9300', 4, 'Lake Access, Spa', 'Tranquil retreat overlooking a scenic lake')
 INSERT INTO Hotels VALUES(25, 'Luxury Skyscraper', '444 Skyline Avenue', 'Tokyo', 'Tokyo', 'Japan', '100-0000', 5, 'Panoramic Views, Michelin Star Restaurant', 'Ultra-modern skyscraper offering unparalleled luxury');

select *from Hotels

/*HOTEL-IMAGES*/
  INSERT INTO Hotel_Images VALUES(1, 1, 'https://example.com/hotel1_image1.jpg')
  INSERT INTO Hotel_Images VALUES(2, 1, 'https://example.com/hotel1_image2.jpg')
  INSERT INTO Hotel_Images VALUES(3, 2, 'https://example.com/hotel2_image1.jpg')
  INSERT INTO Hotel_Images VALUES(4, 2, 'https://example.com/hotel2_image2.jpg')
  INSERT INTO Hotel_Images VALUES(5, 3, 'https://example.com/hotel3_image1.jpg')
  INSERT INTO Hotel_Images VALUES(6, 3, 'https://example.com/hotel3_image2.jpg')
  INSERT INTO Hotel_Images VALUES(7, 4, 'https://example.com/hotel4_image1.jpg')
  INSERT INTO Hotel_Images VALUES(8, 4, 'https://example.com/hotel4_image2.jpg')
  INSERT INTO Hotel_Images VALUES(9, 5, 'https://example.com/hotel5_image1.jpg')
  INSERT INTO Hotel_Images VALUES(10, 5, 'https://example.com/hotel5_image2.jpg')
  INSERT INTO Hotel_Images VALUES(11, 6, 'https://example.com/hotel6_image1.jpg')
  INSERT INTO Hotel_Images VALUES(12, 6, 'https://example.com/hotel6_image2.jpg')
  INSERT INTO Hotel_Images VALUES(13, 7, 'https://example.com/hotel7_image1.jpg')
  INSERT INTO Hotel_Images VALUES(14, 7, 'https://example.com/hotel7_image2.jpg')
  INSERT INTO Hotel_Images VALUES(15, 8, 'https://example.com/hotel8_image1.jpg')
  INSERT INTO Hotel_Images VALUES(16, 8, 'https://example.com/hotel8_image2.jpg')
  INSERT INTO Hotel_Images VALUES(17, 9, 'https://example.com/hotel9_image1.jpg')
  INSERT INTO Hotel_Images VALUES(18, 9, 'https://example.com/hotel9_image2.jpg')
  INSERT INTO Hotel_Images VALUES(19, 10, 'https://example.com/hotel10_image1.jpg')
  INSERT INTO Hotel_Images VALUES(20, 10, 'https://example.com/hotel10_image2.jpg')
  INSERT INTO Hotel_Images VALUES(21, 11, 'https://example.com/hotel11_image1.jpg')
  INSERT INTO Hotel_Images VALUES(22, 11, 'https://example.com/hotel11_image2.jpg')
  INSERT INTO Hotel_Images VALUES(23, 12, 'https://example.com/hotel12_image1.jpg')
  INSERT INTO Hotel_Images VALUES(24, 12, 'https://example.com/hotel12_image2.jpg')
  INSERT INTO Hotel_Images VALUES(25, 13, 'https://example.com/hotel13_image1.jpg');
 
  select * from Hotel_Images

  /*ROOMS*/
  INSERT INTO Rooms VALUES(1, 1, 'Standard Room', 2, 100.00)
  INSERT INTO Rooms VALUES(2, 1, 'Deluxe Room', 2, 150.00)
  INSERT INTO Rooms VALUES(3, 2, 'Suite', 4, 250.00)
  INSERT INTO Rooms VALUES(4, 2, 'Superior Room', 2, 180.00)
  INSERT INTO Rooms VALUES(5, 3, 'Standard Room', 2, 120.00)
  INSERT INTO Rooms VALUES(6, 3, 'Executive Suite', 3, 200.00)
  INSERT INTO Rooms VALUES(7, 4, 'Deluxe Room', 2, 160.00)
  INSERT INTO Rooms VALUES(8, 4, 'Family Suite', 4, 280.00)
  INSERT INTO Rooms VALUES(9, 5, 'Standard Room', 2, 110.00)
  INSERT INTO Rooms VALUES(10, 5, 'Premium Room', 2, 170.00)
  INSERT INTO Rooms VALUES(11, 6, 'Suite', 3, 220.00)
  INSERT INTO Rooms VALUES(12, 6, 'Superior Room', 2, 150.00)
  INSERT INTO Rooms VALUES(13, 7, 'Standard Room', 2, 130.00)
  INSERT INTO Rooms VALUES(14, 7, 'Deluxe Room', 2, 180.00)
  INSERT INTO Rooms VALUES(15, 8, 'Suite', 3, 240.00)
  INSERT INTO Rooms VALUES(16, 8, 'Executive Suite', 4, 320.00)
  INSERT INTO Rooms VALUES(17, 9, 'Standard Room', 2, 100.00)
  INSERT INTO Rooms VALUES(18, 9, 'Premium Room', 2, 160.00)
  INSERT INTO Rooms VALUES(19, 10, 'Deluxe Room', 2, 150.00)
  INSERT INTO Rooms VALUES(20, 10, 'Family Suite', 4, 260.00)
  INSERT INTO Rooms VALUES(21, 11, 'Standard Room', 2, 120.00)
  INSERT INTO Rooms VALUES(22, 11, 'Suite', 3, 220.00)
  INSERT INTO Rooms VALUES(23, 12, 'Deluxe Room', 2, 170.00)
  INSERT INTO Rooms VALUES(24, 12, 'Superior Room', 2, 140.00)
  INSERT INTO Rooms VALUES(25, 13, 'Standard Room', 2, 110.00);
 
  select * from Rooms

 /*BOOKINGS*/
  INSERT INTO Bookings VALUES(1, 1, 1, '2023-06-01', '2023-06-03', 200.00)
  INSERT INTO Bookings VALUES(2, 1, 2, '2023-07-05', '2023-07-08', 450.00)
  INSERT INTO Bookings VALUES(3, 2, 3, '2023-08-12', '2023-08-15', 750.00)
  INSERT INTO Bookings VALUES(4, 2, 4, '2023-09-20', '2023-09-24', 720.00)
  INSERT INTO Bookings VALUES(5, 3, 5, '2023-10-02', '2023-10-04', 240.00)
  INSERT INTO Bookings VALUES(6, 3, 6, '2023-11-10', '2023-11-15', 1000.00)
  INSERT INTO Bookings VALUES(7, 4, 7, '2023-12-18', '2023-12-22', 640.00)
  INSERT INTO Bookings VALUES(8, 4, 8, '2024-01-25', '2024-01-28', 1120.00)
  INSERT INTO Bookings VALUES(9, 5, 9, '2024-02-05', '2024-02-07', 220.00)
  INSERT INTO Bookings VALUES(10, 5, 10, '2024-03-14', '2024-03-19', 850.00)
  INSERT INTO Bookings VALUES(11, 6, 11, '2024-04-22', '2024-04-25', 660.00)
  INSERT INTO Bookings VALUES(12, 6, 12, '2024-05-30', '2024-06-05', 900.00)
  INSERT INTO Bookings VALUES(13, 7, 13, '2024-07-07', '2024-07-10', 390.00)
  INSERT INTO Bookings VALUES(14, 7, 14, '2024-08-15', '2024-08-18', 540.00)
  INSERT INTO Bookings VALUES(15, 8, 15, '2024-09-22', '2024-09-25', 720.00)
  INSERT INTO Bookings VALUES(16, 8, 16, '2024-10-30', '2024-11-04', 1280.00)
  INSERT INTO Bookings VALUES(17, 9, 17, '2024-12-07', '2024-12-10', 220.00)
  INSERT INTO Bookings VALUES(18, 9, 18, '2025-01-15', '2025-01-18', 480.00)
  INSERT INTO Bookings VALUES(19, 10, 19, '2025-02-23', '2025-02-26', 450.00)
  INSERT INTO Bookings VALUES(20, 10, 20, '2025-03-31', '2025-04-04', 1040.00)
  INSERT INTO Bookings VALUES(21, 11, 21, '2025-05-08', '2025-05-10', 240.00)
  INSERT INTO Bookings VALUES(22, 11, 22, '2025-06-16', '2025-06-22', 880.00)
  INSERT INTO Bookings VALUES(23, 12, 23, '2025-07-24', '2025-07-27', 510.00)
  INSERT INTO Bookings VALUES(25, 13, 24, '2025-08-31', '2025-09-03', 540.00)
  INSERT INTO Bookings VALUES(26, 13, 25, '2025-09-09', '2025-09-12', 480.00)

 select * from Bookings

 /*REVIEWS*/
  INSERT INTO Reviews VALUES(1, 1, 1, 4.5, 'The room was clean and spacious. Loved the view!', '2022-01-15')
  INSERT INTO Reviews VALUES(2, 2, 2, 3.8, 'Decent room but the bathroom could use some improvements.', '2022-02-25')
  INSERT INTO Reviews VALUES(3, 3, 3, 4.2, 'Comfortable and cozy room. Enjoyed my stay.', '2022-03-10')
  INSERT INTO Reviews VALUES(4, 4, 4, 4.0, 'The room had all the necessary amenities. Satisfied with my choice.', '2022-04-05')
  INSERT INTO Reviews VALUES(5, 5, 5, 3.5, 'Average room. Nothing too impressive.', '2022-05-20')
  INSERT INTO Reviews VALUES(6, 6, 6, 4.7, 'Spacious and well-designed room. Great experience overall.', '2022-06-15')
  INSERT INTO Reviews VALUES(7, 7, 7, 3.2, 'The room was not as clean as expected. Disappointed.', '2022-07-12')
  INSERT INTO Reviews VALUES(8, 8, 8, 4.9, 'Absolutely loved the room! It was beautifully furnished.', '2022-08-25')
  INSERT INTO Reviews VALUES(9, 9, 9, 3.6, 'The room was small and cramped. Not the best experience.', '2022-09-18')
  INSERT INTO Reviews VALUES(10, 10, 10, 4.3, 'Cozy and comfortable room. Would stay again.', '2022-10-30')
  INSERT INTO Reviews VALUES(11, 11, 11, 4.8, 'The room was spotless and had a nice view. Highly recommended!', '2022-11-05')
  INSERT INTO Reviews VALUES(12, 12, 12, 3.4, 'The room was outdated and in need of renovation.', '2022-12-15')
  INSERT INTO Reviews VALUES(13, 13, 13, 4.6, 'Spacious and modern room. Enjoyed every moment.', '2023-01-22')
  INSERT INTO Reviews VALUES(14, 14, 14, 3.7, 'The room was average. Nothing stood out.', '2023-02-08')
  INSERT INTO Reviews VALUES(15, 15, 15, 4.1, 'Clean and comfortable room. Met my expectations.', '2023-03-18')
  INSERT INTO Reviews VALUES(16, 16, 16, 3.9, 'The room had a strange odor. Not entirely satisfied.', '2023-04-02')
  INSERT INTO Reviews VALUES(17, 17, 17, 4.4, 'The room was spacious and had all the necessary amenities.', '2023-05-10')
  INSERT INTO Reviews VALUES(18, 18, 18, 3.3, 'The room was noisy and the bed was uncomfortable.', '2023-06-20')
  INSERT INTO Reviews VALUES(19, 19, 19, 4.5, 'Beautifully decorated room with a great view.', '2023-07-05')
  INSERT INTO Reviews VALUES(20, 20, 20, 3.8, 'The room was clean and well-maintained. Enjoyable stay.', '2023-08-15')
  INSERT INTO Reviews VALUES(21, 21, 21, 4.2, 'Spacious and comfortable room. Satisfied with my choice.', '2023-09-03')
  INSERT INTO Reviews VALUES(22, 22, 22, 3.5, 'The room was average in terms of cleanliness and comfort.', '2023-09-02')
  INSERT INTO Reviews VALUES(23, 23, 23, 4.7, 'Absolutely loved the room! It exceeded my expectations.', '2023-10-18')
  INSERT INTO Reviews VALUES(24, 24, 24, 3.9, 'The room had a nice view, but the furniture was outdated.', '2023-11-10')
  INSERT INTO Reviews VALUES(25, 25, 25, 4.3, 'Spacious and well-equipped room. Had a pleasant stay.', '2023-12-28');
  select * from Reviews

  /*FLIGHTS*/
  INSERT INTO Flights VALUES(1, 'Delta Airlines', 'JFK', 'LAX', '2023-05-16', '2023-05-16', 250.00)
  INSERT INTO Flights VALUES(2, 'United Airlines', 'LAX', 'SFO', '2023-05-17', '2023-05-17', 150.00)
  INSERT INTO Flights VALUES(3, 'American Airlines', 'DFW', 'ORD', '2023-05-18', '2023-05-18', 200.00)
  INSERT INTO Flights VALUES(4, 'Southwest Airlines', 'LAS', 'DEN', '2023-05-19', '2023-05-19', 180.00)
  INSERT INTO Flights VALUES(5, 'JetBlue Airways', 'MCO', 'JFK', '2023-05-20', '2023-05-20', 300.00)
  INSERT INTO Flights VALUES(6, 'Delta Airlines', 'LAX', 'ATL', '2023-05-21', '2023-05-21', 280.00)
  INSERT INTO Flights VALUES(7, 'United Airlines', 'ORD', 'LAX', '2023-05-22', '2023-05-22', 320.00)
  INSERT INTO Flights VALUES(8, 'American Airlines', 'SFO', 'DFW', '2023-05-23', '2023-05-23', 200.00)
  INSERT INTO Flights VALUES(9, 'Southwest Airlines', 'DEN', 'LAS', '2023-05-24', '2023-05-24', 180.00)
  INSERT INTO Flights VALUES(10, 'JetBlue Airways', 'JFK', 'MCO', '2023-05-25', '2023-05-25', 300.00)
  INSERT INTO Flights VALUES(11, 'Delta Airlines', 'LAX', 'JFK', '2023-05-26', '2023-05-26', 250.00)
  INSERT INTO Flights VALUES(12, 'United Airlines', 'SFO', 'LAX', '2023-05-27', '2023-05-27', 150.00)
  INSERT INTO Flights VALUES(13, 'American Airlines', 'ORD', 'DFW', '2023-05-28', '2023-05-28', 200.00)
  INSERT INTO Flights VALUES(14, 'Southwest Airlines', 'DEN', 'LAS', '2023-05-29', '2023-05-29', 180.00)
  INSERT INTO Flights VALUES(15, 'JetBlue Airways', 'JFK', 'MCO', '2023-05-30', '2023-05-30', 300.00)
  INSERT INTO Flights VALUES(16, 'Delta Airlines', 'ATL', 'LAX', '2023-05-31', '2023-05-31', 280.00)
  INSERT INTO Flights VALUES(17, 'United Airlines', 'LAX', 'ORD', '2023-06-01', '2023-06-01', 320.00)
  INSERT INTO Flights VALUES(18, 'American Airlines', 'DFW', 'SFO', '2023-06-02', '2023-06-02', 200.00)
  INSERT INTO Flights VALUES(19, 'Southwest Airlines', 'LAS', 'DEN', '2023-06-03', '2023-06-03', 180.00)
  INSERT INTO Flights VALUES(20, 'Air France', 'CDG', 'JFK', '2023-06-10', '2023-06-10', 450.00)
  INSERT INTO Flights VALUES(21, 'Delta Airlines', 'LAX', 'ATL', '2023-06-05', '2023-06-05', 280.00)
  INSERT INTO Flights VALUES(22, 'United Airlines', 'ORD', 'LAX', '2023-06-06', '2023-06-06', 320.00)
  INSERT INTO Flights VALUES(23, 'American Airlines', 'SFO', 'DFW', '2023-06-07', '2023-06-07', 200.00)
  INSERT INTO Flights VALUES(24, 'Southwest Airlines', 'DEN', 'LAS', '2023-06-08', '2023-06-08', 180.00)
  INSERT INTO Flights VALUES(25, 'JetBlue Airways', 'JFK', 'MCO', '2023-06-09', '2023-06-09', 300.00);

  select * from Flights


  /*Car_Rentals*/
  INSERT INTO Car_Rentals VALUES(1, 'Enterprise', 'Los Angeles International Airport', 'San Francisco International Airport', '2023-06-01', '2023-06-05', 200.00)
  INSERT INTO Car_Rentals VALUES(2, 'Hertz', 'Miami International Airport', 'Orlando International Airport', '2023-06-02', '2023-06-04', 150.00)
  INSERT INTO Car_Rentals VALUES(3, 'Avis', 'John F. Kennedy International Airport', 'Boston Logan International Airport', '2023-06-03', '2023-06-06', 180.00)
  INSERT INTO Car_Rentals VALUES(4, 'Budget', 'Dallas/Fort Worth International Airport', 'Houston George Bush Intercontinental Airport', '2023-06-04', '2023-06-07', 220.00)
  INSERT INTO Car_Rentals VALUES(5, 'National', 'Chicago OHare International Airport', 'Las Vegas McCarran International Airport', '2023-06-05', '2023-06-08', 250.00)
  INSERT INTO Car_Rentals VALUES(6, 'Thrifty', 'Denver International Airport', 'Phoenix Sky Harbor International Airport', '2023-06-06', '2023-06-09', 190.00)
  INSERT INTO Car_Rentals VALUES(7, 'Alamo', 'San Francisco International Airport', 'Seattle-Tacoma International Airport', '2023-06-07', '2023-06-10', 210.00)
  INSERT INTO Car_Rentals VALUES(8, 'Enterprise', 'Orlando International Airport', 'Miami International Airport', '2023-06-08', '2023-06-11', 170.00)
  INSERT INTO Car_Rentals VALUES(9, 'Hertz', 'Boston Logan International Airport', 'John F. Kennedy International Airport', '2023-06-09', '2023-06-12', 190.00)
  INSERT INTO Car_Rentals VALUES(10, 'Avis', 'Houston George Bush Intercontinental Airport', 'Dallas/Fort Worth International Airport', '2023-06-10', '2023-06-13', 200.00)
  INSERT INTO Car_Rentals VALUES(11, 'Budget', 'Las Vegas McCarran International Airport', 'Chicago OHare International Airport', '2023-06-11', '2023-06-14', 230.00)
  INSERT INTO Car_Rentals VALUES(12, 'National', 'Phoenix Sky Harbor International Airport', 'Denver International Airport', '2023-06-12', '2023-06-15', 210.00)
  INSERT INTO Car_Rentals VALUES(13, 'Thrifty', 'Seattle-Tacoma International Airport', 'San Francisco International Airport', '2023-06-13', '2023-06-16', 220.00)
  INSERT INTO Car_Rentals VALUES(14, 'Alamo', 'Miami International Airport', 'Orlando International Airport', '2023-06-14', '2023-06-17', 180.00)
  INSERT INTO Car_Rentals VALUES(15, 'Enterprise', 'Boston Logan International Airport', 'John F. Kennedy International Airport', '2023-06-15', '2023-06-18', 190.00)
  INSERT INTO Car_Rentals VALUES(16, 'Hertz', 'Dallas/Fort Worth International Airport', 'Houston George Bush Intercontinental Airport', '2023-06-16', '2023-06-19', 220.00)
  INSERT INTO Car_Rentals VALUES(17, 'Avis', 'Las Vegas McCarran International Airport', 'Chicago OHare International Airport', '2023-06-17', '2023-05-07',260.00)
  INSERT INTO Car_Rentals VALUES(18, 'Budget', 'San Francisco International Airport', 'Los Angeles International Airport', '2023-06-23', '2023-06-26', 190.00)
  INSERT INTO Car_Rentals VALUES(19, 'National', 'Miami International Airport', 'Orlando International Airport', '2023-06-24', '2023-06-27', 180.00)
  INSERT INTO Car_Rentals VALUES(20, 'Thrifty', 'John F. Kennedy International Airport', 'Boston Logan International Airport', '2023-06-25', '2023-06-28', 210.00)
  INSERT INTO Car_Rentals VALUES(21, 'Alamo', 'Dallas/Fort Worth International Airport', 'Houston George Bush Intercontinental Airport', '2023-06-26', '2023-06-29', 240.00)
  INSERT INTO Car_Rentals VALUES(22, 'Enterprise', 'Chicago OHare International Airport', 'Las Vegas McCarran International Airport', '2023-06-27', '2023-06-30', 260.00)
  INSERT INTO Car_Rentals VALUES(23, 'Hertz', 'Denver International Airport', 'Phoenix Sky Harbor International Airport', '2023-06-28', '2023-07-01', 200.00)
  INSERT INTO Car_Rentals VALUES(24, 'Avis', 'San Francisco International Airport', 'Seattle-Tacoma International Airport', '2023-06-29', '2023-07-02', 220.00)
  INSERT INTO Car_Rentals VALUES(25, 'Budget', 'Orlando International Airport', 'Miami International Airport', '2023-06-30', '2023-07-03', 170.00)
  INSERT INTO Car_Rentals VALUES(25, 'National', 'Boston Logan International Airport', 'John F. Kennedy International Airport', '2023-07-01', '2023-07-04', 190.00)
  INSERT INTO Car_Rentals VALUES(26, 'Thrifty', 'Houston George Bush Intercontinental Airport', 'Dallas/Fort Worth International Airport', '2023-07-02', '2023-07-05', 210.00);

  select * from Car_Rentals

  /*Flight_Bookings*/
  INSERT INTO Flight_Bookings VALUES(1, 1, 1, 2, 450.00)
  INSERT INTO Flight_Bookings VALUES(2, 1, 2, 1, 250.00)
  INSERT INTO Flight_Bookings VALUES(3, 2, 3, 3, 720.00)
  INSERT INTO Flight_Bookings VALUES(4, 2, 4, 2, 550.00)
  INSERT INTO Flight_Bookings VALUES(5, 3, 5, 1, 350.00)
  INSERT INTO Flight_Bookings VALUES(6, 3, 6, 4, 900.00)
  INSERT INTO Flight_Bookings VALUES(7, 4, 7, 2, 480.00)
  INSERT INTO Flight_Bookings VALUES(8, 4, 8, 3, 720.00)
  INSERT INTO Flight_Bookings VALUES(9, 5, 9, 1, 250.00)
  INSERT INTO Flight_Bookings VALUES(10, 5, 10, 2, 450.00)
  INSERT INTO Flight_Bookings VALUES(11, 6, 11, 4, 900.00)
  INSERT INTO Flight_Bookings VALUES(12, 6, 12, 1, 350.00)
  INSERT INTO Flight_Bookings VALUES(13, 7, 13, 2, 550.00)
  INSERT INTO Flight_Bookings VALUES(14, 7, 14, 3, 720.00)
  INSERT INTO Flight_Bookings VALUES(15, 8, 15, 1, 250.00)
  INSERT INTO Flight_Bookings VALUES(16, 8, 16, 2, 450.00)
  INSERT INTO Flight_Bookings VALUES(17, 9, 17, 3, 720.00)
  INSERT INTO Flight_Bookings VALUES(18, 9, 18, 4, 900.00)
  INSERT INTO Flight_Bookings VALUES(19, 10, 19, 2, 550.00)
  INSERT INTO Flight_Bookings VALUES(20, 10, 20, 1, 350.00)
  INSERT INTO Flight_Bookings VALUES(21, 11, 21, 3, 720.00)
  INSERT INTO Flight_Bookings VALUES(22, 11, 22, 4, 900.00)
  INSERT INTO Flight_Bookings VALUES(23, 12, 23, 1, 250.00)
  INSERT INTO Flight_Bookings VALUES(24, 12, 24, 2, 450.00)
  INSERT INTO Flight_Bookings VALUES(25, 13, 25, 3, 720.00);

  select * from Flight_Bookings

  /*CAR_RENTAL_BOOKINGS*/
  INSERT INTO Car_Rental_Bookings VALUES(1, 1, 1, 120.00)
  INSERT INTO Car_Rental_Bookings VALUES(2, 1, 2, 180.00)
  INSERT INTO Car_Rental_Bookings VALUES(3, 2, 3, 200.00)
  INSERT INTO Car_Rental_Bookings VALUES(4, 2, 4, 150.00)
  INSERT INTO Car_Rental_Bookings VALUES(5, 3, 5, 220.00)
  INSERT INTO Car_Rental_Bookings VALUES(6, 3, 6, 160.00)
  INSERT INTO Car_Rental_Bookings VALUES(7, 4, 7, 190.00)
  INSERT INTO Car_Rental_Bookings VALUES(8, 4, 8, 210.00)
  INSERT INTO Car_Rental_Bookings VALUES(9, 5, 9, 180.00)
  INSERT INTO Car_Rental_Bookings VALUES(10, 5, 10, 230.00)
  INSERT INTO Car_Rental_Bookings VALUES(11, 6, 11, 200.00)
  INSERT INTO Car_Rental_Bookings VALUES(12, 6, 12, 170.00)
  INSERT INTO Car_Rental_Bookings VALUES(13, 7, 13, 210.00)
  INSERT INTO Car_Rental_Bookings VALUES(14, 7, 14, 190.00)
  INSERT INTO Car_Rental_Bookings VALUES(15, 8, 15, 240.00)
  INSERT INTO Car_Rental_Bookings VALUES(16, 8, 16, 160.00)
  INSERT INTO Car_Rental_Bookings VALUES(17, 9, 17, 180.00)
  INSERT INTO Car_Rental_Bookings VALUES(18, 9, 18, 220.00)
  INSERT INTO Car_Rental_Bookings VALUES(19, 10, 19, 200.00)
  INSERT INTO Car_Rental_Bookings VALUES(20, 10, 20, 190.00)
  INSERT INTO Car_Rental_Bookings VALUES(21, 11, 21, 230.00)
  INSERT INTO Car_Rental_Bookings VALUES(22, 11, 22, 180.00)
  INSERT INTO Car_Rental_Bookings VALUES(23, 12, 23, 210.00)
  INSERT INTO Car_Rental_Bookings VALUES(24, 12, 24, 170.00)
  INSERT INTO Car_Rental_Bookings VALUES(25, 13, 25, 200.00);

  select * from Car_Rental_Bookings


  /*PAYMENTS*/
  INSERT INTO Payments VALUES(1, 1, 1, NULL, NULL, '2023-01-05 09:12:34', 150.00, 'Credit Card')
  INSERT INTO Payments VALUES(2, 1, NULL, 1, NULL, '2023-01-06 10:23:45', 250.00, 'PayPal')
  INSERT INTO Payments VALUES(3, 2, 2, NULL, NULL, '2023-01-07 11:34:56', 200.00, 'Credit Card')
  INSERT INTO Payments VALUES(4, 2, NULL, NULL, 1, '2023-01-08 12:45:01', 180.00, 'Debit Card')
  INSERT INTO Payments VALUES(5, 3, 3, NULL, NULL, '2023-01-09 13:56:12', 300.00, 'Credit Card')
  INSERT INTO Payments VALUES(6, 3, NULL, 2, NULL, '2023-01-10 14:07:23', 350.00, 'PayPal')
  INSERT INTO Payments VALUES(7, 4, 4, NULL, NULL, '2023-01-11 15:18:34', 280.00, 'Credit Card')
  INSERT INTO Payments VALUES(8, 4, NULL, NULL, 2, '2023-01-12 16:29:45', 200.00, 'Debit Card')
  INSERT INTO Payments VALUES(9, 5, 5, NULL, NULL, '2023-01-13 17:40:56', 150.00, 'Credit Card')
  INSERT INTO Payments VALUES(10, 5, NULL, 3, NULL, '2023-01-14 18:51:01', 300.00, 'PayPal')
  INSERT INTO Payments VALUES(11, 6, 6, NULL, NULL, '2023-01-15 20:02:12', 400.00, 'Credit Card')
  INSERT INTO Payments VALUES(12, 6, NULL, NULL, 3, '2023-01-16 21:13:23', 220.00, 'Debit Card')
  INSERT INTO Payments VALUES(13, 7, 7, NULL, NULL, '2023-01-17 22:24:34', 180.00, 'Credit Card')
  INSERT INTO Payments VALUES(14, 7, NULL, 4, NULL, '2023-01-18 23:35:45', 250.00, 'PayPal')
  INSERT INTO Payments VALUES(15, 8, 8, NULL, NULL, '2023-01-19 00:46:56', 200.00, 'Credit Card')
  INSERT INTO Payments VALUES(16, 8, NULL, NULL, 4, '2023-01-20 01:58:01', 320.00, 'Debit Card')
  INSERT INTO Payments VALUES(17, 9, 9, NULL, NULL, '2023-01-21 03:09:12', 240.00, 'Credit Card')
  INSERT INTO Payments VALUES(18, 9, NULL, 5, NULL, '2023-01-22 04:20:23', 350.00, 'PayPal')
  INSERT INTO Payments VALUES(19, 10, 10, NULL, NULL, '2023-01-23 05:31:34', 180.00, 'Credit Card')
  INSERT INTO Payments VALUES(20, 13, NULL, 7, NULL, '2023-01-29 12:37:34', 240.00, 'PayPal')
  INSERT INTO Payments VALUES(21, 11, 11, NULL, NULL, '2023-01-24 06:42:45', 250.00, 'Credit Card')
  INSERT INTO Payments VALUES(22, 11, NULL, 6, NULL, '2023-01-25 07:53:56', 280.00, 'PayPal')
  INSERT INTO Payments VALUES(23, 12, 12, NULL, NULL, '2023-01-26 09:04:01', 220.00, 'Credit Card')
  INSERT INTO Payments VALUES(24, 12, NULL, NULL, 5, '2023-01-27 10:15:12', 190.00, 'Debit Card')
  INSERT INTO Payments VALUES(25, 13, 13, NULL, NULL, '2023-01-28 11:26:23', 320.00, 'Credit Card')
 
  select * from Payments

 /*Room_images: */

INSERT INTO Room_Images VALUES (1, 1, 'https://example.com/room1_image1.jpg');
INSERT INTO Room_Images VALUES (2, 1, 'https://example.com/room1_image2.jpg');
INSERT INTO Room_Images VALUES (3, 2, 'https://example.com/room2_image1.jpg');
INSERT INTO Room_Images VALUES (4, 2, 'https://example.com/room2_image2.jpg');
INSERT INTO Room_Images VALUES (5, 3, 'https://example.com/room3_image1.jpg');
INSERT INTO Room_Images VALUES (6, 3, 'https://example.com/room3_image2.jpg');
INSERT INTO Room_Images VALUES (7, 4, 'https://example.com/room4_image1.jpg');
INSERT INTO Room_Images VALUES (8, 4, 'https://example.com/room4_image2.jpg');
INSERT INTO Room_Images VALUES (9, 5, 'https://example.com/room5_image1.jpg');
INSERT INTO Room_Images VALUES (10, 5, 'https://example.com/room5_image2.jpg');
INSERT INTO Room_Images VALUES (11, 6, 'https://example.com/room6_image1.jpg');
INSERT INTO Room_Images VALUES (12, 6, 'https://example.com/room6_image2.jpg');
INSERT INTO Room_Images VALUES (13, 7, 'https://example.com/room7_image1.jpg');
INSERT INTO Room_Images VALUES (14, 7, 'https://example.com/room7_image2.jpg');
INSERT INTO Room_Images VALUES (15, 8, 'https://example.com/room8_image1.jpg');
INSERT INTO Room_Images VALUES (16, 8, 'https://example.com/room8_image2.jpg');
INSERT INTO Room_Images VALUES (17, 9, 'https://example.com/room9_image1.jpg');
INSERT INTO Room_Images VALUES (18, 9, 'https://example.com/room9_image2.jpg');
INSERT INTO Room_Images VALUES (19, 10, 'https://example.com/room10_image1.jpg');
INSERT INTO Room_Images VALUES (20, 10, 'https://example.com/room10_image2.jpg');
INSERT INTO Room_Images VALUES (21, 11, 'https://example.com/room11_image1.jpg');
INSERT INTO Room_Images VALUES (22, 11, 'https://example.com/room11_image2.jpg');
INSERT INTO Room_Images VALUES (23, 12, 'https://example.com/room12_image1.jpg');
INSERT INTO Room_Images VALUES (24, 12, 'https://example.com/room12_image2.jpg');
INSERT INTO Room_Images VALUES (25, 13, 'https://example.com/room13_image1.jpg');

select * from Room_Images

/* Promotions: */


INSERT INTO Promotions VALUES(1, 'Summer Sale', '2023-06-01', '2023-08-31', 0.15, 'Room')
INSERT INTO Promotions VALUES(2, 'Family Discount', '2023-05-01', '2023-12-31', 0.20, 'Room')
INSERT INTO Promotions VALUES(3, 'Weekend Getaway', '2023-07-15', '2023-12-31', 0.10, 'Room')
INSERT INTO Promotions VALUES(4, 'Spring Special', '2023-04-01', '2023-05-31', 0.25, 'Room')
INSERT INTO Promotions VALUES(5, 'Honeymoon Package', '2023-06-01', '2023-12-31', 0.12, 'Room')
INSERT INTO Promotions VALUES(6, 'Last Minute Deal', '2023-05-20', '2023-06-30', 0.18, 'Room')
INSERT INTO Promotions VALUES(7, 'Extended Stay Discount', '2023-05-01', '2023-12-31', 0.15, 'Room')
INSERT INTO Promotions VALUES(8, 'Winter Escape', '2023-11-01', '2024-02-29', 0.30, 'Room')
INSERT INTO Promotions VALUES(9, 'Business Traveler Discount', '2023-05-01', '2023-12-31', 0.10, 'Room')
INSERT INTO Promotions VALUES(10, 'Early Bird Offer', '2024-01-01', '2024-03-31', 0.20, 'Room')
INSERT INTO Promotions VALUES(11, 'Adventure Package', '2023-06-01', '2023-09-30', 0.15, 'Room')
INSERT INTO Promotions VALUES(12, 'Senior Citizen Discount', '2023-05-01', '2023-12-31', 0.25, 'Room')
INSERT INTO Promotions VALUES(13, 'Romantic Getaway', '2023-05-01', '2023-12-31', 0.12, 'Room')
INSERT INTO Promotions VALUES(14, 'Holiday Special', '2023-12-20', '2024-01-05', 0.20, 'Room')
INSERT INTO Promotions VALUES(15, 'Group Booking Discount', '2023-05-01', '2023-12-31', 0.15, 'Room')
INSERT INTO Promotions VALUES(16, 'Summer Vacation', '2023-06-15', '2023-09-15', 0.10, 'Room')
INSERT INTO Promotions VALUES(17, 'Midweek Retreat', '2023-05-01', '2023-12-31', 0.18, 'Room')
INSERT INTO Promotions VALUES(18, 'Anniversary Celebration', '2023-05-01', '2023-12-31', 0.12, 'Room')
INSERT INTO Promotions VALUES(19, 'Weekday Special', '2023-05-01', '2023-12-31', 0.15, 'Room')
INSERT INTO Promotions VALUES(20, 'Fall Foliage Discount', '2023-09-01', '2023-11-30', 0.20, 'Room')
INSERT INTO Promotions VALUES(21, 'Wellness Retreat', '2023-05-01', '2023-12-31', 0.10, 'Room')
INSERT INTO Promotions VALUES(22, 'Summer Adventure', '2023-06-01', '2023-08-31', 0.15, 'Room')
INSERT INTO Promotions VALUES(26, 'Summer Spa Retreat', '2023-06-01', '2023-08-31', 0.15, 'Room')
INSERT INTO Promotions VALUES(24, 'Easter Special', '2023-04-01', '2023-04-10', 0.25, 'Room')
INSERT INTO Promotions VALUES(25, 'New Years Eve Package', '2023-12-30', '2024-01-01', 0.20, 'Room');

select * from Promotions


/* 1. Nested query with aggregate function:
Retrieve the hotel names along with the maximum price
per night among all available rooms for each hotel. */

--sql

SELECT h.hotel_name, (SELECT MAX(r.price_per_night)
FROM Rooms r WHERE r.hotel_id = h.hotel_id) AS max_price
FROM Hotels h;


/* 2. Correlated nested query with count:
Retrieve the hotel names along with the count
of rooms available for each hotel. */
select * from
--sql

SELECT h.hotel_name, (SELECT COUNT(*) FROM Rooms r
WHERE r.hotel_id = h.hotel_id) AS room_count
FROM Hotels h;


/* 3. Join and group by query with aggregate function:
Retrieve the average rating and total number of reviews
for each hotel. */

--sql

SELECT h.hotel_name, AVG(r.rating) AS average_rating, COUNT(r.review_id) AS total_reviews
FROM Hotels h
LEFT JOIN Reviews r ON h.hotel_id = r.hotel_id
GROUP BY h.hotel_id, h.hotel_name;

/* 4. Join and nested query with limit:
Retrieve the top 5 users who have made the most bookings,
along with their respective booking counts. */

--sql

SELECT u.username, COUNT(b.booking_id) AS booking_count
FROM Users u
JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.username
ORDER BY booking_count DESC
;

/* 5. Join and nested query with aggregate function:
Retrieve the hotel names and the minimum price per night
among all available rooms for each hotel. */

--sql

SELECT h.hotel_name, MIN(r.price_per_night) AS min_price
FROM Hotels h
JOIN Rooms r ON h.hotel_id = r.hotel_id
GROUP BY h.hotel_id, h.hotel_name;

/* 6. Nested query with multiple conditions:
Retrieve the hotel names of hotels that have rooms
with a maximum occupancy of 2 and a price per night less than $200. */

--sql

SELECT hotel_name
FROM Hotels
WHERE hotel_id IN (SELECT hotel_id FROM Rooms
WHERE max_occupancy = 2 AND price_per_night < 200);

/* 7. Correlated nested query with conditional aggregation:
Retrieve the usernames of users who have made more than 3 bookings.*/

--sql

SELECT username
FROM Users u
WHERE (SELECT COUNT(*) FROM Bookings b
WHERE b.user_id = u.user_id) > 1;


/* 8. Join and nested query with subquery:
Retrieve the hotel names and the average ratings
of hotels with a rating higher than the average rating of all hotels. */

--sql

SELECT h.hotel_name, (SELECT AVG(rating) FROM Reviews) AS average_rating
FROM Hotels h
JOIN Reviews r ON h.hotel_id = r.hotel_id
WHERE r.rating > (SELECT AVG(rating) FROM Reviews);

/* 9. Group by and having query:
Retrieve the hotel names and the total number
of rooms for hotels that have more than 50 rooms available. */
--sql

SELECT h.hotel_name, COUNT(r.room_id) AS total_rooms
FROM Hotels h
JOIN Rooms r ON h.hotel_id = r.hotel_id
GROUP BY h.hotel_id, h.hotel_name
HAVING COUNT(r.room_id) > 1;

/* 10.Join and order by query:
Retrieve the hotel names and their corresponding
star ratings in descending order of star ratings. */

--sql

SELECT hotel_name, star_rating
FROM Hotels
ORDER BY star_rating DESC;

/* 11. Group by and aggregate function query:
Retrieve the average rating of each hotel along
with the total number of reviews for that hotel. */

--sql

SELECT hotel_id, AVG(rating) AS average_rating,
COUNT(*) AS total_reviews
FROM Reviews
GROUP BY hotel_id;


/* 12. Nested query with multiple conditions and order by:
Retrieve the usernames and email addresses of
users who have made bookings for hotels in a specific city,
sorted alphabetically by username. */

--sql

SELECT username, email
FROM Users
WHERE user_id IN (
    SELECT DISTINCT user_id
    FROM Bookings
    WHERE room_id IN (
        SELECT room_id
        FROM Rooms
        WHERE hotel_id IN (
            SELECT hotel_id
            FROM Hotels
            WHERE city = 'New York'
        )
    )
)
ORDER BY username ASC;

/* 13.Correlated nested query with aggregation and order by:
Retrieve the hotel names and the average rating for each hotel,
sorted in descending order of average rating. */

--sql

SELECT hotel_name, (
    SELECT AVG(rating)
    FROM Reviews
    WHERE hotel_id = h.hotel_id
) AS average_rating
FROM Hotels h
ORDER BY average_rating DESC;

