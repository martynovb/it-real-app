import 'package:cross_file/cross_file.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:it_real_app/presentation/feature/drag_and_drop/bloc/drag_and_drop_bloc.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/utils/bytes_converter.dart';
import 'package:it_real_app/presentation/shared/widgets/device_layout_builder.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';
import 'package:image_picker/image_picker.dart';

class DragAndDropArea extends StatelessWidget {
  final void Function(XFile? file) onFileDropped;
  final void Function(String error) onFileDropError;

  const DragAndDropArea({
    super.key,
    required this.onFileDropped,
    required this.onFileDropError,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DragAndDropBloc, DragAndDropState>(
        listener: (context, state) {
      if (state.status == FormzSubmissionStatus.success) {
        onFileDropped(state.photoFile);
      } else if (state.status == FormzSubmissionStatus.failure) {
        onFileDropError(state.errorMessage ?? '');
      }
    }, builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _content(context),
              if (state.status == FormzSubmissionStatus.inProgress ||
                  state.status == FormzSubmissionStatus.success)
                _imageFileContainer(context, state),
            ],
          ),
        ),
      );
    });
  }

  Widget _content(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 250,
      ),
      child: DropRegion(
        formats: DragAndDropBloc.formats.keys.toList(),
        hitTestBehavior: HitTestBehavior.opaque,
        onDropOver: (event) => DropOperation.copy,
        onPerformDrop: (event) async => context.read<DragAndDropBloc>().add(
              DragAndDropEvent.performDrop(event),
            ),
        child: DottedBorder(
          color: AppColors.purple,
          dashPattern: const [16, 10],
          strokeCap: StrokeCap.round,
          strokeWidth: 1.5,
          radius: const Radius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(34.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.iconUpload,
                    colorFilter: const ColorFilter.mode(
                      AppColors.purple,
                      BlendMode.srcIn,
                    ),
                  ),
                  AppDimensions.sBoxH16,
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: LocaleKeys.clickToUpload.tr(),
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppColors.hyperlink,
                            decoration: TextDecoration.combine([
                              TextDecoration.underline,
                            ]),
                            decorationColor: AppColors.hyperlink,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.read<DragAndDropBloc>().add(
                                const DragAndDropEvent.pickImage(),
                              );
                        },
                      children: [
                        TextSpan(
                          text: ' ${LocaleKeys.orDragAndDrop.tr()}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  AppDimensions.sBoxH16,
                  Text(
                    LocaleKeys.maxFileSize.tr(args: [
                      BytesConverter.formatBytes(
                        DragAndDropBloc.maxFileSizeInBytes,
                        0,
                      )
                    ]),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageFileContainer(BuildContext context, DragAndDropState state) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        constraints: const BoxConstraints(minHeight: 84),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onTertiary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.iconPhotoInProgress,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
              AppDimensions.sBoxW8,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _fileName(
                      context: context,
                      fileName: state.fileName ?? '',
                      extension:
                          DragAndDropBloc.formats[state.fileFormat] ?? '',
                    ),
                    if (state.status == FormzSubmissionStatus.inProgress &&
                        state.progress != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppDimensions.sBoxH4,
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return SizedBox(
                                width: constraints.maxWidth,
                                child: LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(10),
                                  minHeight: 4,
                                  value: state.progress! / 100,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.tertiary,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                    AppColors.purple,
                                  ),
                                ),
                              );
                            },
                          ),
                          Text(
                            LocaleKeys.uploadingProgress.tr(
                              args: [
                                state.progress?.toString() ?? '0',
                              ],
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                          ),
                        ],
                      ),
                    if (state.status == FormzSubmissionStatus.success)
                      Text(
                        state.fileSizeInMb ?? '...',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onTertiary,
                            ),
                      ),
                  ],
                ),
              ),
              AppDimensions.sBoxW16,
              IconButton(
                icon: Icon(
                  Icons.highlight_off,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () => context.read<DragAndDropBloc>().add(
                      const DragAndDropEvent.reset(),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _fileName({
    required BuildContext context,
    required String fileName,
    required String extension,
  }) {
    return DeviceLayoutBuilder(layoutBuilder: (isMobile) {
      final maxLen = isMobile ? 20 : 50;
      return RichText(
        textAlign: TextAlign.start,
        maxLines: 1,
        text: TextSpan(
          text: fileName.length <= maxLen
              ? fileName
              : '${fileName.substring(0, maxLen - 3)}...',
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(
              text: extension,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
            ),
          ],
        ),
      );
    });
  }
}
