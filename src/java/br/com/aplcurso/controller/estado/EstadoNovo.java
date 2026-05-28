
package br.com.aplcurso.controller.estado;

import br.com.aplcurso.model.Estado;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EstadoNovo", urlPatterns = {"/EstadoNovo"})
public class EstadoNovo extends HttpServlet {

    protected void processRequest(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Estado oEstado = new Estado();

        request.setAttribute("estado", oEstado);

        request.getRequestDispatcher(
                "/cadastros/estado/estadoNovo.jsp")
                .forward(request, response);
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }
}
