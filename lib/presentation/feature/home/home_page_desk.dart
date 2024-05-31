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
              _headerDesktop(
                context,
                homeState,
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

  Widget _headerDesktop(BuildContext context, HomeState homeState) {
    final acountBtnGlobalKey = GlobalKey();
    return Padding(
      key: acountBtnGlobalKey,
      padding: const EdgeInsets.only(
        top: 16,
        left: 40,
        right: 40,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 12,
          top: 12,
          right: 12,
          left: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.almostBlack
              : AppColors.white,
        ),
        child: Row(
          children: [
            Text(
              LocaleKeys.appName.tr(),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const Spacer(),
            Container(
              height: 54,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.onTertiary,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '${LocaleKeys.tokenBalance.tr()}: ',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                      children: [
                        TextSpan(
                          text: homeState.userModel.balance.toString(),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AppDimensions.sBoxW16,
            btnOutlinedWithIcon(
              padding: 0,
              minWidth: 0,
              minHeight: 54,
              postfixWidget: SvgPicture.asset(
                AppIcons.iconWallet,
                width: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.purple,
                  BlendMode.srcIn,
                ),
              ),
              context: context,
              text: LocaleKeys.buyTokens.tr(),
              onPressed: () => context.go(RouteConstants.tokens.path),
            ),
            AppDimensions.sBoxW16,
            btnOutlinedWithIcon(
              padding: 0,
              minWidth: 0,
              minHeight: 54,
              postfixWidget: const Icon(
                Icons.person,
                color: AppColors.purple,
                size: 24,
              ),
              context: context,
              text: LocaleKeys.account.tr(),
              onPressed: () async {
                await HomePage.showAccountMenu(
                  menuKey: acountBtnGlobalKey,
                  context: context,
                );
              },
            ),
          ],
        ),
      ),
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
