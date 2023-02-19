import 'package:flutter/material.dart';

class StripeCheckoutPage extends StatefulWidget {
  @override
  _StripeCheckoutPageState createState() => _StripeCheckoutPageState();
}

class _StripeCheckoutPageState extends State<StripeCheckoutPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expMonthController = TextEditingController();
  final TextEditingController _expYearController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expMonthController.dispose();
    _expYearController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.brown.shade400,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Card information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _cardNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Card number',
                      hintText: '4242 4242 4242 4242',
                      prefixIcon: Icon(
                        Icons.credit_card,
                        color: Colors.brown.shade400,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[400]!,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your card number';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _expMonthController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Exp. month',
                            hintText: 'MM',
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.brown.shade400,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[400]!,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter expiration month';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _expYearController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Exp. year',
                            hintText: 'YYYY',
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.brown.shade400,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[400]!,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter expiration year';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _cvcController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'CVC',
                            hintText: '123',
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.brown.shade400,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[400]!,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter CVC';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            _isLoading
                ? CircularProgressIndicator()
                : Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.brown.shade400)),
                      onPressed: () {},
                      child: Text('Pay'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
