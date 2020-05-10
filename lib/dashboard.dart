import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/detailspage.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  _buildListItem(String imgPath, String country, String description) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Stack(
        children: <Widget>[
          //
          Container(
            height: 300.0,
          ),
          //the image
          Container(
            height: 300.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.darken),
                )),
          ),
          // Text ontop of picture
          Container(
            height: 300.0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    country,
                    style: GoogleFonts.montserrat(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                  Text(
                    description,
                    style: GoogleFonts.montserrat(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                  // sized box for spacing
                  SizedBox(
                    height: 20.0,
                  ),
                  // button
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsPage(imgPath: imgPath,title: country,)
                      ));
                    },
                    child: Container(
                      height: 50.0,
                      width: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          'Explore now',
                          style: GoogleFonts.montserrat(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              textStyle: TextStyle(color: Color(0xFFFD4F99))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // top column on page
      children: <Widget>[
        //sized box for top of the screen
        SizedBox(height: 20.0),
        //top row (filter btn, home label, save button)
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Color(0xFFFD4F99)),
                child: Center(
                  child: Icon(Icons.filter_list, color: Colors.white),
                ),
              ),
              Text(
                'HOME',
                style: GoogleFonts.montserrat(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    textStyle: TextStyle(color: Colors.white)),
              ),
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Color(0xFF353535)),
                child: Center(
                  child: Icon(Icons.bookmark_border, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        //size box
        SizedBox(
          height: 10.0,
        ),
        // list of cards
        Container(
          height: MediaQuery.of(context).size.height - 156.0,
          child: ListView(
            children: <Widget>[
              _buildListItem('assets/unitedkingdom.jpg', 'United Kingdom',
                  'Explore the UK.'),
              _buildListItem('assets/switzerland.jpg', 'Switzerland',
                  'Explore Switzerland.'),
              _buildListItem('assets/canada.jpg', 'Canada',
                  'Explore Canada.')
                  
            ],
          ),
        ),
      ],
    );
  }
}
