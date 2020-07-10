class Fact {
  int _id;
  String _title;
  String _description;
  String _imageUrl;

  get id => this._id;
  get title =>this._title;
  get description => this._description;
  get imageUrl => this._imageUrl;


  Fact.fromJson(Map data) {
    _id = data["id"];
    _title = data["title"];
    _description = data["description"];
    _imageUrl = data["image_url"];
  }
}
 


