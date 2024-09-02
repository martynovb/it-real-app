import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/feature/drag_and_drop/bloc/drag_and_drop_bloc.dart';
import 'package:it_real_app/presentation/feature/home/bloc/home_bloc.dart';
import 'package:it_real_app/presentation/feature/drag_and_drop/drag_and_drop_area.dart';
import 'package:it_real_app/presentation/feature/photo_verification/bloc/photo_verification_bloc.dart';
import 'package:it_real_app/presentation/feature/photo_verification/photo_verification_view.dart';
import 'package:it_real_app/presentation/shared/app_constants.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/dialogs/dialogs_manager.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/app_loading_widget.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';
import 'package:it_real_app/presentation/shared/widgets/device_layout_builder.dart';
import 'package:it_real_app/presentation/shared/widgets/footer.dart';
import 'package:it_real_app/presentation/shared/widgets/header.dart';

part 'home_page_mobile.dart';
part 'home_page_desk.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceLayoutBuilder(
      layoutBuilder: (isMobile) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt.get<HomeBloc>()
                ..add(
                  const HomeEvent.started(),
                ),
            ),
            BlocProvider(
              create: (context) => getIt.get<DragAndDropBloc>(),
            ),
          ],
          child: Scaffold(
            body: isMobile ? const HomePageMobile() : const HomePageDesk(),
          ),
        );
      },
    );
  }
}
