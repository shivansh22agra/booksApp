class Lead {
  CustomerRates? customerRates;
  String? imageUrl;
  List<dynamic>? labels;
  String? createdAt;
  dynamic invoiceAddress;
  int? totalAppts;
  int? completedAppts;
  int? totalInvoice;
  int? invoiceCollectedThisMonth;
  int? invoiceCollectedSoFar;
  int? invoiceDueCount;
  String? id;
  String? notaryId;
  String? firstName;
  String? email;
  int? phoneNumber;
  String? type;
  List<dynamic>? notes;
  List<dynamic>? knownContacts;
  int? v;
  CompanyId? companyId;
  String? companyName;

  Lead({
    this.customerRates,
    this.imageUrl,
    this.labels,
    this.createdAt,
    this.invoiceAddress,
    this.totalAppts,
    this.completedAppts,
    this.totalInvoice,
    this.invoiceCollectedThisMonth,
    this.invoiceCollectedSoFar,
    this.invoiceDueCount,
    this.id,
    this.notaryId,
    this.firstName,
    this.email,
    this.phoneNumber,
    this.type,
    this.notes,
    this.knownContacts,
    this.v,
    this.companyId,
    this.companyName,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
        customerRates: json["customerRates"] == null
            ? null
            : CustomerRates.fromJson(json["customerRates"]),
        imageUrl: json["imageURL"],
        labels: json["labels"] == null
            ? []
            : List<dynamic>.from(json["labels"]!.map((x) => x)),
        createdAt: json["createdAt"],
        invoiceAddress: json["invoiceAddress"],
        totalAppts: json["totalAppts"],
        completedAppts: json["completedAppts"],
        totalInvoice: json["totalInvoice"],
        invoiceCollectedThisMonth: json["invoiceCollectedThisMonth"],
        invoiceCollectedSoFar: json["invoiceCollectedSoFar"],
        invoiceDueCount: json["invoiceDueCount"],
        id: json["_id"],
        notaryId: json["notaryId"],
        firstName: json["firstName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        type: json["type"],
        notes: json["notes"] == null
            ? []
            : List<dynamic>.from(json["notes"]!.map((x) => x)),
        knownContacts: json["knownContacts"] == null
            ? []
            : List<dynamic>.from(json["knownContacts"]!.map((x) => x)),
        v: json["__v"],
        companyId: json["companyId"] == null
            ? null
            : CompanyId.fromJson(json["companyId"]),
        companyName: json["companyName"],
      );
}

class CompanyId {
  dynamic invoiceAddress;
  String? photoUrl;
  List<dynamic>? notes;
  List<dynamic>? orderEmailAddress;
  int? invoiceCollectedThisMonth;
  int? invoiceCollectedSoFar;
  int? invoiceDueCount;
  List<String>? contacts;
  int? defaultInvoiceAmount;
  int? totalAppts;
  int? completedAppts;
  int? totalInvoice;
  String? createdAt;
  String? id;
  String? userId;
  String? name;
  String? email;
  int? phoneNumber;
  List<dynamic>? knownContacts;
  int? v;

  CompanyId({
    this.invoiceAddress,
    this.photoUrl,
    this.notes,
    this.orderEmailAddress,
    this.invoiceCollectedThisMonth,
    this.invoiceCollectedSoFar,
    this.invoiceDueCount,
    this.contacts,
    this.defaultInvoiceAmount,
    this.totalAppts,
    this.completedAppts,
    this.totalInvoice,
    this.createdAt,
    this.id,
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.knownContacts,
    this.v,
  });

  factory CompanyId.fromJson(Map<String, dynamic> json) => CompanyId(
        invoiceAddress: json["invoiceAddress"],
        photoUrl: json["photoURL"],
        notes: json["notes"] == null
            ? []
            : List<dynamic>.from(json["notes"]!.map((x) => x)),
        orderEmailAddress: json["orderEmailAddress"] == null
            ? []
            : List<dynamic>.from(json["orderEmailAddress"]!.map((x) => x)),
        invoiceCollectedThisMonth: json["invoiceCollectedThisMonth"],
        invoiceCollectedSoFar: json["invoiceCollectedSoFar"],
        invoiceDueCount: json["invoiceDueCount"],
        contacts: json["contacts"] == null
            ? []
            : List<String>.from(json["contacts"]!.map((x) => x)),
        defaultInvoiceAmount: json["defaultInvoiceAmount"],
        totalAppts: json["totalAppts"],
        completedAppts: json["completedAppts"],
        totalInvoice: json["totalInvoice"],
        createdAt: json["createdAt"],
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        knownContacts: json["knownContacts"] == null
            ? []
            : List<dynamic>.from(json["knownContacts"]!.map((x) => x)),
        v: json["__v"],
      );
}

class CustomerRates {
  List<dynamic>? others;

  CustomerRates({
    this.others,
  });

  factory CustomerRates.fromJson(Map<String, dynamic> json) => CustomerRates(
        others: json["others"] == null
            ? []
            : List<dynamic>.from(json["others"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "others":
            others == null ? [] : List<dynamic>.from(others!.map((x) => x)),
      };
}
