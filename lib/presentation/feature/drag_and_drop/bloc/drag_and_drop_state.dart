part of 'drag_and_drop_bloc.dart';

@freezed
class DragAndDropState with _$DragAndDropState {
  const factory DragAndDropState({
    required FormzSubmissionStatus status,
    String? errorMessage,
    XFile? photoFile,
    int? progress,
    String? fileName,
    FileFormat? fileFormat,
    String? fileSizeInMb,
  }) = _DragAndDropState;
}
