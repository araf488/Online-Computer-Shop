/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package addhandler;

import dao.AddDao;
import dao.ListDao;
import entity.ShopUser;
import entity.UserRole;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;

/**
 *
 * @author araf0
 */
@ManagedBean
@SessionScoped
public class LoginMB {
    ShopUser user = new ShopUser();
    UserRole role = new UserRole();
    Integer roleId;
    String roleName;
    List<UserRole> listRole;

    public List<UserRole> getListRole() {
        return listRole;
    }

    public void setListRole(List<UserRole> listRole) {
        this.listRole = listRole;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    public ShopUser getUser() {
        return user;
    }

    public void setUser(ShopUser user) {
        this.user = user;
    }
    
    public String addUser() {
        listRole = new ListDao().roleListByName(roleName);
        role.setRoleId(listRole.get(0).getRoleId());
        user.setUserRole(role);
        user.setUserName(user.getUserName());
        user.setPassword(user.getPassword());
        user.setEmail(user.getEmail());
        user.setRegDate(user.getRegDate());
        user.setContactNo(user.getContactNo());
        boolean status = new AddDao().addUser(user);
        if (status) {
            return "login.xhtml";
        } else {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Data not Saved", ""));
        }
        return null;
    }
    
    public List<SelectItem> getRoleIdName(){
        List<SelectItem> roleName = new ListDao().roleList();
        return roleName;
    }
}
