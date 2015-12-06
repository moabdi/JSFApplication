package metier.eps.jsf.security.user;

public class MyUser 
    implements metier.eps.jsf.security.User {

  public String getLoginName() {
    //your user bridge
    return null;
  }

  public boolean isUserInRole(String roleName) {
    //your user roles bridge
    return false;
  }
}
