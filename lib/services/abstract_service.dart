import 'package:hive/hive.dart';

abstract class AbstractService{
  Future<List<dynamic>> getListObjects() ;
  Future <dynamic> getObjectById(dynamic id);

}