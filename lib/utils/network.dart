part of skillsage_utils;

class NetworkUtil {
  static const String baseUrl = 'https://localhost:3000/';

  static Future<dynamic> getReq(String endpoint) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(url);

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to perform GET request: $e');
    }
  }

  static Future<dynamic> postReq(String endpoint, dynamic body) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = {'Content-Type': 'application/json'};
      final encodedBody = jsonEncode(body);

      final response =
          await http.post(url, headers: headers, body: encodedBody);

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to perform POST request: $e');
    }
  }

  static Future<dynamic> uploadFile(String endpoint, File file) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final request = http.MultipartRequest('POST', url);
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

  static Future<File> downloadFile(String url, String savePath) async {
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

  static dynamic _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    final responseBody = response.body;

    if (statusCode >= 200 && statusCode < 300) {
      final decodedBody = jsonDecode(responseBody);
      return decodedBody;
    } else {
      throw Exception('Request failed with status code $statusCode');
    }
  }
}
