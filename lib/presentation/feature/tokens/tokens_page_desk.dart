part of 'tokens_page.dart';

class TokensPageDesk extends StatelessWidget {
  const TokensPageDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TokensBloc, TokensState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _headerDesktop(context, state),
              AppDimensions.sBoxH100,
              btnFilled(
                context: context,
                text: 'Buy Tokens',
                onPressed: () {
                  context.read<TokensBloc>().add(
                        TokensEvent.buyProduct(
                          productModel:
                              context.read<TokensBloc>().state.products.first,
                        ),
                      );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _headerDesktop(BuildContext context, TokensState tokensState) {
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
                          text: tokensState.user.balance.toString(),
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
}
