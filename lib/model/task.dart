class Task {
  String? _createdAt;
  String? _descriprion;
  int? _id;
  String? _status;
  String? _title;

  Task(
      {String? createdAt,
        String? descriprion,
        int? id,
        String? status,
        String? title}) {
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (descriprion != null) {
      this._descriprion = descriprion;
    }
    if (id != null) {
      this._id = id;
    }
    if (status != null) {
      this._status = status;
    }
    if (title != null) {
      this._title = title;
    }
  }

  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get descriprion => _descriprion;
  set descriprion(String? descriprion) => _descriprion = descriprion;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get title => _title;
  set title(String? title) => _title = title;

  Task.fromJson(Map<String, dynamic> json) {
    _createdAt = json['createdAt'];
    _descriprion = json['descriprion'];
    _id = json['id'];
    _status = json['status'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this._createdAt;
    data['descriprion'] = this._descriprion;
    data['id'] = this._id;
    data['status'] = this._status;
    data['title'] = this._title;
    return data;
  }
}
