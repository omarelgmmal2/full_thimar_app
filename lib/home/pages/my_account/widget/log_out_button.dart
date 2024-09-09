import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/auth/login/view.dart';
import 'package:full_thimar_project/core/logic/helper_methods.dart';
import '../../../../core/design/app_image.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../features/log_out/cubit.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Builder(
    builder: (context) {
      LogoutCubit cubit = BlocProvider.of(context);
      return Padding(
        padding: const EdgeInsets.only(bottom: 16,right: 30,left: 30),
        child: GestureDetector(
          onTap: () {
            cubit.logout();
            toGetNavigate(const LoginScreen());
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "تسجيل الخروج",
                style: TextStyles.textStyle13Bold,
              ),
              AppImage(
                AssetsData.logOut,
                height: 18,
                width: 18,
              ),
            ],
          ),
        ),
      );
    },
    );
  }
}
