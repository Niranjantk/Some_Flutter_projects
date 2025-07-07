import 'package:flutter/material.dart';

class MiCardApp extends StatelessWidget {
  const MiCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: 
        AssetImage('assets/images/background1.jpg'),
        fit: BoxFit.fitHeight)
      ),
     child: Scaffold(
      backgroundColor: const Color.fromARGB(0, 255, 193, 7),
      appBar: AppBar(
        leading: Icon(Icons.ac_unit_sharp),
        backgroundColor: const Color.fromARGB(0, 255, 193, 7),
      ),
      body: 
          Center(
            child: Container(
              width: 400,
              height: 500,
              
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 19, 19, 19),
                borderRadius: BorderRadius.circular(20),
                
                
                
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('data'),
                  ),
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMO3VpcdqxLZLgoLD6xGcsB884pl5tHXjKcA&s'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index) => Text('Name'), 
                        separatorBuilder: (context,index)=>Divider(), 
                        itemCount: 3),
                    ),
                  ),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        width: 100,
                        child: FloatingActionButton(onPressed: (){},child: Text('Contact'),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: FloatingActionButton(onPressed: (){},child: Text('Message'),))
                  ],
                )
                  
                ],
              ),
            ),
          )
        
     ),
      
    );
  }
}




// import 'package:flutter/material.dart';

// class MiCardApp extends StatelessWidget {
//   const MiCardApp({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(

     
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/background1.jpg'),
//             fit: BoxFit.fitHeight,
//           ),
//         ),
//       child: Column(
//         children: [
//           TextField(
//             decoration: InputDecoration(hint:Text("data")),
//           )
//         ],
//       ),
//       ),
      
//     );
//   }
// }
