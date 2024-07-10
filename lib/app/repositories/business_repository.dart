import 'package:get/get.dart';
import '../models/about_us_model.dart';
import '../models/business_details_model.dart';
import '../models/contact_us_model.dart';
import '../models/gallery_img_model.dart';
import '../models/testimonial_model.dart';
import '../models/theme_template_model.dart';
import '../models/whatsapp_model.dart';

import '../models/api_response.dart';
import '../models/product_model.dart';
import '../models/service_model.dart';
import '../models/slider_model.dart';
import '../providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;

class BusinessRepository {
  late ApiProvider apiProvider;

  BusinessRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  // BUSINESS DETAILS

  Future<ApiResponse> fetchBusinessDetails(Template template) async {
    return await apiProvider.makeAPICall(
        "GET", "business_details/show/${template.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = BusinessDetails.fromJson(value.data["data"]);
      }
      return value;
    });
  }

  Future<ApiResponse> saveBusinessDetails(BusinessDetails data) async {
    var body = dio.FormData.fromMap(data.toJson());
    if (data.logo != null && !data.logo!.contains("logos")) {
      body.fields.removeWhere((element) => element.key == "logo");
      body.files.add(
        MapEntry(
          "logo",
          await dio.MultipartFile.fromFile(data.logo!,
              filename: data.logo.toString().split("/").last),
        ),
      );
    }
    return await apiProvider
        .makeAPICall("POST",
            "business_details/${data.id == null ? "store" : "update"}", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.message = value.data["message"];
      }
      return value;
    });
  }

  //SLIDERS

  Future<ApiResponse> fetchSliderDetails(Template template) async {
    return await apiProvider
        .makeAPICall("GET", "slider/show/${template.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => Slider.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  Future<ApiResponse> saveSliders(List<Slider> data) async {
    for (var slider in data) {
      await saveSlider(slider);
    }
    return ApiResponse.completed({"message": "Saved Sliders Successfully !"});
  }

  Future<ApiResponse> saveSlider(Slider data) async {
    dio.FormData body = dio.FormData.fromMap(data.toJson());

    if (data.image != null && !data.image!.contains("template_sliders")) {
      body.fields.removeWhere((element) => element.key == "image");
      body.files.add(
        MapEntry(
          "image",
          await dio.MultipartFile.fromFile(data.image!,
              filename: data.image.toString().split("/").last),
        ),
      );
    }
    return await apiProvider
        .makeAPICall(
            "POST", "slider/${data.id == null ? "store" : "update"}", body)
        .then((value) {
      // value.message = value.data["message"];
      return value;
    });
  }

  // ABOUT US

  Future<ApiResponse> fetchAboutUsDetails(Template template) async {
    return await apiProvider
        .makeAPICall("GET", "about_us/show/${template.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = AboutUs.fromJson(value.data["data"]);
      }
      return value;
    });
  }

  Future<ApiResponse> saveAboutUsDetails(AboutUs data) async {
    var body = dio.FormData.fromMap(data.toJson());

    return await apiProvider
        .makeAPICall(
            "POST", "about_us/${data.id == null ? "store" : "update"}", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.message = value.data["message"];
      }
      return value;
    });
  }

  // TESTIMONIALS
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

  //PRODUCTS

  Future<ApiResponse> fetchProducts(Template template) async {
    return await apiProvider
        .makeAPICall("GET", "product/show/${template.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => Product.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  Future<ApiResponse> saveProducts(List<Product> data) async {
    for (var product in data) {
      await saveProduct(product);
    }
    return ApiResponse.completed({"message": "Saved Products Successfully !"});
  }

  Future<ApiResponse> saveProduct(Product data) async {
    dio.FormData body = dio.FormData.fromMap(data.toJson());
    if (data.image != null && !data.image!.contains("products")) {
      body.fields.removeWhere((element) => element.key == "image");
      body.files.add(
        MapEntry(
          "image",
          await dio.MultipartFile.fromFile(data.image!,
              filename: data.image.toString().split("/").last),
        ),
      );
    }
    return await apiProvider
        .makeAPICall(
            "POST", "product/${data.id == null ? "store" : "update"}", body)
        .then((value) {
      // value.message = value.data["message"];
      return value;
    });
  }

  //SERVICES
  Future<ApiResponse> fetchServices(Template template) async {
    return await apiProvider
        .makeAPICall("GET", "service/show/${template.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => Service.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  Future<ApiResponse> saveServices(List<Service> data) async {
    for (var service in data) {
      await saveService(service);
    }
    return ApiResponse.completed({"message": "Saved Services Successfully !"});
  }

  Future<ApiResponse> saveService(Service data) async {
    dio.FormData body = dio.FormData.fromMap(data.toJson());
    if (data.image != null && !data.image!.contains("services")) {
      body.fields.removeWhere((element) => element.key == "image");
      body.files.add(
        MapEntry(
          "image",
          await dio.MultipartFile.fromFile(data.image!,
              filename: data.image.toString().split("/").last),
        ),
      );
    }
    return await apiProvider
        .makeAPICall(
            "POST", "service/${data.id == null ? "store" : "update"}", body)
        .then((value) {
      // value.message = value.data["message"];
      return value;
    });
  }

  //GALLERY
  Future<ApiResponse> fetchGalleryIamges(Template template) async {
    return await apiProvider
        .makeAPICall("GET", "gallery/show/${template.id}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => GalleryImage.fromJson(e))
            .toList();
      }
      return value;
    });
  }

  Future<ApiResponse> saveGalleryIamges(List<GalleryImage> data) async {
    for (var img in data) {
      await saveGalleryImage(img);
    }
    return ApiResponse.completed({"message": "Saved Services Successfully !"});
  }

  Future<ApiResponse> saveGalleryImage(GalleryImage data) async {
    dio.FormData body = dio.FormData.fromMap(data.toJson());
    if (data.image != null && !data.image!.contains("gallery")) {
      body.fields.removeWhere((element) => element.key == "image");
      body.files.add(
        MapEntry(
          "image",
          await dio.MultipartFile.fromFile(data.image!,
              filename: data.image.toString().split("/").last),
        ),
      );
    }
    return await apiProvider
        .makeAPICall(
            "POST", "gallery/${data.id == null ? "store" : "update"}", body)
        .then((value) {
      // value.message = value.data["message"];
      return value;
    });
  }

//CONTACT US
  Future<ApiResponse> fetchContactDetails(Template template) async {
    return await apiProvider.makeAPICall(
        "GET", "contact_us/show/${template.id}", {}).then((value) async {
      if (value.status == Status.COMPLETED) {
        ContactUs data = ContactUs.fromJson(value.data["data"]);
        value.data = await fetchWhatsAppDetails(template).then((value) {
          data.whatsAppNumber = value.data;
          return data;
        });
      }
      return value;
    });
  }

  Future<ApiResponse> saveContactUsDetails(ContactUs data) async {
    var body = dio.FormData.fromMap(data.toJson());
    return await apiProvider
        .makeAPICall(
            "POST", "contact_us/${data.id == null ? "store" : "update"}", body)
        .then((value) async {
      if (value.status == Status.COMPLETED) {
        value.message = value.data["message"];
      }
      return data.whatsAppNumber == null
          ? value
          : await saveWhatsAppDetails(data.whatsAppNumber!);
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
