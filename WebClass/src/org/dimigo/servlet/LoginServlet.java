package org.dimigo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.printf("id : %s, pwd : %s\n",id,pwd);
		
		response.setContentType("application/json; charset = UTF-8");
		PrintWriter out = response.getWriter();
		/*
		 * {
		 * "id" : "testid"
		 * } 이런 형식
		 */
//		out.println("{");
//		out.println("\"id\":" + "\"" + id + "\"");
//		out.println("}");
			
		//JSON Simple library
//		JSONObject json = new JSONObject();
//		json.put("id", id);
//		System.out.println(json.toJSONString());
//		out.write(json.toJSONString());
		
		//Gson Library 사용해서 소스 작성하기
		Gson gson = new Gson();
	    JsonObject object = new JsonObject();
	    object.addProperty("id", id);
	    object.addProperty("pwd", pwd);
	    String json = gson.toJson(object);
	    System.out.println(json);
	    out.write(json);
		
		out.close();
	}
}
