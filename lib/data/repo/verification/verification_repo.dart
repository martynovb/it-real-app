import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/report/report_model.dart';
import 'package:it_real_app/data/repo/verification/verification_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: VerificationDataSource)
class VerificationRepo extends VerificationDataSource {
  final SupabaseClient supabaseClient;

  VerificationRepo({
    required this.supabaseClient,
  });

  @override
  Future<ReportModel> verifyPhoto({required XFile photoFile}) async {
    //throw UnimplementedError();
    return const ReportModel(
      aiGenerated: false,
      matchInDb: false,
    );
  }
}
