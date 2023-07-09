part of skillsage_utils;

class NetworkUtil {
  // static const String baseUrl = 'http://127.0.0.1:8000';
  static const String baseUrl = 'http://10.0.2.2:8000';

  Future<Map<String, String>> getHeaders() async {
    final tokenData = await TokenBox.getTokenData();
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${tokenData.token}'
    };
  }

  Future<dynamic> getReq(String endpoint) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(
        url,
        headers: await getHeaders(),
      );

      return _handleResponse(response);
    } catch (e) {
      return throw Exception('Failed to perform GET request: $e');
    }
  }

  Future<dynamic> postReq(String endpoint, Map<String, String> body) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: await getHeaders(),
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to perform POST request: $e');
    }
  }

  Future<dynamic> putReq(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: await getHeaders(),
        body: jsonEncode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to perform UPDATE request: $e');
    }
  }

  Future<dynamic> uploadFile(String endpoint, File file) async {
    try {
      final tokenData = await TokenBox.getTokenData();
      final url = Uri.parse('$baseUrl$endpoint');
      final request = http.MultipartRequest('POST', url);

      request.headers['Authorization'] = 'Bearer ${tokenData.token}';
      request.headers['Content-Type'] = 'multipart/form-data';
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        return jsonDecode(responseBody);
      } else {
        throw Exception(
            'File upload failed with status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }

  Future<File> downloadFile(String url, String savePath) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final file = File(savePath);
        await file.writeAsBytes(response.bodyBytes);
        return file;
      } else {
        throw Exception(
            'File download failed with status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to download file: $e');
    }
  }

  dynamic _handleResponse(http.Response response) {
    // final statusCode = response.statusCode;
    final responseBody = response.body;

    // if (statusCode >= 200 && statusCode < 300) {
    final decodedBody = jsonDecode(responseBody);
    return decodedBody;
    // } else {
    //   throw Exception('Request failed with status code $statusCode');
    // }
  }
}
