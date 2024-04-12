/*
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;

import 'package:http/http.dart' as http;
class HomeMapPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeMapPageState();
  }

}
class HomeMapPageState extends State<HomeMapPage> with WidgetsBindingObserver{
  TextEditingController searchTextController = TextEditingController();
  // BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  late LatLng currentPostion;
  String token = "";
  List<dynamic> _placeList = [];
  String userId = "";

  // final Completer<GoogleMapController> _controller =
  // Completer<GoogleMapController>();
  final Set<Marker> markers = new Set();
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.9170705,78.1294891),
    zoom: 17.4746,
  );
  Location location = Location();
  LatLng _currentLocation =  LatLng(9.9268447,78.1230841);
  // BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  String? _address = "";
  bool isMapReady = false;
  int isPermissionAsked = 0;
  int isAlertShow = 0;
  late AlertDialog alert;
  double latitudeSubmit = 0.0;
  double longitudeSubmit = 0.0;
  bool isSubmitDone = true;
  bool isCameraMoving = false;
  GoogleMapController? _controller;
  Set<Marker> _markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  // Location location = Location();
  // late LatLng _currentLocation;
  String googleApiKey = "AIzaSyBu2JNP2Cp4_vOZwZ37ewueMtoKttO_27s";
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  @override
  initState()  {
    // TODO: implement initState
    super.initState();
    _askPermission();
    WidgetsBinding.instance?.addObserver(this);

  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("onResume$state");
    if (state == AppLifecycleState.resumed) {
      if(isAlertShow == 0){
        _askPermission();
      }

    }
  }
  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        width: 4,
        polylineId: id, color:Colors.redAccent, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline(originLat,originLng,destLat,destLng) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(originLat, originLng),
      PointLatLng(destLat, destLng),
      travelMode: TravelMode.driving,
      // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }
  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(String path, int width) async {
    final Uint8List imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData);
  }
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  getLocationUpdate() async {
    sourceIcon = await getBitmapDescriptorFromAssetBytes("assets/images/bike.png", 80);

    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        print("onlocation changed ${currentLocation.latitude}");
        _currentLocation = LatLng(
          currentLocation.latitude ?? 0.0,
          currentLocation.longitude ?? 0.0,
        );
        isMapReady = true;
        _controller?.animateCamera(
          CameraUpdate.newLatLng(_currentLocation),
        );
        // _markers.removeWhere((marker) => marker.markerId == MarkerId('current'));
        _markers.clear();
        // final MarkerId markerId = MarkerId('current');
        // _markers.remove(markerId);



        LatLngUpdate(currentLocation?.latitude.toString() ?? "9.9268447",currentLocation?.longitude.toString() ?? "78.1230841",currentLocation.heading.toString() ?? "0.0");
        // _markers.add(
        //   Marker(
        //     markerId: MarkerId('drop'),
        //     position: LatLng(9.923087,78.126254),
        //     icon:  BitmapDescriptor.defaultMarker,
        //   ),
        // );
        _markers.add(
          Marker(
            markerId: MarkerId('current'),
            position: _currentLocation,
            rotation: currentLocation!.heading!,
            icon: sourceIcon,
          ),
        );
      });
    });
  }
  LatLngUpdate(String lat,String lng,String heading) async {
    bool isUpdate = await homeViewModel.latLngUpdate(context, lat, lng,heading);
    if(isUpdate){

    }
  }
  void _getUserLocation() async {
    var position = await GeolocatorPlatform.instance
        .getCurrentPosition();
    setState(() {
      currentPostion = LatLng(position.latitude, position.longitude);
      _kGooglePlex = CameraPosition(
        target: currentPostion,
        zoom: 17.4746,
      );
      // getLocation(position.latitude, position.longitude);
      isMapReady = true;
      getMarkers(position.latitude, position.longitude);
      print("Current Position is ${currentPostion}");

    });
  }
  getMarkers(double lat,double lng) async {
    sourceIcon = await getBitmapDescriptorFromAssetBytes("assets/images/google_maps.png", 80);
    markers.add(
        Marker(
          markerId: MarkerId("1"),
          icon: sourceIcon,
          position: LatLng(lat,lng),
          infoWindow: InfoWindow(
            title: 'Location: ',
          ),
        )
    );
    setState(() {
      print("The markers ${markers}");
    });
  }
  void _askPermission() async{
    isPermissionAsked = 1;
    final serviceStatusLocation = await Permission.locationWhenInUse.isGranted ;
    final status = await Permission.locationWhenInUse.request();
    if (status.toString() == "PermissionStatus.granted") {
      print('Permission Granted $isAlertShow');
      // if(isAlertShow == 0)
      await Future.delayed(Duration(milliseconds: 1000), () async {
        // Position position = await Geolocator .getCurrentPosition(desiredAccuracy: LocationAccuracy.high); print(position);
        // _getUserLocation();
        getLocationUpdate();
      });

    } else if (status.toString() == "PermissionStatus.denied") {
      print('Permission denied');
      _askPermission();
    } else if (status.toString() == "PermissionStatus.permanentlyDenied") {
      print('Permission Permanently Denied');
      showAlertDialog(context);
    }
    // PermissionHandler().requestPermissions([PermissionGroup.locationWhenInUse]).then((value) => _onStatusRequest(value));
  }
  void showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("Go To Settings",style: middleWare.customTextStyle(16, Colors.black, FontWeight.bold),),
      onPressed: () async {
        await openAppSettings();
        isAlertShow = 0;
        Navigator.pop(context);
        // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
    );
    Widget cancelButton = TextButton(
      child: const Text("CANCEL"),

      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // Create AlertDialog
    alert = AlertDialog(
      title: Text("Eat",style: middleWare.customTextStyle(17, Colors.black, FontWeight.bold),),
      content: Text(loc_settings_alert_message,style: middleWare.customTextStyle(15, Colors.black, FontWeight.normal),),
      actions: [
        okButton
      ],
    );
    // show the dialog
    if(isAlertShow == 0){
      showDialog(
        barrierDismissible:false,
        context: context,
        builder: (BuildContext context) {
          isAlertShow = 1;
          return WillPopScope(
              onWillPop: (){
                return Future.value(false);
              },
              child:alert
          );
        },
      );
    }
  }
  void getSuggestion(String input) async {
    String kPLACES_API_KEY = "AIzaSyBu2JNP2Cp4_vOZwZ37ewueMtoKttO_27s";
    String type = '(regions)';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY';
    print("Base URL $request");
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      setState(() {
        _placeList = json.decode(response.body)['predictions'];
        print("Place List ${_placeList}");
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }
  @override
  Widget build(BuildContext context) {
    return isMapReady ? Builder(
        builder: (BuildContext context1) => BaseWidgetWithNetworkConnectivity<HomeViewModel>(
            key: Key('login'),
            model: HomeViewModel(eatApis : Provider.of<EatApis>(context, listen: false)),
            onModelReady: (model) async {
              print("kjhzdfihzsih");
              homeViewModel = model;
              token = await PreferenceHelper.getString(PreferenceConst.token);

              getCurrentOrder(model);
              // CurrentOrderModel currentOrderModel = await model.currentorder(context);
              //
              // if(currentOrderModel.status == "success"){
              //
              // pickupAddressList = currentOrderModel.data?.pickupaddress;
              // currentOrderDetails = currentOrderModel.data?.details;
              // print("Current Order List mj ${currentOrderDetails?[0]}");
              //
              // }
              // DeliveryModel orderDetailsModel = await model.getRecentAddress(context,userId);
              // userLocation =orderDetailsModel?.data?.userLocationdetails;
              // deliveryViewModel = model;
              return true;

            },
            builder: (context, model, child) => SafeArea(
                child: WillPopScope(
                    onWillPop: () async {
                      onBackPressed(); // Action to perform on back pressed
                      return false;
                    },
                    child:
                    Scaffold(

                        body:

                        Stack(children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: _kGooglePlex,
                            markers: _markers,
                            polylines: Set<Polyline>.of(polylines.values),
                            onMapCreated: (controller) {
                              _controller = controller;
                            },
                            // onCameraMove: (pinloc){
                            //   setState(() {
                            //     isCameraMoving = true;
                            //     latitudeSubmit = pinloc.target.latitude;
                            //     longitudeSubmit = pinloc.target.longitude;
                            //   });
                            // },
                            // onCameraIdle: (){
                            //   setState(() {
                            //     isCameraMoving = false;
                            //     getLocation(latitudeSubmit, longitudeSubmit);
                            //   });
                            // },
                          ),
                          // Container(child: Center(
                          //   child: Image.asset("assets/images/google_maps.png",width: 60,height: 60,),)
                          //   ,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,)
                        ],),


                        bottomSheet: SingleChildScrollView(child:Container(
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(10))),
                          // height: MediaQuery.of(context).size.height * 0.35,
                          child: Column(children: [
                            middleWare.putSizedBoxHeight(20),
                            getText(pickup),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(margin: EdgeInsets.only(left: 20),child: Text(pickupAddressList!.length > 0 ? (pickupAddressList?.first.kname ?? "") : "",style: middleWare.customTextStyle(16, Colors.black, FontWeight.bold),),),
                                Container(margin: EdgeInsets.only(right: 20),child: Text("Order ID - ${currentOrderDetails!.length > 0 ? (currentOrderDetails?.first.orderid ?? "") : ""}",style: middleWare.customTextStyle(13, Colors.black, FontWeight.normal),),)
                              ],),
                            Divider(color: Colors.grey.shade300,thickness: 1,endIndent: 20,indent: 20,),
                            Row(children: [
                              Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                                // Container(margin: EdgeInsets.only(left: 20),alignment:Alignment.centerLeft,child: Text(pickupAddressList?[0]?.kname ?? "",style: middleWare.customTextStyle(15, Colors.black, FontWeight.normal)),),
                                Container(margin: EdgeInsets.only(left: 20),width: MediaQuery.of(context).size.width/1.5,child: Text("${pickupAddressList!.length > 0 ? (pickupAddressList?.first?.address ?? "") : ""}",overflow: TextOverflow.ellipsis,maxLines: 2,style: middleWare.customTextStyle(14, Colors.grey, FontWeight.normal)),)

                              ],)
                            ],),
                            middleWare.putSizedBoxHeight(10),
                            Row(children: [
                              middleWare.putSizedBoxWidth(10),
                              Container(width: MediaQuery.of(context).size.width/9.9,child:Image.asset(
                                'assets/images/call_icon.jpg',
                                // color: middleWare.uiThemeColor,
                                width: 25.00,
                                height: 25.00,
                              ),),
                              GestureDetector(child: Container(child: Text(currentOrderDetails!.length > 0 ? '${(currentOrderDetails?.first.deliverystatus == waitingToPickup) ? callKitchen :
                              (currentOrderDetails?.first.deliverystatus == driverPickedUp) ? callCustomer :
                              (currentOrderDetails?.first.deliverystatus == orderIsOnTheWay) ? callCustomer : callKitchen
                              }' : callKitchen,style: middleWare.customTextStyle(14, Colors.black, FontWeight.bold),),),
                                onTap: (){
                                  if(currentOrderDetails!.length > 0 && (currentOrderDetails?.first.deliverystatus == waitingToPickup)){
                                    askPermission(pickupAddressList!.length > 0 ? pickupAddressList?.first.kmobile ?? "" : "");
                                  }else {
                                    askPermission(userDetails!.length > 0 ? userDetails?.first.mobile ?? "" : "");
                                  }

                                },)
                            ]),
                            getSwipebutton(model),
                          ],),),
                        ) ))))):SingleChildScrollView(child: Container(color: Colors.white,child: Center(
      child: Image.asset("assets/images/google_maps.png",width: 100,height: 100,),)
      ,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,) );
  }
  askPermission(String mobNo) async {
    final status = await Permission.locationWhenInUse.request();
    if (status.toString() == "PermissionStatus.granted") {
      print('Permission Granted');
      await Future.delayed(Duration(milliseconds: 1000), () async {
        makePhoneCall(mobNo);
      });

    } else if (status.toString() == "PermissionStatus.denied") {
      print('Permission denied');
      askPermission(mobNo);
    } else if (status.toString() == "PermissionStatus.permanentlyDenied") {
      print('Permission Permanently Denied');
      showLocationAlertDialog(context);
    }
  }
  void showLocationAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("Go To Settings",style: middleWare.customTextStyle(16, Colors.black, FontWeight.bold),),

      onPressed: () async {
        await openAppSettings();
        // isAlertShow = 0;
        Navigator.pop(context);
        // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
    );
    Widget cancelButton = TextButton(
      child: const Text("CANCEL"),

      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // Create AlertDialog
    alert = AlertDialog(
      title: Text("Eat",style: middleWare.customTextStyle(17, Colors.black, FontWeight.bold),),
      content: Text(loc_settings_alert_message,style: middleWare.customTextStyle(15, Colors.black, FontWeight.normal),),
      actions: [
        okButton
      ],
    );
    // show the dialog
    // if(isAlertShow == 0){
    showDialog(
      barrierDismissible:false,
      context: context,
      builder: (BuildContext context) {
        // isAlertShow = 1;
        return WillPopScope(
            onWillPop: (){
              return Future.value(false);
            },
            child:alert
        );
      },
    );
  }


  void makePhoneCall(String phoneNumber) async {

    // Check if the URL can be launched
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      print('Could not launch phone call');
    }
  }
  onBackPressed(){
    Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNavigationBarExample(),));
  }
  getSwipebutton(HomeViewModel model){
    return Container(
      margin:EdgeInsets.only(left:20,right: 20,top:20,bottom:7),
      child:SlideAction(
        key: slideActionKey,
        sliderButtonIconPadding: 10,
        borderRadius: 35,
        elevation: 0,
        outerColor: buttonColor,
        height: 60 ,

        sliderButtonIcon: Container(
          width:50, child:Icon( Icons.keyboard_double_arrow_right, color: buttonColor,size:30),),
        text : currentOrderDetails!.length > 0 ? '${(currentOrderDetails?.first.deliverystatus == waitingToPickup) ? "Picked Up" :
        (currentOrderDetails?.first.deliverystatus == driverPickedUp) ? "Reached Customer" :
        (currentOrderDetails?.first.deliverystatus == orderIsOnTheWay) ? "Delivered" : "Reached Kitchen"
        }' : "Reached Kitchen",
        textStyle: TextStyle(fontSize: 15.0, color: uiWhite,),
        sliderRotate: false,
        onSubmit: () async {
          if(currentOrderDetails?.first.deliverystatus == waitingToPickup){
            // bool isStatusUpdate = await model.orderStatusChange(context, currentOrderDetails?.first.orderid ?? "",
            //     (currentOrderDetails?.first.deliverystatus == waitingToPickup) ? driverPickedUp :
            //     (currentOrderDetails?.first.deliverystatus == driverPickedUp) ? orderIsOnTheWay :
            //     (currentOrderDetails?.first.deliverystatus == orderIsOnTheWay) ? orderDelivered : driverPickedUp);
            // if(isStatusUpdate){
            var argument = {
              "otp": currentOrderDetails?.first.deliveryotp,
              "orderId" : currentOrderDetails?.first.orderid,
            };
            Navigator.pushNamed(context, RoutePaths.KitchenOtp,arguments: argument).then((value) {
              slideActionKey.currentState?.reset();
              getCurrentOrder(model);
            } );
            // }
          }else{
            if(currentOrderDetails?.first.deliverystatus == orderIsOnTheWay){
              bool isStatusUpdate = await model.orderStatusChange(context, currentOrderDetails?.first.orderid ?? "",
                  (currentOrderDetails?.first.deliverystatus == waitingToPickup) ? driverPickedUp :
                  (currentOrderDetails?.first.deliverystatus == driverPickedUp) ? orderIsOnTheWay :
                  (currentOrderDetails?.first.deliverystatus == orderIsOnTheWay) ? orderDelivered : driverPickedUp);
              if(isStatusUpdate){
                // getCurrentOrder(model);
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarExampleApp(),));
              }
            }
            else{
              bool isStatusUpdate = await model.orderStatusChange(context, currentOrderDetails?.first.orderid ?? "",
                  (currentOrderDetails?.first.deliverystatus == waitingToPickup) ? driverPickedUp :
                  (currentOrderDetails?.first.deliverystatus == driverPickedUp) ? orderIsOnTheWay :
                  (currentOrderDetails?.first.deliverystatus == orderIsOnTheWay) ? orderDelivered : driverPickedUp);
              if(isStatusUpdate){
                slideActionKey.currentState?.reset();
                getCurrentOrder(model);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarExampleApp(),));
              }
            }
          }



          // Navigator.pushNamed(context, RoutePaths.OrderDetails).then((value) => slideActionKey.currentState!.reset());
        },
      ),
    );
  }
  getCurrentOrder(HomeViewModel model) async {
    print("getCurrent Order ");
    CurrentOrderModel currentOrderModel = await model.currentorder(context);
    setState(() {
      if(currentOrderModel.status == "success"){
        PolylineId id = PolylineId("poly");
        polylines.remove(id);
        pickupAddressList = currentOrderModel.data?.pickupaddress;
        currentOrderDetails = currentOrderModel.data?.details;
        deliverylatlngList = currentOrderModel.data?.deliveryLatlon;
        userDetails = currentOrderModel.data?.userdetails;
        print("Current Order List mj ${currentOrderDetails?[0]}");
        if(currentOrderDetails!.length > 0){
          if(currentOrderDetails?.first.deliverystatus == waitingToPickup){
            if(pickupAddressList!.length > 0){
              _getPolyline(_currentLocation.latitude,_currentLocation.longitude,double.parse(pickupAddressList?[0].lattitude ?? "0.0"),double.parse(pickupAddressList?[0].longitude ?? "0.0"));
            }
          }else if(currentOrderDetails?.first.deliverystatus == driverPickedUp){
            _getPolyline(_currentLocation.latitude,_currentLocation.longitude,double.parse(deliverylatlngList?[0].lat ?? "0.0"),double.parse(deliverylatlngList?[0].lon ?? "0.0"));
          }else if(currentOrderDetails?.first.deliverystatus == orderIsOnTheWay){
            _getPolyline(_currentLocation.latitude,_currentLocation.longitude,double.parse(deliverylatlngList?[0].lat ?? "0.0"),double.parse(deliverylatlngList?[0].lon ?? "0.0"));
          }

        }
      }
    });
  }
  // void _fetchRouteAndDrawPolyline() async {
  //   final directions = GoogleMapsDirections(
  //     apiKey: 'YOUR_GOOGLE_MAPS_API_KEY',
  //   );
  //
  //   final origin = Location(lat: 37.7749, lng: -122.4194); // Origin coordinates
  //   final destination = Location(lat: 37.7849, lng: -122.4300); // Destination coordinates
  //
  //   final result = await directions.directionsWithLocation(
  //     origin: origin,
  //     destination: destination,
  //     travelMode: TravelMode.driving, // You can specify the travel mode
  //   );
  //
  //   if (result.isOkay) {
  //     final encodedPolyline = result.routes.first.overviewPolyline;
  //     List<LatLng> decodedPolyline = decodePolyline(encodedPolyline);
  //
  //     setState(() {
  //       polylines.add(Polyline(
  //         polylineId: PolylineId('polyline_1'), // Unique polyline id
  //         color: Colors.blue, // Color of the polyline
  //         points: decodedPolyline,
  //         width: 5, // Width of the polyline
  //       ));
  //     });
  //   }
  // }
  //
  // List<LatLng> decodePolyline(String encoded) {
  //   List<LatLng> points = [];
  //   int index = 0;
  //   int len = encoded.length;
  //   int lat = 0, lng = 0;
  //
  //   while (index < len) {
  //     int b, shift = 0, result = 0;
  //     do {
  //       b = encoded.codeUnitAt(index++) - 63;
  //       result |= (b & 0x1F) << shift;
  //       shift += 5;
  //     } while (b >= 0x20);
  //     int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
  //     lat += dlat;
  //
  //     shift = 0;
  //     result = 0;
  //     do {
  //       b = encoded.codeUnitAt(index++) - 63;
  //       result |= (b & 0x1F) << shift;
  //       shift += 5;
  //     } while (b >= 0x20);
  //     int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
  //     lng += dlng;
  //
  //     double latitude = lat / 1E5;
  //     double longitude = lng / 1E5;
  //     points.add(LatLng(latitude, longitude));
  //   }
  //
  //   return points;
  // }
  Container circularProgress() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 10.0),
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation(Colors.red), //any color you want
      ),
    );
  }
  getListItem(item){
    return Row(children: [
      middleWare.putSizedBoxWidth(10),
      Container(width: MediaQuery.of(context).size.width/9.9,child:Image.asset(
        'assets/images/pin.png',
        color: middleWare.uiThemeColor,
        width: 25.00,
        height: 25.00,

      ),),
      middleWare.putSizedBoxWidth(10),
      Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
        Container(alignment:Alignment.centerLeft,child: Text(item['structured_formatting']['main_text'] ?? "",style: middleWare.customTextStyle(15, Colors.black, FontWeight.normal)),),
        SizedBox(width: MediaQuery.of(context).size.width/1.5,child: Text(item['structured_formatting']['secondary_text'] ,overflow: TextOverflow.ellipsis,maxLines: 2,style: middleWare.customTextStyle(14, Colors.grey, FontWeight.normal)),)

      ],)
    ],);
  }

  // getLocation(double lat,double lng) async {
  //   List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
  //
  //   // this is all you need
  //   Placemark placeMark  = placemarks[0];
  //   String? name = placeMark.name;
  //   String? subLocality = placeMark.subLocality;
  //   String? locality = placeMark.locality;
  //   String? administrativeArea = placeMark.administrativeArea;
  //   String? postalCode = placeMark.postalCode;
  //   String? country = placeMark.country;
  //   String? address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";
  //
  //   print("Find address $address");
  //
  //   setState(() {
  //     _address = address; // update _address
  //     _locality = subLocality!=null && !subLocality.isEmpty ? subLocality : locality;
  //     latitudeSubmit = lat;
  //     longitudeSubmit = lng;
  //
  //   });
  // }
  getSubmitButton(){
    return Container(
      margin: EdgeInsets.only(
        top: middleWare.minimumPadding * 4,
        // bottom: middleWare.minimumPadding * 5,
        left: middleWare.minimumPadding * 4,
        right: middleWare.minimumPadding * 4,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: middleWare.uiThemeColor,
          foregroundColor: middleWare.uiThemeColor,
          padding: EdgeInsets.only(
            top: middleWare.minimumPadding * 3,
            bottom: middleWare.minimumPadding * 3,
            left: middleWare.minimumPadding *
                7,
            right: middleWare.minimumPadding * 7,
          ),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Use This Location",
                style: middleWare.customTextStyle(
                    17.00, Colors.white, FontWeight.bold)),
            SizedBox(
              width: 8,
            ),
            // ViewState.BUSY == ViewState.BUSY
            //     ? Container(
            //   width: 25,
            //   height: 25,
            //   child: CircularProgressIndicator(
            //     valueColor:
            //     new AlwaysStoppedAnimation<Color>(Colors.white),
            //   ),
            // )
            //     : Container()
          ],
        ),
        onPressed: () async {
          setState(() {
            isSubmitDone = false;
          });
          print("Address to submit ${_address!}");
          // await PreferenceHelper.setString(PreferenceConst.userAddress, _address!);
          // await PreferenceHelper.setString(PreferenceConst.userLatitude, latitudeSubmit.toString());
          // await PreferenceHelper.setString(PreferenceConst.userLongitude, longitudeSubmit.toString());
          // updateLocation(_address!, latitudeSubmit.toString(), longitudeSubmit.toString(), deliveryViewModel,_locality);
        },
      ),
    );
  }
  updateLocation(String address,String latitude,String longitude,HomeViewModel model,locality) async {
    // userId = await PreferenceHelper.getString(PreferenceConst.userId);
    // bool isUpdated = await model.updateLocation(context,userId,address,latitude,longitude,locality);
    // if(isUpdated){
    //   isSubmitDone = true;
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //       builder: (BuildContext context) => BottomNavigationBarExample()));
    // }
  }

  getText(txt){
    return Container(alignment:Alignment.centerLeft,margin:EdgeInsets.only(left: 20,top: 10),child: Text(txt,style: middleWare.customTextStyle(15, Colors.black, FontWeight.normal)),);
  }

  Container getSearchBar() {
    return Container(

      margin: EdgeInsets.only(
        left: middleWare.minimumPadding * 4,
        right: middleWare.minimumPadding * 4,
      ),
      child:  TextFormField(
        style: middleWare.customTextStyle(
            14.00, middleWare.uiTextColor, FontWeight.bold),
        controller: searchTextController,
        keyboardType: TextInputType.text,
        validator: (value) {
          value = value ?? "";
          if (value
              .trim().removeAllWhitespace
              .isEmpty) {
            return "Search for your Location";
          } else if (value
              .trim().removeAllWhitespace
              .length != 10) {
            return "Search for your Location";
          }
          return null;
        },
        decoration: InputDecoration(
            prefixIcon: Image.asset('assets/images/search_icon.png',width: 20,height: 20,),
            // prefix: Image.asset('assets/images/search_icon.png',width: 20,height: 20,),
            border: UnderlineInputBorder(
                borderRadius:BorderRadius.circular(10.0),borderSide: BorderSide.none),
            hintText: "Search for your Location",
            hintStyle: middleWare.customTextStyle(
                14.00, middleWare.uiFordGrayColor, FontWeight.normal),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //   borderSide: BorderSide(color: middleWare.uiThemeColor),
            // ),
            filled: true,
            fillColor: Colors.white
        ),
        onChanged: (val){
          getSuggestion(val);
        },
        */
/*onChanged: onSearchTextChanged,*//*

        // ),
      ),
    );
  }

}*/
