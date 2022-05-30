<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "dao.ReviewDAO" %> 
<%@ page import= "dto.ReviewDTO" %> 
<%@ page import= "dao.FeedDAO" %> 
<%@ page import= "dto.FeedDTO" %>
<%
    ReviewDAO dao= new ReviewDAO();
    int cnt = dao.countReview(6);
    out.print(cnt);
%>