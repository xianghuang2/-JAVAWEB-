package web.servlet;

import domain.User;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findCustomerxinxiServlet")
public class findCustomerxinxiServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //调用findManagerxinxi()查询
    UserService userService = new UserServiceImpl();
    List<User> customerxinxi = userService.findCustomerxinxi();
    
    request.setAttribute("customerxinxi", customerxinxi);
    request.getRequestDispatcher("/customerxinxi.jsp").forward(request, response);
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request, response);
  }
}
