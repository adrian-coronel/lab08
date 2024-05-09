import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      initialRoute: Page.route,
      routes: {
        Page.route: (context) => Page(),
        Client.route: (context) => Client(),
      }
    );
    
  }
}


class Page extends StatelessWidget {

  static var route = "/";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ElevatedButton(
          child: Text("Clientes"),
          onPressed: () => {
            Navigator.pushNamed(context, Client.route)
          },
        ) 
      ),
    );
  }
}


class Client extends StatelessWidget {

  static var route = "/clients";

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Clientes"),
      ),
        body: ListView.builder(
          itemCount: clientes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(clientes[index].name),
              subtitle: Text(clientes[index].project),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClientScreen(client: clientes[index]),
                  ),
                )
              },
            );
          }
        )
      )
    );
  }
}

class ClientScreen extends StatelessWidget {
  final Cliente client;

  ClientScreen({required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(client.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Proyecto: ${client.project}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Cliente {
  final String name;
  final String project;

  Cliente({required this.name, required this.project});
}

List<Cliente> clientes = [
  Cliente(
    name: "WIC", 
    project: "WIC Mobile"
  ),
  Cliente(
    name: "Sapiens Consulting", 
    project: "Timesheet"
  ),
  Cliente(
    name: "Tecsup", 
    project: "Seva"
  ),
];

