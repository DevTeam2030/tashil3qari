


class Urls{
//--------- auth
 static const login='auth/login';
 static const register='auth/register';
 static const updatePhone='auth/update-phone';
 static const activateAccount='auth/activate-acount';
 static const sendVerificationCode='auth/send-verification-code';
 static const updateLocation='auth/update-location';
 static const requestConsultant='request-consultant';
 static const forgetPassword='auth/password-reset-email';
 static const changePassword='change-password';
 static const profile='profile';
 static const userAds='user-ads';
 static const userWishlist='user-wishlist';

 static const countries='countries';
 static const cities='cities';
 static const settings='settings';


 static const finishingTypes='finishing-types';
 static const properties='properties';
 static const categories='categories';

 static const getWishlist='user-wishlist';
 static const wishlistProduct='wishlist';
 static const unWishlistProduct='un-wishlist';
 static const getPropertyInfo='property-info';
 static const getAuctions='get-auctions';
 static const addProperty='add-property';
 static const editProperty='edit-property';
 static const makeAuction='make-auction';
 static const featuredProperty='featured-property';
 static const getConsultant='get-consultant';
 static const getAgreementConsultants='get-agreements-consultant';
 static const getConsultantInfo='get-consultant-info';
 static const followConsultant='follow';

 static const unFollowConsultant='un-follow';
 static const consultantAds='consultant/ads';
 static const updateProfile='update-profile';
 static const deleteProperty='delete-property';
 static const removeFromAuction='remove-auction';
 static const unPublishProperty='un-publish-property';
 static const addConsultantProperty='add-consultant-property';
 static const publishProperty='publish-property';
 static const addComplaint='add-complaint';
 static const addAuction='add-auction';
 static const deleteImageFromAd='delete-image-ad';
 static const userNotifications='user-notifications';
 static const consultantNotifications='consultant-notifications';
 static const countNotification='count-notification';
 static const notificationSeen='notification-seen';
 static const getOpportunities='get-opportunities';
 static const getPosts='get-posts';
 static const addPost='add-post';
 static const editPost='edit-post';
 static const addOpportunity='add-opportunity';
 static const acceptProperty='accept-property';
 static const refuseProperty='refuse-property';
 static const hideOpportunity='hide-opportunity';
 static const hidePost='hide-post';
 static const deleteOpportunity='delete-opportunity';

 static const deletePost='delete-post';
 static const reportConsultant='report-consultant';
 static const deleteVideoAd='delete-video-ad';




 static const services='services';

 static const acceptAgreement='estate-add-agreement';
 static const getEstateAgreements='estate-get-agreements';
 static const addConsultantEstateAgreement='estate-add-consultant';
 static const estateApproveAgreement='estate-approve-agreement';

 static const likeOpportunity='like-opportunity';
 static const unLikeOpportunity='un-like-opportunity';

 static const likePost='like-post';
 static const unlikePost='un-like-post';



 //-----
 static const addAgreement='add-agreement';
 static const addConsultantAgreement='opportunity-add-consultant';
 static const getAgreements='get-agreements';
 static const addPdf='add-pdf';
 static const sendNotificationMessage='send-notification';


 //----------------------------------------------------------------------------------





 static const homeScreen='home-screen';





 static const getProducts='products';
 static const search='search-products';
 //-------------------------

 static const loginSocialMedia='auth/login-social-media';




 static const changeImageProfile='change-image-profile';

 static const updateNotificationsStatus='update-notifications-status';



 


 static const oneCategoryData='stores?category_id=';
 static const allCategories='categories';
 static const recentlyViewedStores='recently-viewed-stores';
 static const featuredStores='featured-stores';
 static const newStores='new-stores';
 static const store='store?id=';
 static const storeInfo='store-info?id=';

 static const rateStore='rate-store';

 static const upsellServices='upsell-services?service_id=';
 static const upsellForAllServices='get-upsell-services';
 static const cancelReasons='cancellation-reasons';
 // static const storeTimes='store-times?id=';
 static const storeTimes='store-times-services';
 // static const reservedServices='reserved_services';
 static const checkForReschedule='check-for-reschedule';
 static const listAddress='list-address';
 static const addAddress='add-address';
 static const editAddress='edit-address';

 static const deleteAddress='delete-address';

 // static const addOrder='add-order';
 static const addOrder='create-order';
 static const reOrder='re-order';
 static const rescheduleOrder='reschedule-order';
 static const cancelOrder='cancel-order';
 static const deleteOrderService='delete-order-service';
 static const addToCalendar='add-calendar';
 static const myOrders='my-orders?status=';
 static const deleteAccount='delete-account';
 static const termsUse='terms-use';
 static const privacyPolicy='privacy-policy';
 static const termsService='terms-service';
 static const usePromo='use-promo';



 static const listSocialAccounts='list-soical-accounts';
 static const activeSocialAccounts='active-soical-account';
 static const unActiveSocialAccounts='unactive-soical-account';
 static const addRecentlyViewed='add-recently-viewed';



 static const rateConsultant='rate-consultant';
 static const replayRate='replay-rate';
 static  getConsultantRates(int consultantId)=>'get-consultant-rates?consultant_id=$consultantId';
}



