import '../middlewares/onboarding_middleware.dart';
import '../screens/account/views/my_profile.dart';
import '../screens/auth/views/forgot_password_screen.dart';
import '../screens/auth/views/login_screen.dart';
import '../screens/auth/views/register_screen.dart';
import '../screens/blog/views/videos_screen.dart';
import '../screens/business/views/business_about_us_form_screen.dart';
import '../screens/business/views/business_service_form_screen.dart';
import '../screens/business/views/business_sliders_form_screen.dart';
import '../screens/home/views/Privacy_policy_view.dart';
import '../screens/home/views/Refund_policy_view.dart.dart';
import '../screens/home/views/about_us_view.dart';
import '../screens/home/views/create_website_screen.dart';
import '../screens/home/views/notifications_view.dart';
import '../screens/home/views/our_policy_view.dart';
import '../screens/home/views/package_screen.dart';
import '../screens/home/views/terms_n_condition_view.dart';
import '../screens/payment/binding/payment_binding.dart';
import '../screens/payment/views/payment_complete_screen.dart';
import '../screens/payment/views/payment_screen.dart';
import '../screens/business/binding/busniess_up_binding.dart';
import '../screens/business/views/business_product_form_screen.dart';
import '../screens/business/views/business_contact_us_form_screen.dart';
import '../screens/business/views/business_details_form_screen.dart';
import '../screens/business/views/business_gallery_form_screen.dart';

import 'package:get/get.dart';
import '../components/splash.dart';
import '../screens/auth/binding/auth_binding.dart';
import '../screens/auth/views/auth_screen.dart';
import '../screens/auth/views/verify_otp_screen.dart';
import '../screens/blog/binding/blog_binding.dart';
import '../screens/blog/views/blog_details_screen.dart';
import '../screens/blog/views/blog_screen.dart';
import '../screens/home/binding/home_binding.dart';
import '../screens/home/views/advertisement_screen.dart';
import '../screens/home/views/dashboard_screen.dart';
import '../screens/self_employed/binding/self_employed_binding.dart';
import '../screens/self_employed/views/contact_details_form_screen.dart';
import '../screens/self_employed/views/fact_details_form_screen.dart';
import '../screens/self_employed/views/my_projects_form_screen.dart';
import '../screens/self_employed/views/my_skills_form_screen.dart';
import '../screens/self_employed/views/personal_details_form_screen.dart';
import '../screens/self_employed/views/testimonial_form_screen.dart';
import '../screens/self_employed/views/work_experience_form_screen.dart';
import '../screens/template/binding/template_binding.dart';
import '../screens/template/views/my_websites_screen.dart';
import '../screens/template/views/template_preview_screen.dart';
import '../screens/template/views/templates_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      // binding: OnboardBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.HOME,
      page: () => MainScreen(),
      binding: HomeBinding(),
      middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.OTP_VERIFY,
      page: () => VerifyOTPScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.MY_PROFILE,
      page: () => MyProfileScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => NotificationsScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.ADVERTISEMENT,
      page: () => AdvertisementScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BLOG,
      page: () => BlogScreen(),
      binding: BlogBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BLOG_DETAILS,
      page: () => BlogDetailsScreen(),
      binding: BlogBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.VIDEOS,
      page: () => VideosScreen(),
      binding: BlogBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.CREATE_WEBSITE,
      page: () => CreateWebsiteScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PACKAGES,
      page: () => PackagesScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.TEMPLATES,
      page: () => TemplatesScreen(),
      binding: TemplateBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.MY_WEBSITE,
      page: () => MyWebsiteScreen(),
      binding: TemplateBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.TEMPLATE_PREVIEW,
      page: () => TemplatePreviewScreen(),
      binding: TemplateBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BUSINESS_DETAIL_FORM,
      page: () => BusinessDetailFormScreen(),
      binding: BusinessBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BUSINESS_SLIDERS_FORM,
      page: () => BusinessSlidersFormScreen(),
      binding: BusinessBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BUSINESS_ABOUT_US_FORM,
      page: () => BusinessAboutUsFormScreen(),
      binding: BusinessBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BUSINESS_PRODUCT_FORM,
      page: () => BusinessProductFormScreen(),
      binding: BusinessBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BUSINESS_SERVICE_FORM,
      page: () => BusinessServiceFormScreen(),
      binding: BusinessBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BUSINESS_GALLERY_FORM,
      page: () => BusinessGalleryFormScreen(),
      binding: BusinessBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.BUSINESS_CONTACT_US_FORM,
      page: () => BusinessContactUsFormScreen(),
      binding: BusinessBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PAYMENT,
      page: () => PaymentScreen(),
      binding: PaymentBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.WEB_CONGRATS,
      page: () => PaymentCompleteScreen(),
      binding: PaymentBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.ABOUT_US,
      page: () => AboutUsView(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.TERMS_N_CONDITION,
      page: () => TermsNConditionView(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PRIVACY_POLICY,
      page: () => PrivacyPolicyView(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.REFUND_POLICY,
      page: () => RefundPolicyView(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.OUR_POLICIES,
      page: () => OurPolicyView(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PERSONAL_DETAILS_FORM,
      page: () => PersonalDetailFormScreen(),
      binding: SelfEmployedBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PERSONAL_FACTS_DETAILS_FORM,
      page: () => FactDetailsFormScreen(),
      binding: SelfEmployedBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PERSONAL_WORK_EXPERIENCE_FORM,
      page: () => WorkExperienceFormScreen(),
      binding: SelfEmployedBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PERSONAL_SKILLS_DETAILS_FORM,
      page: () => MySkillsFormScreen(),
      binding: SelfEmployedBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PERSONAL_PROJECT_DETAILS_FORM,
      page: () => MyProjectsFormScreen(),
      binding: SelfEmployedBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PERSONAL_TESTIMONIALS_DETAILS_FORM,
      page: () => TestimonialFormScreen(),
      binding: SelfEmployedBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.PERSONAL_CONTACT_DETAILS_FORM,
      page: () => ContactDetailsFormScreen(),
      binding: SelfEmployedBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
  ];
}
