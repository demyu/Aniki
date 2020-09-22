
class VA {
  

  String _vaname, _vaImage;
  int _id, _vaid;

  VA(this._vaname, this._vaImage, this._vaid);
  VA.withID(this._id, this._vaname, this._vaImage, this._vaid);
  VA.fromDB(Map<String,dynamic> data){
    this._id = data['id'];
    this._vaname = data['vaname'];
    this._vaImage = data['vaimage'];
    this._vaid = data['vaid'];
  } 

  Map<String,dynamic> toMap(){
    Map<String, dynamic> data = {
      'vaname' : this._vaname,
      'vaimage' : this._vaImage,
      'vaid': this._vaid,
    };
    if (_id != null) {
      data['id'] = this._id;
    }
    return data;
  }

  String getName(){
    return this._vaname;
  }

  String getImage(){
    return this._vaImage;
  }

  int getId(){
    return this._id;
  }

  int getVaId(){
    return this._vaid;
  }
}