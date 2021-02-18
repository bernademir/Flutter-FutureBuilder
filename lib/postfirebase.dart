class PostFirebase {
  String author;
  int id;
  String title;

  PostFirebase({this.author, this.id, this.title});

  PostFirebase.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['id'] = this.id.toString();
    data['title'] = this.title;
    return data;
  }
}
