package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	private FilterConfig filterConfig;
	
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		HttpSession session = request.getSession();
		String p = request.getContextPath();
		
		String noLoginPaths = filterConfig.getInitParameter("noLogin");
		
		if(!request.getServletPath().endsWith(".jsp")){
			arg2.doFilter(arg0, arg1);
			return;
		}
		
		if (noLoginPaths != null) {
			System.out.println(request.getRequestURI());
				String[] paths = noLoginPaths.split(";");
				for (String path : paths) {
					if (path == null || "".equals(path)) continue;
					if (request.getRequestURI().indexOf(path) != -1 || request.getRequestURI().equals("/UFAMSWeb/")) {
						arg2.doFilter(arg0, arg1);
						return;
					}
				}
		}
		System.out.println(session.getAttribute("loginUserAccount"));
		if (session.getAttribute("loginUserAccount") != null ) {
			arg2.doFilter(arg0, arg1);
		} else {
			//request.getRequestDispatcher(p+"/login/login.jsp").forward(request,response);
			response.sendRedirect(p+"/login/login_please.jsp");
		}			
		
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.filterConfig = filterConfig;
	}

}
