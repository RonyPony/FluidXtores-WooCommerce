
import 'user_response.dart';

class UsersResponse{
  List<UserResponse> items = new List();

  UsersResponse();

  UsersResponse.fromJsonList(List<dynamic> jsonList){
      if(jsonList == null) return;

      for(var item in jsonList){
          final user  = UserResponse.fromJson(item);
          items.add(user);
      }
  }
}
