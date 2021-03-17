import 'package:customeremall/Models/AddressModel.dart';
import 'package:customeremall/localization/sharedpreferences/saveLocally.dart';
import 'package:customeremall/settingsAndVariables/Toast/Toast.dart';
import 'package:customeremall/settingsAndVariables/routers/routecodes.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class EditAddress extends StatefulWidget {
  String country;
  String state;
  String city;
  String area;
  String street;
  String address;
  String landmark;
  int index;
  EditAddress(this.country, this.state, this.city, this.area,this.street ,this.address, this.landmark, this.index);

  @override
  _EditAddressState createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {

  TextEditingController CountryController = TextEditingController();
  TextEditingController StateController = TextEditingController();
  TextEditingController CityController = TextEditingController();
  TextEditingController AreaController = TextEditingController();
  TextEditingController StreetController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController LandmarkController = TextEditingController();

  @override
  void initState() {
    CountryController.text = widget.country;
    StateController.text = widget.state;
    CityController.text = widget.city;
    AreaController.text = widget.area;
    StreetController.text = widget.street;
    AddressController.text = widget.address;
    LandmarkController.text = widget.landmark;
    super.initState();
  }

  @override
  void dispose() {
    CountryController.dispose();
    StateController.dispose();
    CityController.dispose();
    AreaController.dispose();
    StreetController.dispose();
    AddressController.dispose();
    LandmarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('Edit Address', style: TextStyle(
              color: Colors.black
          ),),
          leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
              child: Container(
                padding: EdgeInsets.all(5),
                  child: Icon(Icons.arrow_back_ios, color: DarkBlue,)
              )
          ),
        ),
        body: Container(
          width: ScreenWidth,
          height: ScreenHeight,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('*Country', style: TextStyle(
                    color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
                ),),

                SizedBox(height: 10,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: ScreenWidth,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Center(
                    child: TextField(
                      controller: CountryController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Text('*State/Province', style: TextStyle(
                    color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
                ),),

                SizedBox(height: 10,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: ScreenWidth,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: TextField(
                    controller: StateController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Text('*City', style: TextStyle(
                    color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
                ),),

                SizedBox(height: 10,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: ScreenWidth,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: TextField(
                    controller: CityController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Text('*Area', style: TextStyle(
                    color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
                ),),

                SizedBox(height: 10,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: ScreenWidth,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: TextField(
                    controller: AreaController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Text('*Street', style: TextStyle(
                    color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
                ),),

                SizedBox(height: 10,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: ScreenWidth,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: TextField(
                    controller: StreetController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Text('*Address Details', style: TextStyle(
                    color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
                ),),

                SizedBox(height: 10,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: ScreenWidth,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: TextField(
                    controller: AddressController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Text('*Landmark', style: TextStyle(
                    color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold
                ),),

                SizedBox(height: 10,),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: ScreenWidth,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: TextField(
                    controller: LandmarkController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 40,),

                GestureDetector(
                  onTap: (){
                    if(ValidateAddress()){
                      if(widget.index == MyAllAddresses.length) {
                        AddressModel newAddress = AddressModel();
                        newAddress.Country = CountryController.text;
                        newAddress.State = StateController.text;
                        newAddress.City = CityController.text;
                        newAddress.Area = AreaController.text;
                        newAddress.Street = StreetController.text;
                        newAddress.Address = AddressController.text;
                        newAddress.Landmark = LandmarkController.text;
                        MyAllAddresses.add(newAddress);
                      }
                      else{
                        MyAllAddresses[widget.index].Country = CountryController.text;
                        MyAllAddresses[widget.index].State = StateController.text;
                        MyAllAddresses[widget.index].City = CityController.text;
                        MyAllAddresses[widget.index].Area = AreaController.text;
                        MyAllAddresses[widget.index].Street = StreetController.text;
                        MyAllAddresses[widget.index].Address = AddressController.text;
                        MyAllAddresses[widget.index].Landmark = LandmarkController.text;
                      }
                      writeAddresses().then((value){
                        readAddresses().then((value) {
                          ShowToast("Address Saved", context);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, MyAddressRouteCode);
                        });
                      });
                    }
                    else ShowToast("Please, fill up the form first.", context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 60,
                    width: ScreenWidth,
                    decoration: BoxDecoration(
                        color: DarkBlue,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text("Save",style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,),
                    ),
                  ),
                ),

                SizedBox(height: 20,),

              ],
            ),
          ),
        ),
      ),
    );
  }


  bool ValidateAddress(){
    return (
        CountryController.text.isNotEmpty &&
        StateController.text.isNotEmpty &&
        CityController.text.isNotEmpty &&
        AreaController.text.isNotEmpty &&
        StreetController.text.isNotEmpty &&
        AddressController.text.isNotEmpty &&
        LandmarkController.text.isNotEmpty
    );
  }

}
