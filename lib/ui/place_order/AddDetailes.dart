//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:view_products/widgets/app_button_main.dart';
import 'package:view_products/widgets/app_text_button.dart';
import 'package:view_products/widgets/app_text_field.dart';
import 'package:view_products/widgets/text_payment_field.dart';

class AddDelates extends StatefulWidget {
  const AddDelates({Key? key}) : super(key: key);

  @override
  _AddDelatesState createState() => _AddDelatesState();
}

class _AddDelatesState extends State<AddDelates> {
  String dropdownValue = '+91';
  List<String> _Adress = [
    'Please choose a Adrees',
    'Gaza',
    'Egypt',
    'Ramallah',
    'Remal'
  ];

  String? choseValue;
  List<String> ListItem = ['Gaza', 'Palestine', 'Egypt', 'Amrica', 'Canda'];
  late TextEditingController _fullname;
  late TextEditingController _address1;
  late TextEditingController _address2;
  late TextEditingController _phone;
  late TextEditingController _zipCode;
  //Final dropval => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fullname = TextEditingController();
    _address1 = TextEditingController();
    _address2 = TextEditingController();
    _phone = TextEditingController();
    _zipCode = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fullname.dispose();
    _address1.dispose();
    _address2.dispose();
    _phone.dispose();
    _zipCode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF273246),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 60,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add Address',
          style: TextStyle(
              fontSize: 28,
              // fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat'),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 95,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadiusDirectional.only(topEnd: Radius.circular(40)),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          children: [
            Text(
              'Full name*',
              style: TextStyle(
                color: Color(0xff9A9A9A),
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            PaymentText(controller: _fullname),
            SizedBox(
              height: 20,
            ),
            Text(
              'Address1*',
              style: TextStyle(
                color: Color(0xff9A9A9A),
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            PaymentText(controller: _address1),
            SizedBox(
              height: 20,
            ),
            Text(
              'Address2*',
              style: TextStyle(
                color: Color(0xff9A9A9A),
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            PaymentText(controller: _address1),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Row(
                      children: [
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down_sharp),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.grey),
                          underline: Container(
                            width: 1,
                            color: Colors.redAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['+91', '+097', '+092', '+093']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Expanded(child: PaymentText(controller: _phone)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Text(
              'Zip Code*',
              style: TextStyle(
                color: Color(0xff9A9A9A),
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            PaymentText(controller: _zipCode),
            SizedBox(
              height: 20,
            ),
            Text(
              'City',
              style: TextStyle(
                color: Color(0xff9A9A9A),
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: DropdownButton(
                    focusColor: Colors.grey,
                    elevation: 10,
                    isExpanded: true,
                    value: choseValue,
                    items: ListItem.map(
                      (valueItem) {
                        return DropdownMenuItem<String>(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      },
                    ).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        choseValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: [
                        Color(0XFF273246),
                        Color(0XFF181D29),
                      ])),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/select_card');
                },
                child: Text(
                  'Place Order',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    primary: Colors.transparent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _dropdownItems.add(CountryModel(country: 'India', countryCode: '+91'));
      _dropdownItems.add(CountryModel(country: 'USA', countryCode: '+1'));
      _dropdownValue = _dropdownItems[0];
      phoneController.text = _dropdownValue.countryCode;
    });
  }
 Widget _buildCountry() {
    return FormField(
      builder: (FormFieldState state) {
        return DropdownButtonHideUnderline(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new InputDecorator(
                decoration: InputDecoration(
                  filled: false,
                  hintText: 'Choose Country',
                  prefixIcon: Icon(Icons.location_on),
                  labelText:
                  _dropdownValue == null ? 'Where are you from' : 'From',
                  errorText: _errorText,
                ),
                isEmpty: _dropdownValue == null,
                child: new DropdownButton<CountryModel>(
                  value: _dropdownValue,
                  isDense: true,
                  onChanged: (CountryModel newValue) {
                    print('value change');
                    print(newValue);
                    setState(() {
                      _dropdownValue = newValue;
                      phoneController.text = _dropdownValue.countryCode;
                    });
                  },
                  items: _dropdownItems.map((CountryModel value) {
                    return DropdownMenuItem<CountryModel>(
                      value: value,
                      child: Text(value.country),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPhonefiled() {
    return Row(
      children: <Widget>[
        new Expanded(
          child: new TextFormField(
            controller: phoneController,
            enabled: false,
            decoration: InputDecoration(
              filled: false,
              prefixIcon: Icon(FontAwesomeIcons.globe),
              labelText: 'code',
              hintText: "Country code",
            ),
          ),
          flex: 2,
        ),
        new SizedBox(
          width: 10.0,
        ),
        new Expanded(
          child: new TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: false,
              labelText: 'mobile',
              hintText: "Mobile number",
              prefixIcon: new Icon(Icons.mobile_screen_share),
            ),
            onSaved: (String value) {},
          ),
          flex: 5,
        ),
      ],
    );
  }

  class CountryModel {
  String country = '';
  String countryCode = '';

  CountryModel({
  required this.country,
  required this.countryCode,
  });
  }
}

 */





