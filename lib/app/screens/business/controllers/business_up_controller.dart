import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../models/about_us_model.dart';
import '../../../models/api_response.dart';
import '../../../models/business_details_model.dart';
import '../../../models/contact_us_model.dart';
import '../../../models/gallery_img_model.dart';
import '../../../models/product_model.dart';
import '../../../models/service_model.dart';
import '../../../models/slider_model.dart';
import '../../../models/testimonial_model.dart';
import '../../../models/theme_template_model.dart';
import '../../../repositories/business_repository.dart';
import '../../../repositories/payment_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class BusinessController extends GetxController {
  late BusinessRepository _businessRepository;
  late PaymentRepository _paymentRepository;
  BusinessController() {
    _businessRepository = BusinessRepository();
    _paymentRepository = PaymentRepository();
  }

  @override
  void onInit() {
    super.onInit();

    template = Get.arguments["template"];

    // selectedTile.listen((p0) {
    //   switch (p0) {
    //     case 2:
    //       fetchMpCommitees();
    //       break;
    //     case 3:
    //       fetchOccupationCategories();
    //       break;
    //     default:
    //   }
    // });

    fetchData();
  }

  late Template template;

  RxBool isAuthenticated = false.obs;
  RxInt selectedTile = 1.obs;

  List<String> stepsLabel = [
    translations.persoanalDetails.tr,
    translations.politicalDetails.tr,
    translations.workingDetails.tr,
    translations.familyDetails.tr,
    translations.schemeDetails.tr,
    // "Personal Details"
    // "Political Details",
    // "Working Details",
    // "Family Details",
    // "Scheme Details"
  ];

  GlobalKey<FormState> businessDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> businessSlidersFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> businessAboutUsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> businessProductFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> businessServicesFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> businessGalleryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> businessContactUsFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  void validateAndContinue(context, int stage) async {
    // selectedTile.value = 5;
    GlobalKey<FormState>? key = stage == 2 ? businessSlidersFormKey : null;
    if (key?.currentState!.validate() ?? true) {
      var result = false;
      isLoading.value = true;
      switch (stage) {
        case 1:
          businessDetails.value.templateId = template.id;
          result = await _businessRepository
              .saveBusinessDetails(businessDetails.value)
              .then((value) {
            if (value.status == Status.ERROR) {
              Get.showSnackbar(GetSnackBar(
                backgroundColor: ColorPallete.red,
                duration: const Duration(seconds: 2),
                message: value.message,
              ));
            }
            return value.status == Status.COMPLETED;
          });

          if (result) {
            fetchSliderDetails();
            Get.toNamed(Routes.BUSINESS_SLIDERS_FORM);
          }
          break;
        case 2:
          result = await _businessRepository
              .saveSliders(sliders
                  .where((element) => (element.title?.isNotEmpty ?? false))
                  .toList())
              .then((value) {
            if (value.status == Status.ERROR) {
              Get.showSnackbar(GetSnackBar(
                backgroundColor: ColorPallete.red,
                duration: const Duration(seconds: 2),
                message: value.message,
              ));
            }
            return value.status == Status.COMPLETED;
          });
          if (result) {
            fetchAboutUsDetails();
            Get.toNamed(Routes.BUSINESS_ABOUT_US_FORM);
          }
          break;
        case 3:
          aboutUsDetails.value.templateId = template.id;
          result = await _businessRepository
              .saveAboutUsDetails(aboutUsDetails.value)
              .then((value) {
            if (value.status == Status.ERROR) {
              Get.showSnackbar(GetSnackBar(
                backgroundColor: ColorPallete.red,
                duration: const Duration(seconds: 2),
                message: value.message,
              ));
            }
            return value.status == Status.COMPLETED;
          });
          if (result) {
            if ([5, 3].contains(template.id)) {
              fetchProducts();
              Get.toNamed(Routes.BUSINESS_PRODUCT_FORM);
            } else {
              fetchServices();
              Get.toNamed(Routes.BUSINESS_SERVICE_FORM);
            }
          }
          break;
        case 4:
          result = await _businessRepository
              .saveProducts(products
                  .where((element) =>
                      (element.name?.isNotEmpty ?? false) &&
                      (element.description?.isNotEmpty ?? false))
                  .toList())
              .then((value) {
            if (value.status == Status.ERROR) {
              Get.showSnackbar(GetSnackBar(
                backgroundColor: ColorPallete.red,
                duration: const Duration(seconds: 2),
                message: value.message,
              ));
            }
            return value.status == Status.COMPLETED;
          });
          if (result) {
            if ([5].contains(template.id)) {
              fetchServices();
              Get.toNamed(Routes.BUSINESS_SERVICE_FORM);
            } else {
              fetchGallery();
              Get.toNamed(Routes.BUSINESS_GALLERY_FORM);
            }
          }
          break;
        case 5:
          result = await _businessRepository
              .saveServices(services
                  .where((element) =>
                      (element.name?.isNotEmpty ?? false) &&
                      (element.description?.isNotEmpty ?? false))
                  .toList())
              .then((value) {
            if (value.status == Status.ERROR) {
              Get.showSnackbar(GetSnackBar(
                backgroundColor: ColorPallete.red,
                duration: const Duration(seconds: 2),
                message: value.message,
              ));
            }
            return value.status == Status.COMPLETED;
          });
          if (result) {
            fetchGallery();
            Get.toNamed(Routes.BUSINESS_GALLERY_FORM);
          }
          break;
        case 6:
          result = await _businessRepository
              .saveGalleryIamges(galleryImgs
                  .where((element) => (element.name?.isNotEmpty ?? false))
                  .toList())
              .then((value) {
            if (value.status == Status.ERROR) {
              Get.showSnackbar(GetSnackBar(
                backgroundColor: ColorPallete.red,
                duration: const Duration(seconds: 2),
                message: value.message,
              ));
            }
            return value.status == Status.COMPLETED;
          });
          if (result) {
            fetchContactDetails();
            Get.toNamed(Routes.BUSINESS_CONTACT_US_FORM);
          }
          break;
        case 7:
          contactUsDetails.value.templateId = template.id;
          result = await _businessRepository
              .saveContactUsDetails(contactUsDetails.value)
              .then((value) {
            if (value.status == Status.ERROR) {
              Get.showSnackbar(GetSnackBar(
                backgroundColor: ColorPallete.red,
                duration: const Duration(seconds: 2),
                message: value.message,
              ));
            }
            return value.status == Status.COMPLETED;
          });
          if (result) {
            if (await paymentCheck()) {
              Get.until(
                  (route) => Get.currentRoute == Routes.BUSINESS_DETAIL_FORM);
              Get.offAndToNamed(
                Routes.PAYMENT,
                arguments: template,
              );
            } else {
              Get.offAllNamed(Routes.HOME);
            }
          }
          break;

        default:
          result = false;
      }

      // result = true;
      isLoading.value = false;
      if (result) {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: ColorPallete.primary,
          duration: const Duration(seconds: 2),
          message: translations.detailsSubmitted.tr,
        ));
      } else {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: ColorPallete.red,
          duration: const Duration(seconds: 2),
          message: translations.errorUpdatingDetails.tr,
        ));
      }
    }
  }

  RxList<Slider> sliders = <Slider>[].obs;
  RxList<Product> products = <Product>[].obs;
  RxList<Service> services = <Service>[].obs;
  RxList<GalleryImage> galleryImgs = <GalleryImage>[].obs;

  Rx<BusinessDetails> businessDetails = BusinessDetails().obs;
  Rx<AboutUs> aboutUsDetails = AboutUs(
          description: "We excel in our field !",
          mission: "To give best services as possible !",
          goal: "To be the best in the World !",
          vision: "To give great products to the world !")
      .obs;
  Rx<ContactUs> contactUsDetails = ContactUs().obs;
  RxList<Testimonial> testimonials = <Testimonial>[].obs;

  void fetchData() {
    fetchBusinessDetails();
    // fetchSliderDetails();
  }

  void fetchBusinessDetails() async {
    await _businessRepository.fetchBusinessDetails(template).then((value) {
      if (value.status == Status.COMPLETED) {
        businessDetails.value = value.data;
        businessDetails.refresh();
      } else {}
    });
  }

  void fetchSliderDetails() async {
    await _businessRepository.fetchSliderDetails(template).then((value) {
      if (value.status == Status.COMPLETED) {
        sliders.value = value.data;
        sliders.refresh();
      } else {}
    });
  }

  void fetchAboutUsDetails() async {
    await _businessRepository.fetchAboutUsDetails(template).then((value) {
      if (value.status == Status.COMPLETED) {
        if (((value.data as AboutUs).id ?? "") != "") {
          aboutUsDetails.value = value.data;
        }
        aboutUsDetails.refresh();
      } else {}
    });
  }

  void fetchProducts() async {
    await _businessRepository.fetchProducts(template).then((value) {
      if (value.status == Status.COMPLETED) {
        products.value = value.data;
        products.refresh();
      }
    });
  }

  void fetchServices() async {
    await _businessRepository.fetchServices(template).then((value) {
      if (value.status == Status.COMPLETED) {
        services.value = value.data;
        services.refresh();
      }
    });
  }

  void fetchGallery() async {
    await _businessRepository.fetchGalleryIamges(template).then((value) {
      if (value.status == Status.COMPLETED) {
        galleryImgs.value = value.data;
        galleryImgs.refresh();
      }
    });
  }

  void fetchContactDetails() async {
    await _businessRepository.fetchContactDetails(template).then((value) {
      if (value.status == Status.COMPLETED) {
        contactUsDetails.value = value.data;
        contactUsDetails.refresh();
      }
    });
  }

  Future<bool> paymentCheck() async {
    return _paymentRepository.fetchPaymentReport(template).then((value) {
      return !(value.status == Status.COMPLETED);
    });
  }
}
