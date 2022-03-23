package dao.impl;

import dao.UserDao;
import domain.*;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtil;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class UserDaoImpl implements UserDao {
  
  private JdbcTemplate template = new JdbcTemplate(JDBCUtil.getDataSource());
  
  @Override
  public User findById(int i) {
    User user = null;
    try {
      //1.定义sql语句
      String sql = "select * from customer where id = ?";
      
      //2.执行sql
      user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), i);
      
    } catch (DataAccessException e) {
    
    }
    
    return user;
  }
  
  @Override
  public void save(User user) {
    String sql = "insert into customer(id,password,name,sex,email) values (?,?,?,?,?)";
    
    template.update(sql, user.getUid(),
            user.getPassword(),
            user.getName(),
            user.getSex(),
            user.getEmail());
    
    
  }
  
  @Override
  public User findByIdPassword(loginUser loginUser) {
    String sqlc = "select * from customer where id = ? and password = ?";
    String sqlm = "select * from manager where id = ? and password = ?";
    User user = null;
    
    if (loginUser.getLeibie().equals("customer")) {
      try {
        user = template.queryForObject(sqlc, new BeanPropertyRowMapper<User>(User.class), loginUser.getUid(), loginUser.getPassword());
      } catch (DataAccessException e) {
      
      }
    } else {
      try {
        user = template.queryForObject(sqlm, new BeanPropertyRowMapper<User>(User.class), loginUser.getUid(), loginUser.getPassword());
      } catch (DataAccessException e) {
      
      }
    }
    
    return user;
  }
  
  @Override
  public List<User> findManagerxinxi() {
    String sql = "select * from manager";
    List<User> managerxinxi = template.query(sql, new BeanPropertyRowMapper<User>(User.class));
    return managerxinxi;
  }
  
  @Override
  public List<Goods> findGoods() {
    String sql = "select * from goods";
    List<Goods> goods = template.query(sql, new BeanPropertyRowMapper<Goods>(Goods.class));
    return goods;
  }
  
  @Override
  public String findname(loginUser loginUser) {
    String sqlc = "select name from customer where id = ? and password = ?";
    String sqlm = "select name from manager where id = ? and password = ?";
    String name = null;
    
    if (loginUser.getLeibie().equals("customer")) {
      try {
        name = template.queryForObject(sqlc, String.class,
                loginUser.getUid(), loginUser.getPassword());
      } catch (DataAccessException e) {
      
      }
    } else {
      try {
        name = template.queryForObject(sqlm, String.class,
                loginUser.getUid(), loginUser.getPassword());
      } catch (DataAccessException e) {
      
      }
    }
    
    return name;
  }
  
  @Override
  public void salegoods(String goodsname, String num, int cid) {
    String sql = "insert into saleform values(null,?,?,?,?,?)";
    String sql2 = "select id from goods where name = ?";
    int count = Integer.parseInt(num);
    int goodsid = 1;
    if (goodsname.equals("mucai")) {
      goodsid = template.queryForObject(sql2, Integer.class, "木材");
    } else if (goodsname.equals("gangtie")) {
      goodsid = template.queryForObject(sql2, Integer.class, "钢铁");
    } else if (goodsname.equals("boli")) {
      goodsid = template.queryForObject(sql2, Integer.class, "玻璃");
    } else if (goodsname.equals("lvhejin")) {
      goodsid = template.queryForObject(sql2, Integer.class, "铝合金");
    } else if (goodsname.equals("shuz")) {
      goodsid = template.queryForObject(sql2, Integer.class, "树脂");
    } else if (goodsname.equals("fangfumv")) {
      goodsid = template.queryForObject(sql2, Integer.class, "防腐木");
    } else if (goodsname.equals("hunnitu")) {
      goodsid = template.queryForObject(sql2, Integer.class, "混泥土");
    } else if (goodsname.equals("jiaoshui")) {
      goodsid = template.queryForObject(sql2, Integer.class, "胶水");
    } else if (goodsname.equals("lvsuoban")) {
      goodsid = template.queryForObject(sql2, Integer.class, "塑料板");
    } else if (goodsname.equals("xianwei")) {
      goodsid = template.queryForObject(sql2, Integer.class, "竹子纤维");
    } else {
      goodsid = 0;
    }
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String data = sdf.format(new Date());
    template.update(sql, cid, 1, goodsid, count, data);
  }
  
  @Override
  public void purgoods(String goodsname, String num, int cid) {
    String sql = "insert into purform values(null,?,?,?,?,?)";
    String sql2 = "select id from goods where name = ?";
    int count = Integer.parseInt(num);
    int goodsid = 1;
    if (goodsname.equals("mucai")) {
      goodsid = template.queryForObject(sql2, Integer.class, "木材");
    } else if (goodsname.equals("gangtie")) {
      goodsid = template.queryForObject(sql2, Integer.class, "钢铁");
    } else if (goodsname.equals("boli")) {
      goodsid = template.queryForObject(sql2, Integer.class, "玻璃");
    } else if (goodsname.equals("lvhejin")) {
      goodsid = template.queryForObject(sql2, Integer.class, "铝合金");
    } else if (goodsname.equals("shuz")) {
      goodsid = template.queryForObject(sql2, Integer.class, "树脂");
    } else if (goodsname.equals("fangfumv")) {
      goodsid = template.queryForObject(sql2, Integer.class, "防腐木");
    } else if (goodsname.equals("hunnitu")) {
      goodsid = template.queryForObject(sql2, Integer.class, "混泥土");
    } else if (goodsname.equals("jiaoshui")) {
      goodsid = template.queryForObject(sql2, Integer.class, "胶水");
    } else if (goodsname.equals("lvsuoban")) {
      goodsid = template.queryForObject(sql2, Integer.class, "塑料板");
    } else if (goodsname.equals("xianwei")) {
      goodsid = template.queryForObject(sql2, Integer.class, "竹子纤维");
    } else {
      goodsid = 0;
    }
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String data = sdf.format(new Date());
    template.update(sql, goodsid, 1, cid, count, data);
  }
  
  @Override
  public List<User> findCustomerxinxi() {
    String sql = "select * from customer";
    List<User> customerxinxi = template.query(sql, new BeanPropertyRowMapper<User>(User.class));
    return customerxinxi;
  }
  
  @Override
  public void delUserById(int id) {
    String sql = "DELETE FROM customer WHERE id = ?";
    template.update(sql, id);
  }
  
  @Override
  public void updatesaleprice(int goodid, double saleprice) {
    String sql = "UPDATE goods SET saleprice = ?,data=? WHERE id = ?";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String data = sdf.format(new Date());
    template.update(sql, saleprice, data, goodid);
  }
  
  @Override
  public List<pur_sale_count> findpsc(String starttime, String endtime) {
    starttime = "\'" + starttime + "\'";
    endtime = "\'" + endtime + "\'";
    template.execute("call pur_sale_count(" + starttime + "," + endtime + ")");
    String sql = "select * from pur_sale_count";
    System.out.println(starttime);
    List<pur_sale_count> psclist = template.query(sql,
            new BeanPropertyRowMapper<pur_sale_count>(pur_sale_count.class));
    return psclist;
  }
  
  @Override
  public List<pur_sale_income> findpsi(String starttime, String endtime) {
    starttime = "\'" + starttime + "\'";
    endtime = "\'" + endtime + "\'";
    template.execute("call pur_sale_income(" + starttime + "," + endtime + ")");
    String sql = "select * from pur_sale_income";
    System.out.println(starttime);
    List<pur_sale_income> psilist = template.query(sql,
            new BeanPropertyRowMapper<pur_sale_income>(pur_sale_income.class));
    return psilist;
  }
}
