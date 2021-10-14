import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as Loc;
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Color _mainColor = Color(0xff117684);
  String ?user;
  Loc.LocationData ?_currentPosition;
  String ?_address;
  final Loc.Location location = Loc.Location();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  getLoc() async{
    bool _serviceEnabled;
    Loc.PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == Loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != Loc.PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    print(_currentPosition);
    getAddress(_currentPosition?.latitude, _currentPosition!.longitude);

  }

  getAddress(double ?lat,double ?long) async{

    List<Placemark> placemarks = await placemarkFromCoordinates(lat!,long!);
    Placemark placeMark  = placemarks[0];
    _address = placeMark.name!+','+placeMark.subLocality!+','+placeMark.locality!+','+placeMark.administrativeArea!+','+placeMark.postalCode!+','+placeMark.country!;
    setState(() {
      print(_address);
    });


  }


  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)?.settings.arguments as Map;
    print(userData['userName']);
    user = userData['userName'];
    return Scaffold(
      bottomNavigationBar: Container(
        child: Padding(padding: EdgeInsets.all(20),
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: const Text('Log Out', style: TextStyle(fontSize: 20)),
            color: _mainColor,
            textColor: Colors.white,
            elevation: 5,
          ),

        ),
      ),
      appBar: AppBar(
        backgroundColor: _mainColor,
        title: Text("Dashboard", style:TextStyle(fontSize: 18, color: Colors.white),),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to dashboard, ${user}',style: TextStyle(fontSize: 15,color: _mainColor,fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Padding(padding: EdgeInsets.all(20),
              child: RaisedButton(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: _mainColor,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius:
                      BorderRadius.circular(10)),
                  padding:
                  EdgeInsets.symmetric(vertical: 12),
                  textColor: Colors.white,
                  color: _mainColor,
                  onPressed: () {
                    getLoc();
                  },
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(Icons.location_on),
                      Text('Show my location',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              ),
              SizedBox(height: 10,),
              _address!= null ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on,color: _mainColor,),
                  Flexible(child:  Text(_address!,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),)
                ],
              ):Container()
            ],
          ),


        ],
      ),
    );
  }
}
