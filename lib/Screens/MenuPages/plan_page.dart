import 'package:beep/Providers/ux_control_provider.dart';
import 'package:beep/utils/enums.dart';
import 'package:beep/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanPage extends StatefulWidget {
  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        titleSpacing: 0.1,
        title: Text(
          'Plan',
          style: TextStyle(color: Colors.black, fontFamily: 'NUnito'),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
        child: Consumer<UxControl>(
          builder: (context,choice,_){

            return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom:16.0),
                child: Text(
                  'Your Beeep plan helps cover\noperational costs. ',
                  style: TextStyle(fontSize: 14),
                ),
              ),

              choice.currentPlan == plan.basicPlan ? GestureDetector(
                onTap: (){
                  setState(() {
                   choice.currentPlan = plan.basicPlan;
                  });
                },
                            child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      border: Border.all(
                          color: choice.currentPlan == plan.basicPlan
                              ? Color.fromRGBO(153, 98, 77, 1)
                              : Colors.transparent,
                          width: 2)),
                  width: 312,
                  height: 185,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RadioListTile<plan>(
                        title: const Text(
                          'Basic',
                          style: TextStyle(fontFamily: 'Nunito', fontSize: 20),
                        ),
                        value: plan.basicPlan,
                        groupValue: choice.currentPlan,
                        activeColor: Colors.brown,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (plan value) {
                          setState(() {
                            choice.currentPlan = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                            '1 Beeep buddy\nAccess to pool of lawyers\n1 device'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text.rich(TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: '\n₦1000/', style: TextStyle(fontSize: 16)),
                          TextSpan(text: '3 months', style: TextStyle(fontSize: 14))
                        ])),
                      )
                    ],
                  ),
                ),
              ):
               GestureDetector(
                  onTap: (){
                    setState(() {
                      choice.currentPlan = plan.essentialPlan;
                    });
                  },
                                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(
                            color: choice.currentPlan == plan.essentialPlan
                                ? Color.fromRGBO(153, 98, 77, 1)
                                : Colors.transparent,
                            width: 2)),
                    width: 312,
                    height: 185,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RadioListTile<plan>(
                          title: const Text(
                            'Essential',
                            style: TextStyle(fontFamily: 'Nunito', fontSize: 20),
                          ),
                          value: plan.essentialPlan,
                          groupValue: choice.currentPlan,
                          activeColor: Colors.brown,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (plan value) {
                            setState(() {
                              choice.currentPlan = value;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                              'Unlimited Beeep buddy\nAccess to pool of lawyers\n3 devices'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text.rich(TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: '\n₦3000/', style: TextStyle(fontSize: 16)),
                            TextSpan(text: '1 year', style: TextStyle(fontSize: 14))
                          ])),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              
              Consumer<UxControl>(                
                builder: (context, type,_) {
                  return Padding(
                    padding: const EdgeInsets.only(top:8),
                    child: type.currentPlan == plan.basicPlan ?  CommonButton(text: 'Upgrade Plan', onPressed: ()=>Navigator.pushNamed(context, 'UpgradePlan')) : SizedBox()
                  );
                }
              )
            ],
          );
          },
              
        ),
      ),
    );
  }
}
