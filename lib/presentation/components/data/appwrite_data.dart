class appwrite_data {
  String judul;
  String deskripsi;

  appwrite_data(
      {this.judul,
      this.deskripsi
      });

  appwrite_data.fromJson(Map<String, dynamic> json) {
    judul = json['judul'];
    deskripsi = json['deskripsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['judul'] = this.judul;
    data['deskripsi'] = this.deskripsi;
    return data;
  }
}