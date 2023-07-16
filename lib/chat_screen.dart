import "package:chat_app/chat_messgae.dart";
import"package:flutter/material.dart";

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override


  final TextEditingController _textcontroller = TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage> [];



  void _handleSubmitted(String text){
    _textcontroller.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget(){
    return IconTheme(
      data: new IconThemeData(
        color: Colors.green
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal:8.0 ),
       child: Row(
        children: [
         Flexible(
             child: TextField(
          decoration: InputDecoration.collapsed(hintText: "Send a message"),
          controller: _textcontroller,
          onSubmitted: _handleSubmitted,
    
        ),
        
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          child: IconButton(onPressed: ()=> _handleSubmitted(_textcontroller.text), icon: Icon(Icons.send)),
        ),
    
        ],
       )
    
      ),
    );
  }


  Widget build(BuildContext context) {
    return Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemBuilder: (_,int index) => _messages[index],
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              ),
              ),
              Divider(height: 1.0,),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: _textComposerWidget()

              ),
        ],
    );
      
  }
}