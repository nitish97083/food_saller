import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_saller_app/widgets/custom_text_field.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Future<void> _getImage() async {
    xImageFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      xImageFile;
      print(" Path Of image ${xImageFile!.path}");
    });
  }

  Position? _position;
  List<Placemark>? _placeMark;
  var isLocationLoading = false;

  _getCurrentLocation() async {
    // if (await Permission.location.isPermanentlyDenied) {
    // await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //   print(" Location enabled");
    // }
    isLocationLoading = true;
    await [Permission.location].request();
    // print(' print ${await Permission.location.isPermanentlyDenied}');
    try {
      Position newPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _position = newPosition;

      _placeMark = await placemarkFromCoordinates(
          _position!.latitude, _position!.longitude);

      Placemark pMark = _placeMark![0];
      String completeAddress =
          ' ${pMark.subLocality}, ${pMark.locality}, ${pMark.administrativeArea}, ${pMark.postalCode},  ${pMark.country}'
          '';
      print(" Selected Address $completeAddress");
      setState(() {
        isLocationLoading = false;
        _location.text = completeAddress;
      });
    } catch (exp) {
      print(exp.toString());
      // await [Permission.location].request();
      // if (await Permission.location.isPermanentlyDenied) {
      print("open setting for location access");
      openAppSettings();
      // }
    }
  }

  XFile? xImageFile;
  final ImagePicker _imagePicker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _loader = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _loader.text = 'Loading';
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              _getImage();
            },
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.20,
              backgroundColor: Colors.white,
              backgroundImage: xImageFile == null
                  ? null
                  : FileImage(
                      File(xImageFile!.path),
                    ),
              child: xImageFile == null
                  ? Icon(
                      Icons.add_photo_alternate_sharp,
                      color: Colors.grey,
                      size: MediaQuery.of(context).size.width * 0.20,
                    )
                  : null,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustTextField(
                  textEditingController: _name,
                  icon: Icons.person_2,
                  isObscure: false,
                  hintText: "Name",
                  textInputType: TextInputType.name,
                ),
                CustTextField(
                  textEditingController: _email,
                  icon: Icons.email_outlined,
                  isObscure: false,
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                CustTextField(
                  textEditingController: _password,
                  icon: Icons.lock,
                  isObscure: true,
                  hintText: "Password",
                  textInputType: TextInputType.emailAddress,
                ),
                CustTextField(
                  textEditingController: _confirmPassword,
                  icon: Icons.lock,
                  isObscure: true,
                  hintText: "Confirm Password",
                  // isEnable: true,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustTextField(
                  textEditingController: _phone,
                  icon: Icons.phone,
                  isObscure: false,
                  hintText: "Phone",
                  textInputType: TextInputType.number,
                ),
                CustTextField(
                  textEditingController:
                      isLocationLoading ? _loader : _location,
                  icon: Icons.my_location,
                  isObscure: false,
                  isEnable: false,
                  hintText: "Cafe/Restaurant Location",
                  textInputType: TextInputType.text,
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: 400,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _getCurrentLocation();
                      setState(() {
                        print(" Location Pressed");
                      });
                    },
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    label: const Text("Get My Current Location"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 10)),
            child: const Text(
              "SignUp",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
