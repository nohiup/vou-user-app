class EventParticipants {
  int id; // Primary key for this table
  int eventId; // Foreign key referencing Events.event_id
  String userId; // Foreign key referencing User.user_id
  int playerCredit; // Foreign key referencing PlayCredits.credits_available
  int quantityV;
  int quantityO;
  int quantityU;
  int quantityC;
  int quantityH;
  int quantityE;
  int quantityR;

  // Constructor to initialize the fields
  EventParticipants({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.playerCredit,
    required this.quantityV,
    required this.quantityO,
    required this.quantityU,
    required this.quantityC,
    required this.quantityH,
    required this.quantityE,
    required this.quantityR,
  });

  // Method to create an EventParticipants instance from a map (e.g., from JSON)
  factory EventParticipants.fromJson(Map<String, dynamic> json) {
    return EventParticipants(
      id: json['id'],
      eventId: json['eventId'],
      userId: json['userId'],
      playerCredit: json['playerCredit'],
      quantityV: json['quantityV'],
      quantityO: json['quantityO'],
      quantityU: json['quantityU'],
      quantityC: json['quantityC'],
      quantityH: json['quantityH'],
      quantityE: json['quantityE'],
      quantityR: json['quantityR'],
    );
  }

  // Method to convert EventParticipants instance to a map (e.g., for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventId': eventId,
      'userId': userId,
      'playerCredit': playerCredit,
      'quantityV': quantityV,
      'quantityO': quantityO,
      'quantityU': quantityU,
      'quantityC': quantityC,
      'quantityH': quantityH,
      'quantityE': quantityE,
      'quantityR': quantityR,
    };
  }
}
