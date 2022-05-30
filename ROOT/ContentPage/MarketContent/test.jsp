<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.FeedDAO" %>
<%@ page import= "dto.FeedDTO" %>
<%@ page import= "dao.ReviewDAO" %> 
<%@ page import= "dto.ReviewDTO" %> 
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <% 
    String key = "";
    String result = "";
    List TourismList = new ArrayList();
    
    
        try {
            URL url = new URL("http://apis.data.go.kr/6260000/FestivalService/getFestivalKr?serviceKey=wUEtd8BhDy7yesRSMeUkuPQAU63BIllURM2vJUlvKO3YihCA%2B6JGfQHNlxDaYd8rTifOGVq4Ve6IpmJ8mGoYeA%3D%3D&pageNo=1&%20numOfRows=1&resultType=json");
            BufferedReader bf;
        
            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
            result = bf.readLine();
        
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
            JSONObject getTourism = (JSONObject)jsonObject.get("getFestivalKr");
            JSONArray item  = (JSONArray)getTourism.get("item");
            JSONObject items = (JSONObject)item.get(3);                         
            
            String Maintitle = (String)items.get("TITLE");
            TourismList.add(Maintitle);

            String title = (String)items.get("SUBTITLE");
            TourismList.add(title);

            String image = (String)items.get("MAIN_IMG_THUMB");
            TourismList.add(image);

            String information = (String)items.get("ITEMCNTNTS");
            TourismList.add(information);

            String useTime = (String)items.get("USAGE_DAY_WEEK_AND_TIME");
            TourismList.add(useTime);

            String holiday = (String)items.get("HLDY_INFO");
            TourismList.add(holiday);

            String trfcInfo = (String)items.get("TRFC_INFO");
            TourismList.add(trfcInfo);

            String address = (String)items.get("ADDR1");
            TourismList.add(address);

            String tel = (String)items.get("CNTCT_TEL");
            TourismList.add(tel);

            String thisUrl = (String)items.get("HOMEPAGE_URL");
            TourismList.add(thisUrl);

        } catch (ParseException e){
            e.printStackTrace();
            out.print("에러");
        }
    %>  
<section>
<h1 class="mt-3">
    <% 
    out.print(TourismList.get(0));
    %>
</h1>
<h3 class="mt-3">
    <% 
    out.print(TourismList.get(1));
    %>
</h3>

<img class="mt-4" src=<% out.print(TourismList.get(2)); %>>

<p class="mt-2">
    <% 
     out.print(TourismList.get(3)); 
     %>
</p>
<p class="mt-2">
    <%
     out.print("이용안내 : " + TourismList.get(4)); 
     %>
</p>
<p class="mt-2">
    <% 
     out.print("휴무일 : " + TourismList.get(5)); 
     %>
</p>
<p class="mt-2">
    <% 
     out.print("교통정보 : " + TourismList.get(6)); 
     %>
</p>
<p class="mt-2">
    <% 
     out.print("주소 : " + TourismList.get(7)); 
     %>
</p>
<p class="mt-2">
    <% 
     out.print("전화번호 : " + TourismList.get(8)); 
     %> 
</p>
<p class="mt-2">
    <% 
     out.print("HomePage : " + TourismList.get(9)); 
     %>
</p>   
</section>                  
</body>
</html>

