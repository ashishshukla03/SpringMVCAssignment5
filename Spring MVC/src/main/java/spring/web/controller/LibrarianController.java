package spring.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.web.dao.LibrarianDao;
import spring.web.entity.Librarian;

@SuppressWarnings("unused")
@WebServlet(name = "login")
public class LibrarianController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LibrarianController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		LibrarianDao userdao = new LibrarianDao(Factory.getFactory());
		boolean user = userdao.getUserByEmailAndPassword(email, password);
		HttpSession httpSession = request.getSession();

		if (user != false) {
			httpSession.setAttribute("current-user", email);
			response.sendRedirect("books.jsp");
			return;
		} else {
			httpSession.setAttribute("message", "Invalid id/password");
			response.sendRedirect("loginPage.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
