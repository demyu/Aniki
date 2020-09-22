
class CharactersCast {
  

  String _charactername, _characterImage;
  int _id, _animeid, _vaid;

  CharactersCast(this._charactername, this._characterImage, this._animeid, this._vaid);
  CharactersCast.withID(this._id, this._charactername, this._characterImage, this._animeid, this._vaid);
  CharactersCast.fromDB(Map<String,dynamic> data){
    this._id = data['id'];
    this._charactername = data['charactername'];
    this._characterImage = data['characterimage'];
    this._animeid = data['animeid'];
    this._vaid = data['vaid'];
  } 

  Map<String,dynamic> toMap(){
    Map<String, dynamic> data = {
      'charactername' : this._charactername,
      'characterimage' : this._characterImage,
      'animeid': this._animeid,
      'vaid': this._vaid
    };
    if (_id != null) {
      data['id'] = this._id;
    }
    return data;
  }

  String getName(){
    return this._charactername;
  }

  String getImage(){
    return this._characterImage;
  }

  int getId(){
    return this._id;
  }

  int getVaid(){
    return this._vaid;
  }

  int getAnimeId(){
    return this._animeid;
  }
}