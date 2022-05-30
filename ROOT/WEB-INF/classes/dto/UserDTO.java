package dto;

public class UserDTO {
    private String id;
    private String pw;
    private String name;
    private String profile;
    private String email;
    private String age;

    public void UserDTO(String id, String pw, String profile, String email, String age, String name)
    {
        this.id= id;
        this.pw= pw;
        this.name= name;
        this.profile= profile;
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

    

    public String getProfile() {
        return profile;
    }

    

    public String getEmail() {
        return email;
    }

    

    public String getAge() {
        return age;
    }

    
    
}