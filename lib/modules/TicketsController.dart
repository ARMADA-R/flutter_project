import 'package:experienceapp/modules/app_determinants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';


class TicketController {


  Future<bool> sentParentToAdminTicket({
    required String ticketText,
    required String department,
    required String priority,
    required String parentId ,
    context,
  }) async {
    bool status = false;
    var url = Uri.parse('https://rafi.nobalaa.com/CodeSchoolSystem/Tickets/AddParentAdminTicket');
    var response = await http.post(url, headers: {
      "authorization" : AppDeterminants().token
    }, body: {
      'ticket_text': ticketText,
      'department': department,
      'prority':priority,
      'parent_id':parentId,
    } );

    if (response.statusCode == 200) {
      status = true;
      print (status);
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green[600],
          content: Text(
            jsonResponse['msg'],
            textAlign: TextAlign.center,
          ),
          duration: Duration(milliseconds: 4000),
        ));
      }

    }
    else {
      print(status);
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red[600],
          content: Text(
            jsonResponse['msg'],
            textAlign: TextAlign.center,
          ),
          duration: Duration(milliseconds: 4000),
        ));
      }
    }
    return status;
  }

  Future<bool> sentParentToSchoolTicket({
    required String ticketText,
    required String department,
    required String schoolId,
    required String priority,
    required String parentId ,
    context,
    String type = "",
  }) async {
    bool status = false;
    var url = Uri.parse('https://rafi.nobalaa.com/CodeSchoolSystem/Tickets/AddParentSchoolTicket');
    var response = await http.post(url, headers: {
      "authorization" : AppDeterminants().token
    }, body: {
      'ticket_text': ticketText,
      'school_id' : schoolId,
      'department': department,
      'type':type,
      'prority':priority,
      'parent_id':parentId,
    } );

    if (response.statusCode == 200) {
      status = true;
      print (status);
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green[600],
          content: Text(
            jsonResponse['msg'],
            textAlign: TextAlign.center,
          ),
          duration: Duration(milliseconds: 4000),
        ));
      }

    }
    else {
      print(status);
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red[600],
          content: Text(
            jsonResponse['msg'],
            textAlign: TextAlign.center,
          ),
          duration: Duration(milliseconds: 4000),
        ));
      }
    }
    return status;
  }
}

