// import 'package:cobras_e_escadas/helpers/helpers.dart';
enum OI { ola, eae }
void main() {
  print(OI.values.where((element) => element.toString() == "OI.ola").first);
}
