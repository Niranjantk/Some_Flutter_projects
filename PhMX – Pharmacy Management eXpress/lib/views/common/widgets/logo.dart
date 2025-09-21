import 'package:flutter/material.dart';
import 'package:parmacy_billing_system/views/common/common_color.dart';

class TheSystemLogoContainer extends StatelessWidget {
  const TheSystemLogoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        
        decoration: BoxDecoration(
          color: CmmonColors.backgroundColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logo_dev),
            Text("System Name")
          ],
        ),
      ),
    );
  }
}
