import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_ahwa_manager_app/core/helpers/enums.dart';
import 'package:smart_ahwa_manager_app/core/local_db/db_result.dart';
import 'package:smart_ahwa_manager_app/features/home/data/models/order_request.dart';
import 'package:smart_ahwa_manager_app/features/home/data/models/order_response.dart';
import 'package:smart_ahwa_manager_app/features/home/data/repos/home_repo.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeStateInitial());

  void getOrders() async {
    emit(GetOrdersLoading());
    DataBaseResult<List<OrderResponse>> result = await _homeRepo.getOrders();

    if (result is Success<List<OrderResponse>>) {
      emit(GetOrdersSuccess(result.data));
    } else if (result is Failure<List<OrderResponse>>) {
      emit(GetOrdersError(result.message));
    }
  }

  TextEditingController customerNameController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  Drink drink = Drink.coffee;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addOrder() async {
    emit(AddOrderLoading());
    DataBaseResult<String> result = await _homeRepo.addOrder(
      OrderRequest(
        customerName: customerNameController.text,
        drink: drink,
        notes: notesController.text,
        image: drink.image,
      ),
    );
    if (result is Success<String>) {
      clearControllers();
      getOrders();
      emit(AddOrderSuccess(result.data));
    } else if (result is Failure<String>) {
      emit(AddOrderError(result.message));
    }
  }

  void clearControllers() {
    customerNameController.clear();
    notesController.clear();
  }

  IconData fabIcon = Icons.add;
  bool _isBottomSheetShown = false;
  bool get isBottomSheetShown => _isBottomSheetShown;

  void changeBottomSheetState() {
    _isBottomSheetShown = !_isBottomSheetShown;
    if (_isBottomSheetShown) {
      fabIcon = Icons.check;
    } else {
      fabIcon = Icons.add;
    }
    emit(AppChangeBottomSheetState());
  }

  void deleteOrder(int id) async {
    emit(DeleteOrderLoading());
    DataBaseResult<String> result = await _homeRepo.deleteOrder(id);
    if (result is Success<String>) {
      getOrders();
      emit(DeleteOrderSuccess(result.data));
    } else if (result is Failure<String>) {
      emit(DeleteOrderError(result.message));
    }
  }

  void updateOrderStatus(int id) async {
    emit(UpdateOrderLoading());
    DataBaseResult<String> result = await _homeRepo.updateOrderStatus(
      id: id,
      status: Status.done.name,
    );
    if (result is Success<String>) {
      getOrders();
      emit(UpdateOrderSuccess(result.data));
    } else if (result is Failure<String>) {
      emit(UpdateOrderError(result.message));
    }
  }
}
