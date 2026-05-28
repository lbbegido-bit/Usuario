
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>

<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

<div class="topbar">

    <div class="page-title">
        <h1>Estados</h1>
        <p>Formulário de cadastro.</p>
    </div>

</div>

<div class="card-custom">

    <a class="btn-custom"
       href="${pageContext.request.contextPath}/EstadoListar"
       style="margin-bottom:25px;">

        <i class="fa fa-arrow-left"></i>
        Voltar

    </a>

    <div class="form-group">

        <label>ID</label>

        <input class="form-control"
               type="text"
               id="id"
               value="${estado.id}"
               readonly>

    </div>

    <div class="form-group">

        <label>Nome Estado</label>

        <input class="form-control"
               type="text"
               id="nomeestado"
               value="${estado.nomeEstado}">

    </div>

    <div class="form-group">

        <label>Sigla</label>

        <input class="form-control"
               type="text"
               id="siglaestado"
               value="${estado.siglaEstado}">

    </div>

    <button class="btn-custom"
            onclick="validarCampos()">

        <i class="fa fa-save"></i>
        Salvar Estado

    </button>

</div>

<script>

    $(document).ready(function () {

        console.log("entrei na ready");

        $('#siglaestado').blur(function () {

            var sigla = $('#siglaestado').val().toUpperCase();

            $('#siglaestado').val(sigla);

            if ($('#id').val() == 0) {

                $.ajax({

                    type: 'get',

                    url: 'EstadoVerificarSigla',

                    data: {
                        sigla: sigla
                    },

                    success: function (response) {

                        console.log(response);

                        if (response == '1') {

                            Swal.fire({

                                position: 'center',

                                icon: 'warning',

                                title: 'Sigla já cadastrada!',

                                text: 'Verifique a sigla informada.',

                                showConfirmButton: true,

                                timer: 4000

                            }).then(function () {

                                $('#siglaestado').focus();
                            });
                        }
                    },

                    error: function () {

                        console.log(
                            "Erro ao verificar sigla.");
                    }
                });
            }
        });

        $('#nomeestado').focus();
    });

    function validarCampos() {

        console.log("validando campos");

        if (document.getElementById(
                "nomeestado").value === '') {

            Swal.fire({

                position: 'center',

                icon: 'error',

                title: 'Verifique o nome do estado!',

                showConfirmButton: false,

                timer: 1500
            });

            $("#nomeestado").focus();

        } else if (document.getElementById(
                "siglaestado").value === '') {

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

        console.log("gravando estado");

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

                console.log(data);

                if (data == 1) {

                    Swal.fire({

                        position: 'center',

                        icon: 'success',

                        title: 'Sucesso',

                        text: 'Estado gravado com sucesso!',

                        showConfirmButton: true,

                        timer: 3000

                    }).then(function () {

                        window.location.href =
                        'EstadoNovo';
                    });

                } else if (data == 4) {

                    Swal.fire({

                        position: 'center',

                        icon: 'error',

                        title: 'Sigla já cadastrada!',

                        showConfirmButton: true,

                        timer: 3000

                    });

                } else {

                    Swal.fire({

                        position: 'center',

                        icon: 'error',

                        title: 'Erro ao gravar estado!',

                        showConfirmButton: true,

                        timer: 3000
                    });
                }
            },

            error: function () {

                Swal.fire({

                    position: 'center',

                    icon: 'error',

                    title: 'Erro de comunicação!',

                    showConfirmButton: true,

                    timer: 3000
                });
            }
        });
    }

</script>

<jsp:include page="/footer.jsp"/>

