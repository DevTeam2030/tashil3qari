part of'bid_imports.dart';


class BidData {
  late int propertyId;
  final formKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController(text: '0');

  addAuction({required BuildContext context,required String price,required currencyId})
  async=> context.read<ProductProvider>().addAuction(context: context,propertyId: propertyId,price: price,currencyId: currencyId);

}

