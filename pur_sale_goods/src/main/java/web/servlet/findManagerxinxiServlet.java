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


/*
 * 查找所有的客服信息，封装成List<User>转发给前端
 *
 * */
@WebServlet("/findManagerxinxiServlet")
public class findManagerxinxiServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    //调用findManagerxinxi()查询
    UserService userService = new UserServiceImpl();
    List<User> managerxinxi = userService.findManagerxinxi();
    
    request.setAttribute("managerxinxi", managerxinxi);
    request.getRequestDispatcher("/managerxinxi.jsp").forward(request, response);
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request, response);
  }
}
