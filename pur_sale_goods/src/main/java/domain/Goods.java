package domain;

import lombok.Data;

@Data
public class Goods {
  private int id;
  private String name;
  private double purprice;
  private int count;
  private double saleprice;
  private String data;
  private double income;
}
