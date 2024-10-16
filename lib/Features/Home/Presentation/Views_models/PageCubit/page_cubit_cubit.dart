import 'package:bloc/bloc.dart';

class PaginationCubit extends Cubit<int> {
  PaginationCubit() : super(0); // Initial state is page 0

  void goToPage(int page) {
    emit(page);
  }

  void nextPage() {
    if (state < 4) { // Assuming 5 pages (0-4)
      emit(state + 1);
    }
  }

  void prevPage() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}
