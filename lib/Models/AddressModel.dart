class AddressModel{
  String Country;
  String State;
  String City;
  String Area;
  String Street;
  String Address;
  String Landmark;
  String TotalAddress;

  void MyTotalAddress(){
    TotalAddress = "Address: " + Address  +
        ", Landmark: " + Landmark  +
        ", Street: " + Street +
        ", Area: " + Area +
        ", City: " + City;
  }

  Map<String, String>toJson() => {
    "Address" : Address,
    "Landmark" : Landmark,
    "Street" : Street,
    "Area" : Area,
    "City" : City,
    "State" : State,
    "Country" : Country
  };

}