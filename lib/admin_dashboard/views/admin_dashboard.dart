import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellfish/admin_dashboard/admin_dashboard.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String? _chosenValue;

  final _analysisBloc = AnalysisBloc();

  TextStyle greyFonts = GoogleFonts.poppins(
    color: Colors.grey.shade500,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  TextStyle headStyle = GoogleFonts.montserrat(
    fontSize: 25,
  );

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _analysisBloc..add(GetAnalysisData()),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('WED, 23 MARCH', style: greyFonts),
                  Text(
                    'Hi, ',
                    style: GoogleFonts.fredokaOne(
                      fontSize: 35,
                    ),
                  ),
                  const Text('test')
                ],
              ),
              trailing: const Padding(
                padding: EdgeInsets.only(right: 5),
                child: CircleAvatar(
                  radius: 35,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              title: Text('Analytics', style: headStyle),
              trailing: DropdownButton(
                hint: _chosenValue == null
                    ? Text(
                        'Monthly',
                        style: GoogleFonts.poppins(fontSize: 20),
                      )
                    : Text(
                        _chosenValue.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                items: <String>[
                  'Day',
                  'Monthly',
                  'Year',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _chosenValue = value;
                  });
                },
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: BlocBuilder<AnalysisBloc, AnalysisState>(
                  builder: (context, state) {
                    if (state is AnalysisData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          analysisCard(
                            'Earnings',
                            'Total Sale',
                            '2000',
                          ),
                          analysisCard(
                            'Sellers',
                            'Total sellers',
                            state.sellerCount.toString(),
                            state.activeSellers.toString(),
                            state.pendingSellers.toString(),
                          ),
                          analysisCard(
                            'Products',
                            'Total products',
                            state.productsCount.toString(),
                          ),
                          analysisCard(
                            'Customers',
                            'Total customers',
                            state.customerCount.toString(),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container analysisCard(
    String title,
    String subTitle,
    String count, [
    String activeCount = '',
    String reqCount = '',
  ]) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: headStyle,
          ),
          if (title == 'Sellers')
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subTitle,
                      style: greyFonts,
                    ),
                    Text(
                      count,
                      style: headStyle,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Active Sellers',
                      style: GoogleFonts.poppins(color: Colors.green),
                    ),
                    Text(
                      activeCount,
                      style: GoogleFonts.poppins(
                        color: Colors.green.shade500,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seller Requests',
                      style: GoogleFonts.poppins(color: Colors.red),
                    ),
                    Text(
                      reqCount,
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 25,
                      ),
                    )
                  ],
                )
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subTitle,
                  style: greyFonts,
                ),
                Text(
                  count,
                  style: headStyle,
                )
              ],
            )
        ],
      ),
    );
  }
}
