package dto;
//import java.sql.*;

public class SearchDTO {

    // 서브 페이지 게시물에 관련된 DB 정보를 변수로 저장
    private int f_num; 
    private String f_name;
    private String f_subName;
    private String f_image;
    private int f_count;
    private int f_reviewCount;


    // 매개변수 생성자
    public SearchDTO(int f_num, String f_name, String f_subName, String f_image, int f_count, int f_reviewCount) {
        this.f_num = f_num;
        this.f_name = f_name;
        this.f_subName = f_subName;
        this.f_image = f_image;
        this.f_count = f_count;
        this.f_reviewCount = f_reviewCount;
    }

    // getter
    public int getF_num() {
        return f_num;
    }

    public String getF_name() {
        return f_name;
    }

    public String getF_subName() {
        return f_subName;
    }

    public String getF_image() {
        return f_image;
    }

    public int getF_count() {
        return f_count;
    }

    public int getF_reviewcount() {
        return f_reviewCount;
    }
}