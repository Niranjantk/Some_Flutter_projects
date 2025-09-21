import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/common/widgets/add_bill_pop_up/add_medicin_bill_popup.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class SearchBarAndAddButton extends StatelessWidget {
  const SearchBarAndAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [SearchContainer(), AddIconContainer()]);
  }
}



class AddIconContainer extends StatelessWidget {
  const AddIconContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return AddMedicinPopUp();
              },
            );
          },
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: [
                  Colors.indigo.shade500,
                  Colors.deepPurple.shade700,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add_circle_rounded,
                    size: 32,
                    color: Colors.white,
                  ),
                 
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          height: 80,
          child: Row(
            children: [
              // Search Box
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search here...",
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),

              // Date and Time
              DateTimeContainer(),
            ],
          ),
        ),
      ),
    );
  }
}


class DateTimeContainer extends StatefulWidget {
  const DateTimeContainer({super.key});

  @override
  _DateTimeContainerState createState() => _DateTimeContainerState();
}

class _DateTimeContainerState extends State<DateTimeContainer> {
  late String _date;
  late String _time;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _updateDateTime());
    });
  }

  void _updateDateTime() {
    final now = DateTime.now();
    _date = DateFormat("MMM dd, yyyy").format(now); // e.g. Sep 18, 2025
    _time = DateFormat("hh:mm:ss a").format(now);  // e.g. 06:45:32 PM
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 6,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _date,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _time,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[700],
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

