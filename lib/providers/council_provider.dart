import 'dart:io';
import 'package:flutter/material.dart';
import '../domain/controller/consultant_controller.dart';
import '../domain/controller/council_controller.dart';
import '../domain/model/models/post_model.dart';

class CouncilProvider extends ChangeNotifier {
  final CouncilController _api = CouncilController();
  final ConsultantController _apiConsultant = ConsultantController();
  bool isLoading = false;

  List<PostModel> posts = [];
  List<PostModel> opportunities = [];

  Future<void> getCouncilData({required BuildContext context, required bool notify,int? cityId}) async {
    isLoading = true;
    posts = [];
    opportunities = [];

    if (notify) notifyListeners();
    posts = await _api.getPosts(context: context,cityId: cityId);
    opportunities = await _api.getOpportunities(context: context,cityId: cityId);

    isLoading = false;
    notifyListeners();
  }

  Future<void> getOpportunities({required BuildContext context,}) async {
    isLoading = true;
    notifyListeners();
    opportunities = await _api.getOpportunities(context: context,);
    isLoading = false;
    notifyListeners();
  }

  Future<void> addPost({required BuildContext context, required String post, required File? image,required int cityId}) async {
    isLoading = true;

    notifyListeners();
    bool isAdded = await _api.addPost(context: context, image: image, post: post,cityId: cityId);

    if (isAdded) {
      posts = await _api.getPosts(
        context: context,
        cityId: cityId
      );
    }
    isLoading = false;
    notifyListeners();
  }
  Future<void> editPost({required BuildContext context, required String post ,required int postId,required int cityId}) async {
    isLoading = true;

    notifyListeners();
    bool isAdded = await _api.editPost(context: context, postId: postId, post: post,cityId: cityId);

    if (isAdded) {
      posts = await _api.getPosts(context: context,cityId: cityId);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addOpportunity(
      {required BuildContext context,
      required String post,
      required String description,
        required int cityId,
      required File? image}) async {
    isLoading = true;

    notifyListeners();
    bool isAdded =
        await _api.addOpportunity(context: context, image: image, post: post,cityId: cityId,description: description);

    if (isAdded) {
      opportunities = await _api.getOpportunities(
        context: context,
        cityId: cityId
      );
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> hidePostOrOpportunity(
      {required BuildContext context,
      required int postId,
      required bool isPost}) async {
    isLoading = true;

    notifyListeners();
    bool isHiden = await _api.hidePostOrOpportunity(
        context: context, postId: postId, isPost: isPost);

    if (isHiden) {
      if (isPost) {
        posts.removeWhere((element) => element.id == postId);
      } else {
        opportunities.removeWhere((element) => element.id == postId);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> deletePostOrOpportunity(
      {required BuildContext context,
      required int postId,
      required bool isPost}) async {
    isLoading = true;

    notifyListeners();
    bool isDelete = await _api.deletePostOrOpportunity(
        context: context, postId: postId, isPost: isPost);

    if (isDelete) {
      if (isPost) {
        posts.removeWhere((element) => element.id == postId);
      } else {
        opportunities.removeWhere((element) => element.id == postId);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> reportConsultant(
      {required BuildContext context, required int consultantId,required String message}) async {
    isLoading = true;

    notifyListeners();
    bool report = await _api.reportConsultant(context: context, consultantId: consultantId,message: message);
    isLoading = false;
    notifyListeners();
  }

  Future<void> followOrUnfollowConsultant(
      {required BuildContext context,
      required PostModel post,
      required bool isPost}) async {
    isLoading = true;
    notifyListeners();

    if (post.isFollow) {
      bool unFollow = await _apiConsultant.unFollowConsultant(
          context: context, consultantId: post.userId);
      if (unFollow) {
        isPost
            ? posts.firstWhere((element) => element.id == post.id).isFollow =
                false
            : opportunities
                .firstWhere((element) => element.id == post.id)
                .isFollow = false;
      }
    } else {
      bool follow = await _apiConsultant.followConsultant(
          context: context, consultantId: post.userId);
      if (follow) {
        isPost
            ? posts.firstWhere((element) => element.id == post.id).isFollow =
                true
            : opportunities
                .firstWhere((element) => element.id == post.id)
                .isFollow = true;
      }
    }

    isLoading = false;
    notifyListeners();
  }


  Future<void> likePost({required BuildContext context, required PostModel post,required isLike}) async {
    isLoading = true;

    notifyListeners();
    bool isAdded = await _api.likePost(context: context,isLike: isLike,postId: post.id);

    if (isAdded) {
      posts = await _api.getPosts(context: context,);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> likeOpportunity({required BuildContext context, required PostModel opportunity,required isLike}) async {
    isLoading = true;

    notifyListeners();
    bool isAdded = await _api.likeOpportunity(context: context,isLike: isLike,opportunityId: opportunity.id);

    if (isAdded) {
      opportunities = await _api.getOpportunities(context: context,);
    }
    isLoading = false;
    notifyListeners();
  }
}
