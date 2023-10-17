/// [OdooRecord] is immutable representation of Odoo record.
class OdooRecord {
  final int id;
  final String lastUpdate;

  /// Creates JSON from [OdooRecord] compatible with Odoo's create() and write().
  /// In opposite to [toJson()] it should represent relational fields as integer
  /// instad of tuple (id, name).
  Map<String, dynamic> toVals() {
    return {'id': id, '__last_update': lastUpdate};
  }

  /// Creates JSON from [OdooRecord] compatible with [fromJson].
  /// Used to cache records.
  Map<String, dynamic> toJson() {
    // keys must match odoo field names
    return {'id': id, '__last_update': lastUpdate};
  }

  /// Creates [OdooRecord] from JSON returned by search_read() or cache.
  static OdooRecord fromJson(Map<String, Object> json) {
    // keys must match odoo field names
    return OdooRecord(json['id'] as int, json['__last_update'] as String);
  }

  /// Deprecated. static properties can not be inherited by children
  /// override oFields in odoo_repository instead
  /// List of fields to fetch
  // static List<String> get oFields => ['id', '__last_update'];

  const OdooRecord(this.id, this.lastUpdate);
}
