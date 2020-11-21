import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  Set<Polyline> polyline = Set<Polyline>();

  @override
  void initState() {
    super.initState();
    setState(() {
      createPolylineReturn();
      crearPolylineDeparture();
    });
  }

  crearPolylineDeparture() {
    polyline.add(Polyline(
        polylineId: PolylineId("PolylineMap2"),
        zIndex: 1,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.bevel,
        points: <LatLng>[
          LatLng(10.860949, -74.835952),
          LatLng(10.862090, -74.835823),
          LatLng(10.863596, -74.835064),
          LatLng(10.863047, -74.830278),
          LatLng(10.862857, -74.828622),
          LatLng(10.862775, -74.827557),
          LatLng(10.863013, -74.825456),
          LatLng(10.862903, -74.824978),
          LatLng(10.862404, -74.823641),
          LatLng(10.862206, -74.822259),
          LatLng(10.861459, -74.815504),
          LatLng(10.861190, -74.801869),
          LatLng(10.861119, -74.801596),
          LatLng(10.861105, -74.801366),
          LatLng(10.861051, -74.799585),
          LatLng(10.861130, -74.799066),
          LatLng(10.861128, -74.798581),
          LatLng(10.861100, -74.796086),
          LatLng(10.861275, -74.792244),
          LatLng(10.860833, -74.788550),
          LatLng(10.860883, -74.784007),
          LatLng(10.861016, -74.783187),
          LatLng(10.862596, -74.778944),
          LatLng(10.862452, -74.778802),
          LatLng(10.862043, -74.778161),
          LatLng(10.861363, -74.776656),
          LatLng(10.861185, -74.776366),
          LatLng(10.860763, -74.775265),
          LatLng(10.860460, -74.774305),
          LatLng(10.860397, -74.773922),
          LatLng(10.861967, -74.773546),
          LatLng(10.863390, -74.773157),
          LatLng(10.865006, -74.772526),
          LatLng(10.865089, -74.772229),
          LatLng(10.872854, -74.770623),
          LatLng(10.874573, -74.769987),
          LatLng(10.882200, -74.769251),
          LatLng(10.883999, -74.769255),
          LatLng(10.884472, -74.769336),
          LatLng(10.887932, -74.769842),
          LatLng(10.888525, -74.769851),
          LatLng(10.892552, -74.769472),
          LatLng(10.897594, -74.769108),
          LatLng(10.899957, -74.769015),
          LatLng(10.900045, -74.768972),
          LatLng(10.903701, -74.769244),
          LatLng(10.904609, -74.769527),
          LatLng(10.904483, -74.768701),
          LatLng(10.905851, -74.768393),
          LatLng(10.907673, -74.768113),
          LatLng(10.908451, -74.768076),
          LatLng(10.910138, -74.767721),
          LatLng(10.911976, -74.767211),
          LatLng(10.912624, -74.766904),
          LatLng(10.913250, -74.766657),
          LatLng(10.914350, -74.766242),
          LatLng(10.916063, -74.765668),
          LatLng(10.920049, -74.763919),
          LatLng(10.920847, -74.763596),
          LatLng(10.921389, -74.763531),
          LatLng(10.921906, -74.763530),
          LatLng(10.924884, -74.763774),
          LatLng(10.925530, -74.763885),
          LatLng(10.926497, -74.764101),
          LatLng(10.930929, -74.764418),
          LatLng(10.932511, -74.764614),
          LatLng(10.933516, -74.764776),
          LatLng(10.933922, -74.765020),
          LatLng(10.936055, -74.766589),
          LatLng(10.941197, -74.769587),
          LatLng(10.944488, -74.770874),
          LatLng(10.946477, -74.772550),
          LatLng(10.947224, -74.773065),
          LatLng(10.948474, -74.773482),
          LatLng(10.948959, -74.773327),
          LatLng(10.949319, -74.773184),
          LatLng(10.949641, -74.773285),
          LatLng(10.950150, -74.773671),
          LatLng(10.954634, -74.773899),
          LatLng(10.958498, -74.774598),
          LatLng(10.963562, -74.775191),
          LatLng(10.965231, -74.775227),
          LatLng(10.969311, -74.774315),
          LatLng(10.970602, -74.774364),
          LatLng(10.975384, -74.775248),
          LatLng(10.977834, -74.781140),
          LatLng(10.978776, -74.780881),
        ]));
  }

  createPolylineReturn() {
    polyline.add(Polyline(
        polylineId: PolylineId("PolylineMap"),
        zIndex: 2,
        color: Colors.red,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.bevel,
        points: <LatLng>[
          LatLng(10.978776, -74.780881),
          LatLng(10.979774, -74.780624),
          LatLng(10.979692, -74.780339),
          LatLng(10.979024, -74.778753),
          LatLng(10.978964, -74.778605),
          LatLng(10.978298, -74.777515),
          LatLng(10.977580, -74.777909),
          LatLng(10.976630, -74.778364),
          LatLng(10.975952, -74.776785),
          LatLng(10.975405, -74.775384),
          LatLng(10.970449, -74.774454),
          LatLng(10.969357, -74.774461),
          LatLng(10.969083, -74.774493),
          LatLng(10.965920, -74.775232),
          LatLng(10.965329, -74.775368),
          LatLng(10.964995, -74.775373),
          LatLng(10.963579, -74.775290),
          LatLng(10.958503, -74.774703),
          LatLng(10.954734, -74.774000),
          LatLng(10.950473, -74.773832),
          LatLng(10.950170, -74.773838),
          LatLng(10.949543, -74.774071),
          LatLng(10.949187, -74.774147),
          LatLng(10.948957, -74.773982),
          LatLng(10.948482, -74.773504),
          LatLng(10.947455, -74.773198),
          LatLng(10.946932, -74.772937),
          LatLng(10.944664, -74.771035),
          LatLng(10.944298, -74.770821),
          LatLng(10.942139, -74.770000),
          LatLng(10.941182, -74.769605),
          LatLng(10.939565, -74.768705),
          LatLng(10.936040, -74.766608),
          LatLng(10.933669, -74.764887),
          LatLng(10.933522, -74.764822),
          LatLng(10.932966, -74.764726),
          LatLng(10.930857, -74.764461),
          LatLng(10.927173, -74.764208),
          LatLng(10.926492, -74.764115),
          LatLng(10.926107, -74.764023),
          LatLng(10.925532, -74.763905),
          LatLng(10.924887, -74.763791),
          LatLng(10.923882, -74.763700),
          LatLng(10.921856, -74.763554),
          LatLng(10.921368, -74.763556),
          LatLng(10.920841, -74.763618),
          LatLng(10.917207, -74.765265),
          LatLng(10.916057, -74.765688),
          LatLng(10.914353, -74.766261),
          LatLng(10.912944, -74.766789),
          LatLng(10.911979, -74.767225),
          LatLng(10.908618, -74.768054),
          LatLng(10.907656, -74.768123),
          LatLng(10.905317, -74.768524),
          LatLng(10.904512, -74.768706),
          LatLng(10.904613, -74.769486),
          LatLng(10.904521, -74.769662),
          LatLng(10.904089, -74.769505),
          LatLng(10.902680, -74.769301),
          LatLng(10.900468, -74.769205),
          LatLng(10.898589, -74.769179),
          LatLng(10.888524, -74.769972),
          LatLng(10.887144, -74.769841),
          LatLng(10.884652, -74.769415),
          LatLng(10.882310, -74.769372),
          LatLng(10.874891, -74.770090),
          LatLng(10.872862, -74.770749),
          LatLng(10.865112, -74.772346),
          LatLng(10.865021, -74.772551),
          LatLng(10.864001, -74.772932),
          LatLng(10.863395, -74.773178),
          LatLng(10.861981, -74.773562),
          LatLng(10.862501, -74.775466),
          LatLng(10.862709, -74.776273),
          LatLng(10.862891, -74.777129),
          LatLng(10.863028, -74.777596),
          LatLng(10.863104, -74.777640),
          LatLng(10.861105, -74.783060),
          LatLng(10.860978, -74.783508),
          LatLng(10.860910, -74.784066),
          LatLng(10.860871, -74.788536),
          LatLng(10.861300, -74.792166),
          LatLng(10.861232, -74.793943),
          LatLng(10.861124, -74.796669),
          LatLng(10.861160, -74.799085),
          LatLng(10.861499, -74.815247),
          LatLng(10.861590, -74.816471),
          LatLng(10.862439, -74.823609),
          LatLng(10.862944, -74.824947),
          LatLng(10.863022, -74.825260),
          LatLng(10.863053, -74.825708),
          LatLng(10.862819, -74.827460),
          LatLng(10.862855, -74.828139),
          LatLng(10.863139, -74.830606),
          LatLng(10.863624, -74.835079),
          LatLng(10.862104, -74.835838),
          LatLng(10.860951, -74.835977),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(children: [
            _crearMapa(),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 10, 0),
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/logo.png'),
                alignment: Alignment.topRight,
              )),
            )
          ]),
          bottomNavigationBar: _crearBottomNavigationBar()),
    );
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.blue[300],
      fixedColor: Colors.white,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            size: 40,
          ),
          label: 'Robo',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.traffic,
            size: 40,
          ),
          label: 'Trafico',
        ),
      ],
    );
  }

  Widget _crearMapa() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(10.974793, -74.787355),
        zoom: 13.0,
      ),
      polylines: polyline,
    );
  }
}
