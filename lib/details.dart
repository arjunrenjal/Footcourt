import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final List<String> imagePaths = [
    'assets/c1.jpg',
    'assets/c2.jpg',
    'assets/c3.jpg',
    'assets/c4.jpg',
    // Add more image paths as needed
  ];

  double currentIndex = 0;

  List<String> amenities = [
    'Changing Room',
    'Refreshments',
    'Toilets',
    'Parking',
    'Showers',
    // Add more amenities as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      child: Image.asset(
                        imagePaths[index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    height: 100,
                  ),
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Tiento Sports",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          SizedBox(width: 4),
                          Text(
                            "3.81",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "(91 Reviews)",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Maddison Road",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amenities & Facilities',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4, // Show a maximum of 4 amenities initially
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          title: Text(amenities[index]),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    if (amenities.length > 4)
                      TextButton(
                        onPressed: () {
                          // Navigate to a new page showing all amenities
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AllAmenitiesPage(amenities: amenities)),
                          );
                        },
                        child: Text('Show All'),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Price: ₹1230/hour',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the booking confirmation page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookingConfirmationPage(
                                totalAmount: 1230,
                              )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    fixedSize: Size(200, 60),
                  ),
                  child: Text(
                    'Book Now',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AllAmenitiesPage extends StatelessWidget {
  final List<String> amenities;

  const AllAmenitiesPage({required this.amenities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('All Amenities'),
      ),
      body: ListView.builder(
        itemCount: amenities.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.check,
              color: Colors.green,
            ),
            title: Text(amenities[index]),
          );
        },
      ),
    );
  }
}

class BookingConfirmationPage extends StatefulWidget {
  final double totalAmount;

  BookingConfirmationPage({required this.totalAmount});

  @override
  _BookingConfirmationPageState createState() =>
      _BookingConfirmationPageState();
}

class _BookingConfirmationPageState extends State<BookingConfirmationPage> {
  int numberOfPlayers = 1;

  @override
  Widget build(BuildContext context) {
    double splitAmount = widget.totalAmount / numberOfPlayers;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the button horizontally
            children: [
              ElevatedButton(
                onPressed: () {
                  // Code to send payment messages to the players
                  // Replace this with your actual implementation for sending messages
                  for (int i = 0; i < numberOfPlayers; i++) {
                    String playerMessage =
                        "Hello Player ${i + 1}, please pay \$${splitAmount.toStringAsFixed(2)} "
                        "for the football field booking.";
                    // You can use a messaging service, like Firebase Cloud Messaging, to send messages
                    // to the players with the playerMessage content.
                  }

                  // Navigate back to the previous page
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  fixedSize: Size(200, 60),
                ),
                child: Text(
                  'CONFIRM PAYMENT',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Booking Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.book_online_rounded,
                        color: Colors.black,
                      ),
                      Text(
                        'Booking Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Date: July 31, 2023',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Time: 9:00 AM - 10:00 AM',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Court: Tiento Sports',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "--------------------------------------------------------------------------------------------------------------------------"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Payment Method',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Credit Card'),
                    subtitle: Text('**** **** **** 1234'),
                  ),
                  ListTile(
                    leading: Icon(Icons.money),
                    title: Text('Cash'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "--------------------------------------------------------------------------------------------------------------------------"),
                  SizedBox(height: 10),
                  Text(
                    'Number of Players',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (numberOfPlayers > 1) {
                            setState(() {
                              numberOfPlayers--;
                            });
                          }
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text(numberOfPlayers.toString(),
                          style: TextStyle(fontSize: 18)),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            numberOfPlayers++;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                      "--------------------------------------------------------------------------------------------------------------------------"),
                  SizedBox(height: 20),
                  Text(
                    'Split Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Split among $numberOfPlayers players:',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\₹${splitAmount.toStringAsFixed(2)} per player',
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 20),
                  Text(
                      "--------------------------------------------------------------------------------------------------------------------------"),
                  SizedBox(height: 20),
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('\₹${widget.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 20)),
                      SizedBox(width: 50),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Details(),
  ));
}
