import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:zemi/utils/zemiConstant.dart';
import 'package:zemi/views/components/expenseIcon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Map<String, double> dataMap = {
    ZemiConst.item1: 0,
    ZemiConst.item2: 0,
    ZemiConst.item3: 0,
    ZemiConst.item4: 0,
    ZemiConst.item5: 0,
    ZemiConst.item11: 0,
  };

  String _selectedExpense = ZemiConst.item1;

  TextEditingController _txtExpenseController = TextEditingController();
  TextEditingController _txtIncomeController = TextEditingController();

  double _expense = 0;
  double _income = 0;

  void changeDataMap(String type, double money) {
    double currentBill = dataMap[type]!;
    double totalNow = money + currentBill;
    setState(() {
      dataMap[type] = totalNow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0),
                color: Colors.white,
                child: PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(seconds: 2),
                  chartLegendSpacing: 32,
                  chartRadius: MediaQuery.of(context).size.width / 3.2,
                  initialAngleInDegree: 0,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 32,
                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    chartValueStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: true,
                    decimalPlaces: 0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                padding: EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "EXPENSE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ExpenseIcon(
                          color: Colors.red[300]!,
                          icon: Icons.fastfood_rounded,
                          isHighlighted: _selectedExpense == ZemiConst.item1,
                          func: () {
                            setState(() => _selectedExpense = ZemiConst.item1);
                          },
                        ),
                        ExpenseIcon(
                          color: Colors.blue[300]!,
                          icon: Icons.directions_car,
                          isHighlighted: _selectedExpense == ZemiConst.item2,
                          func: () {
                            setState(() => _selectedExpense = ZemiConst.item2);
                          },
                        ),
                        ExpenseIcon(
                          color: Colors.greenAccent,
                          icon: Icons.lightbulb,
                          isHighlighted: _selectedExpense == ZemiConst.item3,
                          func: () {
                            setState(() => _selectedExpense = ZemiConst.item3);
                          },
                        ),
                        ExpenseIcon(
                          color: Colors.yellow[600]!,
                          icon: Icons.wifi_tethering_rounded,
                          isHighlighted: _selectedExpense == ZemiConst.item4,
                          func: () {
                            setState(() => _selectedExpense = ZemiConst.item4);
                          },
                        ),
                        ExpenseIcon(
                          color: Colors.purple[300]!,
                          icon: Icons.attach_money,
                          isHighlighted: _selectedExpense == ZemiConst.item5,
                          func: () {
                            setState(() => _selectedExpense = ZemiConst.item5);
                          },
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: TextField(
                        controller: _txtExpenseController,
                        onChanged: (value){
                          setState(() {
                            _expense = double.parse(value);
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "0",
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_expense > 0){
                            changeDataMap(_selectedExpense, _expense);
                            _txtExpenseController.text = "";
                          }
                          FocusScope.of(context).unfocus();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow[300],
                          onPrimary: Colors.red[300],
                        ),
                        child: Text("SAVE"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                padding: EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "INCOME",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: _txtIncomeController,
                        onChanged: (value){
                          setState(() {
                            _income = double.parse(value);
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "0",
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_income > 0){
                            changeDataMap(ZemiConst.item11, _income);
                            _txtIncomeController.text = "";
                          }
                          FocusScope.of(context).unfocus();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow[300],
                          onPrimary: Colors.green[300],
                        ),
                        child: Text("SAVE"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
