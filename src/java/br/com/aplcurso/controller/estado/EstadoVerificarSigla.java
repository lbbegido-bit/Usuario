package br.com.aplcurso.controller.estado;

import br.com.aplcurso.dao.EstadoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EstadoVerificarSigla",
        urlPatterns = {"/EstadoVerificarSigla"})

public class EstadoVerificarSigla extends HttpServlet {

    protected void processRequest(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String sigla =
                    request.getParameter("sigla");

            EstadoDAO dao = new EstadoDAO();

            if (dao.siglaExiste(sigla)) {

                response.getWriter().print(1);

            } else {

                response.getWriter().print(0);
            }

        } catch (Exception ex) {

            ex.printStackTrace();

            response.getWriter().print(0);
        }
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }
}

