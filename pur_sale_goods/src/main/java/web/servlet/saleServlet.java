package web.servlet;

import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/saleServlet")
public class saleServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    String goodsname = request.getParameter("id");
    String num = request.getParameter("num");
    String cd = request.getParameter("cid");
    int cid = Integer.parseInt(cd);
    
    UserService userService = new UserServiceImpl();
    userService.salegoods(goodsname, num, cid);
    
    request.getRequestDispatcher("/customergoodsServlet").forward(request, response);
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request, response);
  }
}
