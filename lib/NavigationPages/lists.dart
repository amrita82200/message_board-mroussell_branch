import 'package:flutter/material.dart';
import 'package:message_board_app/NavigationPages/messages.dart';

//class MessagesPage extends StatelessWidget {
class MessagesPage extends StatefulWidget {
  final Color color;

  MessagesPage(this.color);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  //@override
  List<ListEntry> listItems = [
    ListEntry('M&Ms', 'mnm.jpeg', 'Candy Lovers'),
    ListEntry('Hot Fries', 'hotfries.jpeg', 'Chesters vs. Andy Capp'),
    ListEntry('Blueberries', 'blueberries.jpeg', 'Healthy Living'),
    ListEntry('Red Bull', 'redbull.jpeg', 'Late Nights?'),
  ];

  void gotomessages() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BoardPage(Colors.black)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text('Choose a Message Board'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  tileColor: Colors.blue,
                  onTap: gotomessages,
                  title: Text(listItems[index].title),
                  subtitle: Text(listItems[index].description),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${listItems[index].icon}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class ListEntry {
  final String title;
  final String icon;
  final String description;

  ListEntry(this.title, this.icon, this.description);
}
