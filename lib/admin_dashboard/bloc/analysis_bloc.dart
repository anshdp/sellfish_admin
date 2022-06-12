import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sellfish/admin_dashboard/admin_dashboard.dart';

part 'analysis_event.dart';
part 'analysis_state.dart';

class AnalysisBloc extends Bloc<AnalysisEvent, AnalysisState> {
  AnalysisBloc() : super(AnalysisInitial()) {
    on<AnalysisEvent>((event, emit) async {
      if (event is GetAnalysisData) {
        final sellerCount = await AnalysisAppData().getUsers(true);
        final customerCount = await AnalysisAppData().getUsers(false);
        final productsCount = await AnalysisAppData().getProducts();
        final activeCount = await AnalysisAppData().sellerStatus(true);
        final requestedCount = await AnalysisAppData().sellerStatus(false);

        emit(
          AnalysisData(
            sellerCount: sellerCount,
            customerCount: customerCount,
            productsCount: productsCount,
            activeSellers: activeCount,
            pendingSellers: requestedCount,
          ),
        );
      }
    });
  }
}
