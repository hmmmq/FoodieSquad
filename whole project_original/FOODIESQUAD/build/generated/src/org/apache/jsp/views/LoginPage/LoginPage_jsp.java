package org.apache.jsp.views.LoginPage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LoginPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0,user-scalable=no\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"cssForLoginPage.css\" />\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<!--容器-->\n");
      out.write("<div class=\"container\">\n");
      out.write("<!--顶部页面属性与后退-->\n");
      out.write("<div class=\"headingBox\"><img src=\"closebutton.svg\" id=\"closebtn\" class=\"closeButtonSize\"/><label for=\"closebtn\" class=\"headingText\">手机登录/注册</label>\n");
      out.write("</div>\n");
      out.write("<!--logo图片-->\n");
      out.write("<div class=\"logoBox\">\n");
      out.write("<img src=\"logo.svg\" id=\"logoimg\" class=\"logoSize\"/>\n");
      out.write("</div>\n");
      out.write("<form>\n");
      out.write("<!--电话号码-->\n");
      out.write("<div class=\"inputBox\">\n");
      out.write("<input type=\"text\" id=\"cellphonenumber\" class=\"inputShape inputText\" placeholder=\"请输入您的手机号\" />\n");
      out.write("</div>\n");
      out.write("</form>\n");
      out.write("<!--附加提醒-->\n");
      out.write("<div class=\"addtionBox\">\n");
      out.write("    <p class=\"additionText\">用<b onclick=\"call()\">手机号</b>登录<br/>登录/注册即代表同意<b>服务协议</b></p>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("  <script type=\"text/javascript\">\n");
      out.write("    function call(){\n");
      out.write("    var cellnum=document.getElementById(\"cellphonenumber\").value;\n");
      out.write("  \n");
      out.write("    window.location.href=\"/FOODIESQUAD/LoginServlet?cellnum=\"+cellnum;\n");
      out.write("    }\n");
      out.write("/*\n");
      out.write("//跳转到loginservlet：/Users/hmqhmq/Downloads/FOODIESQUAD/src/java/foodiesquad/servlet/loginServlet.java */\n");
      out.write("//当前：/Users/hmqhmq/Downloads/FOODIESQUAD/web/views/LoginPage/LoginPage.jsp\n");
      out.write("  </script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
