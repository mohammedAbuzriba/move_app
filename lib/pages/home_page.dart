import 'package:flutter/material.dart';
import 'package:move_app/pages/login_page.dart';
import 'package:move_app/user_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  int _selectedIndex = 0;
  static String id = 'HomePage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserModel user;
  UserModel get usernull {
    if (user.username == '') {
      user.username = 'no user';
      user.password = 'no user';
      return user;
    } else {
      return user;
    }
  }

  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)!.settings.arguments as UserModel;

    const TextStyle optionStyle =
        TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    List<Widget> _widgetOptions = <Widget>[
      HomeContent(),
      const Text(
        'Index 2: Open Dialog',
        style: optionStyle,
      ),
      const Text(
        'Index 3: Open Dialog',
        style: optionStyle,
      ),

      profile(usernull: usernull, context: context),

      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       const Text(
      //         'My Profile',
      //         style: optionStyle,
      //       ),
      //       Text(
      //         'user name : ${usernull.username}',
      //         style: optionStyle,
      //       ),
      //       Text(
      //         'password : ${usernull.password}',
      //         style: optionStyle,
      //       ),
      //     ],
      //   ),
      // ),
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.black,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.green),
        ),
        actions: [
          Row(
            children: [
              text(text: user.username.toString()),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        surfaceTintColor: Colors.green,
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text('Drawer Header')),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginPage.id, (Route<dynamic> route) => false);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(children: [
                Text('Loge out'),
                Icon(Icons.logout),
              ]),
            ),
          )
        ]),
      ),
      body: _widgetOptions.elementAt(widget._selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie,
            ),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.recent_actors,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          )
        ],
        currentIndex: widget._selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
            case 3:
              break;
          }
          setState(() {
            widget._selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  HomeContent({super.key});
  List moviesCategory = [
    'action',
    'drama',
    'crime',
    'action',
    'adventure',
    'action',
    'drama',
    'crime',
    'action'
  ];
  List moviesImage = [
    'https://www.themoviedb.org/t/p/w220_and_h330_face/7bEYwjUvlJW7GerM8GYmqwl4oS3.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/7WCNaek6zGlhum99TA63QmVPhox.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/eeUNWsdoiOijOZAMaWFDA5Pb1n8.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/oktTNFM8PzdseiK1X0E0XhB6LvP.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/7bEYwjUvlJW7GerM8GYmqwl4oS3.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/2PQRFl4zcJvZROJFJ2Ngr9YbOqp.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/cAoAgzOCxSytYBqqCQulhXNR3LB.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 30),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlayAnimationDuration: Duration(milliseconds: 400),
                autoPlay: true,
                height: 150.0,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 2.0,
                initialPage: 2,
              ),
              items: moviesImage.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          url,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            )
            // Container(
            //   height: 150,
            //   child:
            //   ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: moviesImage.length,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 20),
            //         child: Container(
            //           width: 200,
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(20),
            //             child: Image.network(
            //               moviesImage[index],
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),

            ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesCategory.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1, color: Colors.black)),
                    padding: EdgeInsets.all(10),
                    child: Text(moviesCategory[index]),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Text('NEW RENTAL'),
        ),
        SizedBox(height: 10),
        Container(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesImage.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: 100,
                  child: ClipRRect(
                    child: Image.network(
                      moviesImage[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget text({String? text}) {
  if (text == 'no user') {
    return const Text('');
  } else {
    return Text(text!);
  }
}

Widget profile({required UserModel usernull, required BuildContext context}) {
  if (usernull.username == 'no user') {
    return Center(
        child: const Text(
      'no user',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ));
  } else {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'My Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'user name : ${usernull.username}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'password : ${usernull.password}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
