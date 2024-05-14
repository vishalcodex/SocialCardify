import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../models/api_response.dart';
import '../../../models/fact_details_models.dart';
import '../../../models/personal_details_model.dart';
import '../../../models/project_model.dart';
import '../../../models/skill_model.dart';
import '../../../models/social_links_model.dart';
import '../../../models/testimonial_model.dart';
import '../../../models/theme_template_model.dart';
import '../../../models/work_experience_model.dart';
import '../../../repositories/self_employed_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class SelfEmployedController extends GetxController {
  late SelfEmployedRepository _selfEmployedRepository;
  SelfEmployedController() {
    _selfEmployedRepository = SelfEmployedRepository();
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

  RxString image = "".obs;

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
  GlobalKey<FormState> businessCategoryFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> businessTestimonialFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> businessContactUsFormKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  void validateAndContinue(context, int stage) async {
    // selectedTile.value = 5;
    // GlobalKey<FormState> key = stage == 1
    //     ? businessDetailsFormKey
    //     : selectedTile.value == 2
    //         ? businessCategoryFormKey
    //         : selectedTile.value == 3
    //             ? businessTestimonialFormKey
    //             : businessContactUsFormKey;
    // if (key.currentState!.validate()) {
    var result = false;
    isLoading.value = true;
    switch (stage) {
      case 1:
        personalDetails.value.templateId = template.id;
        result = await _selfEmployedRepository
            .savePersonalDetails(personalDetails.value)
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
          fetchFacts();
          Get.toNamed(Routes.PERSONAL_FACTS_DETAILS_FORM);
        }
        break;
      case 2:
        factsDetails.value.templateId = template.id;
        result = await _selfEmployedRepository
            .saveFactsDetails(factsDetails.value)
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
          if (template.id == 2) {
            fetchWorkExperience();
            Get.toNamed(Routes.PERSONAL_WORK_EXPERIENCE_FORM);
          } else {
            fetchSkills();
            Get.toNamed(Routes.PERSONAL_SKILLS_DETAILS_FORM);
          }
        }
        break;
      case 3:
        result = await _selfEmployedRepository
            .saveWorkExperiences(workExperiences
                .where((element) =>
                    (element.companyName?.isNotEmpty ?? false) &&
                    (element.designation?.isNotEmpty ?? false))
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
          fetchSkills();
          Get.toNamed(Routes.PERSONAL_SKILLS_DETAILS_FORM);
        }
        break;
      case 4:
        result = await _selfEmployedRepository
            .saveSkills(skills
                .where((element) =>
                    (element.name?.isNotEmpty ?? false) &&
                    (element.percentage?.isNotEmpty ?? false))
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
          fetchProjects();
          Get.toNamed(Routes.PERSONAL_PROJECT_DETAILS_FORM);
        }
        break;
      case 5:
        result = await _selfEmployedRepository
            .saveProjects(projects
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
          fetchTestimonials();
          Get.toNamed(Routes.PERSONAL_TESTIMONIALS_DETAILS_FORM);
        }
        break;
      case 6:
        result = await _selfEmployedRepository
            .saveTestimonials(testimonials
                .where((element) =>
                    (element.name?.isNotEmpty ?? false) &&
                    (element.message?.isNotEmpty ?? false))
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
          Get.toNamed(Routes.PERSONAL_CONTACT_DETAILS_FORM);
        }
        break;
      case 7:
        contactUsDetails.value.templateId = template.id;
        result = await _selfEmployedRepository
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
          if ((contactUsDetails.value.id ?? "") == "") {
            Get.toNamed(Routes.PAYMENT, arguments: template);
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
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: ColorPallete.primary,
          duration: const Duration(seconds: 2),
          message: translations.detailsSubmitted.tr,
        ),
      );
    }
  }

  Rx<PersonalDetails> personalDetails = PersonalDetails().obs;
  Rx<FactsDetails> factsDetails = FactsDetails().obs;
  Rx<WorkExperience> workExperience = WorkExperience().obs;
  RxList<WorkExperience> workExperiences = <WorkExperience>[].obs;
  RxList<Skill> skills = <Skill>[].obs;
  RxList<Project> projects = <Project>[].obs;
  RxList<Testimonial> testimonials = <Testimonial>[].obs;
  Rx<SocialLinks> contactUsDetails = SocialLinks().obs;

  void fetchData() {
    fetchPersonalDetails();
  }

  void fetchPersonalDetails() async {
    await _selfEmployedRepository.fetchPersonalDetails(template).then((value) {
      if (value.status == Status.COMPLETED) {
        personalDetails.value = value.data;
        personalDetails.refresh();
      }
    });
  }

  void fetchFacts() async {
    await _selfEmployedRepository.fetchFacts(template).then((value) {
      if (value.status == Status.COMPLETED) {
        factsDetails.value = value.data;
        factsDetails.refresh();
      }
    });
  }

  void fetchWorkExperience() async {
    await _selfEmployedRepository.fetchWorkExperiences(template).then((value) {
      if (value.status == Status.COMPLETED) {
        workExperiences.value = value.data;
        workExperiences.refresh();
      }
    });
  }

  void fetchSkills() async {
    await _selfEmployedRepository.fetchSkills(template).then((value) {
      if (value.status == Status.COMPLETED) {
        skills.value = value.data;
        skills.refresh();
      }
    });
  }

  void fetchProjects() async {
    await _selfEmployedRepository.fetchProjects(template).then((value) {
      if (value.status == Status.COMPLETED) {
        projects.value = value.data;
        projects.refresh();
      }
    });
  }

  void fetchTestimonials() async {
    await _selfEmployedRepository.fetchTestimonials(template).then((value) {
      if (value.status == Status.COMPLETED) {
        testimonials.value = value.data;
        testimonials.refresh();
      }
    });
  }

  void fetchContactDetails() async {
    await _selfEmployedRepository.fetchContactDetails(template).then((value) {
      if (value.status == Status.COMPLETED) {
        contactUsDetails.value = value.data;
        contactUsDetails.refresh();
      }
    });
  }
}
