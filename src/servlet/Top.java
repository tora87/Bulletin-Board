package servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.UserDao;

/**
 * Servlet implementation class Top
 */
@WebServlet("/Top")
@MultipartConfig(maxFileSize=1048576)
public class Top extends HttpServlet {
	private static final long serialVersionUID = 1L;

	final File uploadDir = new File("C:\\users\\Hanasaka Toranosuke\\Desktop\\応用Java\\kadai39\\WebContent\\upload\\");
	  public void init() throws ServletException {
	    uploadDir.mkdir();
	  }

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Top() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String view = "/WEB-INF/view/Top.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(view);

		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		String text = request.getParameter("texta");
		Part fPart = request.getPart("file");


		if(!("".equals(name)) && !("".equals(mail)) && !("".equals(text))){
			if(name != null && mail != null && text != null){
				if(fPart != null){
					String fName = (new StringBuilder().append(System.currentTimeMillis()).append("_").append(fPart.getSubmittedFileName()).toString());
					save(fPart, new File(uploadDir, fName));
					// HTML を返す ->
					response.setContentType("text/html; charset=utf-8");
					response.getWriter().write("<html><body><p>保存完了</p></body></html>");
					UserDao.insertUserWithFile(name, mail, text, fName);

				}else{
					UserDao.insertUser(name, mail, text);
				}
			}
		}

		String view = "/WEB-INF/view/Top.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(view);

		dispatcher.forward(request, response);
	}

	public void save(Part in, File out) throws IOException {
	    BufferedInputStream br
	      = new BufferedInputStream(in.getInputStream());
	    try (BufferedOutputStream bw =
	      new BufferedOutputStream(new FileOutputStream(out))
	    ) {
	      int len = 0;
	      byte[] buff = new byte[1024];
	      while ((len = br.read(buff)) != -1) {
	        bw.write(buff, 0, len);
	      }
	    }
	  }

}
