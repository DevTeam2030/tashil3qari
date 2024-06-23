part of'widgets_imports.dart';

class PersonalDataWidget extends StatelessWidget {
  final ConsultantInfoModel consultantInfo;
  const PersonalDataWidget({super.key,required this.consultantInfo});

@override
Widget build(BuildContext context) {
  return   Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        PersonalDataItem(title: "information".tr(),value:consultantInfo.des,),


        PersonalDataItem(title: "name".tr(),value:'${consultantInfo.firstName} ${consultantInfo.lastName}'),

        PersonalDataItem(title: "MobileNumber".tr(),value:consultantInfo.phone),
        PersonalDataItem(title: "Email".tr(),value:consultantInfo.email),
        PersonalDataItem(title: "City".tr(),value:consultantInfo.country +' , '+consultantInfo.city),
        PersonalDataItem(title: "Membership type".tr(),value:'Real estate consultant'.tr()),
        PersonalDataItem(title: "licenseNumber".tr(),value:consultantInfo.licenseNumber)

      ],
    ),
  );
}
}
