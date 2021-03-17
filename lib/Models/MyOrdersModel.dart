class MyOrdersModel{
  bool User_Payment;
  String Order_Id;
  String Customer_Id;
  String Product_Id;
  String Mobile;
  String Address;
  String Amount;
  String Quantity;
  String PaymentType;
  String Color;
  String Size;
  String Date;
  String Status;
  void WhatsMyStatus(){
    Status = (User_Payment)?"Completed":"Processing";
  }
}