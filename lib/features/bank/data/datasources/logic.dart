import 'package:bank/features/bank/data/models/clients.dart';
import 'package:bank/features/bank/data/models/users.dart';

import 'package:bank/features/bank/presentation/bloc/delcli.dart';
import 'package:bank/features/bank/presentation/bloc/filling.dart';
import 'package:bank/features/bank/presentation/bloc/upcli.dart';
import 'package:bank/features/bank/presentation/pages/addclients.dart';
import 'package:bank/features/bank/presentation/pages/adduserpage.dart';
import 'package:bank/features/bank/presentation/pages/clientspage.dart';
import 'package:bank/features/bank/presentation/pages/homepage.dart';
import 'package:bank/features/bank/presentation/pages/permissionpage.dart';
import 'package:bank/features/bank/presentation/pages/signin.dart';
import 'package:bank/features/bank/presentation/pages/signup.dart';
import 'package:bank/features/bank/presentation/pages/usersetingpage.dart';
import 'package:bank/features/bank/presentation/pages/userspage.dart';
import 'package:bank/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum enbank {
  show_clients,
  add_client,

  user_settings,
  logout
}

enum enuser { show_users, add_user, conrol_permission }

bool addusers = false;
bool readuser = false;
bool updateusers = false;
bool deletusers = false;
Users? currentuser;
List userslist = [
  Users(
    email: "admin",
    password: "1234",
    permission: 15,
  )
];
List clientslist = [
  Clients(
    name: 'abdo',
    balance: 5000,
  ),
];
bool isuserfound(Users users) {
  for (int i = 0; i < userslist.length; i++) {
    if (users.email == userslist[i].email) {
      return true;
    }
  }
  return false;
}

void navigate(BuildContext context, Function() newpage) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => newpage()));
}

void navigaterepl(BuildContext context, Function() newpage) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => newpage()));
}

bool ispermission(int number) {
  return (number & currentuser!.permission) == number;
}

void showmessage(String message, BuildContext context, Function() myfun) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel")),
            TextButton(onPressed: myfun, child: Text("Ok"))
          ],
        );
      });
}

void signup(BuildContext context, GlobalKey<FormState> formkey,
    TextEditingController email, TextEditingController password) {
  Users users = Users(
    email: email.text,
    password: password.text,
    permission: 0,
  );
  if (formkey.currentState!.validate()) {
    if (!isuserfound(users)) {
      context.read<Filling>().fill(userslist, users);
      email.clear();
      password.clear();
      navigate(context, () => Signin());
    } else {
      showmessage("email already in use❗", context, () {
        Navigator.of(context).pop();
        navigate(context, () => Signin());
      });
    }
  }
}

int getindex(String name) {
  for (int i = 0; i < userslist.length; i++) {
    if (userslist[i].email == name) {
      return i;
    }
  }
  return -1;
}

void addtobalance(GlobalKey<FormState> formkey, TextEditingController balance,
    int index, BuildContext context) {
  if (ispermission(1)) {
    if (formkey.currentState!.validate()) {
      int number = int.tryParse(balance.text)!;

      clientslist[index].balance += number;
      navigate(context, () => Clientspage());
    }
  } else {
    showmessage("you don't have permissoin🚓😈", context, () {
      Navigator.of(context).pop();
    });
  }
}

void withdraw(GlobalKey<FormState> formkey, TextEditingController balance,
    int index, BuildContext context) {
  if (ispermission(1) || currentuser!.email == "amdin") {
    if (formkey.currentState!.validate()) {
      int number = int.tryParse(balance.text)!;
      if (number <= clientslist[index].balance) {
        clientslist[index].balance -= number;
        navigate(context, () => Clientspage());
      }
    } else {
      showmessage("you don't have enough blance", context, () {
        Navigator.of(context).pop();
      });
    }
  } else {
    showmessage("you don't have permissoin🚓😈", context, () {
      Navigator.of(context).pop();
    });
  }
}

void signin(BuildContext context, GlobalKey<FormState> formkey,
    TextEditingController email, TextEditingController password)async {
  int index = getindex(email.text);

  Users users = Users(
      email: email.text,
      password: password.text,
      permission: userslist[index].permission);
  if (formkey.currentState!.validate()) {
    if (isuserfound(users)) {
      currentuser = users;
      email.clear();
      password.clear();
      navigaterepl(context, () => Homepage());
        await stored.setInt("id", 1);
    } else {
      showmessage("email not found try signup👌", context, () {
        Navigator.of(context).pop();
        navigate(context, () => Signup());
      });
    }
    email.clear();
    password.clear();
  }
}

void addclients(BuildContext context, TextEditingController name,
    TextEditingController balance, List mylist) {
  if (ispermission(2) || currentuser!.email == "admin") {
    Clients clients = Clients(
      name: name.text,
      balance: int.tryParse(balance.text),
    );

    context.read<Filling>().fill(mylist, clients);
    Navigator.of(context).pop();
  } else {
    print(currentuser!.permission);
    showmessage("you don't have permissoin🚓😈", context, () {
      Navigator.of(context).pop();
    });
  }
}

void delete(BuildContext context, dynamic clients, List mylist) {
  if (ispermission(4) || currentuser!.email == "admin") {
    context.read<Delcli>().delete(mylist, clients);
  } else {
    showmessage("you don't have permissoin🚓😈", context, () {
      Navigator.of(context).pop();
    });
  }
}

void update(
  BuildContext context,
  int index,
  TextEditingController name,
  TextEditingController balance,
  List mylist,
) {
  if (ispermission(8) || currentuser!.email == "admin") {
    Clients clients = Clients(
      name: name.text,
      balance: int.tryParse(balance.text),
    );
    context.read<Upcli>().update(index, mylist, clients);
    Navigator.of(context).pop();
    navigate(context, () => Clientspage());
  } else {
    showmessage("you don't have permissoin🚓😈", context, () {
      Navigator.of(context).pop();
    });
  }
}

void adduser(BuildContext context, TextEditingController email,
    TextEditingController password) {
  if (ispermission(2) || currentuser!.email == "admin") {
    Users users =
        Users(email: email.text, password: password.text, permission: 0);
    context.read<Filling>().fill(userslist, users);
    navigate(context, () => Userspage());
  } else {
    showmessage("you don't have permissoin🚓😈", context, () {
      Navigator.of(context).pop();
    });
  }
}

void updateuser(BuildContext context, TextEditingController email, int index,
    TextEditingController password) {
  if (ispermission(8) || currentuser!.email == "admin") {
    Users users = Users(email: email.text, password: email.text, permission: 0);
    context.read<Upcli>().update(index, userslist, users);
    navigate(context, () => Userspage());
  } else {
    showmessage("you don't have permissoin🚓😈", context, () {
      Navigator.of(context).pop();
    });
  }
}

void performuserstates(
  int index,
  BuildContext context,
) {
  enuser user = enuser.values[index];
  switch (user) {
    case enuser.add_user:
      navigate(context, () => Adduserpage());
      break;
    case enuser.show_users:
      navigate(context, () => Userspage());
      break;
    case enuser.conrol_permission:
      navigate(context, () => Permissionpage());
      break;

    default:
  }
}

void performprogram(int index, BuildContext context) {
  enbank bank = enbank.values[index];
  switch (bank) {
    case enbank.show_clients:
      navigate(context, () => Clientspage());
      break;
    case enbank.add_client:
      navigate(context, () => Addclients());
      break;
    case enbank.user_settings:
      {
        if (ispermission(1) || currentuser!.email == "admin") {
          navigate(context, () => Usersetingpage());
        }else {
    showmessage("you don't have permissoin🚓😈", context, () {
      Navigator.of(context).pop();
    });
  }
      }

      break;
    case enbank.logout:
      navigaterepl(context, () => Signup());
      break;
    default:
  }
}
