import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class PaymentGateway extends StatefulWidget {
  const PaymentGateway({Key? key}) : super(key: key);

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  Razorpay _razorpay = Razorpay();

  final _controller = TextEditingController();

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    print("Pament success");
    var msg = "SUCCESS: " + response.paymentId!;
    // Toast.show(msg);
    print(" 22 " + msg);
  }

  void checkout() {
    var options = {
      "key": "rzp_test_RaosGOE38ATNPd",
      "amount": num.parse(_controller.text) * 100, // Convert Paisa to Rupees
      "name": "Test Payment By Abhi",
      "description": "This is a Test Payment",
      "timeout": "180",
      "theme.color": "#03be03",
      "currency": "INR",
      "prefill": {"contact": "2323232323", "email": "testByAbhi@razorpay.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerErrorFailure(PaymentFailureResponse response) {
    var msg = "ERROR: " +
        response.code.toString() +
        " - " +
        jsonDecode(response.message!)['error']['description'];
    print("Errrror" + msg);
    // Toast.show(msg);
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    var msg = "EXTERNAL_WALLET: " + response.walletName!;
    // Toast.show(msg);
  }

  @override
  void initState() {
    _razorpay = new Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("checkout"),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              width: 250,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "₹100",
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
                child: Text("Pay Now"), onPressed: (() => checkout()))
          ],
        )),
      ),
    );
  }
}
