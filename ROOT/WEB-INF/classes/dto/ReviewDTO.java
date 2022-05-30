package dto;
//import java.sql.*;

public class ReviewDTO {

    // 서브 페이지 게시물에 관련된 DB 정보를 변수로 저장
    private int r_no; 
    private String r_title;
    private String r_content;
    private int r_rating;
    private String r_date;
    private String r_uId;
    private String r_fId;

    // 생성자
    public ReviewDTO() {
        super();
    }   

    // 매개변수 생성자
    public ReviewDTO(int r_no, String r_title, String r_content, int r_rating, String r_date, String r_uId, String r_fId) {
        super();
        this.r_no = r_no;
        this.r_title = r_title;
        this.r_rating = r_rating;
        this.r_content = r_content;
        this.r_date = r_date;
        this.r_uId = r_uId;
        this.r_fId = r_fId;
    }

    // getter
    public String getR_title() {
        return r_title;
    }

    public int getR_no() {
        return r_no;
    }

    public String getR_content() {
        return r_content;
    }

    public int getR_rating() {
        return r_rating;
    }

    public String getR_date() {
        return r_date;
    }

    public String getR_uid() {
        return r_uId;
    }  
    public String getR_fid() {
        return r_fId;
    }
}