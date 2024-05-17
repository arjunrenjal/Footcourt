import 'package:flutter/material.dart';
import 'package:footcourt/details.dart';
import 'package:footcourt/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    BookingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer_sharp),
                label: 'Bookings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_3),
                label: 'Profile',
              ),
            ],
            selectedLabelStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              title: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        child: Image.asset(
                          'assets/logo.png',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 123,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.location_on,
                          size: 30,
                        ),
                        onPressed: () {
                          // Implement action for showing user's current location
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Hello, user 👋 Where would you like to play?',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: 'Search for courts, locality & more...',
                        hintStyle: TextStyle(fontSize: 16),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 18),
                      ),
                    ),
                  ),
                ],
              ),
              toolbarHeight: 210,
              backgroundColor: Colors.black,
            ),
            SizedBox(height: 20),
            _buildLocalityCircleWithHeading(
              context,
              'Popular Localities',
              [
                _buildLocalityCircle(
                  context,
                  'assets/l1.jpg',
                  'Falnir',
                ),
                _buildLocalityCircle(
                  context,
                  'assets/l2.jpg',
                  'Deralakatte',
                ),
                _buildLocalityCircle(
                  context,
                  'assets/l3.jpg',
                  'Kudroli',
                ),
                _buildLocalityCircle(
                  context,
                  'assets/l4.jpg',
                  'Pandeshwar',
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // Set your desired color here
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Events',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/e2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ), // Replace with your event image
                      ],
                    ),
                  ),
                  // Replace with your event image
                ],
              ),
            ),
            _buildCourtItemsWithHeading(
              context,
              'Recommended Courts',
              [
                _buildCourtItem(
                  context,
                  'assets/c1.jpg',
                  'Tiento Sports',
                  '3.81',
                  '(91)',
                  'Maddison Road',
                ),
                _buildCourtItem(
                  context,
                  'assets/c3.jpg',
                  'Fusion - The Turf',
                  '4.32',
                  '(22)',
                  'Next to Karnataka State Homes...',
                ),
                _buildCourtItem(
                  context,
                  'assets/c2.jpg',
                  'Skyline Multisport',
                  '4.96',
                  '(53)',
                  'JP Nagar',
                ),
                _buildCourtItem(
                  context,
                  'assets/c4.jpg',
                  'Red Bull Arena',
                  '3.77',
                  '(43)',
                  'Banaswadi',
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLocalityCircle(
    BuildContext context,
    String imagePath,
    String localityName,
  ) {
    return GestureDetector(
      onTap: () {
        // Implement action for when a locality circle is tapped
        // For example, you can navigate to a specific page or perform some action.
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover, // Scale and crop the image to fit the circle
                width: 80,
                height: 80,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            localityName,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocalityCircleWithHeading(
    BuildContext context,
    String heading,
    List<Widget> circles,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            heading,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: circles,
        ),
      ],
    );
  }

  Widget _buildCourtItem(
    BuildContext context,
    String imagePath,
    String name,
    String rating,
    String reviewCount,
    String location,
  ) {
    return GestureDetector(
      onTap: () {
        // Navigate to the booking page here when the container is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Details(), // Replace Details() with your booking page
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Container(
          height: 252, // Set a fixed height for the container
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 180, // Set a fixed height for the image
                  fit: BoxFit
                      .cover, // Ensure the image maintains aspect ratio and covers the available space
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        SizedBox(width: 4),
                        Text(rating),
                        SizedBox(width: 8),
                        Text(
                          reviewCount,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourtItemsWithHeading(
    BuildContext context,
    String heading,
    List<Widget> courtItems,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            heading,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(children: courtItems),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 0, left: 15),
          child: Row(
            children: [
              Text(
                'CONVENIENT',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(width: 5),
              Image.asset(
                'assets/i.png',
                height: 40,
                width: 70,
                color: Colors.grey,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 0, left: 15),
          child: Text(
            'COURT BOOKINGS',
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontStyle: FontStyle.italic),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 250, left: 15),
          child: Text(
            'All across Manglore',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontStyle: FontStyle.italic),
          ),
        )
      ],
    );
  }
}

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Your Bookings',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900,
                fontSize: 28.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'We\'ve curated your bookings for you!',
              style: TextStyle(
                color: Color.fromRGBO(147, 147, 147, 1),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Current',
            ),
            Tab(
              text: 'Past',
            ),
            Tab(
              text: 'Cancelled',
            ),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.greenAccent,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        toolbarHeight: 132.0,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: TabBarView(controller: _tabController, children: [
        // Add your widgets for each tab (Current, Past, and Cancelled) here
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: [
                    _buildCourtItem(
                      'assets/c3.jpg',
                      'Fusion - The Turf',
                      '4.32',
                      '(22)',
                      'Next to Karnataka State Homes...',
                      '₹2900/hour',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              _buildCourtItem(
                'assets/c2.jpg',
                'Skyline Multisport',
                '4.96',
                '(53)',
                'JP Nagar',
                '₹1150/hour',
              ),
              SizedBox(height: 10),
              _buildCourtItem(
                'assets/c4.jpg',
                'Red Bull Arena',
                '3.77',
                '(43)',
                'Banaswadi',
                '₹1450/hour',
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              _buildCourtItem(
                'assets/c1.jpg',
                'Tiento Sports',
                '3.81',
                '(91)',
                'Maddison Road',
                '₹1200/hour',
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildCourtItem(
    String imagePath,
    String name,
    String rating,
    String reviewCount,
    String location,
    String price,
  ) {
    return Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
        child: Container(
            height: 252, // Set a fixed height for the container
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 180, // Set a fixed height for the image
                  fit: BoxFit
                      .cover, // Ensure the image maintains aspect ratio and covers the available space
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            SizedBox(width: 4),
                            Text(rating),
                            SizedBox(width: 8),
                            Text(
                              reviewCount,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          location,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ]))
            ])));
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w900,
            fontSize: 28.0,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SettingsPage(); // Placeholder import for SettingsPage
                  },
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/p33.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.0),
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/pr1.jpeg'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Arjun Renjal',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Forward',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 24.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Stats',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1.5,
                        ),
                        SizedBox(height: 12),
                        buildProfileStatRow('No of Bookings', '3'),
                        SizedBox(height: 12),
                        buildProfileStatRow('Date of Birth', '05-06-2003'),
                        SizedBox(height: 12),
                        buildProfileStatRow('Email', 'arjun.renjal@gmail.com'),
                        SizedBox(height: 12),
                        buildProfileStatRow('Phone', '+1 (123) 456-7890'),
                        SizedBox(height: 12),
                        buildProfileStatRow('Address', '1234 Elm Street, City'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileStatRow(String title, String value) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  // Implement the settings page as needed
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}
