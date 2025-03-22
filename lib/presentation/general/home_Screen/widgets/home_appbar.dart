part of'widget_imports.dart';

class HomeBuildAppBar extends StatelessWidget implements PreferredSizeWidget {

  final bool? showFilter;
  final double? fromHeight;
  final bool isFromHome,showLogo;
  const HomeBuildAppBar({
    super.key,
    this.showFilter,
    this.fromHeight,
    this.isFromHome=true,
    this.showLogo=true,
  });


  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) =>   Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [





               // Row(
               //   children: [
               //     if(Constants.isLogin&& Constants.userDataModel!.isUser==false&&isFromHome==true)
               //       Consumer<ProfileProvider>(
               //         builder: (context, provider, child) => Padding(
               //           padding: const EdgeInsets.symmetric(horizontal:2.0),
               //           child: InkWell(
               //             // onTap: ()=>MyRoute().navigate(context: context, route: HomeAddLocationScreen()),
               //             child:Consumer<AuthProvider>(
               //                 builder: (context, provider, child) =>
               //                 Constants.userDataModel!.documented?
               //                 const Icon(Icons.check_circle_sharp,color: ColorManager.primary,size: 20,):
               //                 const Icon(Icons.error,color: ColorManager.red,size: 20,)
               //             ),
               //
               //
               //           ),
               //         ),
               //       ),
               //     const AppbarLogo(),
               //
               //   ],
               // ),

                Row(
                  children: [
                    const HomeDropdownButton(),
                   const AppSizeBox(width: 14,),
                    if(Constants.isLogin&& Constants.userDataModel!.isUser==false&&isFromHome==true)
                      Consumer<ProfileProvider>(
                        builder: (context, provider, child) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal:2.0),
                          child: InkWell(
                            // onTap: ()=>MyRoute().navigate(context: context, route: HomeAddLocationScreen()),
                            child:Consumer<AuthProvider>(
                                builder: (context, provider, child) =>
                                Constants.userDataModel!.documented?
                                const Icon(Icons.check_circle_sharp,color: ColorManager.primary,size: 20,):
                                const Icon(Icons.error,color: ColorManager.red,size: 20,)
                            ),


                          ),
                        ),
                      )
                    // else AppSizeBox(width: .18.sw,),
                  ],
                ),
                


                if(showFilter!=false)
                  ValueListenableBuilder(valueListenable:  context.read<HomeMapProvider>().openSearch,
                      builder: (context, value, child) => Container(
                          width: 120.0,
                          height: AppSize.s40,
                          padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p14),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: value?ColorManager.white:ColorManager.primary,
                              border: value?
                              const Border(bottom: BorderSide(color:  ColorManager.primary,width: 3),) :
                              Border.all(color:value?ColorManager.white: ColorManager.primary,width: AppSize.s06),
                              borderRadius:value?null:  BorderRadius.circular(RadiusManager.r14)
                          ),


                          // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
                          child:InkWell(
                              onTap: (){
                                 context.read<HomeMapProvider>().openSearch.value=!value;
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                      title: 'search'.tr(),
                                      titleAlign: TextAlign.center,
                                      titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                                      titleSize: FontSize.s12,titleColor: value?ColorManager.primary:ColorManager.white),
                                  Icon(value?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined,
                                    color: value?ColorManager.primary:ColorManager.white,size: AppSize.s20,)
                                ],
                              ))


                      )),

                // if(showLogo)
                // const AppbarLogo(),



                // if(Constants.userDataModel==null||Constants.userDataModel!.isUser)
                // if(false)
                //   CitiesDropdownButton(
                //     onChanged: () {
                //        context.read<HomeMapProvider>().showCitiesMarkers=true;
                //       context.read<HomeMapProvider>().properties=[];
                //        context.read<HomeMapProvider>().initDataCitiesMarkers(context: context,isNotify: true);
                //     },
                //   ),

                // if(! context.read<HomeMapProvider>().showCitiesMarkers)
                // ForSaleOrRentDropdownButton(
                //   selectedType:   context.read<HomeMapProvider>().selectedAdType,
                //     onChanged: (type) async{
                //        context.read<HomeMapProvider>().selectedAdType;
                //        context.read<HomeMapProvider>().getByCategory(context: context, category:  context.read<HomeMapProvider>().selectedCategory.value);
                //     },
                //   ),

          

                // ignore: prefer_const_constructors
                ChatNotifyIcon(),


              ],
            ),
          ),

          const Divider(color: ColorManager.divider,thickness: 1.2),

          if(showFilter!=false)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  // ValueListenableBuilder(valueListenable:  context.read<HomeMapProvider>().openSearch,
                  //     builder: (context, value, child) => Container(
                  //         width: 100.0,
                  //         height: AppSize.s35,
                  //         padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p14),
                  //         alignment: Alignment.center,
                  //         decoration: BoxDecoration(
                  //             color: value?ColorManager.white:ColorManager.primary,
                  //             border: value?
                  //             Border(
                  //               bottom: BorderSide(color:  ColorManager.primary,width: 3),
                  //             )
                  //                 :
                  //             Border.all(color:value?ColorManager.white: ColorManager.primary,width: AppSize.s06),
                  //             borderRadius:value?null: const BorderRadius.only(
                  //                 topLeft: Radius.circular(RadiusManager.r14),
                  //                 topRight: Radius.circular(RadiusManager.r14)
                  //             )
                  //         ),
                  //
                  //
                  //         // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
                  //         child:InkWell(
                  //             onTap: (){
                  //                context.read<HomeMapProvider>().openSearch.value=!value;
                  //             },
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 AppText(
                  //                     title: 'search'.tr(),
                  //                     titleAlign: TextAlign.center,
                  //                     titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                  //                     titleSize: FontSize.s12,titleColor: value?ColorManager.primary:ColorManager.white),
                  //                 Icon(value?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined,
                  //                   color: value?ColorManager.primary:ColorManager.white,size: AppSize.s20,)
                  //               ],
                  //             ))
                  //
                  //
                  //     )),

              SizedBox(
                width: 1.0.sw-40,
                // width: 1.0.sw-140,
                child:     Row(
                  children: [
                    Expanded(child: ForSaleOrRentDropdownButton(
                      hint: 'saleRent'.tr(),
                      selectedType:   context.read<HomeMapProvider>().selectedAdType,
                      onChanged: (type) async{
                         context.read<HomeMapProvider>().selectedAdType=type;
                         context.read<HomeMapProvider>().getByCategory(context: context, category:  context.read<HomeMapProvider>().selectedCategory.value);
                      },

                      monthly:    context.read<HomeMapProvider>().monthly,

                      inAppbar: true,
                    ),),

                    AppSizeBox(width: 10,),
                    
                    Expanded(child: CategoriesDropdownButton(
                      selectedCategory:  context.read<HomeMapProvider>().selectedCategory.value,
                      onChanged: (selectedCategory)=> context.read<HomeMapProvider>().getByCategory(context: context, category: selectedCategory),
                    ),),


                  ],
                ),
              ),
                  if(false)
                  SizedBox(
                      width: 1.0.sw-140,
                      height: AppSize.s35,
                      child: ListView.builder(
                        itemCount:  Constants.settingModel.categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          var categories=Constants.settingModel.categories;
                          return  Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 0),
                            child: ValueListenableBuilder(
                              valueListenable:  context.read<HomeMapProvider>().selectedCategory,
                              builder: (context, value, child) => InkWell(
                                onTap: ()=> context.read<HomeMapProvider>().getByCategory(context: context, category: categories[index]),
                                child:  Container(
                                  height: AppSize.s40,
                                  width: 60,
                                  alignment: Alignment.center,
                                  decoration: value==categories[index]?const BoxDecoration(
                                      border:Border(
                                        bottom: BorderSide(color:  ColorManager.primary,width: 3),
                                      )
                                  ):null,
                                  child: AppText(
                                      title: categories[index].name,
                                      titleAlign: TextAlign.center,
                                      titleMaxLines: 2,
                                      fontWeightType:value==categories[index]?  FontWeightType.extraBold:FontWeightType.medium,
                                      titleSize: FontSize.s10,titleColor: ColorManager.icons),
                                ),
                              ),),
                          );
                        },))
                ],
              ),
            ),

          AppSizeBox(height: 4,)


        ],



      )
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(fromHeight??110);
}
