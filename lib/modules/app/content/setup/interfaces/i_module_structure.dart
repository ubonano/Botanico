import '../../model/key_model.dart';
export '../../model/key_model.dart';

abstract class IModuleStructure {
  String get id;
  String get label;
  List<KeyModel> get keys;
}
