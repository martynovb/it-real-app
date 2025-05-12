part of 'home_page.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, homeState) {
        if (homeState.showTokensPurchaseDialog) {
          DialogsManager.showInfoDialog(
            context: context,
            title: LocaleKeys.successTokenPurchaseTitle.tr(),
            description: LocaleKeys.successTokenPurchase.tr(
              args: [
                AppConstants.emailSupport,
              ],
            ),
          );
        }
      },
      builder: (context, homeState) {
        return BlocConsumer<PhotoVerificationBloc, PhotoVerificationState>(
          listener: (context, photoVerificationState) =>
              PhotoVerificationView.handlePhotoVerificationResult(
            context,
            photoVerificationState,
          ),
          builder: (context, photoVerificationState) {
            return CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: headerMobile(
                    context: context,
                    user: homeState.userModel,
                    onBalanceTap: () => context.read<HomeBloc>().add(
                          const HomeEvent.started(),
                        ),
                  ),
                ),
                photoVerificationState.steps.values.any(
                        (status) => status == FormzSubmissionStatus.inProgress)
                    ? SliverFillRemaining(
                        child: _photoVerificationView(
                          context,
                          photoVerificationState,
                        ),
                      )
                    : SliverToBoxAdapter(
                        child: _content(
                          context: context,
                          homeState: homeState,
                        ),
                      ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Spacer(),
                      footer(context),
                    ],
                  ),
                ),
              ],
            );
          },
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
        children: <Widget>[
          AppDimensions.sBoxH32,
          AutoSizeText(
            LocaleKeys.uploadImage.tr(),
            style: Theme.of(context).textTheme.titleLarge,
            maxLines: 1,
          ),
          AppDimensions.sBoxH32,
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
          _startVerificationBtn(context, homeState),
          AppDimensions.sBoxH32,
        ],
      ),
    );
  }

  Widget _startVerificationBtn(BuildContext context, HomeState homeState) {
    return BlocBuilder<DragAndDropBloc, DragAndDropState>(
      builder: (context, state) {
        return btnFilledWithIcon(
          padding: const EdgeInsets.only(left: 24, right: 8),
          minHeight: AppDimensions.btnHDesk,
          onPressed: context.read<DragAndDropBloc>().state.photoFile != null
              ? () {
                  final photoFile =
                      context.read<DragAndDropBloc>().state.photoFile;
                  if (photoFile == null) {
                    return;
                  }

                  if (homeState.userModel.balance <
                      AppConstants.minTokensToVerify) {
                    DialogsManager.showNotEnoughBalanceDialog(
                      context: context,
                      isMobile: true,
                    );
                    return;
                  }

                  context.read<PhotoVerificationBloc>().add(
                        PhotoVerificationEvent.verifyPhoto(
                          photoFile: photoFile,
                        ),
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

  Widget _photoVerificationView(
    BuildContext context,
    PhotoVerificationState state,
  ) {
    final currentStep = state.steps.entries
            .firstWhereOrNull(
              (entry) => entry.value == FormzSubmissionStatus.inProgress,
            )
            ?.key ??
        PhotoVerificationStatus.aiCheck;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _stepIcon(
            context,
            _stepIconPath(currentStep),
          ),
          AppDimensions.sBoxH16,
          Text(
            '${PhotoVerificationStatus.values.indexOf(currentStep) + 1} ${LocaleKeys.step.tr()}:',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.grey5,
                ),
            textAlign: TextAlign.center,
          ),
          AppDimensions.sBoxH16,
          Text(
            _stepText(context, currentStep),
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          AppDimensions.sBoxH16,
          const AppLoadingWidget(size: 40),
          AppDimensions.sBoxH16,
          _indicatorContainer(
            context,
            state.steps.length,
            PhotoVerificationStatus.values.indexOf(currentStep),
          ),
          AppDimensions.sBoxH32,
        ],
      ),
    );
  }

  String _stepIconPath(PhotoVerificationStatus step) {
    switch (step) {
      case PhotoVerificationStatus.aiCheck:
        return AppIcons.iconInsights;
      case PhotoVerificationStatus.databaseCheck:
        return AppIcons.iconSearch;
      case PhotoVerificationStatus.resultPreparation:
        return AppIcons.iconReport;
    }
  }

  String _stepText(BuildContext context, PhotoVerificationStatus step) {
    switch (step) {
      case PhotoVerificationStatus.aiCheck:
        return LocaleKeys.step1PhotoVerification.tr();
      case PhotoVerificationStatus.databaseCheck:
        return LocaleKeys.step2PhotoVerification.tr();
      case PhotoVerificationStatus.resultPreparation:
        return LocaleKeys.step3PhotoVerification.tr();
    }
  }

  Widget _stepIcon(BuildContext context, String iconPah) {
    return Container(
      height: 72,
      width: 72,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            child: SvgPicture.asset(
              iconPah,
              colorFilter: const ColorFilter.mode(
                AppColors.purple,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _indicatorContainer(
    BuildContext context,
    int length,
    int currentIndex,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => _indicator(
          context,
          index == currentIndex,
        ),
      ),
    );
  }

  Widget _indicator(BuildContext context, bool isActive) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? AppColors.purple : AppColors.almostBlack,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
