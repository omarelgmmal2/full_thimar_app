import 'model.dart';

class CategoriesStates{}

class CategoryLoadingState extends CategoriesStates{}
class CategorySuccessState extends CategoriesStates{
  final List<CategoriesModel> list;
  CategorySuccessState({required this.list});
}
class CategoryFailedState extends CategoriesStates{
  final String msg;
  CategoryFailedState({required this.msg});
}