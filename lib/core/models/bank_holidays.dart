class BankHolidays {
  BankHolidays({
    required this.englandAndWales,
    required this.scotland,
    required this.northernIreland,
  });
  late final EnglandAndWales englandAndWales;
  late final Scotland scotland;
  late final NorthernIreland northernIreland;

  BankHolidays.fromJson(Map<String, dynamic> json) {
    englandAndWales = EnglandAndWales.fromJson(json['england-and-wales']);
    scotland = Scotland.fromJson(json['scotland']);
    northernIreland = NorthernIreland.fromJson(json['northern-ireland']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['england-and-wales'] = englandAndWales.toJson();
    _data['scotland'] = scotland.toJson();
    _data['northern-ireland'] = northernIreland.toJson();
    return _data;
  }
}

class EnglandAndWales {
  EnglandAndWales({
    required this.division,
    required this.events,
  });
  late final String division;
  late final List<Events> events;

  EnglandAndWales.fromJson(Map<String, dynamic> json) {
    division = json['division'];
    events = List.from(json['events']).map((e) => Events.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['division'] = division;
    _data['events'] = events.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Events {
  Events({
    required this.title,
    required this.date,
    required this.notes,
    required this.bunting,
  });
  late final String title;
  late final String date;
  late final String notes;
  late final bool bunting;

  Events.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    notes = json['notes'];
    bunting = json['bunting'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['date'] = date;
    _data['notes'] = notes;
    _data['bunting'] = bunting;
    return _data;
  }
}

class Scotland {
  Scotland({
    required this.division,
    required this.events,
  });
  late final String division;
  late final List<Events> events;

  Scotland.fromJson(Map<String, dynamic> json) {
    division = json['division'];
    events = List.from(json['events']).map((e) => Events.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['division'] = division;
    _data['events'] = events.map((e) => e.toJson()).toList();
    return _data;
  }
}

class NorthernIreland {
  NorthernIreland({
    required this.division,
    required this.events,
  });
  late final String division;
  late final List<Events> events;

  NorthernIreland.fromJson(Map<String, dynamic> json) {
    division = json['division'];
    events = List.from(json['events']).map((e) => Events.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['division'] = division;
    _data['events'] = events.map((e) => e.toJson()).toList();
    return _data;
  }
}
