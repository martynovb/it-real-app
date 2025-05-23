part of 'home_page.dart';

class HomePageDesk extends StatelessWidget {
  const HomePageDesk({
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
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: headerDesktop(
                  context: context,
                  user: homeState.userModel,
                  onBalanceTap: () => context.read<HomeBloc>().add(
                        const HomeEvent.started(),
                      ),
                ),
              ),
              SliverToBoxAdapter(
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
                      AppDimensions.sBoxH32,
                      footer(context),
                    ],
                  )),
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
          SizedBox(
            height: MediaQuery.of(context).size.height *
                AppDimensions.topPaddingRatioDesk,
          ),
          Text(
            LocaleKeys.uploadImage.tr(),
            style: Theme.of(context).textTheme.displayLarge,
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
          maxWidth: AppDimensions.startVerificationDesktopBtnWidth,
          padding: const EdgeInsets.only(left: 24, right: 8),
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
                      isMobile: false,
                    );
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
