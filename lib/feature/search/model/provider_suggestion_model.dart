class ProviderSuggestionModel {
  String? responseCode;
  String? message;
  List<ProviderSuggestion>? providerSuggestionContent;

  ProviderSuggestionModel({this.responseCode, this.message, this.providerSuggestionContent});

  ProviderSuggestionModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    if (json['content'] != null) {
      providerSuggestionContent = <ProviderSuggestion>[];
      json['content'].forEach((v) {
        providerSuggestionContent!.add(ProviderSuggestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    data['message'] = message;
    if (providerSuggestionContent != null) {
      data['content'] = providerSuggestionContent!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProviderSuggestion {
  String? name;
  int? isSearched;
  String? providerid;

  ProviderSuggestion({this.name, this.isSearched,this.providerid});

  ProviderSuggestion.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isSearched = json['is_searched'];
    providerid = json['providerid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['is_searched'] = isSearched;
    data['providerid'] = providerid;
    return data;
  }
}
