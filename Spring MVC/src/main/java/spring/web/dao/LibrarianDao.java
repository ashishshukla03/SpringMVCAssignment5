package spring.web.dao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import spring.web.entity.Librarian;
public class LibrarianDao {
	private SessionFactory factory;

	public LibrarianDao(SessionFactory factory) {

		this.factory = factory;
	}

	public boolean getUserByEmailAndPassword(String email, String password) {
		System.out.println("hiber-connected validate");
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();

		String query = "FROM librarian U WHERE U.email = :email";
		@SuppressWarnings("rawtypes")
		Query q = session.createQuery(query);
		q.setParameter("email", email);
		Librarian user = (Librarian) q.uniqueResult();

		if (user != null && user.getpassword().equals(password) && user.getEmail().equals(email)) {
			return true;
		}
		tx.commit();
		session.close();
		return false;
}
}
