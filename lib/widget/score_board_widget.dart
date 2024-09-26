import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({super.key});

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  final _scoreCollRef = FirebaseFirestore.instance
      .collection('scores')
      .where("score", isNotEqualTo: 0)
      .orderBy("score", descending: false)
      .withConverter<Score>(
        fromFirestore: (snapshots, _) => Score.fromJson(snapshots.data()!),
        toFirestore: (score, _) => score.toJson(),
      );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 252, 252, 252),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
            width: 7,
          )),
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(
              child: Text(
            "Score Board",
            style: TextStyle(
              fontSize: 52,
              letterSpacing: 2,
            ),
          )),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Score>>(
              stream: _scoreCollRef.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final data = snapshot.requireData;

                return ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    return ScoreCard(
                      data.docs[index].data(),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.redAccent)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Exit',
                style: TextStyle(
                    fontSize: 40, letterSpacing: 2, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// move to new file

class ScoreCard extends StatelessWidget {
  final Score score;
  const ScoreCard(this.score, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Text(score.name), Text("${score.score}")],
      ),
    );
  }
}

@immutable
class Score {
  const Score({required this.name, required this.score});
  final String name;
  final int score;
  Score.fromJson(Map<String, Object?> json)
      : this(name: (json['name'] as String), score: json['score'] as int);
  Map<String, Object?> toJson() {
    return {'name': name, 'score': score};
  }
}
