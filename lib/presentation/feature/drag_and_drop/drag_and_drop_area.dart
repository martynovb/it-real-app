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
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

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
    return BlocProvider(
      create: (context) => getIt.get<DragAndDropBloc>(),
      child: BlocConsumer<DragAndDropBloc, DragAndDropState>(
          listener: (context, state) {
        if (state.status == FormzSubmissionStatus.success) {
          onFileDropped(state.photoFile);
        } else if (state.status == FormzSubmissionStatus.failure) {
          onFileDropError(state.errorMessage ?? '');
        }
      }, builder: (context, state) {
        return Container(
          constraints: const BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: double.infinity,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _content(context),
                if (state.progress != null || state.photoFile != null)
                  _imageFileContainer(context, state),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _content(BuildContext context) {
    return DropRegion(
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
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    children: [
                      TextSpan(
                        text: ' ${LocaleKeys.orDragAndDrop.tr()}',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
                AppDimensions.sBoxH16,
                Text(
                  LocaleKeys.maxFileSize.tr(args: ['10MB']),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageFileContainer(BuildContext context, DragAndDropState state) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onTertiary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.iconUpload,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  AppDimensions.sBoxW8,
                  _fileName(
                    context: context,
                    fileName: state.fileName ?? '',
                    extension: DragAndDropBloc.formats[state.fileFormat] ?? '',
                  ),
                ],
              ),
              if (state.progress != null) ...[
                AppDimensions.sBoxH4,
                LinearProgressIndicator(
                  value: state.progress?.toDouble(),
                  backgroundColor: Theme.of(context).colorScheme.onTertiary,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.purple,
                  ),
                ),
                AppDimensions.sBoxH4,
                Text(
                  '${state.progress}% done',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                ),
              ],
            ],
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
            onPressed: () => context.read<DragAndDropBloc>().add(
                  const DragAndDropEvent.reset(),
                ),
          ),
        ],
      ),
    );
  }

  Widget _fileName({
    required BuildContext context,
    required String fileName,
    required String extension,
  }) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: fileName,
        style: Theme.of(context).textTheme.displaySmall,
        children: [
          TextSpan(
            text: extension,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
          ),
        ],
      ),
    );
  }
}
