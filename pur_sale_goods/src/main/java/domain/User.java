package domain;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户实体类
 */
@Data
public class User implements Serializable {
  private int uid;//用户id
  private String password;//密码
  private String name;//姓名
  private String sex;//男或女
  private String email;//邮箱
  private String id;//mysql对应id
  
  
}
