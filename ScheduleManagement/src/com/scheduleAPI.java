package com;

import com.item;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class scheduleAPI
 */
@WebServlet("/scheduleAPI")
public class scheduleAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	item itemObj = new item();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public scheduleAPI() {
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		
		String output = itemObj.insertItem(request.getParameter("btnSid"),
				request.getParameter("btnHid"),
				request.getParameter("btnHname"),
				request.getParameter("btnDocid"),
				request.getParameter("btnDocname"),
				request.getParameter("btnSpecial"),
				request.getParameter("btnDate"),
				request.getParameter("btnStart"),
				request.getParameter("btnEnd"),
				request.getParameter("btnRoom"),
				request.getParameter("stat"));
		
				response.getWriter().write(output);
		
		
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		Map paras = getParasMap(request);
		String output = itemObj.updateItem(paras.get("hidItemIDSave").toString(),
		paras.get("btnSid").toString(),
		paras.get("btnHid").toString(),
		paras.get("btnHname").toString().replace('+', ' '),
		paras.get("btnDocid").toString(),
		paras.get("btnDocname").toString().replace('+', ' '),
		paras.get("btnSpecial").toString().replace('+', ' '),
		paras.get("btnDate").toString(),
		paras.get("btnStart").toString().replace("%3A", ":"),
		paras.get("btnEnd").toString().replace("%3A", ":"),
		paras.get("btnRoom").toString(),
		paras.get("stat").toString());
		response.getWriter().write(output);
		
		
		
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Map paras = getParasMap(request);
		String output = itemObj.deleteItem(paras.get("ID").toString());
		response.getWriter().write(output);
		
		
	}
	
	
	private static Map getParasMap(HttpServletRequest request)
	{
	Map<String, String> map = new HashMap<String, String>();
	try
	{
	Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
	String queryString = scanner.hasNext() ?
	scanner.useDelimiter("\\A").next() : "";
	scanner.close();
	String[] params = queryString.split("&");
	for (String param : params)
	{
		String[] p = param.split("=");
		map.put(p[0], p[1]);
		}
		}
		catch (Exception e)
		{
		}
		return map;
		}
	
	
	

}
