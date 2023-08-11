import 'package:flutter/material.dart';
import 'package:interviewproject/apicontroller.dart';
import 'package:interviewproject/apimodel.dart';

class Trial extends StatefulWidget {
  const Trial({Key? key}) : super(key: key);

  @override
  State<Trial> createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  List<PersonalChat> chatlist = [];

  Future<void> fetchChatData() async {
    final chatList = await ApiService().getAllData();
    setState(() {
      chatlist = chatList;
    });
  }

  @override
  void initState() {
    fetchChatData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 32, 102, 233),
        title: Text('ChatApp'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Center(
            child: Text('Personal Chats',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 8),
          Divider(),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: chatlist.length,
              itemBuilder: (context, index) {
                final chat = chatlist[index];
                final time = DateTime.parse(chat.timeSent.toString());
                final formattedTime = "${time.hour}:${time.minute}";

                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, bottom: 8, right: 8, top: 4),
                            child: ClipOval(
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: FadeInImage.assetNetwork(
                                  placeholder:
                                      'assets/images/bus-removebg-preview.png',
                                  image: chat.profileImage.toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(chat.userName.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 8),
                              Text(chat.message.toString(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(formattedTime,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(), // Add Divider
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        elevation: 0.0,
        tooltip: 'Refresh',
        onPressed: () {},
        child: Icon(Icons.refresh, color: Colors.white),
        backgroundColor: Color.fromARGB(255, 32, 102, 233),
      ),
    );
  }
}
