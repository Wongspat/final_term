// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Info info;
    List<Result> results;

    Welcome({
        required this.info,
        required this.results,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        info: Info.fromJson(json["info"]),
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Info {
    int count;
    int pages;
    String nextPage;
    dynamic prevPage;

    Info({
        required this.count,
        required this.pages,
        required this.nextPage,
        required this.prevPage,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next_page": nextPage,
        "prev_page": prevPage,
    };
}

class Result {
    int id;
    String name;
    String? img;
    List<String> alias;
    List<Species> species;
    Gender gender;
    dynamic age;
    Height height;
    List<Relative> relatives;
    String birthplace;
    Residence residence;
    Status status;
    Occupation occupation;
    List<Group> groups;
    List<String> roles;
    List<String> episodes;

    Result({
        required this.id,
        required this.name,
        this.img,
        required this.alias,
        required this.species,
        required this.gender,
        required this.age,
        required this.height,
        required this.relatives,
        required this.birthplace,
        required this.residence,
        required this.status,
        required this.occupation,
        required this.groups,
        required this.roles,
        required this.episodes,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        alias: List<String>.from(json["alias"].map((x) => x)),
        species: List<Species>.from(json["species"].map((x) => speciesValues.map[x]!)),
        gender: genderValues.map[json["gender"]]!,
        age: json["age"],
        height: heightValues.map[json["height"]]!,
        relatives: List<Relative>.from(json["relatives"].map((x) => Relative.fromJson(x))),
        birthplace: json["birthplace"],
        residence: residenceValues.map[json["residence"]]!,
        status: statusValues.map[json["status"]]!,
        occupation: occupationValues.map[json["occupation"]]!,
        groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
        roles: List<String>.from(json["roles"].map((x) => x)),
        episodes: List<String>.from(json["episodes"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "alias": List<dynamic>.from(alias.map((x) => x)),
        "species": List<dynamic>.from(species.map((x) => speciesValues.reverse[x])),
        "gender": genderValues.reverse[gender],
        "age": age,
        "height": heightValues.reverse[height],
        "relatives": List<dynamic>.from(relatives.map((x) => x.toJson())),
        "birthplace": birthplace,
        "residence": residenceValues.reverse[residence],
        "status": statusValues.reverse[status],
        "occupation": occupationValues.reverse[occupation],
        "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "episodes": List<dynamic>.from(episodes.map((x) => x)),
    };
}

enum Gender {
    AMBIGUOUS_9,
    FEMALE,
    MALE,
    UNKNOWN
}

final genderValues = EnumValues({
    "Ambiguous[9]": Gender.AMBIGUOUS_9,
    "Female": Gender.FEMALE,
    "Male": Gender.MALE,
    "unknown": Gender.UNKNOWN
});

class Group {
    Name name;
    List<SubGroup> subGroups;

    Group({
        required this.name,
        required this.subGroups,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        name: nameValues.map[json["name"]]!,
        subGroups: List<SubGroup>.from(json["sub_groups"].map((x) => subGroupValues.map[x]!)),
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "sub_groups": List<dynamic>.from(subGroups.map((x) => subGroupValues.reverse[x])),
    };
}

enum Name {
    SCOUT_REGIMENT
}

final nameValues = EnumValues({
    "Scout Regiment": Name.SCOUT_REGIMENT
});

enum SubGroup {
    KLAUS_SQUAD,
    SPECIAL_OPERATIONS_SQUAD,
    SQUAD_MICHE
}

final subGroupValues = EnumValues({
    "Klaus Squad": SubGroup.KLAUS_SQUAD,
    "Special Operations Squad": SubGroup.SPECIAL_OPERATIONS_SQUAD,
    "Squad Miche": SubGroup.SQUAD_MICHE
});

enum Height {
    THE_160_CM_AT_THE_WITHERS,
    THE_60_M_COLOSSAL_TITAN_FORM,
    UNKNOWN
}

final heightValues = EnumValues({
    "160 cm (at the withers)": Height.THE_160_CM_AT_THE_WITHERS,
    "60 m (Colossal Titan form)": Height.THE_60_M_COLOSSAL_TITAN_FORM,
    "unknown": Height.UNKNOWN
});

enum Occupation {
    HORSE,
    SOLDIER,
    THUG
}

final occupationValues = EnumValues({
    "Horse": Occupation.HORSE,
    "Soldier": Occupation.SOLDIER,
    "Thug": Occupation.THUG
});

class Relative {
    String family;
    List<String> members;

    Relative({
        required this.family,
        required this.members,
    });

    factory Relative.fromJson(Map<String, dynamic> json) => Relative(
        family: json["family"],
        members: List<String>.from(json["members"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "family": family,
        "members": List<dynamic>.from(members.map((x) => x)),
    };
}

enum Residence {
    UNKNOWN,
    WALL_ROSE,
    WALL_SINA
}

final residenceValues = EnumValues({
    "unknown": Residence.UNKNOWN,
    "Wall Rose": Residence.WALL_ROSE,
    "Wall Sina": Residence.WALL_SINA
});

enum Species {
    HORSE,
    HUMAN,
    INTELLIGENT_TITAN,
    TITAN_FORMERLY_HUMAN
}

final speciesValues = EnumValues({
    "Horse": Species.HORSE,
    "Human": Species.HUMAN,
    "Intelligent Titan": Species.INTELLIGENT_TITAN,
    "Titan (formerly human)": Species.TITAN_FORMERLY_HUMAN
});

enum Status {
    ALIVE,
    DECEASED,
    UNKNOWN
}

final statusValues = EnumValues({
    "Alive": Status.ALIVE,
    "Deceased": Status.DECEASED,
    "Unknown": Status.UNKNOWN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
