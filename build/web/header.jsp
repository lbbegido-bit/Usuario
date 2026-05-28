<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Sistema</title>

        <!-- JQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.mask.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.maskMoney.min.js"></script>

        <!-- DataTables -->
        <link rel="stylesheet"
              href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>

        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

        <!-- SweetAlert -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <!-- Font Awesome -->
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

        <!-- Google Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">

        <style>

            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
                font-family:'Poppins', sans-serif;
            }

            body{
                background:#f5f7fb;
                display:flex;
                min-height:100vh;
                color:#1e293b;
            }

            /* MENU LATERAL */
            .sidebar{
                width:240px;
                background:linear-gradient(180deg,#0f3fd9,#032b8c);
                padding:30px 15px;
                position:fixed;
                height:100%;
                border-radius:0 25px 25px 0;
            }

            .logo{
                color:#fff;
                font-size:28px;
                font-weight:700;
                margin-bottom:50px;
                text-align:center;
            }

            .menu{
                display:flex;
                flex-direction:column;
                gap:15px;
            }

            .menu a{
                text-decoration:none;
                color:#fff;
                padding:15px 20px;
                border-radius:14px;
                display:flex;
                align-items:center;
                gap:12px;
                transition:0.3s;
                font-size:16px;
            }

            .menu a:hover{
                background:rgba(255,255,255,0.15);
            }

            .menu a.active{
                background:rgba(255,255,255,0.18);
            }

            /* CONTEÚDO */
            .main-content{
                margin-left:260px;
                width:calc(100% - 260px);
                padding:30px;
            }

            .topbar{
                display:flex;
                justify-content:space-between;
                align-items:center;
                margin-bottom:30px;
            }

            .page-title h1{
                font-size:38px;
                font-weight:700;
                color:#162447;
            }

            .page-title p{
                color:#64748b;
                margin-top:5px;
            }

            .search-box{
                background:#fff;
                border:1px solid #dbe2ea;
                border-radius:14px;
                padding:12px 18px;
                display:flex;
                align-items:center;
                gap:10px;
                width:320px;
            }

            .search-box input{
                border:none;
                outline:none;
                width:100%;
                font-size:15px;
            }

            /* CARD */
            .card-custom{
                background:#fff;
                border-radius:24px;
                padding:25px;
                box-shadow:0 10px 30px rgba(0,0,0,0.05);
            }

            /* BOTÕES */
            .btn-custom{
                background:#0f62fe;
                color:#fff;
                border:none;
                border-radius:12px;
                padding:12px 22px;
                font-weight:500;
                cursor:pointer;
                transition:0.3s;
                text-decoration:none;
                display:inline-flex;
                align-items:center;
                gap:10px;
            }

            .btn-custom:hover{
                background:#004de0;
            }

            .btn-danger{
                background:#ef4444;
            }

            .btn-warning{
                background:#f59e0b;
            }

            /* TABELA */
            table.dataTable{
                border-collapse:collapse !important;
                margin-top:20px !important;
            }

            table.dataTable thead th{
                color:#475569;
                font-weight:600;
                border-bottom:1px solid #e2e8f0 !important;
            }

            table.dataTable tbody td{
                padding:18px 10px !important;
                border-bottom:1px solid #f1f5f9;
            }

            table.dataTable tbody tr:hover{
                background:#f8fafc;
            }

            /* STATUS */
            .status{
                padding:6px 14px;
                border-radius:20px;
                font-size:13px;
                font-weight:600;
            }

            .ativo{
                background:#dcfce7;
                color:#15803d;
            }

            .inativo{
                background:#fee2e2;
                color:#dc2626;
            }

            /* FORM */
            .form-group{
                margin-bottom:20px;
            }

            .form-group label{
                display:block;
                margin-bottom:8px;
                font-weight:500;
            }

            .form-control{
                width:100%;
                padding:14px;
                border:1px solid #dbe2ea;
                border-radius:14px;
                outline:none;
                transition:0.3s;
                font-size:15px;
            }

            .form-control:focus{
                border-color:#0f62fe;
                box-shadow:0 0 0 3px rgba(15,98,254,0.15);
            }

            .row{
                display:flex;
                gap:20px;
                flex-wrap:wrap;
            }

            .col-sm{
                flex:1;
            }

        </style>
    </head>

    <body>