import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/utility/my_button.dart';
import 'package:wallet_app/utility/my_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(children: [
          //app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, //done to move + to right
              children: [
                Row(
                  children: [
                    Text(
                      'My ',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Cards',
                      style: TextStyle(fontSize: 28),
                    ),
                  ],
                ),

                //plus button
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey[400], shape: BoxShape.circle),
                    child: Icon(Icons.add)),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          //cards
          Container(
            height: 200,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                MyCard(
                  balance: 2525.20,
                  cardNumber: 12345678,
                  expiryMonth: 10,
                  expiryYear: 24,
                  color: Colors.deepPurple[400],
                ),
                MyCard(
                  balance: 7822.50,
                  cardNumber: 45238712,
                  expiryMonth: 08,
                  expiryYear: 26,
                  color: Colors.blue[400],
                ),
                MyCard(
                  balance: 7823.30,
                  cardNumber: 78122658,
                  expiryMonth: 11,
                  expiryYear: 28,
                  color: Colors.green[400],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade800),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // 3 buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //send button
                MyButton(
                    iconImagePath: 'lib/icons/send money.png',
                    buttonText: 'Send'),

                //pay button
                MyButton(
                    iconImagePath: 'lib/icons/card.png', buttonText: 'Pay'),

                //bills button
                MyButton(
                    iconImagePath: 'lib/icons/bill.png', buttonText: 'Bills'),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                //stats
                Row(
                  children: [
                    Container(
                      height: 80,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.asset('lib/icons/statistics.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Statistics',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text('Payments and Income',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600])),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                )
                //transactions
              ],
            ),
          ),

          // column stats+transactions
        ]),
      ),
    );
  }
}
