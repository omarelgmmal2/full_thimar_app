import 'package:flutter/material.dart';
import 'package:full_thimar_project/core/design/app_button.dart';
import 'package:full_thimar_project/core/design/app_input.dart';
import 'package:full_thimar_project/core/utils/assets.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:get/get.dart';
import '../../../../auth/register/cities_sheet.dart';
import '../../../../core/regex/app_regex.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../features/get_cities/model.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  final formKey = GlobalKey<FormState>();
  CityModel? selectedCity;
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "53".tr,
        ),
        leading: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: kPrimaryColor.withOpacity(.13),
          ),
          child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new,color: kPrimaryColor),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 33),
          children: [
            Center(
              child: SizedBox(
                height: 134,
                width: 112,
                child: Column(
                  children: [
                    Container(
                      height: 83,
                      width: 88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        image: const DecorationImage(image: AssetImage(AssetsData.profile),
                        ),
                      ),
                    ),
                    verticalSpace(2),
                    const Text(
                      "عمر الجمال",
                      style: TextStyles.textStyle14Bold,
                    ),
                    verticalSpace(4),
                    Text(
                      "01062156826",
                      style: TextStyles.textStyle14Regular.copyWith(color: const Color(0xffA7A7A7),),
                    ),
                  ],
                ),
              ),
            ),
            AppInput(
              labelText: "16".tr,
              icon: AssetsData.userIcon,
              paddingTop: 28,
              controller: fullNameController,
              type: TextInputType.name,
              validator: (value) {
                if (value!.isEmpty || !AppRegex.hasLowerCase(value)) {
                  return "15".tr;
                }
                return null;
              },
            ),
            AppInput(
              labelText: "7".tr,
              icon: AssetsData.phoneIcon,
              type: TextInputType.phone,
              onChanged: (value) {
                setState(() {
                  phoneController.text = value;
                });
              },
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPhoneNumberValid(value)) {
                  return "6".tr;
                }
                return null;
              },
              controller: phoneController,
              isPhone: true,
            ),
            StatefulBuilder(
              builder: (context, setState) => GestureDetector(
                onTap: () async {
                  var result = await showModalBottomSheet(
                    context: context,
                    builder: (context) => const CitiesSheet(),
                  );
                  if (result != null) {
                    selectedCity = result;
                    setState(() {});
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AbsorbPointer(
                        absorbing: true,
                        child: AppInput(
                          labelText:
                          selectedCity?.name ?? "18".tr,
                          validator: (value) {
                            if (selectedCity == null) {
                              return "31".tr;
                            }
                            return null;
                          },
                          icon: "assets/icons/city.png",
                        ),
                      ),
                    ),
                    if (selectedCity != null)
                      IconButton(
                        onPressed: () {
                          selectedCity = null;
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.clear,
                          size: 24,
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            AppInput(
              labelText: "9".tr,
              icon: AssetsData.passwordIcon,
              type: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPasswordValid(value)) {
                  return "8".tr;
                }
                return null;
              },
              controller: passwordController,
              isPassword: true,
              paddingBottom: 19,
            ),
            verticalSpace(100),
            AppButton(
                text: "52".tr,
                onPress: (){
                  if(formKey.currentState!.validate()){

                  }
                },
            ),
          ],
        ),
      ),
    );
  }
}
