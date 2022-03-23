package web.servlet;

import domain.pur_sale_count;
import domain.pur_sale_income;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findBytimeServlet")
public class findBytimeServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    String starttime = request.getParameter("starttime");
    String endtime = request.getParameter("endtime");
    UserService userService = new UserServiceImpl();
    pur_sale_count psc = new pur_sale_count();
    pur_sale_income psi = new pur_sale_income();
    List<pur_sale_count> psclist = userService.callpsc(starttime, endtime);
    List<pur_sale_income> psilist = userService.callpsi(starttime, endtime);
    
    double xiaoshoue = 0;
    double jinglirun = 0;
    for (int i = 0; i < psilist.size(); i++) {
      xiaoshoue += psilist.get(i).getSaleincome();
      jinglirun += psilist.get(i).getIncome();
    }
    request.setAttribute("psc", psclist);
    request.setAttribute("psi", psilist);
    
    request.setAttribute("xiaoshoue", xiaoshoue);
    request.setAttribute("jinglirun", jinglirun);
    System.out.println(psclist);
    request.getRequestDispatcher("/findBytime.jsp").forward(request, response);
    
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request, response);
  }
}
