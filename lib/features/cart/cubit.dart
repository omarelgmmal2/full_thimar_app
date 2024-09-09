import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/core/logic/dio_helper.dart';
import 'package:full_thimar_project/home/pages/main/widget/cart_screen.dart';
import '../../core/logic/helper_methods.dart';
import 'model.dart';
import 'states.dart';

class CartCubit extends Cubit<CartStates>{
  CartCubit():super(CartStates());
  
  Future<void> addToCart({required int id,required int amount})async{
    emit(AddToCartLoadingState());
    final response = await DioHelper().sendData("client/cart", data: {
      "product_id": id,
      "amount": amount,
    });
    if (response.isSuccess) {
      emit(AddToCartSuccessState());
      toGetNavigate(const CartScreen());
    } else {
      emit(AddToCartFailedState());
    }
  }

  Future<void> getCartItems() async {
    emit(GetCartItemsLoadingState());
    final response = await DioHelper().getData('client/cart');
    if (response.isSuccess) {
      final model = CartData.fromJson(response.response!.data);
      emit(GetCartItemsSuccessState(model: model));
    } else {
      emit(GetCartItemsFailedState(msg: response.message));
    }
  }

  Future<void> deleteFromCart({required int id}) async {
    emit(RemoveItemLoadingState());
    final response = await DioHelper().sendData("client/cart/delete_item/$id",
        data: {
      '_method': 'delete'
    });
    if (response.isSuccess) {
      showMessage(response.message);
      emit(RemoveItemSuccessState());
      getCartItems();
    } else {
      showMessage(response.message);
      emit(RemoveItemFailedState());
    }
  }
}