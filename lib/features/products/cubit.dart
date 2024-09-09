import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/core/logic/dio_helper.dart';
import 'package:full_thimar_project/features/products/model.dart';
import 'package:full_thimar_project/features/products/states.dart';

class ProductsCubit extends Cubit<ProductsStates>{
  ProductsCubit() :super(ProductsStates());

  Future<void> getData()async{
    emit(ProductsLoadingState());
    final response = await DioHelper().getData("products");
    if(response.isSuccess){
      final model = ProductsData.fromJson(response.response!.data);
      emit(ProductsSuccessState(list: model.list));
    }else{
      emit(ProductsFailedState(msg: response.message));
    }
  }
}