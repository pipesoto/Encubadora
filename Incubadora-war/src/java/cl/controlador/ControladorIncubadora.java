/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.controlador;


import cl.beans.IncubadoraLocal;
import cl.modelo.Emprendedor;
import cl.modelo.Proyecto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 2guzm
 */
@WebServlet(name = "ControladorIncubadora", urlPatterns = {"/save", "/listar","/documentar.do","/evaluar","/nota.do","/finalizar","/emprende"})
public class ControladorIncubadora extends HttpServlet {

    @EJB
    private IncubadoraLocal incubadora;

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        String cp=request.getServletPath();
        if (cp.equals("/documentar.do")) {
            
            ArrayList<Proyecto> lista=incubadora.getProyecto();
            for (Proyecto proyecto : lista) {
                if (proyecto.getRut().equals(request.getParameter("rut"))) {
                    proyecto.setDocumentacion(true);
                }
            }
            request.setAttribute("listaProyectos", lista);
            request.getRequestDispatcher("listarproyectos.jsp").forward(request, response);
            
        }else if (cp.equals("/nota.do")) {
            
            ArrayList<Proyecto> lista=incubadora.getProyecto();
            for (Proyecto proyecto : lista) {
                if (proyecto.getRut().equals(request.getParameter("rut"))) {
                    proyecto.setNota(Double.parseDouble(request.getParameter("nota")));
                }
            }
            request.setAttribute("listaProyectos", lista);
            request.getRequestDispatcher("evaluar.jsp").forward(request, response);
        }
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
        
        if (request.getServletPath().equals("/emprende")) {
            
            if (incubadora.existsProyect(request.getParameter("rut"))) {   
                String message = "El rut ingresado ya existe!";
                request.setAttribute("nombre", request.getParameter("nombre"));
                request.setAttribute("profesion", request.getParameter("profesion"));
                request.setAttribute("email", request.getParameter("email"));
                request.setAttribute("msg", message);
                request.getRequestDispatcher("regemprendedor.jsp").forward(request, response);
            }else{
                request.setAttribute("rut", request.getParameter("rut"));
                request.setAttribute("nombre", request.getParameter("nombre"));
                request.setAttribute("profesion", request.getParameter("profesion"));
                request.setAttribute("email", request.getParameter("email"));
                request.getRequestDispatcher("regproyecto.jsp").forward(request, response);
                
            }   
            
        } else if (request.getServletPath().equals("/save")) {
            
                Emprendedor e = new Emprendedor();
                e.setRut(request.getParameter("rut"));
                e.setNombre(request.getParameter("nombre"));
                e.setProfesion(request.getParameter("profesion"));
                e.setEmail(request.getParameter("email"));
                incubadora.addEmprendedor(e);

                Proyecto p = new Proyecto();
                p.setRut(request.getParameter("rut"));
                p.setNombre(request.getParameter("nompro"));
                p.setDescripcion(request.getParameter("descpro"));
                p.setMonto(Double.parseDouble(request.getParameter("monto")));
                p.setTiempo(request.getParameter("tiempo"));
                p.setDocumentacion(false);
                incubadora.addProyecto(p);

                response.sendRedirect("index.jsp");
            
        }else if (request.getServletPath().equals("/listar")) {
            ArrayList<Proyecto> lista= incubadora.getProyecto();
            
            request.setAttribute("listaProyectos", lista);
            request.getRequestDispatcher("listarproyectos.jsp").forward(request, response);
            
        }else if (request.getServletPath().equals("/evaluar")) {
            ArrayList<Proyecto> lista= incubadora.getProyecto();
            
            request.setAttribute("listaProyectos", lista);
            request.getRequestDispatcher("evaluar.jsp").forward(request, response);
            
        }else if (request.getServletPath().equals("/finalizar")) {
            ArrayList<Proyecto> listaGanadores=new ArrayList<>();
            ArrayList<Proyecto> listao= incubadora.getProyecto();
            ArrayList<Proyecto> listac=new ArrayList<>();
            for (Proyecto p : listao) {
                listac.add(p);            
            }
            
            for (int i = 0; i < 3; i++) {
                String maxr="";
                double maxn=0;
                for (Proyecto p : listac) {
                    if (p.getNota()>maxn) {
                        maxr=p.getRut();
                        maxn=p.getNota();
                    }
                }
                for (Proyecto pro : listao) {
                    if (pro.getRut().equals(maxr)) {
                        listaGanadores.add(pro);
                    }
                }
                Iterator<Proyecto> it = listac.iterator();
                while(it.hasNext()){
                    if (it.next().getRut().equals(maxr)) {
                        it.remove();
                    }
                }
            }       
            request.setAttribute("listaProyectos", listaGanadores);
            request.getRequestDispatcher("ganadores.jsp").forward(request, response);
        }
        
        
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
