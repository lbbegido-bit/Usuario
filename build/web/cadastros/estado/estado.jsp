
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>

<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

<div class="topbar">

    <div class="page-title">
        <h1>Estados</h1>
        <p>Gerencie os estados cadastrados na plataforma.</p>
    </div>

</div>

<div class="card-custom">

    <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:20px;">

        <div class="search-box" style="width:300px;">
            <i class="fa fa-search"></i>
            <input type="text" id="customSearch" placeholder="Buscar estados...">
        </div>

        <a class="btn-custom"
           href="${pageContext.request.contextPath}/EstadoNovo">

            <i class="fa fa-plus"></i>
            Novo Estado
        </a>

    </div>

    <table id="datatable" class="display">

        <thead>
            <tr>
                <th>ID</th>
                <th>Nome Estado</th>
                <th>Sigla</th>
                <th>Excluir</th>
                <th>Alterar</th>
            </tr>
        </thead>

        <tbody>

            <c:forEach var="estado" items="${estados}">

                <tr>

                    <td>${estado.id}</td>

                    <td>${estado.nomeEstado}</td>

                    <td>${estado.siglaEstado}</td>

                    <td>

                        <button class="btn-custom btn-danger"
                                onclick="deletar(${estado.id})">

                            <i class="fa fa-trash"></i>
                        </button>

                    </td>

                    <td>

                        <a href="${pageContext.request.contextPath}/EstadoCarregar?id=${estado.id}">

                            <button class="btn-custom btn-warning">

                                <i class="fa fa-pen"></i>

                            </button>

                        </a>

                    </td>

                </tr>

            </c:forEach>

        </tbody>

    </table>

</div>
<script>

    $(document).ready(function () {

        console.log('entrei ready');

        $('#datatable').DataTable({

            "oLanguage": {

                "sProcessing": "Processando...",

                "sLengthMenu": "Mostrar _MENU_ registros",

                "sZeroRecords": "Nenhum registro encontrado.",

                "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",

                "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",

                "sInfoFiltered": "",

                "sInfoPostFix": "",

                "sSearch": "Buscar:",

                "sUrl": "",

                "oPaginate": {

                    "sFirst": "Primeiro",

                    "sPrevious": "Anterior",

                    "sNext": "Seguinte",

                    "sLast": "Último"

                }
            }
        });
    });

    function deletar(codigo){

        var id = codigo;

        console.log(codigo);

        Swal.fire({

            title: 'Você tem certeza?',

            text: "Você não poderá recuperar depois!",

            icon: 'warning',

            showCancelButton: true,

            confirmButtonColor: '#3085d6',

            cancelButtonColor: '#d33',

            confirmButtonText: 'Sim, apague o estado!',

            cancelButtonText: 'Cancelar'

        }).then((result) => {

            if (result.isConfirmed) {

                $.ajax({

                    type: 'post',

                    url: '${pageContext.request.contextPath}/EstadoExcluir',

                    data:{
                        id: id
                    },

                    success:

                        function(data){

                            if(data == 1){

                                Swal.fire({

                                    position: 'top-end',

                                    icon: 'success',

                                    title: 'Sucesso',

                                    text: 'Estado excluído com sucesso!',

                                    showConfirmButton: false,

                                    timer: 2000
                                });

                            } else {

                                Swal.fire({

                                    position: 'top-end',

                                    icon: 'error',

                                    title: 'Erro',

                                    text: 'Não foi possível excluir o estado!',

                                    showConfirmButton: false,

                                    timer: 2000
                                });
                            }

                            window.location.href =
                            "${pageContext.request.contextPath}/EstadoListar";
                        },

                    error:

                        function(data){

                            window.location.href =
                            "${pageContext.request.contextPath}/EstadoListar";
                        }
                });
            };
        });
    }

</script>

<jsp:include page="/footer.jsp"/>


