import 'package:flutter/material.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final String secretKey = "sk_test_09f2c897bc62492bbc0df3fe2f2e1cf1e42d7a54"; // Replace with your PayStack secret key
  final String callbackUrl = "/"; // Replace with your desired callback URL
  final String currency = "NGN"; // Replace with your desired currency code
  final String amount = "20000"; // Replace with your desired amount

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            initiatePayment();
          },
          child: Text('Initiate Payment'),
        ),
      ),
    );
  }

  void initiatePayment() {
    PayWithPayStack().now(
      context: context,
      secretKey: secretKey,
      customerEmail: "customer@example.com", // Replace with the customer's email
      reference: DateTime.now().microsecondsSinceEpoch.toString(),
      callbackUrl: callbackUrl,
      currency: currency,
      amount: amount,
      transactionCompleted: () {
        onTransactionCompleted();
      },
      transactionNotCompleted: () {
        onTransactionNotCompleted();
      },
    );
  }

  void onTransactionCompleted() {
    // Handle actions after a successful transaction
    print("Transaction Successful");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment Successful')),
    );
    // Add any additional logic or navigation here
  }

  void onTransactionNotCompleted() {
    // Handle actions when a transaction is not completed
    print("Transaction Not Successful");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment Unsuccessful')),
    );
    // Add any additional logic or navigation here
  }
}

