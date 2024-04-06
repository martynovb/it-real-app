import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
class ReportModel with _$ReportModel {
  const factory ReportModel({
    required bool aiGenerated,
    required bool matchInDb,
  }) = _ReportModel;

  const ReportModel._();

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  static const empty = ReportModel(
    aiGenerated: false,
    matchInDb: false,
  );
}
