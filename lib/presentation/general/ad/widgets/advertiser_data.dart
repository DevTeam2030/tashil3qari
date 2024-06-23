part of 'widgets_imports.dart';

class AdvertiserData extends StatelessWidget {
  final PropertyInfoModel propertyInfo;

  const AdvertiserData({super.key, required this.propertyInfo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
      propertyInfo.userType == UserType.consultant?
          MyRoute().navigate(context: context, route:  YourConsultantProfileScreen(consultantId: propertyInfo.userId,)):null,
    child:
      Column(
      children: [
        Container(
            width: 1.0.sw,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: 'Advertiser data'.tr(),
                  titleMaxLines: 2,
                  titleHeight: 1.3,
                  titleSize: FontSize.s16,
                  titleAlign: TextAlign.start,
                  titleColor: ColorManager.black,
                  fontWeightType: FontWeightType.extraBold,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: 1.0.sw,
                  // height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(RadiusManager.r14),
                    color: ColorManager.textGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          CachedImage(
                            url: propertyInfo.userImage,
                            height: 65,
                            width: 65,
                            fit: BoxFit.cover,
                            boxShape: BoxShape.circle,
                          ),
                          const AppSizeBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppSizeBox(
                                height: 3,
                              ),
                              AppText(
                                  title: propertyInfo.userName,
                                  titleAlign: TextAlign.center,
                                  titleMaxLines: 1,
                                  fontWeightType: FontWeightType.extraBold,
                                  titleSize: FontSize.s14,
                                  titleColor: ColorManager.black),
                              const AppSizeBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  AppText(
                                      title:
                                          propertyInfo.userType == UserType.user
                                              ? 'user'.tr()
                                              : "RealEstateConsultant".tr(),
                                      titleAlign: TextAlign.start,
                                      titleMaxLines: 1,
                                      fontWeightType: FontWeightType.medium,
                                      titleSize: FontSize.s8,
                                      titleColor: ColorManager.black),
                                  const AppSizeBox(
                                    width: 4,
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4.0),
                                      child: Icon(
                                        Icons.star,
                                        size: 12,
                                        color: ColorManager.starColor,
                                      )),
                                  AppText(
                                    title: '${propertyInfo.userRate}',
                                    titleSize: FontSize.s10,
                                    titleAlign: TextAlign.start,
                                    titleColor: ColorManager.black,
                                    fontWeightType: FontWeightType.medium,
                                  ),
                                ],
                              ),
                              const AppSizeBox(
                                height: 4,
                              ),
                              InkWell(
                                onTap: () => MyRoute().navigate(
                                    context: context,
                                    route: AllOwnerAds(
                                      ownerId: propertyInfo.userId,
                                      ownerName: propertyInfo.userName,
                                    )),
                                child: AppText(
                                    title: 'See all ads'.tr(),
                                    titleAlign: TextAlign.start,
                                    titleMaxLines: 1,
                                    fontWeightType: FontWeightType.extraBold,
                                    titleSize: FontSize.s9,
                                    titleColor: ColorManager.primary),
                              ),
                              const AppSizeBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CallIcon(phoneNo: propertyInfo.userPhone),


                            const AppSizeBox(
                              width: 4,
                            ),
                            ChatIcon(receiverType: UserType.consultant,
                                receiverName: propertyInfo.userName,
                                receiverImage: propertyInfo.userImage,
                                propertyId: propertyInfo.id,
                                receiverId: propertyInfo.userId),
                            const AppSizeBox(
                              width: 4,
                            ),
                            InkWell(
                                onTap: () => UrlLauncherMethods.whatsapp(
                                    phoneNo: propertyInfo.userPhone),
                                child: SvgPicture.asset(ImageManager.whatsSvg)),
                            const AppSizeBox(
                              width: 4,
                            ),
                            InkWell(
                                onTap: () => UrlLauncherMethods.sendEmail(
                                    email: propertyInfo.userEmail),
                                child:
                                    SvgPicture.asset(ImageManager.messageSvg)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
        const Divider(color: ColorManager.divider, thickness: 2),
      ],
    ));
  }
}
