<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>

<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

<div class="container-fluid">

    <h1 class="h3 mb-2 text-gray-800">Estados</h1>

    <p class="mb-4">Alteração de Estado</p>

    <a class="btn btn-secondary mb-4"
       href="${pageContext.request.contextPath}/EstadoListar">

        <i class="fas fa-undo-alt"></i>

        <strong>Voltar</strong>
    </a>

    <div class="row">

        <div class="col-lg-9">

            <div class="card shadow mb-4">

                <div class="card-body">

                    <div class="form-group">

                        <label>Id</label>

                        <input class="form-control"
                               type="text"
                               name="id"
                               id="id"
                               value="${estado.id}"
                               readonly="readonly"/>

                    </div>

                    <div class="form-group">

                        <label>Nome do Estado</label>

                        <input class="form-control"
                               type="text"
                               name="nomeestado"
                               id="nomeestado"
                               value="${estado.nomeEstado}"
                               maxlength="100"/>

                    </div>

                    <div class="form-group">

                        <label>Sigla</label>

                        <input class="form-control"
                               type="text"
                               name="siglaestado"
                               id="siglaestado"
                               value="${estado.siglaEstado}"
                               maxlength="2"/>

                    </div>

                    <div class="form-group">

                        <button class="btn btn-success"
                                type="button"
                                onclick="validarCampos()">

                            Salvar Alteração

                        </button>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<script>

    $(document).ready(function () {

        $('#nomeestado').focus();

        $('#siglaestado').blur(function () {

            var sigla =
                    $('#siglaestado')
                    .val()
                    .toUpperCase();

            $('#siglaestado').val(sigla);

            if ($('#id').val() == 0) {

                $.ajax({

                    type: 'get',

                    url: 'EstadoVerificarSigla',

                    data: {
                        sigla: sigla
                    },

                    success: function (response) {

                        if (response == '1') {

                            Swal.fire({

                                position: 'center',

                                icon: 'warning',

                                title: 'Sigla já cadastrada!',

                                text: 'Verifique a sigla informada.',

                                showConfirmButton: true,

                                timer: 4000
                            });
                        }
                    }
                });
            }
        });
    });

    function validarCampos() {

        if (document.getElementById("nomeestado").value === '') {

            Swal.fire({

                position: 'center',

                icon: 'error',

                title: 'Verifique o nome do estado!',

                showConfirmButton: false,

                timer: 1500
            });

            $("#nomeestado").focus();

        } else if (
                document.getElementById("siglaestado").value === '') {

            Swal.fire({

                position: 'center',

                icon: 'error',

                title: 'Verifique a sigla do estado!',

                showConfirmButton: false,

                timer: 1500
            });

            $("#siglaestado").focus();

        } else {

            gravarDados();
        }
    }

    function gravarDados() {

        $.ajax({

            type: 'post',

            url: 'EstadoCadastrar',

            data: {

                id: $('#id').val(),

                nomeestado:
                        $('#nomeestado')
                        .val()
                        .toUpperCase(),

                siglaestado:
                        $('#siglaestado')
                        .val()
                        .toUpperCase()
            },

            success: function (data) {

                if (data == 1) {

                    Swal.fire({

                        position: 'center',

                        icon: 'success',

                        title: 'Sucesso',

                        text: 'Estado alterado com sucesso!',

                        showConfirmButton: true,

                        timer: 3000

                    }).then(function () {

                        window.location.href =
                                'EstadoListar';
                    });

                } else if (data == 4) {

                    Swal.fire({

                        position: 'center',

                        icon: 'error',

                        title: 'Sigla já cadastrada!',

                        showConfirmButton: true,

                        timer: 4000
                    });

                } else {

                    Swal.fire({

                        position: 'center',

                        icon: 'error',

                        title: 'Não foi possível alterar o estado!',

                        showConfirmButton: true,

                        timer: 4000
                    });
                }
            },

            error: function () {

                Swal.fire({

                    position: 'center',

                    icon: 'error',

                    title: 'Erro de comunicação com o servidor!',

                    showConfirmButton: true,

                    timer: 4000
                });
            }
        });
    }

</script>

<jsp:include page="/footer.jsp"/>
