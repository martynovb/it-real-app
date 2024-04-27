part of 'home_page.dart';

class HomePageDesk extends StatelessWidget {
  const HomePageDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, homeState) {
        return Column(
          children: [
            _header(
              context,
              homeState,
            ),
            _content(
              context: context,
              homeState: homeState,
            ),
          ],
        );
      },
    );
  }

  Widget _header(
    BuildContext context,
    HomeState homeState,
  ) {
    return const Center();
  }

  Widget _content({
    required BuildContext context,
    required HomeState homeState,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: DragAndDropArea(
            onFileDropped: (XFile? file) {},
            onFileDropError: (String error) {},
          ),
        ),
        btnFilled(
          context: context,
          text: 'Logout',
          onPressed: () {
            context.read<AuthBloc>().add(
                  const AuthEvent.logout(),
                );
          },
        ),
      ],
    );
  }
}
