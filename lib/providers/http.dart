import 'dart:convert';
import 'dart:io';

import 'package:time_mobile/constants/api.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as Http;

class MyHttpClient {
  final String token;
  Map<String, String> headers;
  Http.Client client;

  MyHttpClient(this.token) {
    _setClient();
    _setHeaders();
  }

  serializeUrlByQuery(dynamic obj, {String prefix}) {
    List<String> strs = [];
    var p;
    for (p in obj.keys.toList()) {
      if (obj.containsKey(p)) {
        var key = p;
        var k = prefix != null ? prefix + "[" + p + "]" : p;
        var v = obj[p];
        var str;
        if (v == null) continue;
        if (v.runtimeType.toString() == 'String') {
          str = k + "=" + Uri.encodeComponent(v);
        } else if (v.runtimeType.toString() == 'int') {
          str = k + "=" + Uri.encodeComponent(v.toString());
        } else if (v.runtimeType.toString().contains('Map')) {
          str = serializeUrlByQuery(v, prefix: k);
        } else if (v.runtimeType.toString().contains('List')) {
          str = List.from(v).map((item) {
            return "$key[]=${Uri.encodeComponent(item.toString())}";
          }).join("&");
        } else {
          continue;
        }
        if (str != null) {
          strs.add(str);
        }
      }
    }
    return strs.join("&");
  }

  void _setClient() {
    this.client = new Http.Client();
  }

  void _setHeaders() {
    this.headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
  }

  String createURI(String url, Map queryParams) {
    List baseSplit = url.split(BASE_URL);
    var path = baseSplit[1];
    var uri = new Uri();
    String serializeUrlByQueryEncode = '';
    if (queryParams != null) {
      serializeUrlByQueryEncode = this.serializeUrlByQuery(queryParams);
    }
    if (BASE_URL.toLowerCase().contains('https')) {
      uri = new Uri.https(BASE_URL.replaceAll("https://", ""), "$path");
    } else {
      uri = new Uri.http(BASE_URL.replaceAll("http://", ""), "$path");
    }
    return (serializeUrlByQueryEncode == '')
        ? uri.toString()
        : "${uri.toString()}?$serializeUrlByQueryEncode";
  }

  get(String url, {Map queryParams}) async {
    String uri = this.createURI(url, queryParams);
    print("------- GET $uri --------");
    return this.client.get(Uri.parse(uri), headers: this.headers);
  }

  post(String url, body) async {
    var data = body != null ? json.encode(body) : {};
    print("------- POST $url --------");
    return this.client.post(Uri.parse(url), body: data, headers: this.headers);
  }

  put(String url, {body}) async {
    var data = body != null ? json.encode(body) : {};
    print("------- PUT $url --------");
    return this.client.put(Uri.parse(url), body: data, headers: this.headers);
  }

  patch(String url, String body) async {
    var data = body != null ? json.encode(body) : {};
    print("------- PATCH $url --------");
    return this.client.patch(Uri.parse(url), body: data, headers: this.headers);
  }

  delete(url, {headers, Map queryParams}) async {
    String uri = this.createURI(url, queryParams);
    print("------- DELETE $uri --------");
    return this.client.delete(Uri.parse(uri), headers: this.headers);
  }

  putUpload(
    String url,
    String fileUpload, {
    Function onSendProgress,
    Function onReceiveProgress,
  }) async {
    Dio dio = new Dio();
    MultipartFile multipartFile = await MultipartFile.fromFile(fileUpload);
    FormData formData = new FormData.fromMap({
      "file": multipartFile,
    });
    print("------- PUT UPLOAD $url --------");
    return dio.put(
      url,
      data: formData,
      options: new Options(headers: this.headers),
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
  }

  putUploadWithFormData(
    String url,
    FormData formData, {
    Function onSendProgress,
    Function onReceiveProgress,
  }) async {
    Dio dio = new Dio();
    print("------- PUT UPLOAD (With FormData) $url --------");
    return dio.put(
      url,
      data: formData,
      options: new Options(headers: this.headers),
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
  }

  postUploadWithFormData(String url, FormData formData,
      {ProgressCallback onSendProgress,
      ProgressCallback onReceiveProgress}) async {
    Dio dio = new Dio();
    print("------- POST UPLOAD (With FormData) $url --------");
    return dio
        .post(
      url,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
      data: formData,
      options: new Options(headers: this.headers),
    )
        .catchError((e) {
      print("Error Me : ${e.toString()}");
    });
  }

  postUpload(
    String url,
    String fileUpload, {
    Function onSendProgress,
    Function onReceiveProgress,
  }) async {
    Dio dio = new Dio();
    FormData formData = new FormData.fromMap({
      "file": await MultipartFile.fromFile(fileUpload.toString()),
    });
    print("------- POST UPLOAD $url --------");
    return dio.post(
      url,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
      data: formData,
      options: new Options(headers: this.headers),
    );
  }
}
