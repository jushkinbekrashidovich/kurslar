import 'package:hive/hive.dart';
 
 part 'courses_model.g.dart';
 
 @HiveType(typeId: 0)

 class CoursesModel {
  @HiveField(0)
  String? post_id;

  @HiveField(1)
  String? image_url;

  @HiveField(2)
  String? school_name;

  @HiveField(3)
  String? address;

  @HiveField(4)
  String? latitude_location;

  @HiveField(5)
  String? longtitude_location;

  @HiveField(6)
  String? phone_number;

  @HiveField(7)
  String? description;
  
  @HiveField(8)
  String? telegram_link;

  @HiveField(9)
  String? instagram_link;

  @HiveField(10)
  String? website_link;

  @HiveField(11)
  String? facebook_link;


  @HiveField(12)
  List<String>? subjects;

  CoursesModel({
    this.post_id,
    this.image_url,
    this.school_name,
    this.address,
    this.latitude_location,
    this.longtitude_location,
    this.phone_number,
    this.description,
    this.telegram_link,
    this.instagram_link,
    this.website_link,
    this.facebook_link,
    this.subjects,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    return CoursesModel(
      //post_id: json['post_id'],
      image_url: json['image_url'] ?? "https://firebasestorage.googleapis.com/v0/b/kurslar-cee29.appspot.com/o/image_not_found.png?alt=media&token=ba09c460-f653-4b19-9e4e-b680430de238",
      school_name: json['school_name']??"O'quv markaz nomi topilmadi",
      address: json['address'] ?? "",
      latitude_location: json['latitude_location']??"",
      longtitude_location: json['longtitude_location']??"",
      phone_number: json['phone_number']??"",
      description: json['description']??"",
      telegram_link: json['telegram_link']??"",
      instagram_link: json['instagram_link']??"",
      website_link: json['website_link']??"",
      facebook_link: json['facebook_link']??"",
      subjects: List<String>.from(json['subjects']??""),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      //'post_id': post_id,

      'image_url': image_url,
      'school_name': school_name,
      'address': address,
      'latitude_location': latitude_location,
      'longtitude_location': longtitude_location,
      'phone_number': phone_number,
      'description': description,
      'telegram_link': telegram_link,
      'instagram_link': instagram_link,
      'website_link': website_link,
      'facebook_link': facebook_link,
      'subjects': subjects,
    };
  }
}
