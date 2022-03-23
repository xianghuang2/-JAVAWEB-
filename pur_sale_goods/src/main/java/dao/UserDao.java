package dao;

import domain.*;

import java.util.List;

public interface UserDao {
  //根据用户名查询用户信息
  public User findById(int i);
  
  public void save(User user);
  
  User findByIdPassword(loginUser loginUser);
  
  List<User> findManagerxinxi();
  
  List<Goods> findGoods();
  
  String findname(loginUser loginUser);
  
  void salegoods(String goodsname, String num, int cid);
  
  void purgoods(String goodsname, String num, int cid);
  
  List<User> findCustomerxinxi();
  
  void delUserById(int id);
  
  void updatesaleprice(int goodid, double saleprice);
  
  List<pur_sale_count> findpsc(String starttime, String endtime);
  
  List<pur_sale_income> findpsi(String starttime, String endtime);
}
