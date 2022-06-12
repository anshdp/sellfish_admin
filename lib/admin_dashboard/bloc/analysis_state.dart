part of 'analysis_bloc.dart';

@immutable
abstract class AnalysisState {}

class AnalysisInitial extends AnalysisState {}

class AnalysisData extends AnalysisState {
  AnalysisData({
    required this.sellerCount,
    required this.customerCount,
    required this.productsCount,
    required this.activeSellers,
    required this.pendingSellers,
  });
  int sellerCount;
  int customerCount;
  int productsCount;
  int activeSellers;
  int pendingSellers;
}
