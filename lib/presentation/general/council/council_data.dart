part of 'council_imports.dart';

class CouncilData{

  final newsFormKey = GlobalKey<FormState>();
  final opportunityFormKey = GlobalKey<FormState>();
  TextEditingController newsController = TextEditingController();
  TextEditingController opportunityController = TextEditingController();
  XFile? opportunityPicker;


}