import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:localads/screens/home_screen.dart';

class Chat_screen extends StatelessWidget {
  const Chat_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text("Chat"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.search,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Form(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "type your research here..."),
                        ),
                      ),
                    )
                  ],
                ),
                height: 45,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromARGB(255, 252, 250, 250),
                ),
              ),
              Conversation('Manfred', 'yo l article est toujours la??',
                  Icons.account_box_rounded),
              Conversation("Nzepa", "tu peux me gerer un flyers la?",
                  Icons.account_box_rounded),
              Conversation(
                  "Zache", "iphone 14 a 25k", Icons.account_box_rounded)
              // Container(
              //   margin: EdgeInsets.only(bottom: 10),
              //   height: 70,
              //   width: 350,
              //   color: Colors.white,
              // ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 10),
              //   height: 70,
              //   width: 350,
              //   color: Colors.white,
              // ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 10),
              //   height: 70,
              //   width: 350,
              //   color: Colors.white,
              // ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 10),
              //   height: 70,
              //   width: 350,
              //   color: Colors.white,
              // ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 10),
              //   height: 70,
              //   width: 350,
              //   color: Colors.white,
              // ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 10),
              //   height: 70,
              //   width: 350,
              //   color: Colors.white,
              // ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 10),
              //   height: 70,
              //   width: 350,
              //   color: Colors.white,
              // )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(),
          ],
        ),
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home_sceen()));
              },
              child: Icon(
                Icons.home,
              ),
            ),
            Icon(
              Icons.chat_rounded,
            ),

            Container(
              height: 30,
              width: 30,
            ),
            // Icon(
            //   Icons.add,
            // ),
            Icon(
              Icons.heart_broken_rounded,
            ),
            Icon(
              Icons.person,
            )
          ],
        ),
      ),
    );
  }

  Container Conversation(nom, comment, icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      height: 70,
      // width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: 50,
            child: Icon(
              icon,
              size: 50,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      nom,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      comment,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            height: 20,
            width: 50,
            child: Text("1 New"),
          )
        ],
      ),
    );
  }
}
