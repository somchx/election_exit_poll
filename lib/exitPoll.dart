import 'package:election_exit_poll_620710654/models/candidate_list.dart';
import 'package:election_exit_poll_620710654/services/api.dart';
import 'package:flutter/material.dart';

import 'CandidateResult.dart';
import 'models/candidate_score.dart';

class Poll extends StatefulWidget {
  static const routeName = '/poll';

  const Poll({Key? key}) : super(key: key);

  @override
  _PollState createState() => _PollState();
}

class _PollState extends State<Poll> {
  Future<List<Candidate>>? _futureMemberlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              image: const AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              child: Container(
                child: Column(
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
                    Text(
                      'EXIT POLL',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(34.0),
                      child: Text(
                        'เลือกตั้ง อบต.',
                        style: TextStyle(fontSize: 27.0, color: Colors.white),
                      ),
                    ),
                    Text(
                      'รายชื่อผู้สมัครเลือกตั้ง',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    Text(
                      'นายองค์การบริหารส่วนตำบลเขาพระ',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    Text(
                      'อำเภอเมืองนครนายก จังหวัดนครนายก',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Candidate>>(
                future: _futureMemberlist,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                     return Column(
                       children: [
                         TextButton(
                           onPressed: _handleClickVoted(1),
                           child: Text('นาย สุรเดช สังฆธรรม',style: TextStyle (color: Colors.white),),
                         ),TextButton(
                           onPressed: _handleClickVoted(2),
                           child: Text('นาย บุญญวัฒน์ หัสสากร',style: TextStyle (color: Colors.white),),
                         ),
                       ],
                     );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right:8.0 ),
              child: ElevatedButton(
                onPressed: _handleClickResult,
                child: Text('ดูผล'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Candidate>> _loadMember() async {
    List list = await Api().fetch('exit_poll');
    var candidateList = list.map((item) => Candidate.fromJson(item)).toList();
    return candidateList;
  }

  @override
  initState() {
    super.initState();
    _futureMemberlist = _loadMember();
  }

  _handleClickResult() {
    Navigator.pushNamed(
      context,
      Result.routeName,
      arguments: Score,
    );
  }
  _handleClickVoted(num) async {
    print('$num');
    var answer = await _vote(num);
  }
  Future<List<dynamic>?> _vote(num) async {
    try {
      var answer = (await Api().submit('exit_poll', {'candidateNumber': num})) as List<dynamic>;
      return answer;
    } catch (e) {
      print(e);

      return null;
    } finally {
      setState(() {});
    }
  }
  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            TextButton(
              child: const Text('OK'), // ปุ่ม OK ใน dialog
              onPressed: () {
                Navigator.of(context).pop(); // ปิด dialog
              },
            ),
          ],
        );
      },
    );
  }
}
