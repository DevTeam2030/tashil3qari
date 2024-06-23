
class MakeAuctionModel {
  int propertyId;
  String minimumAuction;
  int auctionDurationId;
  String auctionNotes;

  MakeAuctionModel({
    required this.propertyId,
    required this.minimumAuction,
    required this.auctionDurationId,
    required this.auctionNotes,
  });

  Map<String, dynamic> toJson() => {
    "property_id": propertyId,
    "minimum_auction": minimumAuction,
    "auction_duration_id": auctionDurationId,
    "auction_notes": auctionNotes,
  };
}


class MakeAdFeaturedModel {
  int propertyId;
  int featuredPlanId;

  MakeAdFeaturedModel({
    required this.propertyId,
    required this.featuredPlanId,

  });

  Map<String, dynamic> toJson() => {
    "property_id": propertyId,
    "featured_plan_id": featuredPlanId,
  };
}
