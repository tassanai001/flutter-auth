class ApiPath {

  final env = {
    "development": {
      "api_url": "http://192.168.1.39:4000",
    },
    "production": {
      "api_url": "https://test-prod.com",
    }
  };

  getApiPath() {
    return env;
  }
}
