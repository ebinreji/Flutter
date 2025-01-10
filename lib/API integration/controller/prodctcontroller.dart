import 'package:get/get.dart';
import 'package:julyfultterproject/API%20integration/service/api_service.dart';

class ProductController extends GetxController{
  var isloading = true.obs;
  var productList = [].obs;

  @override
  void onInit(){
    getProducts();
    super.onInit();
  }
  void getProducts() async{
    try{
       var products = await HttpService.fetchProducts();
       if(products !=null){
         productList.value=products;
       }
    }
    catch(e){
      print(e);
    }finally{
      isloading(false);
    }
  }

}