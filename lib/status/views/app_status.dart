import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sellfish/admin_dashboard/admin_dashboard.dart';
import 'package:sellfish/admin_dashboard/bloc/analysis_bloc.dart';
import 'package:sellfish/router/app_constants.dart';
import 'package:sellfish/widgets/custom_cards.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Status extends StatelessWidget {
  Status({Key? key}) : super(key: key);

  final _analysisBloc = AnalysisBloc();

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 34),
      ChartData('Others', 52)
    ];
    return BlocProvider(
      create: (context) => _analysisBloc..add(GetAnalysisData()),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<AnalysisBloc, AnalysisState>(
                builder: (context, state) {
                  if (state is AnalysisData) {
                    return GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      children: [
                        CustomCards(
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          number: 2,
                          title: 'Orders',
                          onTap: () {},
                          color: Colors.amber,
                        ),
                        CustomCards(
                          icon: const Icon(
                            Icons.dashboard,
                            color: Colors.white,
                          ),
                          number: state.productsCount,
                          title: 'Products',
                          onTap: () {},
                          color: Colors.pink,
                        ),
                        CustomCards(
                          icon: const Icon(
                            Icons.people_rounded,
                            color: Colors.white,
                          ),
                          number: state.sellerCount,
                          title: 'Sellers',
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteConstants.sellerList);
                          },
                          color: Colors.deepPurpleAccent,
                        ),
                        CustomCards(
                          icon: const Icon(
                            Icons.delivery_dining,
                            color: Colors.white,
                          ),
                          number: 2,
                          title: 'Delivery Status',
                          onTap: () {},
                          color: Colors.purple,
                        ),
                        Center(
                          child: Container(
                              color: Colors.amber,
                              child: SfCircularChart(series: <CircularSeries>[
                                RadialBarSeries<ChartData, String>(
                                  dataSource: chartData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  // Radius of the radial bar
                                  radius: '50%',
                                )
                              ])),
                        )
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
