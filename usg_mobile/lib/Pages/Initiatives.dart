
class Initiative{

  String title = '';

  String description = '';

  String creator = '';

  List signers = <String>[];

  DateTime createDate = DateTime.now();

  Initiative();

  Initiative.fromInitiative(this.title, this.description, this.creator){

    createDate = DateTime(createDate.year, createDate.month, createDate.day);

  }

  void addSigs(String sig){

    if(!signers.contains(sig)){

      signers.add(sig);

    }

  }

  void removeSig(String sig){

    for(int i = 0; i < signers.length; i++){

        if(signers[i] == sig){

          signers.removeAt(i);

          break;

        }

    }

  }

  void printSigs(){

    for(int i = 0; i < signers.length; i++){

      print(signers[i].toString());

    }

  }

}

class VoteData{

  static List alrVotedUsers = <VoterData>[];

  static List userOptions = <String>[];

  static List optionPercents = <double>[];

  static void addOption(String option){ //each time we create one its percent gets made with it

    userOptions.add(option);

    optionPercents.add(0); //all start out at zero, we will add to this value in the actual voting portion

  }

  static void addVotee(String activeVoter, int userPick){//activeVoter = person who has put in input

    bool alrIn = true;

    for(int i = 0; i < alrVotedUsers.length; i++){

      if(alrVotedUsers[i].data.contains(activeVoter) != true){

        alrIn = false;

        break;

      }

    }

    if(alrIn != true || alrVotedUsers.isEmpty == true){

      Map inputFormat = {

        String: activeVoter,

        int: userPick

      };

      alrVotedUsers.add(inputFormat);

    }

  }

}

class VoterData {

  Map data = {

  String: "",

  int: 0

  };

}

class Initiatives{

  static List initiatives = <Initiative>[];

  static void createInit(String title, String description, String creator){

    bool goodToAdd = false;

    Initiative init = Initiative.fromInitiative(title, description, creator);

    if(initiatives.isEmpty == true){

      initiatives.add(init);

    }else{

      for(int i = 0; i < initiatives.length; i++){

        if(initiatives[i].title.toLowerCase() != title.toLowerCase()){

          goodToAdd = true;

        }

      }

    }

    if(goodToAdd == true){

      initiatives.add(init);

    }

  }

  static void printInits(){

      for(int i = 0; i < initiatives.length; i++){

        print(initiatives[i].title);

        print(initiatives[i].description);

      }

  }

  static void removeInitByTitle(String title){

    for(int i = 0; i < initiatives.length; i++){

      if(initiatives[i].title.toLowerCase() == title.toLowerCase()){

        initiatives.removeAt(i);

        break;

      }

    }

  }

  static void removeInitsByCreator(String creator){

    List heretics = <int>[];

    for(int i = 0; i < initiatives.length; i++){

      if(initiatives[i].creator.toLowerCase() == creator.toLowerCase()){

        heretics.add(i);

        break;

      }

    }

    heretics.reversed;

    for(int q = 0; q < heretics.length; q++){

      initiatives.removeAt(q);

    }

  }

  static Initiative getInitByTitle(String title){

    Initiative init = Initiative();

    for(int i = 0; i < initiatives.length; i++){

      if(initiatives[i].title.toLowerCase() == title.toLowerCase()){

        init = initiatives[i];

        break;

      }

    }

    return init;

  }

}

