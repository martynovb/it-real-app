import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/feature/home/home_page.dart';
import 'package:it_real_app/presentation/feature/tokens/bloc/tokens_bloc.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';
import 'package:it_real_app/presentation/shared/widgets/device_layout_builder.dart';

part 'tokens_page_mobile.dart';
part 'tokens_page_desk.dart';

class TokensPage extends StatelessWidget {
  const TokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt.get<TokensBloc>()
          ..add(
            const TokensEvent.started(),
          ),
        child: DeviceLayoutBuilder(
          layoutBuilder: (isMobile) => Scaffold(
            body: isMobile ? const TokensPageMobile() : const TokensPageDesk(),
          ),
        ));
  }
}
