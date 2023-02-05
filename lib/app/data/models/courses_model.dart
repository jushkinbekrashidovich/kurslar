class CoursesModel {
  String? post_id;

  String? image_url;
  String? school_name;
  String? address;
  String? latitude_location;
  String? longtitude_location;
  String? phone_number;
  String? description;

  String? telegram_link;
  String? instagram_link;
  String? website_link;
  String? facebook_link;
  
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
      image_url: json['image_url'],
      school_name: json['school_name'],
      address: json['address'],
      latitude_location: json['latitude_location'],
      longtitude_location: json['longtitude_location'],
      phone_number: json['phone_number'],
      description: json['description'],
      telegram_link: json['telegram_link'],
      instagram_link: json['instagram_link'],
      website_link: json['website_link'],
      facebook_link: json['facebook_link'],
      subjects: List<String>.from(json['subjects']),
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
