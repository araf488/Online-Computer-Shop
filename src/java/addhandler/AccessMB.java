/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package addhandler;

import dao.LoginDao;
import entity.ShopUser;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author araf0
 */
@ManagedBean
@SessionScoped
public class AccessMB {
    ShopUser user = new ShopUser();

    public ShopUser getUser() {
        return user;
    }

    public void setUser(ShopUser user) {
        this.user = user;
    }
   public String login(){
       
        user.setUserName(user.getUserName());
        user.setPassword(user.getPassword());
        user.setEmail(user.getEmail());
       
        
        if(new LoginDao().login(user)){
            System.out.println("Login success");
//            try {
//                ExternalContext ec = SessionUtil.getExternalContext();
//                HttpSession session = SessionUtil.getSession();
//                
//                
//                String redirect = ec.getRequestContextPath() + "/customer/product.xhtml"; 
//                
//                
//                if(!session.getAttribute("redirect").toString().equals("")){
//                    redirect = session.getAttribute("redirect").toString();
//                }
//                
//               
//                ec.redirect(redirect);
//            } catch (IOException ex) {
//                ex.printStackTrace();
//            }
            return "/customer/product";
        } else{
            System.out.println("Login failed");
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Something went wrong!", ""));
        }
        return null;
    }
    
    public String logout(){    
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
        System.out.println("Logout");
        return "/login";
    } 
}
