import 'package:get/get.dart';
import 'package:social_cardify/app/models/whatsapp_model.dart';

import '../models/api_response.dart';
import '../models/fact_details_models.dart';
import '../models/personal_details_model.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/social_links_model.dart';
import '../models/testimonial_model.dart';
import '../models/theme_template_model.dart';
import '../models/work_experience_model.dart';
import '../providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;

class SelfEmployedRepository {
  late ApiProvider apiProvider;

  SelfEmployedRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  // PERSONAL DETAILS
  Future<ApiResponse> fetchPersonalDetails(Template template) async {
    return await apiProvider.makeAPICall(
        "GET", "personal_information/show/${template.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = PersonalDetails.fromJson(value.data["data"]);
      }
      return value;
    });
  }

  Future<ApiResponse> savePersonalDetails(PersonalDetails data) async {
    var body = dio.FormData.fromMap(data.toJson());
    if (data.photo != null && !data.photo!.contains("images")) {
      body.fields.removeWhere((element) => element.key == "photo");
      body.files.add(
        MapEntry(
          "photo",
          await dio.MultipartFile.fromFile(data.photo!,
              filename: data.photo.toString().split("/").last),
        ),
      );
    }
    return await apiProvider
        .makeAPICall(
            "POST",
            "personal_information/${data.id == null ? "store" : "update"}",
            body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.message = value.data["message"];
      }
      return value;
    });
  }

  //FACTS
  Future<ApiResponse> fetchFacts(Template template) async {
    return await apiProvider
        .makeAPICall("GET", "fact/show/${template.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = FactsDetails.fromJson(value.data["data"]);
      }
      return value;
    });
  }

  Future<ApiResponse> saveFactsDetails(FactsDetails data) async {
    var body = dio.FormData.fromMap(data.toJson());
    return await apiProvider
        .makeAPICall(
            "POST", "fact/${data.id == null ? "store" : "update"}", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.message = value.data["message"];
      }
      return value;
    });
  }

  //WORK EXPERIENCE
  Future<ApiResponse> fetchWorkExperiences(Template template) async {
    return await apiProvider.makeAPICall(
        "GET", "work_experience/show/${template.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => WorkExperience.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  Future<ApiResponse> saveWorkExperiences(List<WorkExperience> data) async {
    for (var slider in data) {
      await saveWorkExperience(slider);
    }
    return ApiResponse.completed({"message": "Saved Sliders Successfully !"});
  }

  Future<ApiResponse> saveWorkExperience(WorkExperience data) async {
    dio.FormData body = dio.FormData.fromMap(data.toJson());
    return await apiProvider
        .makeAPICall("POST",
            "work_experience/${data.id == null ? "store" : "update"}", body)
        .then((value) {
      // value.message = value.data["message"];
      return value;
    });
  }

  Future<ApiResponse> deleteWorkExperience(WorkExperience data) async {
    return await apiProvider.makeAPICall(
        "DELETE", "work_experience/delete/${data.id}", {}).then((value) {
      // value.message = value.data["message"];
      return value;
    });
  }

  //SKILLS
  Future<ApiResponse> fetchSkills(Template template) async {
    return await apiProvider
        .makeAPICall("GET", "skill/show/${template.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data =
            (value.data["data"] as List).map((e) => Skill.fromJson(e)).toList();
      }
      return value;
    });
  }

  Future<ApiResponse> saveSkills(List<Skill> data) async {
    for (var slider in data) {
      await saveSkill(slider);
    }
    return ApiResponse.completed({"message": "Saved Sliders Successfully !"});
  }

  Future<ApiResponse> saveSkill(Skill data) async {
    dio.FormData body = dio.FormData.fromMap(data.toJson());
    return await apiProvider
        .makeAPICall(
            "POST", "skill/${data.id == null ? "store" : "update"}", body)
        .then((value) {
      // value.message = value.data["message"];
      return value;
    });
  }

  Future<ApiResponse> deleteSkill(Skill data) async {
    return await apiProvider
        .makeAPICall("DELETE", "skill/delete/${data.id}", {}).then((value) {
      // value.message = value.data["message"];
      return value;
    });
  }

  //PROJECTS
  Future<ApiResponse> fetchProjects(Template template) async {
    return await apiProvider
        .makeAPICall("GET", "project/show/${template.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => Project.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  Future<ApiResponse> saveProjects(List<Project> data) async {
    for (var project in data) {
      await saveProject(project);
    }
    return ApiResponse.completed({"message": "Saved Projects Successfully !"});
  }

  Future<ApiResponse> saveProject(Project data) async {
    dio.FormData body = dio.FormData.fromMap(data.toJson());

    return await apiProvider
        .makeAPICall(
            "POST", "project/${data.id == null ? "store" : "update"}", body)
        .then((value) {
      // value.message = value.data["message"];
      return value;
    });
  }

  Future<ApiResponse> deleteProject(Project data) async {
    return await apiProvider
        .makeAPICall("DELETE", "project/delete/${data.id}", {}).then((value) {
      // value.message = value.data["message"];
      return value;
    });
  }

  // TESTIMONIALS
  Future<ApiResponse> fetchTestimonials(Template template) async {
    return await apiProvider.makeAPICall(
        "GET", "testimonial/show/${template.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => Testimonial.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  Future<ApiResponse> saveTestimonials(List<Testimonial> data) async {
    for (var testimonial in data) {
      await saveTestimonial(testimonial);
    }
    return ApiResponse.completed(
        {"message": "Saved Testimonials Successfully !"});
  }

  Future<ApiResponse> saveTestimonial(Testimonial data) async {
    dio.FormData body = dio.FormData.fromMap(data.toJson());
    return await apiProvider
        .makeAPICall(
            "POST", "testimonial/${data.id == null ? "store" : "update"}", body)
        .then((value) {
      // value.message = value.data["message"];
      return value;
    });
  }

  Future<ApiResponse> deleteTestimonial(Testimonial data) async {
    return await apiProvider.makeAPICall(
        "DELETE", "testimonial/delete/${data.id}", {}).then((value) {
      // value.message = value.data["message"];
      return value;
    });
  }

//CONTACT US
  Future<ApiResponse> fetchContactDetails(Template template) async {
    return await apiProvider.makeAPICall(
        "GET", "social_link/show/${template.id}", {}).then((value) async {
      if (value.status == Status.COMPLETED) {
        SocialLinks data = SocialLinks.fromJson(value.data["data"]);
        value.data = await fetchWhatsAppDetails(template).then((value) {
          data.whatsappNumber = value.data;
          return data;
        });
      }
      return value;
    });
  }

  Future<ApiResponse> saveContactUsDetails(SocialLinks data) async {
    var body = dio.FormData.fromMap(data.toJson());
    return await apiProvider
        .makeAPICall(
            "POST", "social_link/${data.id == null ? "store" : "update"}", body)
        .then((value) async {
      if (value.status == Status.COMPLETED) {
        value.message = value.data["message"];
      }
      return data.whatsappNumber == null
          ? value
          : await saveWhatsAppDetails(data.whatsappNumber!);
    });
  }

  Future<ApiResponse> fetchWhatsAppDetails(Template template) async {
    return await apiProvider.makeAPICall(
        "GET", "whatsapp/show/${template.id}", {}).then((value) async {
      if (value.status == Status.COMPLETED) {
        value.data = WhatsAppDetails.fromJson(value.data["data"]);
      }
      return value;
    });
  }

  Future<ApiResponse> saveWhatsAppDetails(WhatsAppDetails data) async {
    var body = dio.FormData.fromMap(data.toJson());
    return await apiProvider
        .makeAPICall(
            "POST", "whatsapp/${data.id == null ? "store" : "update"}", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.message = value.data["message"];
      }
      return value;
    });
  }
}
