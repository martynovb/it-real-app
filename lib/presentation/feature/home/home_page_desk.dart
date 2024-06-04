part of 'home_page.dart';

class HomePageDesk extends StatelessWidget {
  const HomePageDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, homeState) {
        return BlocListener<PhotoVerificationBloc, PhotoVerificationState>(
          listener: (context, state) {
            if (state.status == FormzSubmissionStatus.failure) {
              context.pop(RouteConstants.home.path);
              DialogsManager.showErrorDialog(
                context: context,
                title: state.exception?.title,
                description: state.exception?.message,
              );
            }
          },
          child: Column(
            children: [
              headerDesktop(
                context,
                homeState.userModel,
              ),
              AppDimensions.sBoxH100,
              Text(
                LocaleKeys.uploadImage.tr(),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              AppDimensions.sBoxH32,
              _content(
                context: context,
                homeState: homeState,
              ),
              const Spacer(),
              footer(context),
            ],
          ),
        );
      },
    );
  }

  Widget _content({
    required BuildContext context,
    required HomeState homeState,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: DragAndDropArea(
              onFileDropped: (XFile? file) {},
              onFileDropError: (String error) {},
            ),
          ),
          AppDimensions.sBoxH24,
          _startVerificationBtn(context: context, homeState: homeState),
        ],
      ),
    );
  }

  Widget _startVerificationBtn({
    required BuildContext context,
    required HomeState homeState,
  }) {
    return BlocBuilder<DragAndDropBloc, DragAndDropState>(
      builder: (context, state) {
        return btnFilledWithIcon(
          isMobile: false,
          onPressed: context.read<DragAndDropBloc>().state.photoFile != null
              ? () {
                  final photoFile =
                      context.read<DragAndDropBloc>().state.photoFile;

                  if (photoFile == null) {
                    return;
                  }

                  if (homeState.userModel.balance <
                      AppConstants.minTokensToVerify) {
                    DialogsManager.showNotEnoughBalanceDialog(context: context);
                    return;
                  }

                  context.read<PhotoVerificationBloc>().add(
                        PhotoVerificationEvent.verifyPhoto(
                          photoFile: photoFile,
                        ),
                      );

                  PhotoVerificationView.showPhotoVerificationDialog(
                    context: context,
                    onShowReport: () {
                      context.pop();
                      PhotoVerificationView.handlePhotoVerificationResult(
                        context,
                        context.read<PhotoVerificationBloc>().state,
                      );
                    },
                  );
                }
              : null,
          context: context,
          text: LocaleKeys.startVerification.tr(),
          postfixWidget: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.iconArrowRight,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
