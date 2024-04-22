import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:it_real_app/presentation/feature/auth/bloc/auth_bloc.dart';
import 'package:it_real_app/presentation/feature/home/bloc/home_bloc.dart';
import 'package:it_real_app/presentation/feature/photo_verification/bloc/photo_verification_bloc.dart';
import 'package:it_real_app/presentation/feature/photo_verification/photo_verification_view.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       
        BlocProvider(
          create: (context) => getIt.get<HomeBloc>(),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Home Page'),
                  btnFilled(
                    context: context,
                    text: 'Start Verification',
                    onPressed: () async {
                      context.read<PhotoVerificationBloc>().add(
                            PhotoVerificationEvent.verifyPhoto(
                              photoFile: XFile(''),
                            ),
                          );
                      await showDialog(
                        context: context,
                        barrierDismissible: false, 
                        builder: (context) => const PhotoVerificationView(),
                      );
                    },
                  ),
                  btnFilled(
                    context: context,
                    text: 'Logout',
                    onPressed: () {
                      context.read<AuthBloc>().add(const AuthEvent.logout());
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
