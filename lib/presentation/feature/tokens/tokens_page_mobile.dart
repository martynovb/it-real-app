part of 'tokens_page.dart';

class TokensPageMobile extends StatelessWidget {
  const TokensPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TokensBloc, TokensState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Tokens Page'),
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

  Widget _headerMobile(
    BuildContext context,
    TokensState tokensState,
  ) {
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
              text: tokensState.user.balance.toString(),
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
