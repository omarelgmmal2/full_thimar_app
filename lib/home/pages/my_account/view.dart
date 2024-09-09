import 'package:flutter/material.dart';
import 'package:full_thimar_project/core/logic/helper_methods.dart';
import 'package:full_thimar_project/core/utils/assets.dart';
import 'package:full_thimar_project/home/pages/my_account/widget/information_profile.dart';
import 'screens/calling.dart';
import 'screens/complaints and_suggestions.dart';
import 'screens/information.dart';
import 'screens/privacy_policy.dart';
import 'screens/question.dart';
import 'screens/user_profile.dart';
import 'widget/custom_profile_container.dart';
import 'widget/log_out_button.dart';

class MyAccountPageView extends StatelessWidget {
  const MyAccountPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomProfileContainer(),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              height: 200,
              width: double.infinity,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      toGetNavigate(const UserProfile());
                    },
                    child: const InformationProfile(
                      text: "البيانات الشخصية",
                      icon: AssetsData.userProfile,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const InformationProfile(
                      text: "المحفظة",
                      icon: AssetsData.wallet,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const InformationProfile(
                      text: "العناوين",
                      icon: AssetsData.location,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const InformationProfile(
                      text: "الدفع",
                      icon: AssetsData.cash,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              height: 240,
              width: double.infinity,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      toGetNavigate(const Question());
                    },
                    child: const InformationProfile(
                      text: "أسئلة متكررة",
                      icon: AssetsData.question,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toGetNavigate(const PrivacyPolicy());
                    },
                    child: const InformationProfile(
                      text: "سياسة الخصوصية",
                      icon: AssetsData.privacyPolicy,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toGetNavigate(const Calling());
                    },
                    child: const InformationProfile(
                      text: "تواصل معنا",
                      icon: AssetsData.calling,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toGetNavigate(const SuggestionsAndComplaints());
                    },
                    child: const InformationProfile(
                      text: "الشكاوي والأقتراحات",
                      icon: AssetsData.complaintsAndSuggestions,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const InformationProfile(
                      text: "مشاركة التطبيق",
                      icon: AssetsData.shareProject,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              height: 160,
              width: double.infinity,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      toGetNavigate(const Information());
                    },
                    child: const InformationProfile(
                      text: "عن التطبيق",
                      icon: AssetsData.info,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const InformationProfile(
                      text: "الشروط والأحكام",
                      icon: AssetsData.termsAndConditions,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const InformationProfile(
                      text: "تقييم التطبيق",
                      icon: AssetsData.rate,
                    ),
                  ),
                ],
              ),
            ),
            const LogOutButton(),
          ],
        ),
      ),
    );
  }
}
