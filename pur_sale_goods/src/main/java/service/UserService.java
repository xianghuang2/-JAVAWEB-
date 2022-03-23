package service;

import domain.*;

import java.util.List;

public interface UserService {
  boolean regist(User user);
  
  boolean login(loginUser loginUser);
  
  List<User> findManagerxinxi();
  
  List<Goods> findGoods();
  
  String findname(loginUser loginUser);
  
  void salegoods(String goodsname, String num, int cid);
  
  void purgoods(String goodsname, String num, int cid);
  
  List<User> findCustomerxinxi();
  
  void delUserById(int id);
  
  void updatesaleprice(int goodid, double saleprice);
  
  List<pur_sale_count> callpsc(String starttime, String endtime);
  
  List<pur_sale_income> callpsi(String starttime, String endtime);
}
