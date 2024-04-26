part of 'drag_and_drop_bloc.dart';

@freezed
class DragAndDropEvent with _$DragAndDropEvent {
  const factory DragAndDropEvent.performDrop(PerformDropEvent event) = _PerformDrop;

  const factory DragAndDropEvent.updateProgress(int progress) = _UpdateProgress;

  const factory DragAndDropEvent.reset() = _Reset;
}