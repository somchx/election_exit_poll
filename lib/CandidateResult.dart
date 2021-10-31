import 'package:election_exit_poll_620710654/services/api.dart';
import 'package:flutter/material.dart';
import 'models/candidate_list.dart';
import 'models/candidate_score.dart';

class Result extends StatefulWidget {
  static const routeName = '/result';

  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  Future<List<Score>>? _futureResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              image: const AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover
          ),
        ),
        child: FutureBuilder<List<Score>>(
          future: _futureResult,
          builder: (context,snapshot){
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.hasData){
              return SafeArea(
                child: Container(
                  child: Center(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 22.0),
                          child: Image(
                            image: AssetImage('assets/images/vote_hand.png'),
                            width: 100,
                            height: 100,
                            //fit: BoxFit.fill,
                            //fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 22.0),
                          child: Text(
                            'EXIT POLL',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                        Text('RESULT',style: TextStyle(fontSize: 20.0,color: Colors.white),),


                      ],
                    ),
                  ),
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
  Future<List<Score>> _loadMember() async {
    List list = await Api().fetch('exit_poll/result');
    var candidateList = list.map((item) => Score.fromJson(item)).toList();
    return candidateList;
  }
  @override
  initState() {
    super.initState();
    _futureResult = _loadMember();
  }
}
