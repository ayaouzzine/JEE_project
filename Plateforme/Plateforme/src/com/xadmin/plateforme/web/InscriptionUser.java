package com.xadmin.plateforme.web;

import com.xadmin.plateforme.bean.User;
import com.xadmin.plateforme.dao.DaoFactory;
import com.xadmin.plateforme.dao.interfaces.UserDao;
import com.xadmin.plateforme.form.UserInscriptionForm;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@WebServlet("/inscription")
public class InscriptionUser extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private UserDao userDao;

    private static final String VUE_INSCRIPTION = "/WEB-INF/inscription.jsp" ;
    private static final String VUE_APRES_INSCRITPION = "/apres_inscription.jsp";

    private static final String ATT_FORM = "form";
    private static final String ATT_USER = "user";
    private static final String ATT_SESSION_USER = "userSession";

    public void init() throws ServletException {
    	DaoFactory daoFactory = null;
		try {
			daoFactory = DaoFactory.getInstance();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        this.userDao = daoFactory.getUserDao();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher(VUE_INSCRIPTION).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserInscriptionForm form = new UserInscriptionForm(userDao);
        User user = form.inscrireUser(req);

        req.setAttribute(ATT_FORM,form);
        req.setAttribute(ATT_USER,user);
        Map<String, String> map = new HashMap<>();

        if(form.getErreurs().isEmpty()){
            HttpSession session = req.getSession();
            session.setAttribute(ATT_SESSION_USER,user);
            //succes
            map.put("msg", "Votre compte a �t� cr�� avec succ�s !!");
            map.put("icon", "check");
           
        } else {
        	map.put("msg", "Un probl�me est survenu !! Veuillez r��ssayer ult�rieurement.");
            map.put("icon", "exclamation-triangle");
        }
        req.setAttribute("isCreated", map);
        this.getServletContext().getRequestDispatcher(VUE_INSCRIPTION).forward(req, resp);
    }


}
