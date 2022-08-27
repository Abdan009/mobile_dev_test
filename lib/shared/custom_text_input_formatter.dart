part of 'shared.dart';

class NumberFirstNotNolFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(oldValue.text.isEmpty &&newValue.text=="0"){
      return oldValue;
    }
    return newValue;
  }
}

class NumberPersentaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(oldValue.text.isEmpty &&newValue.text=="0"){
      return oldValue;
    }
    if(int.parse(newValue.text)>100){
      return oldValue;
    }
    return newValue;
  }
}