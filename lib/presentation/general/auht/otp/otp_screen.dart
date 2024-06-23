part of'otp_imports.dart';

class OtpScreen extends StatefulWidget {
  final RegisterModel registerModel;
  final String emailToVerify;
  const OtpScreen({super.key,required this.registerModel,required this.emailToVerify});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with OtPData ,CodeAutoFill{


   Timer? timer;

  ValueNotifier<int>secondsCount= ValueNotifier<int>(60);

  @override
  void initState() {
    super.initState();
    startTimer();
    getAppsSignature();
    errorController = StreamController<ErrorAnimationType>();
  }
  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    cancel();
    timer!.cancel();
    codeController.dispose();
    errorController?.close();
    super.dispose();


  }
  // +23koB4y70U
  getAppsSignature()async{
    signature = await SmsAutoFill().getAppSignature;
    Utils.printData('signature=============== $signature');
    SmsAutoFill().listenForCode;
  }
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    secondsCount.value=60;
    timer =  Timer.periodic(
      oneSec,
          (Timer timer) {
        if (secondsCount.value == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            secondsCount.value--;
          });
        }
      },
    );
  }

  @override
  void codeUpdated() {
    if(code!=null) {

      setState(() {
        otpCode = code!;
        codeController.text=otpCode;

      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return   Material(
      child:Stack(
        children: [
          const LoginImage(),
          Scaffold(
            backgroundColor: ColorManager.transparent,
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextButton(title: 'Continue'.tr(),
                      size: Size( .8.sw,  47),
                      radius: 8,
                      fontWeightType: FontWeightType.bold,
                      titleSize: FontSize.s18,
                      primaryColor: ColorManager.primary,
                      titleColor: ColorManager.white,
                      onPressed: (){
                        timer!.cancel();
                        validateFromRegister(context: context, registerModel: widget.registerModel);

                      }),
                ],
              ),
            ),

            body: InkWell(
              splashColor:ColorManager.white,
              focusColor: ColorManager.white,
              onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
              child: ScreenLoading(

                isLoading:  context.watch<AuthProvider>().isLoading,

                child: Container(
                    height: 1.0.sh,
                    width: 1.0.sw,
                    margin:const EdgeInsets.symmetric(horizontal: PaddingManager.p16),
                    child:SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            const AppSizeBox(height: AppSize.s60),
                            if(Navigator.canPop(context))
                               Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  BackAppBarButton(),
                                ],
                              ),
                            const AppSizeBox(height: AppSize.s40),
                            Row(
                              children: [
                                Flexible(
                                  child: AppText(title:'codeSentMessage'.tr(),
                                      titleSize: FontSize.s18,
                                      titleHeight: 1.3,
                                      titleMaxLines: 3,
                                      titleAlign: TextAlign.start,
                                      titleColor: ColorManager.text,
                                      fontWeightType: FontWeightType.medium),
                                ),
                              ],
                            ),

                            const AppSizeBox(height: AppSize.s20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: AppText(title: 'EnterCodeMessage'.tr(),
                                    titleSize: FontSize.s16,
                                    titleMaxLines: 3,
                                    titleHeight: 1.3,
                                    titleColor: ColorManager.grey,
                                      titleAlign: TextAlign.center
                                  ),
                                ),
                              ],
                            ),
                            const AppSizeBox(height: AppSize.s10),
                            AppText(
                                title: widget.emailToVerify,
                                // title: '05648985612',
                                titleSize: FontSize.s18,
                                titleColor: ColorManager.primary,
                                titleAlign: TextAlign.center
                                ),




                            const AppSizeBox(height: AppSize.s30),

                            Directionality(
                              textDirection: ui.TextDirection.ltr,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: PaddingManager.p18.w),
                                  child: PinCodeTextField(
                                    errorAnimationController: errorController,
                                    appContext: context,
                                    pastedTextStyle: const TextStyle(
                                      color: ColorManager.primary,
                                    ),
                                    length: 6,
                                    boxShadows:
                                     [
                                      // BoxShadow(color: ColorManager.textGrey,
                                      //     blurRadius: AppSize.s70,
                                      //     spreadRadius: AppSize.s20,
                                      //     blurStyle: BlurStyle.outer,),

                                    ],

                                    animationType: AnimationType.fade,
                                    // validator: (value)=>value?.validateEmpty(context,message: tr(context, "enter_verification_code")),
                                    scrollPadding: const EdgeInsets.symmetric(horizontal: 2),
                                    pinTheme: PinTheme(
                                        shape: PinCodeFieldShape.box,
                                        borderRadius:BorderRadius.circular(AppSize.s12) ,
                                        borderWidth: 1,
                                        fieldWidth: AppSize.s45,
                                        activeColor: ColorManager.primary,
                                        selectedColor: ColorManager.text,
                                        inactiveColor: ColorManager.grey.withOpacity(.7),
                                        inactiveFillColor: ColorManager.white,
                                        fieldOuterPadding: EdgeInsets.zero),
                                    cursorColor: ColorManager.starColor,
                                    animationDuration: const Duration(milliseconds: 300),
                                    controller: codeController,
                                    keyboardType: TextInputType.number,
                                    textStyle: const TextStyle(
                                        fontSize: FontSize.s14,
                                        color: ColorManager.primary,
                                        fontWeight: FontWeight.w600),
                                    onCompleted: (v) {
                                      // printLog(v);
                                      setState(() {
                                        otpCode = v;
                                      });
                                      // verifyCode( context,widget.moreData,email!,widget.moreData.textEditingController!.text);
                                    },
                                    onChanged: (value) {
                                      // printLog(value);
                                    },
                                    beforeTextPaste: (text) {
                                      return true;
                                    },
                                  )),
                            ),

                            // const AppSizeBox(height: AppSize.s10),
                            ValueListenableBuilder(valueListenable: secondsCount,
                                builder: (context, value, child) =>  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(title: '00:${value>10?value:'0$value'}',
                                        titleSize: FontSize.s14,
                                        titleColor: ColorManager.primary,
                                        titleAlign: TextAlign.center
                                    ),
                                  ],
                                ),),


                            AppSizeBox(height: AppSize.s20),

                            InkWell(
                              onTap: (){
                                timer!.cancel();
                                startTimer();
                                sendVerificationCode(context: context,registerModel:widget.registerModel);
                              },
                              child: RichText(

                                text:  TextSpan(
                                  text:"didntReceiveCode".tr(),
                                  style:getAppTextStyle(titleColor: ColorManager.text,
                                      fontWeightType: FontWeightType.medium,
                                      titleSize:FontSize.s12,underline: false),

                                  children: [
                                    TextSpan(
                                      text:' ${'resend'.tr()}',
                                      style: getAppTextStyle(
                                          titleColor: ColorManager.primary,
                                          fontWeightType: FontWeightType.medium,
                                          titleSize:FontSize.s12,underline: false),

                                    ),

                                  ],
                                ),
                              ),
                            ),






                          ],
                        ),
                      ),
                    )



                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
