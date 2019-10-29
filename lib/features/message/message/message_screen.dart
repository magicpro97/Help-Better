import 'package:better_help/common/data/models/message.dart';
import 'package:better_help/common/data/models/message_group.dart';
import 'package:better_help/common/ui/screen_loading.dart';
import 'package:better_help/features/message/message/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_bar.dart';
import 'message_item.dart';

class MessageScreen extends StatefulWidget {
  final String groupId;

  const MessageScreen({Key key, @required this.groupId})
      : assert(groupId != null),
        super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final messageBloc = MessageBloc();

  @override
  void initState() {
    super.initState();
    messageBloc.initStream(widget.groupId);
  }

  @override
  void dispose() {
    super.dispose();
    messageBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: StreamBuilder<MessageGroup>(
            stream: messageBloc.messageGroupStream,
            builder: (context, snapshot) {
              return Text(snapshot.hasData ? snapshot.data.displayName : '');
            }),
      ),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: StreamBuilder<List<Message>>(
                    stream: messageBloc.messageListStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Something went wrong.'),
                        );
                      }

                      if (!snapshot.hasData) {
                        return ScreenLoading();
                      }

                      final messages = snapshot.data;

                      return ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        itemBuilder: (context, index) =>
                            MessageItem(
                              message: messages[index],
                            ),
                        itemCount: messages.length,
                      );
                    }),
              ),
              ChatBar(),
            ],
          ),
        ),
      ),
    );
  }
}
