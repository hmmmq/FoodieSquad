/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package foodiesquad.servlet;

import foodiesquad.entity.Canteen;
import foodiesquad.entity.Menu;
import foodiesquad.service.CanteenService;
import foodiesquad.service.serviceimpl.CanteenServiceImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hmqhmq
 */
public class CanteenServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
         List<Canteen> cslist;
         CanteenService cs=new CanteenServiceImpl();
         cslist=cs.queryAllCanteen();
         //List<Menu> mulistmax=null;
         if(cslist!=null){
     request.setAttribute("cslist", cslist);
       for(int i=0;i<cslist.size();i++){
         int cid= cslist.get(i).getcId();
  System.out.println("cid:"+cid+" "+"cName:"+cslist.get(i).getcName()+"cAdderss: "+cslist.get(i).getcAddress());

        /*List<Menu> mulist=cs.queryMenuById(cid);
        if(mulist!=null)
        { System.out.println("mulist:"+"mName:"+mulist.get(i).getmName());
            // mulistmax.addAll(mulist);
        }
        else{System.out.println("该餐厅无菜。");}
         // request.setAttribute("mulistmax", mulistmax);
        
   request.getRequestDispatcher("views/ChooseCanteenPage/chooseCanteenPage.jsp").forward(request, response);
       }}*/
    }}
   
         request.getRequestDispatcher("views/ChooseCanteenPage/chooseCanteenPage.jsp").forward(request, response);
        
        }}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
