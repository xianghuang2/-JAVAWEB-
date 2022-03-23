package web.servlet;

import domain.Goods;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/customergoodsServlet")
public class customergoodsServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    request.setCharacterEncoding("utf-8");
    //调用findgoods()查询
    UserService userService = new UserServiceImpl();
    List<Goods> goods = userService.findGoods();

//    System.out.println(goods);
    String name = (String) request.getSession().getAttribute("cname");
    HttpSession session = request.getSession();
    session.setAttribute("cname", name);
    
    request.setAttribute("goods", goods);
    request.setAttribute("name", name);
    request.getRequestDispatcher("/customer.jsp").forward(request, response);
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request, response);
  }
}
