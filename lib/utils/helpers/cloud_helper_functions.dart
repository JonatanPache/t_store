import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:t_store/utils/exceptions/firebase_exception.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

/// Helper functions for cloud-related operations
class TCloudHelperFunctions {

  /// Helper function to check the state of a single database record
  ///
  /// Returns a Widget based on the state of the snopshot
  /// If data is still loading, it returns a CircularProgressIndicator
  /// if no data is found, it returns a generic 'No data found' message
  /// Otherwise it returns null
  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot){
    if (snapshot.connectionState == ConnectionState.waiting){
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data == null){
      return const Center(child: Text('No data found'));
    }

    if (snapshot.hasError){
      return const Center(child: Text('Something went wrong'));
    }

    return null;
  }


  /// Helper function to check the state of a single database record
  ///
  /// Returns a Widget based on the state of the snopshot
  /// If data is still loading, it returns a CircularProgressIndicator
  /// if no data is found, it returns a generic 'No data found' message
  /// Otherwise it returns null
  static Widget? checkMultiRecordState<T>(
      {required AsyncSnapshot<T> snapshot,
      Widget? loader,
      Widget? error,
      Widget? nothingFound}){
    if (snapshot.connectionState == ConnectionState.waiting){
      if (loader != null) return loader;
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data == null){
      if(nothingFound != null) return nothingFound;
      return const Center(child: Text('No data found'));
    }

    if (snapshot.hasError){
      if (error != null) return error;
      return const Center(child: Text('Something went wrong'));
    }

    return null;
  }


  /// Helper function to check the state of a single database record
  ///
  /// Returns a Widget based on the state of the snopshot
  /// If data is still loading, it returns a CircularProgressIndicator
  /// if no data is found, it returns a generic 'No data found' message
  /// Otherwise it returns null
  static Future<String> checkURLFromFilePathAndName(String path) async{
    try {
      if(path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on TFirebaseException catch (e) {
      throw e.message;
    } on TPlatformException catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


}