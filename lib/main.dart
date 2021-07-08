import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Color Hex Code & RGBO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<String> valueChooseList = ["1", "2", "3", "4", "5", "6", "7", "8"];
  String? valueChoose;
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            Container(
                width: size.width,
                height: size.height * 0.3,
                color: Colors.green),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return AlertDialog(
                            content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DropdownButton<String>(
                                hint: Text('Select the number'),
                                value: valueChoose,
                                onChanged: (String? value) {
                                  setState(() {
                                    valueChoose = value;
                                    print(value);
                                  });
                                },
                                items: valueChooseList.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList())
                          ],
                        ));
                      });
                    });
              },
              child: Text('Button'),
            ),
            DefaultTabController(
              length: 2,
              child: Container(
                height: size.height * 0.1,
                child: TabBar(
                  indicatorColor: Colors.green.shade900,
                  controller: tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.green, width: 4.0),
                    insets: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  tabs: [
                    Text(
                      'Facebook',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: tabController!.index == 0
                                ? Colors.teal
                                : Colors.amber,
                          ),
                    ),
                    Text(
                      'Youtube',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: tabController!.index == 0
                                ? Colors.black
                                : Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Text(
                        'Sagar Koju 😊 ',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.white,
                            ),
                      )),
                  Container(
                      alignment: Alignment.center,
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Text(
                        ' Koju Sagar ',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.white,
                            ),
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
