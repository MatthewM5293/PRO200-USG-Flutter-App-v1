
import 'dart:js_util';

class Initiative{

  String title = '';

  String description = '';

  String creator = '';

  List signers = <String>[];

  DateTime createDate = DateTime.now();

  Initiative();

  Initiative.fromInitiative(this.title, this.description, this.creator){}

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

}

class Initiatives{

  static List initiatives = <Initiative>[];

  void createInit(String title, String description, String creator){

    bool goodToAdd = true;

    Initiative init = Initiative.fromInitiative(title, description, creator);

    for(int i = 0; i < initiatives.length; i++){

      if(!initiatives[i].title.toLowerCase() == title.toLowerCase()){

        goodToAdd = false;

      }

    }

    if(goodToAdd == true){

      initiatives.add(init);

    }

  }

  void removeInitByTitle(String title){

    for(int i = 0; i < initiatives.length; i++){

      if(initiatives[i].title.toLowerCase() == title.toLowerCase()){

        initiatives.removeAt(i);

        break;

      }

    }

  }

  void removeInitsByCreator(String creator){

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

  Initiative getInitByTitle(String title){

    Initiative init = newObject();

    for(int i = 0; i < initiatives.length; i++){

      if(initiatives[i].title.toLowerCase() == title.toLowerCase()){

        init = initiatives[i];

        break;

      }

    }

    return init;

  }

}

