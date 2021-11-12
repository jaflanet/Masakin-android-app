String validateEmail(String value) {
  String _massage = "Null";
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value.isEmpty) {
    _massage = "Your username is required";
  } else if (!regex.hasMatch(value)) {
    _massage = "Please provide a valid emal address";
  }
  return _massage;
}