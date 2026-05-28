
package br.com.aplcurso.controller.estado;

import br.com.aplcurso.dao.EstadoDAO;
import br.com.aplcurso.model.Estado;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EstadoCadastrar",
        urlPatterns = {"/EstadoCadastrar"})

public class EstadoCadastrar extends HttpServlet {

    protected void processRequest(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Estado oEstado = new Estado();

            oEstado.setId(
                    Integer.parseInt(
                            request.getParameter("id")));

            oEstado.setNomeEstado(
                    request.getParameter("nomeestado"));

            oEstado.setSiglaEstado(
                    request.getParameter("siglaestado"));

            EstadoDAO dao = new EstadoDAO();

            if (oEstado.getId() == 0) {

                if (dao.siglaExiste(
                        oEstado.getSiglaEstado())) {

                    response.getWriter().print(4);

                    return;
                }
            }

            if (dao.cadastrar(oEstado)) {

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
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }
}

