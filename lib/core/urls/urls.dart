class URL {
  static const baseURL = "192.168.187.239:8000";
  //154.160.16.54
  returnURI(String path) {
    return Uri.http(baseURL,path,);
  }
}
