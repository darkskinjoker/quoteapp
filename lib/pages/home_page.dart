import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/quote_widget.dart';
import 'package:http/http.dart' as http;
import 'package:random_color/random_color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var apiURL = "https://type.fit/api/quotes";
  PageController controller = PageController();
  late List<dynamic> _quoteData;

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

  Future<void> fetchQuotes() async {
    final response = await http.get(Uri.parse('$apiURL'));
    if (response.statusCode == 200) {
      setState(() {
        _quoteData = json.decode(response.body);
        _quoteData.shuffle();
      });
    } else {
      throw Exception('Failed to load quotes');
    }
  }

  RandomColor _randomColor = RandomColor();

  void nextPage() {
    controller.nextPage(
      duration: Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _quoteData == null
          ? Center(child: CircularProgressIndicator())
          : PageView.builder(
        controller: controller,
        itemCount: _quoteData.length,
        itemBuilder: (context, index) {
          var model = _quoteData[index];
          return QuoteWidget(
            quote: model["text"].toString(),
            author: model["author"].toString(),
            onPrClick: () {},
            onNextClick: nextPage,
            bgColor: _randomColor.randomColor(
              colorHue: ColorHue.multiple(
                colorHues: [ColorHue.red, ColorHue.blue],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: nextPage,
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}