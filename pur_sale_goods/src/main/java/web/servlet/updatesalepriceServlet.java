package web.servlet;

import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updatesalepriceServlet")
public class updatesalepriceServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    String goodsid = request.getParameter("goodid");
    String salesprice = request.getParameter("saleprice");
    int goodid = Integer.parseInt(goodsid);
    double saleprice = Double.parseDouble(salesprice);
    
    UserService userService = new UserServiceImpl();
    userService.updatesaleprice(goodid, saleprice);
    
    request.getRequestDispatcher("/kucunServlet").forward(request, response);
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request, response);
  }
}
