class SignUpLocationResponse {
  List<DataLocation>? data;
  // Links? links;
  // Meta? meta;
  SignUpLocationResponse({
    required this.data,
    // required this.links,
    // required this.meta,
  });

  factory SignUpLocationResponse.fromJson(Map<String, dynamic> json) =>
      SignUpLocationResponse(
        data: (json['data'] as List)
            .map((json) => DataLocation.fromJson(json))
            .toList(),

        // links: json['links'] != null ? Links.fromJson(json['links']) : null,
        // meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      );
}

class DataLocation {
  int? id;
  String? name;
  double? lat;
  double? lng;
  DataLocation({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
  });

  Map<String, dynamic> toJson(DataLocation data) {
    return <String, dynamic>{'id': data.id, 'lat': data.lat, 'lng': data.lng};
  }

  factory DataLocation.fromJson(Map<String, dynamic> json) {
    return DataLocation(
      name: json['name'] as String,
      id: json['id'] as int,
      lat: json['lat'] as double,
      lng: json['lng'] as double,
    );
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });
  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json['first'] as String,
    last: json['last'] as String,
    prev: json['prev'] as String,
    next: json['next'] as String,
  );
}

class Meta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<MetaLink>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });
  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json['current_page'] as int,
    from: json['from'] as int,
    lastPage: json['last_page'] as int,
    links: json['links'] != null
        ? (json['links'] as List).map((e) => MetaLink.fromJson(e)).toList()
        : [],

    path: json['path'] as String,
    perPage: json['per_page'] as int,
    to: json['to'] as int,
    total: json['total'] as int,
  );

  Map<String, dynamic> toJson(Meta meta) => {
    'currentPage': meta.currentPage,
    'from': meta.from,
    'lastPage': meta.lastPage,
    'links': meta.links,
    'path': meta.path,
    'per_page': meta.perPage,
    'to': meta.to,
    'total': meta.total,
  };
}

class MetaLink {
  final String? url;
  final String? label;
  final bool? active;

  MetaLink({required this.url, required this.label, required this.active});
  factory MetaLink.fromJson(Map<String, dynamic> json) =>
      MetaLink(url: json['url'], label: json['label'], active: json['active']);

  Map<String, dynamic> toJson(MetaLink listMeta) => {
    'url': listMeta.url,
    'label': listMeta.label,
    'active': listMeta.active,
  };
}
