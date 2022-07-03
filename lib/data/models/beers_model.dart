class Beer {
  String? id;
  String? name;
  String? breweryType;

  Beer({
    this.id,
    this.name,
    this.breweryType,
  });

  Beer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    breweryType = json['brewery_type'];
    ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['brewery_type'] = this.breweryType;

    return data;
  }
}
