package dto;

public class UserDTO {
    private String id;
    private String pw;
    private String name;
    private String email;
    private String age;

    public void UserDTO(String id, String pw, String email, String age, String name)
    {
        this.id= id;
        this.pw= pw;
        this.name= name;
        this.email= email;
        this.age= age;
    }


    public String getId() {
        return id;
    }

    
    public String getPw() {
        return pw;
    }

    

    public String getName() {
        return name;
    }
   

    public String getEmail() {
        return email;
    }

    

    public String getAge() {
        return age;
    }

    
    
}