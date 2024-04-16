import 'dart:io';

class Database {
  // Keeps the finalizer itself reachable, otherwise it might be disposed
  // before the finalizer callback gets a chance to run.
  static final Finalizer<DBConnection> _finalizer =
  Finalizer((connection) {
    connection.close();
    print("Finalizer close$connection");
  });

  final DBConnection _connection;

  Database._fromConnection(this._connection);

  factory Database.connect() {
    // Wraps the connection in a nice user API,
    // *and* closes connection if the user forgets to.
    final connection = DBConnection.connect();
    final wrapper = Database._fromConnection(connection);
    // Get finalizer callback when `wrapper` is no longer reachable.
    _finalizer.attach(wrapper, connection, detach: wrapper);
    return wrapper;
  }

  void close() {
    // User requested close.
    _connection.close();
    // Detach from finalizer, no longer needed.
    _finalizer.detach(this);
  }

// Some useful methods.
}

class DBConnection {
  close() {}

  DBConnection.connect();
}
main(){
  var x=[Database.connect()];
   sleep(Duration(seconds: 1));
  x[0].close();
  x.clear();

  for(var i=0;i<10000000;i++){
    x.add(Database.connect());
    if(i%3==-0){
       x.removeLast();
    }

    if(i%100000==-0){
      // sleep(Duration(seconds: 1));
      print(DateTime.now());
    }

  }
}