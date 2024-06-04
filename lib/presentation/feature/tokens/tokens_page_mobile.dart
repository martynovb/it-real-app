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
              headerMobile(
                context: context,
                user: state.user,
              ),
              const Spacer(),
              TokensPage.buyPackageBtn(
                context,
                isMobile: true,
              ),
              const Spacer(),
              footer(context),
            ],
          ),
        );
      },
    );
  }
}
