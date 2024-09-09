import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/features/categories/states.dart';
import '../../core/logic/dio_helper.dart';
import 'model.dart';



class CategoriesCubit extends Cubit<CategoriesStates>{
  CategoriesCubit() :super(CategoriesStates());

  Future<void> getData()async{
    emit(CategoryLoadingState());
    final response =await DioHelper().getData("categories");
    if(response.isSuccess){
      final model = CategoriesData.fromJson(response.response!.data);
      emit(CategorySuccessState(list: model.list));
    } else{
      emit(CategoryFailedState(msg: response.message));
    }
  }
}