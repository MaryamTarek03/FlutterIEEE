part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductLoadingState extends ProductsState {}

final class ProductGetSuccess extends ProductsState {}

final class ProductGetFailure extends ProductsState {}
