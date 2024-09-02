import 'package:image_picker/image_picker.dart';
import 'package:it_real_app/data/models/report/report_model.dart';

abstract class VerificationDataSource {
  Future<ReportModel> verifyPhoto({
    required XFile photoFile,
  });
}
