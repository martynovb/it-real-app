part of 'drag_and_drop_bloc.dart';

@freezed
class DragAndDropEvent with _$DragAndDropEvent {
  const factory DragAndDropEvent.performDrop(PerformDropEvent event) = _PerformDrop;

  const factory DragAndDropEvent.pickImage() = _PickImage;

  const factory DragAndDropEvent.pickImageIosWeb(XFile? image) = _PickImageIosWeb;

  const factory DragAndDropEvent.updateProgress(int progress) = _UpdateProgress;

  const factory DragAndDropEvent.reset() = _Reset;
}