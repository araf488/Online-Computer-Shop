/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.ShopUser;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;
import util.SessionUtil;

/**
 *
 * @author B14
 */
public class LoginDao {
    public boolean register(ShopUser u) {
        try {

            SessionFactory factory = HibernateUtil.getSessionFactory();
            Session session = factory.openSession();
            session.beginTransaction();

            session.save(u);

            session.getTransaction().commit();
            session.close();
            return true;

        } catch (Exception e) {
            //e.printStackTrace();
            return false;
        }
    }
    
    public boolean login(ShopUser user) {
        try {

            SessionFactory factory = HibernateUtil.getSessionFactory();
            Session session = factory.openSession();
            session.beginTransaction();
            
            Query query = session.createQuery("SELECT u FROM ShopUser u WHERE u.userName=:uname AND u.password =:pass And u.email=:email");
            query.setString("uname", user.getUserName());
            query.setString("pass", user.getPassword());
            query.setString("email", user.getEmail());
            
            List<ShopUser> cList= query.list();
            cList.toString();
            session.getTransaction().commit();
            session.close();
            
            if(cList.size()>0){
                HttpSession session1 = SessionUtil.getSession();
                session1.setAttribute("uname", cList.get(0).getUserName());
                session1.setAttribute("uid", cList.get(0).getUserId());              
                return true;
            } else{
                return false;                
            }
            

        } catch (Exception e) {
            //e.printStackTrace();
            return false;
        }
    }
}
