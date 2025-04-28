import 'package:flutter/material.dart';
import 'package:it_real_app/targets/run_configurations.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SfPdfViewer.network(
            RunConfigurations.privacyPolicyUrl,
          ),
        ),
      ),
    );
  }
}
