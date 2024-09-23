import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/no_data_available.dart';
import '../../../../components/screen_loading.dart';
import '../../../../components/text_field/general_appbar_logo.dart';
import '../../../../providers/profile_provider.dart';
import '../widgets/widgets_imports.dart';


class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key,});

  @override
  State<FollowersScreen> createState() =>
      _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileProvider>().getFollowersUsers(context: context,isNotify: false,);
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: GeneralAppBar(title: 'Followers'.tr(),
            showChatNotify: false),
        body: Consumer<ProfileProvider>(
            builder: (context, provider, child) =>ScreenLoading(
              isLoading: provider.isLoading,
              child:Container(
                height: 1.0.sh,
                width: 1.0.sw,
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 20),
                child: CustomScrollView(
                  // shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  slivers: [

                    SliverList(
                      delegate: SliverChildListDelegate([

                        if(provider.followersUsers.isEmpty&&!provider.isLoading)Padding(
                          padding: EdgeInsets.only(top: .24.sh),
                          child: const NoDataCurrentlyAvailable(),
                        ),
                      ]),
                    ),


                      SliverGrid(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          childAspectRatio: .94,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return FollowingUserWidgets(user: provider.followersUsers[index],);
                          },
                          childCount:provider.followersUsers.length,
                        ),
                      ),


                  ],
                ),


              ),
            )
        )

      ),
    );
  }
}
