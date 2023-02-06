class CoursesDetailsArguments {
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

  CoursesDetailsArguments({
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
  });}