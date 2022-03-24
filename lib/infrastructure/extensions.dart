
import 'dart:convert';

extension MapX<K,V> on Map<K,V>{
	/// updates or adds the field to the map and return the new map
	Map<K,V> putOrUpdate(K key, V Function() put) {
		update(key, (_) => put(), ifAbsent: put);
		return this;
	}
	
	String get toJson => jsonEncode(this);
}
