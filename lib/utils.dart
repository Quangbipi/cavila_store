import 'package:cavila_store/constans.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Utils {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Widget textButton(
      double height, double width, Function onClick, String title) {
    return TextButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(width, height)),
            backgroundColor: MaterialStateProperty.all(Constants.secondaryColor)),
        onPressed: () {
          onClick();
        },
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }

  static void showAlert(BuildContext context, String text, Function action) {
    var alert = AlertDialog(
      title: const Text(
        "Thông báo",
        style: TextStyle(color: Colors.redAccent),
      ),
      content: Text(text),
      actions: [
        TextButton(
            onPressed: () {
              action();
            },
            child: const Text('Đóng')),
      ],
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return alert;
        });
  }

  static int validatePass(String pass) {
    return pass.length > 6 ? 1 : 0;
  }

  static int validateConfirmPass(String pass, String conFirmPass) {
    return pass.compareTo(conFirmPass) == 0 ? 1 : 0;
  }

  static int validateEmail(String email) {
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    return regex.hasMatch(email) ? 1 : 0;
  }

  static int validateAddress(String address) {
    return address.length > 8 ? 1 : 0;
  }

  static int validatePhone(String phoneNumber) {
    return phoneNumber.length > 9 ? 1 : 0;
  }

  static int validateAll(
      TextEditingController emai,
      TextEditingController pass,
      TextEditingController confirm,
      TextEditingController name,
      TextEditingController address,
      TextEditingController phone,
      BuildContext context) {
    if (emai.text.isEmpty ||
        pass.text.isEmpty ||
        confirm.text.isEmpty ||
        name.text.isEmpty ||
        address.text.isEmpty ||
        phone.text.isEmpty) {
      Utils.showAlert(
          context, 'Vui lòng nhập đủ thông tin', () => Navigator.pop(context));
      return 0;
    }
    if (Utils.validatePass(pass.text.trim()) == 0) {
      Utils.showAlert(context, 'Mật khẩu phải lớn hơn 6',
          () => Navigator.pop(context));
      return 0;
    }
    
    if (validateConfirmPass(pass.text.trim(), confirm.text.trim()) == 0) {
      Utils.showAlert(context, 'Nhập lại mật khẩu không khớp',
          () => Navigator.pop(context));
      return 0;
    }
    if(validateAddress(address.text.trim()) == 0){
      Utils.showAlert(context, 'Thông tin địa chỉ không rõ ràng',
          () => Navigator.pop(context));
      return 0;
    }
    if(validatePhone(phone.text.trim()) == 0){
      Utils.showAlert(context, 'Số điện thoại không phù hợp',
          () => Navigator.pop(context));
      return 0;
    }
    return 1;
  }

  static String numberFormat(int number){
    NumberFormat numberFormat = NumberFormat("#,##0", "vi_VN");
    return numberFormat.format(number);
  }

  static bool checkAutoLogin(String token){
    return token.isNotEmpty;
  }
}
