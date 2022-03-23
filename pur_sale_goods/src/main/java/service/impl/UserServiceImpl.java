package service.impl;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import domain.*;
import service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
  
  private UserDao userDao = new UserDaoImpl();
  
  //注册用户
  @Override
  public boolean regist(User user) {
    //根据用户名查询用户对象
    User u = userDao.findById(user.getUid());
    
    if (u != null) {
      return false;
    } else {
      //保存用户信息
      userDao.save(user);
      return true;
    }
  }
  
  @Override
  public boolean login(loginUser loginUser) {
    //根据用户名，密码，类别查找用户或管理员
    User u = userDao.findByIdPassword(loginUser);
    
    if (u != null) {
      return true;
    } else {
      return false;
    }
    
  }
  
  @Override
  public List<User> findManagerxinxi() {
    List<User> managerxinxi = userDao.findManagerxinxi();
    if (managerxinxi != null) {
      return managerxinxi;
    }
    return null;
  }
  
  @Override
  public List<Goods> findGoods() {
    List<Goods> goods = userDao.findGoods();
    if (goods != null) {
      return goods;
    }
    return null;
  }
  
  @Override
  public String findname(loginUser loginUser) {
    String name = userDao.findname(loginUser);
    
    if (name != null) {
      return name;
    } else {
      return null;
    }
  }
  
  @Override
  public void salegoods(String goodsname, String num, int cid) {
    userDao.salegoods(goodsname, num, cid);
  }
  
  @Override
  public void purgoods(String goodsname, String num, int cid) {
    userDao.purgoods(goodsname, num, cid);
  }
  
  @Override
  public List<User> findCustomerxinxi() {
    List<User> customerxinxi = userDao.findCustomerxinxi();
    if (customerxinxi != null) {
      return customerxinxi;
    }
    return null;
  }
  
  @Override
  public void delUserById(int id) {
    userDao.delUserById(id);
  }
  
  @Override
  public void updatesaleprice(int goodid, double saleprice) {
    userDao.updatesaleprice(goodid, saleprice);
  }
  
  @Override
  public List<pur_sale_count> callpsc(String starttime, String endtime) {
    List<pur_sale_count> psclist = userDao.findpsc(starttime, endtime);
    if (psclist != null) {
      return psclist;
    }
    return null;
  }
  
  @Override
  public List<pur_sale_income> callpsi(String starttime, String endtime) {
    List<pur_sale_income> psilist = userDao.findpsi(starttime, endtime);
    if (psilist != null) {
      return psilist;
    }
    return null;
  }
  
  
}
