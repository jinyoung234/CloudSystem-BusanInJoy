<%@ page contentType ="text/html; charset=utf-8" %>
<div class = "review">
    <div class="review-form">
        <form method = "post" action="writeAction.jsp">
        <table class = "reveiw-table" border="2">

            <tbody>
                <tr>
                    <td style="background-color:#eeeeee; text-align:center;"><b>리뷰 작성</b></td>
                </tr>
                <tr>
                    <td><input type="text" class="form-control" placeholder="리뷰 제목" name = "title" maxlength="50"></td>
                </tr>
                <tr>
                    <td><textarea  class="form-control" placeholder="리뷰 내용" name = "content" maxlength="2048"></textarea></td>
                </tr>
                <tr >
                    <td>평점 : <input type="number"  class="form-control" name = "rating"  min ="1" max="5" value = "5" step="1"></textarea></td>
                </tr>
                <tr >
                    <td>아이디 : <input type="text" class="form-control" placeholder="아이디" name = "uid" maxlength="50" ></td>
                </tr>
                <td><input type="submit" class = "btn btn-primary pull-rright" value="리뷰 글쓰기"> </td>
            </tbody>
        </table>
        
    </form>
    </div>
</div>