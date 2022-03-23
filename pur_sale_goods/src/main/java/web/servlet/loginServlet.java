package web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import domain.ResultInfo;
import domain.loginUser;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    //1.获取数据
    Map<String, String[]> map = request.getParameterMap();
    
    
    //2.封装对象
    loginUser loginUser = new loginUser();
    try {
      BeanUtils.populate(loginUser, map);
    } catch (IllegalAccessException e) {
      e.printStackTrace();
    } catch (InvocationTargetException e) {
      e.printStackTrace();
    }
    
    HttpSession session = request.getSession();
    
    //3.调用service完成登陆验证
    UserService userService = new UserServiceImpl();
    boolean flag = userService.login(loginUser);
    ResultInfo info = new ResultInfo();
    String name = userService.findname(loginUser);
    //4.响应结果
    
    if (flag) {
      info.setFlag(true);
      info.setErrorMsg(name);
      session.setAttribute("filter", "filter");
    } else {
      info.setFlag(false);
      info.setErrorMsg("登录失败");
    }
    //将info对象序列化为json格式
    
    ObjectMapper mapper = new ObjectMapper();
    String json = mapper.writeValueAsString(info);
    
    
    //将json数据写回客户端
    //设置content-type
    response.setContentType("application/json;charset=utf-8");
    response.getWriter().write(json);
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request, response);
  }
}
