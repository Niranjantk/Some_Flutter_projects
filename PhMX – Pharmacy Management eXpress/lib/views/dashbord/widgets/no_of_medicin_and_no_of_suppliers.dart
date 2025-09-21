import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/common/common_color.dart';
import 'package:parmacy_billing_system/views/common/custome_text.dart';
class NoofMedicinAndNoOfSuppliers extends StatelessWidget {
  const NoofMedicinAndNoOfSuppliers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 0,left: 16,right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomeText(
                    label: "Medicin",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  IconButton(
                    color: Colors.white,
                    onPressed: () {
                    
                  }, icon: Icon(Icons.medical_information))
                ],
              ),
            ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  height: 200,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomeText(label: "Inventory",fontWeight: FontWeight.bold,),
                          
                            CustomeText(label: "Go to User Inventory",fontWeight: FontWeight.bold,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CmmonColors.navigationColor,
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                     
                                      CustomeText(label: "64",fontWeight: FontWeight.bold,color: Colors.white,),
                                      CustomeText(label: "Total no of Medicin",fontWeight: FontWeight.bold,color: Colors.white,),
                                     
                                    ],
                                  ),
                                  SizedBox(width: 50),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      
                                      CustomeText(label: "24",fontWeight: FontWeight.bold,color: Colors.white,),
                                      CustomeText(label: "Medicin that Expires",fontWeight: FontWeight.bold,color: Colors.white,),
                                     
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomeText(
                    label: "Suppliers",
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  height: 200,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomeText(label: "User",fontWeight: FontWeight.bold,),
                          
                            CustomeText(label: "Go to User Mangement",fontWeight: FontWeight.bold,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CmmonColors.navigationColor,
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                    
                                      CustomeText(label: "6",fontWeight: FontWeight.bold,color: Colors.white,),
                                      CustomeText(label: "Total no of Suppliers",fontWeight: FontWeight.bold,color: Colors.white,),
                                     

                                    ],
                                  ),
                                  SizedBox(width: 50),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                   
                                      CustomeText(label: "24",fontWeight: FontWeight.bold,color: Colors.white,),
                                      CustomeText(label: "Total no of Users",fontWeight: FontWeight.bold,color: Colors.white,),
                                     
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
