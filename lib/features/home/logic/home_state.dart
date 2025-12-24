import 'package:smart_ahwa_manager_app/features/home/data/models/order_response.dart';

sealed class HomeState {}

class HomeStateInitial extends HomeState {}

// Orders
class GetOrdersLoading extends HomeState {}

class GetOrdersSuccess extends HomeState {
  final List<OrderResponse> orders;
  GetOrdersSuccess(this.orders);
}

class GetOrdersError extends HomeState {
  final String errorMessage;
  GetOrdersError(this.errorMessage);
}

// Add Order
class AddOrderLoading extends HomeState {}

class AddOrderSuccess extends HomeState {
  final String successMessage;
  AddOrderSuccess(this.successMessage);
}

class AddOrderError extends HomeState {
  final String errorMessage;
  AddOrderError(this.errorMessage);
}

// Delete Order
class DeleteOrderLoading extends HomeState {}

class DeleteOrderSuccess extends HomeState {
  final String successMessage;
  DeleteOrderSuccess(this.successMessage);
}

class DeleteOrderError extends HomeState {
  final String errorMessage;
  DeleteOrderError(this.errorMessage);
}

// Update Order
class UpdateOrderLoading extends HomeState {}

class UpdateOrderSuccess extends HomeState {
  final String successMessage;
  UpdateOrderSuccess(this.successMessage);
}

class UpdateOrderError extends HomeState {
  final String errorMessage;
  UpdateOrderError(this.errorMessage);
}

class AppChangeBottomSheetState extends HomeState {}
