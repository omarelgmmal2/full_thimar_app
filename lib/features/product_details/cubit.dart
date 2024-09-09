import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/features/product_details/states.dart';
import '../../core/logic/dio_helper.dart';
import '../products/model.dart';
import 'model.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  int amount = 1;
  late num totalPrice,price;
  late ProductModel model;

  ProductDetailsCubit() : super(ProductDetailsStates()){
    print("*"*50);
    print("New Object");
  }
  Future<void> getData(int id) async{
    emit(ProductGetLoadingState());
    final response = await DioHelper().getData("products/$id");
    if (response.isSuccess){
      model =ProductDetailsData.fromJson(response.response!.data).model;
      price = model.price;
      totalPrice =price;
      emit(ProductGetSuccessState());
    }else {
      emit(ProductGetFailedState());
    }
  }
  Future<void> updatePrice() async{
    totalPrice =price*amount;
    emit(ProductGetSuccessState());

  }
}