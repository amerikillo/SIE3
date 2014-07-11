<%-- 
    Document   : index
    Created on : 17/02/2014, 03:34:46 PM
    Author     : Americo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conn.*" %>
<!DOCTYPE html>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyyMMddhhmmss"); %>
<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<%java.text.DateFormat df3 = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<%

    HttpSession sesion = request.getSession();
    String usua = "";
    if (sesion.getAttribute("nombre") != null) {
        usua = (String) sesion.getAttribute("nombre");
    } else {
        response.sendRedirect("index.jsp");
    }
    ConectionDB con = new ConectionDB();
    String folio_gnk = "", fecha = "", folio_remi = "", orden = "", provee = "", recib = "", entrega = "", origen = "", coincide = "", observaciones = "", clave = "", descrip = "", Cb = "", Marca = "", Codbar2 = "", PresPro = "";
    int Cuenta = 0;
    try {
        folio_gnk = (String) session.getAttribute("folio");
        fecha = (String) session.getAttribute("fecha");
        folio_remi = (String) session.getAttribute("folio_remi");
        orden = (String) session.getAttribute("orden");
        provee = (String) session.getAttribute("provee");
        recib = (String) session.getAttribute("recib");
        origen = (String) session.getAttribute("origen");
        Codbar2 = (String) session.getAttribute("codbar2");
        clave = (String) session.getAttribute("clave");
        descrip = (String) session.getAttribute("descrip");
        Cb = (String) session.getAttribute("cb");
        Marca = (String) session.getAttribute("Marca");
        PresPro = (String) session.getAttribute("PresPro");
        Cuenta = Integer.parseInt((String) session.getAttribute("cuenta"));

    } catch (Exception e) {
    }

    if (folio_gnk == null || folio_gnk.equals("")) {
        try {
            con.conectar();
            ResultSet rset = con.consulta("select F_IndCom from tb_indice");
            while (rset.next()) {
                folio_gnk = Integer.toString(Integer.parseInt(rset.getString(1)));
            }

            con.cierraConexion();
        } catch (Exception e) {
        }
        if (folio_gnk == null || folio_gnk.equals("null")) {
            folio_gnk = "1";
        }
        fecha = "";
        folio_remi = "";
        orden = "";
        provee = "";
        recib = "";
        entrega = "";
        origen = "";
        coincide = "";
        observaciones = "";
        clave = "";
        descrip = "";
        Marca = "";
        Codbar2 = "";
        PresPro = "";
    }
    //out.println((String)session.getAttribute("servletMsg"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Estilos CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/datepicker3.css" rel="stylesheet">
        <link rel="stylesheet" href="css/cupertino/jquery-ui-1.10.3.custom.css" />
        <link href="css/navbar-fixed-top.css" rel="stylesheet">
        <!---->
        <title>SIE Sistema de Ingreso de Entradas</title>
    </head>
    <body onLoad="foco();
            mueveReloj();">
        <div class="container">
            <h1>SIALSS</h1>
            <h4>SISTEMA INTEGRAL DE ADMINISTRACIÓN Y LOGÍSTICA PARA SERVICIOS DE SALUD</h4>
            <div class="navbar navbar-default">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="main_menu.jsp">Inicio</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">SIE <b class="caret"></b></a>
                                <ul class="dropdown-menu">

                                    <li><a href="captura.jsp">Captura de Insumos</a></li>
                                    <!--li><a href="captura_handheld.jsp">Captura de Insumos handheld</a></li-->
                                    <li><a href="factura.jsp">Facturación Automática</a></li>
                                    <li><a href="requerimiento.jsp">Carga de Requerimiento</a></li>
                                    <li class="divider"></li>
                                    <li><a href="medicamento.jsp">Catálogo de Insumo para la Salud</a></li>
                                    <li><a href="catalogo.jsp">Catálogo de Proveedores</a></li>
                                    <li><a href="marcas.jsp">Catálogo de Marcas</a></li>
                                    <li><a href="reimpresion.jsp">Reimpresión de Compras</a></li>
                                    <li><a href="reimp_factura.jsp">Reimpresión de Facturas</a></li>
                                    <li class="divider"></li>
                                    <li><a href="http://192.168.2.170:8081/UbicacionesConsolidado" target="_blank">Ubicaciones</a></li>
                                </ul>
                            </li>
                            <!--li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">ADASU<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="captura.jsp">Captura de Insumos</a></li>
                                    <li class="divider"></li>
                                    <li><a href="catalogo.jsp">Catálogo de Proveedores</a></li>
                                    <li><a href="reimpresion.jsp">Reimpresión de Docs</a></li>
                                </ul>
                            </li-->
                            <%
                                if (usua.equals("root")) {
                            %>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Usuario<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="usuarios/usuario_nuevo.jsp">Nuevo Usuario</a></li>
                                    <li><a href="usuarios/edita_usuario.jsp">Edicion de Usuarios</a></li>
                                </ul>
                            </li>
                            <%                                }
                            %>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href=""><span class="glyphicon glyphicon-user"></span> <%=usua%></a></li>
                            <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span></a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Captura de Insumo</h3>
                </div>
                <form class="form-horizontal" role="form" name="formulario1" id="formulario1" method="post" action="Altas">
                    <div class="panel-body">
                        <div class="row">
                            <label for="folio" class="col-sm-2 control-label">No. Folio</label>
                            <div class="col-sm-2">
                                <input type="folio" class="form-control" id="folio" name="folio" placeholder="Folio" readonly value="<%=folio_gnk%>"/>
                            </div>
                            <label for="fecha" class="col-sm-1 control-label">Fecha</label>
                            <div class="col-sm-2">
                                <input type="fecha" class="form-control" id="fecha" name="fecha" placeholder="Fecha" readonly value="<%=df3.format(new java.util.Date())%>">
                            </div>
                            <label for="hora" class="col-sm-1 control-label">Hora</label>
                            <div class="col-sm-2">
                                <input type="hora" class="form-control" id="hora" name="hora" placeholder="Hora" readonly value="<%=df3.format(new java.util.Date())%>">
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <label for="fol_rem" class="col-sm-2 control-label">Folio Remisión</label>
                            <div class="col-sm-3">
                                <input type="fol_rem" class="form-control" id="folio_remi" name="folio_remi" placeholder="Folio Remisión" onKeyPress="return tabular(event, this)" value="<%=folio_remi%>" />
                            </div>
                            <label for="orden" class="col-sm-2 control-label">Orden de Compra</label>
                            <div class="col-sm-3">
                                <input type="orden" class="form-control" id="orden" name="orden" placeholder="Orden de Compra" onKeyPress="return tabular(event, this)" value="<%=orden%>" />
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <label for="prov" class="col-sm-2 control-label">Proveedor</label>
                            <input type="prov" class="hidden" id="provee" name="provee" placeholder="Proveedor" readonly onKeyPress="return tabular(event, this)" value="<%=provee%>" />                             
                            <div class="col-sm-2">
                                <select class="form-control" name="list_provee" onKeyPress="return tabular(event, this)" id="list_provee" onchange="proveedor();">
                                    <option value="">Proveedor</option>
                                    <%
                                        try {
                                            con.conectar();
                                            ResultSet rset = con.consulta("SELECT F_ClaProve,F_NomPro FROM tb_proveedor");
                                            while (rset.next()) {
                                    %>
                                    <option value="<%=rset.getString("F_ClaProve")%>"
                                            <%
                                                if (rset.getString("F_ClaProve").equals(provee)) {
                                                    out.println("selected");
                                                }
                                            %>
                                            ><%=rset.getString("F_NomPro")%></option>
                                    <%
                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {
                                        }
                                    %>
                                </select>

                            </div>
                            <div class="col-sm-1">                                      
                                <button class="btn btn-block btn-primary glyphicon glyphicon-refresh" type = "submit" value = "refresh" name = "accion" ></button>
                            </div>
                            <%

                            %>
                            <div class="col-sm-1">
                                <label for="prov" class="col-sm-2 control-label"><a href="catalogo.jsp" target="_blank">Alta</a></label>
                            </div>
                            <label for="recib" class="col-sm-2 control-label">Recibido por</label>
                            <div class="col-sm-2">
                                <input type="recib" class="form-control" id="recib" name="recib" placeholder="Recibe" onKeyPress="return tabular(event, this)" value = "<%=usua%>" readonly>
                            </div>
                        </div>

                        <!-- En duda -->
                        <!--button class="btn btn-block btn-info">Guardar</button-->
                        <!-- En duda -->
                    </div>
                    <div class="panel-footer">
                        <div class="row">
                            <label for="codigo" class="col-sm-1 control-label">C.B</label>
                            <div class="col-sm-2">
                                <input type="codigo" class="form-control" id="codigo" name="codigo"  placeholder="C. B." maxlength="13" onkeydown="if (event.keyCode == 13) {
                                            document.getElementById('claveCod').click();
                                            return false;
                                        }"  />
                            </div>
                            <div class="col-sm-1">
                                <button class="btn btn-block btn-primary" type = "submit" value = "codigo" id="claveCod" name = "accion">Código</button>
                            </div>
                            <%
                                if (Cuenta == 0) {
                            %>
                            <label for="clave" class="col-sm-1 control-label">Clave</label>
                            <div class="col-sm-2">
                                <input type="clave" class="form-control" id="clave" name="clave" placeholder="Clave" onKeyPress="return tabular(event, this)">
                            </div>
                            <div class="col-sm-1">
                                <button class="btn btn-block btn-primary" type = "submit" value = "clave" name = "accion" >Clave</button>
                            </div>
                        </div>
                        <br/>
                        <div class="row">

                            <label for="descr" class="col-sm-1 control-label">Descripción</label>
                            <div class="col-sm-8">
                                <input type="descr" class="form-control" id="descr" name="descr" placeholder="Descripción" onKeyPress="return tabular(event, this)">
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-block btn-primary"  type = "submit" value = "descripcion" name = "accion" >Descripción</button>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <label for="clave1" class="col-sm-1 control-label">Clave</label>
                            <div class="col-sm-2">
                                <input type="clave1" class="form-control" id="clave1" name="clave1" placeholder="Clave" value="<%=clave%>" readonly onKeyPress="return tabular(event, this)">
                            </div>
                            <label for="descr1" class="col-sm-1 control-label">Descripción</label>
                            <div class="col-sm-3">
                                <textarea class="form-control" name="descripci" id="descripci" readonly onKeyPress="return tabular(event, this)"><%=descrip%></textarea>
                            </div>
                            <label for="descr1" class="col-sm-1 control-label">Presentación</label>
                            <div class="col-sm-3">
                                <textarea class="form-control" name="Presentación" id="Presentación" readonly onKeyPress="return tabular(event, this)"><%=PresPro%></textarea>
                            </div>

                        </div>
                        <br/>
                        <div class="row">                               
                            <label for="Marca" class="col-sm-1 control-label">Marca</label>
                            <div class="col-sm-2">
                                <input type="Marca" class="hidden" id="Marca" name="Marca" readonly="true" placeholder="Marca" onKeyPress="return tabular(event, this)" value="<%=Marca%>" />
                                <select class="form-control" name="list_marca" onKeyPress="return tabular(event, this)" id="list_marca" onchange="marca();">
                                    <option value="">Marca</option>
                                    <%
                                        try {
                                            con.conectar();
                                            ResultSet rset = con.consulta("SELECT F_ClaMar,F_DesMar FROM tb_marca");
                                            while (rset.next()) {
                                    %>
                                    <option value="<%=rset.getString("F_ClaMar")%>"
                                            <%
                                                if (rset.getString("F_ClaMar").equals(Marca)) {

                                                }
                                            %>
                                            ><%=rset.getString("F_DesMar")%></option>
                                    <%
                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="col-sm-1">
                                <button class="btn btn-block btn-primary glyphicon glyphicon-refresh" type = "submit" value = "refresh" name = "accion" ></button>
                            </div>
                            <div class="col-sm-1">
                                <label for="prov" class="col-sm-1 control-label"><a href="marcas.jsp" target="_blank">Alta</a></label>
                            </div>
                            <label for="cb" class="col-sm-2 control-label">Código de Barras</label>
                            <div class="col-sm-2">
                                <input type="cb" class="form-control" id="cb" name="cb" placeholder="C. B." onKeyPress="return tabular(event, this)" maxlength="13" value="<%=Codbar2%>" />                                     
                            </div>
                            <div class="col-sm-1">
                                <button class="btn btn-block btn-primary glyphicon glyphicon-barcode" type = "submit" value = "CodBar" name = "accion" ></button>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <label for="Lote" class="col-sm-1 control-label">Lote</label>
                            <div class="col-sm-2">
                                <input type="Lote" class="form-control" id="Lote" name="Lote" placeholder="Lote" onKeyPress="return tabular(event, this)" />
                            </div>
                            <label for="Caducidad" class="col-sm-1 control-label">Cadu</label>
                            <div class="col-sm-1">
                                <input data-date-format="dd" type="text" class="form-control" id="cdd" name="cdd" placeholder="Día" onKeyPress="return handleEnter(this, even)" onkeyup="putDays()" maxlength="2" />                                
                            </div>
                            <div class="col-sm-1">
                                <input data-date-format="mm" type="text" class="form-control" id="cmm" name="cmm" placeholder="Mes" onKeyPress="return handleEnter(this, even)" onkeyup="putMonthss()"  maxlength="2" />
                            </div>
                            <div class="col-sm-1">
                                <input data-date-format="yyyy" type="text" class="form-control" id="caa" name="caa" placeholder="Año" onKeyPress="return handleEnter(this, even)" onkeyup="putYearss()" maxlength="4" />
                            </div>    
                        </div>
                        <%} else {
                            int numLot = 0;
                            String F_ClaPro = "", F_ClaLot = "", F_FecCad = "", F_FecFab = "", F_DesPro = "", F_ClaMar = "";
                            try {
                                con.conectar();
                                ResultSet rset = con.consulta("SELECT c.F_ClaPro, c.F_ClaLot, c.F_FecCad, c.F_FecFab, m.F_DesPro, m.F_PrePro, mar.F_ClaMar FROM tb_cb c, tb_medica m, tb_marca mar WHERE mar.F_ClaMar = c.F_ClaMar and c.F_ClaPro = m.F_ClaPro and F_Cb='" + Cb + "' ");
                                while (rset.next()) {
                                    numLot++;
                                    F_ClaPro = rset.getString(1);
                                    F_ClaLot = rset.getString(2);
                                    F_FecCad = df3.format(df2.parse(rset.getString(3)));
                                    F_FecFab = df3.format(df2.parse(rset.getString(4)));
                                    F_DesPro = rset.getString(5);
                                    F_ClaMar = rset.getString(7);
                                    PresPro = rset.getString(6);
                                }
                                con.cierraConexion();
                            } catch (Exception e) {
                                System.out.println(e.getMessage());
                            }
                            if (numLot != 1) {
                                //F_ClaPro = "";
                                F_ClaLot = "";
                                F_FecCad = "";
                                F_FecFab = "";
                            }
                        %>
                    </div>
                    <br/>
                    <div class="row">
                        <label for="clave1" class="col-sm-1 control-label">Clave</label>
                        <div class="col-sm-2">
                            <input type="clave1" class="form-control" id="clave1" name="clave1" placeholder="Clave" onKeyPress="return tabular(event, this)" value="<%=F_ClaPro%>">
                        </div>
                        <%
                            if (numLot != 1) {
                        %>
                        <div class="col-sm-2">
                            <select class="form-control" name="list_clave" onKeyPress="return tabular(event, this)" id="list_clave" onchange="clave();">
                                <option value="">Claves</option>
                                <%
                                    try {
                                        con.conectar();
                                        ResultSet rset = con.consulta("SELECT F_ClaPro FROM tb_cb WHERE F_Cb='" + Cb + "' GROUP BY F_ClaPro");
                                        while (rset.next()) {
                                            out.println("<option value = '" + rset.getString("F_ClaPro") + "'>" + rset.getString("F_ClaPro") + "</option>");
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {
                                    }
                                %>
                            </select>
                        </div>
                        <%
                            }
                        %>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="despro1" name="despro1" placeholder="Descripción" onKeyPress="return tabular(event, this)" value="<%=F_DesPro%>">
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <label for="descr1" class="col-sm-1 control-label">Presentación</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="Presentación" id="Presentación" readonly onKeyPress="return tabular(event, this)"><%=PresPro%></textarea>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <label for="Marca" class="col-sm-1 control-label">Marca</label>
                        <input type="Marca" class="hidden" id="Marca" name="Marca" readonly="true" placeholder="Marca" onKeyPress="return tabular(event, this)" value="<%=F_ClaMar%>" />
                        <div class="col-sm-2">
                            <select class="form-control" name="list_marca" onKeyPress="return tabular(event, this)" id="list_marca" onchange="marca();">
                                <option value="">Marca</option>
                                <%
                                    try {
                                        con.conectar();
                                        ResultSet rset = con.consulta("SELECT F_ClaMar,F_DesMar FROM tb_marca group by F_DesMar");
                                        while (rset.next()) {
                                            System.out.println(F_ClaMar + "---" + rset.getString("F_ClaMar"));
                                %>
                                <option value="<%=rset.getString("F_ClaMar")%>" 
                                        <%
                                            if (rset.getString("F_ClaMar").equals(F_ClaMar)) {
                                                out.println("selected");
                                            }
                                        %>
                                        ><%=rset.getString("F_DesMar")%></option>
                                <%
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-sm-1">
                            <button class="btn btn-block btn-primary glyphicon glyphicon-refresh" type = "submit" value = "refresh" name = "accion" ></button>
                        </div>
                        <div class="col-sm-1">
                            <label for="prov" class="col-sm-1 control-label"><a href="marcas.jsp" target="_blank">Alta</a></label>
                        </div>
                    </div>
                    <br/>
                    <div class="row">                                
                        <label for="Lote" class="col-sm-1 control-label">Lote</label>
                        <div class="col-sm-2">
                            <input type="Lote" class="form-control" id="Lote" name="Lote" placeholder="Lote" onKeyPress="return tabular(event, this)" value="<%=F_ClaLot%>" />
                        </div>
                        <div class="col-sm-2">
                            <%
                                if (numLot != 1) {
                            %>
                            <select class="form-control" name="list_lote" onKeyPress="return tabular(event, this)" id="list_lote" onchange="lotes();
                                    cambiaLoteCadu(this);">
                                <option value="">Lotes</option>
                                <%
                                    try {
                                        con.conectar();
                                        ResultSet rset = con.consulta("SELECT F_ClaLot FROM tb_cb WHERE F_Cb='" + Cb + "' group by F_ClaLot order by F_ClaLot");
                                        while (rset.next()) {
                                            out.println("<option value = '" + rset.getString("F_ClaLot") + "'>" + rset.getString("F_ClaLot") + "</option>");
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {
                                    }
                                %>
                            </select>
                            <%
                                }
                            %>
                        </div>
                        <label for="cb" class="col-sm-2 control-label">Código de Barras</label>
                        <div class="col-sm-2">
                            <input type="cb" class="form-control" id="cb" name="cb" placeholder="C. B." onKeyPress="return tabular(event, this)" value="<%=Cb%>" maxlength="13" readonly="true" />
                        </div>
                    </div>
                    <br/>
                    <div class="row">

                        <label for="Caducidad" class="col-sm-1 control-label">Cadu</label>
                        <div class="col-sm-2">
                            <input data-date-format="dd" type="text" class="form-control" id="cdd" name="cdd" placeholder="Caducidad" onKeyPress="return handleEnter(this, even)" onkeyup="" maxlength="10" value="<%=F_FecCad%>"  />                                
                        </div>
                        <div class="col-sm-2">
                            <%
                                if (numLot != 1) {
                            %>
                            <select class="form-control" name="list_cadu" onKeyPress="return tabular(event, this)" id="list_cadu" onchange="cadu();">
                                <option value="">Caducidad</option>
                                <%
                                    try {
                                        con.conectar();
                                        ResultSet rset = con.consulta("SELECT DATE_FORMAT(F_FecCad,'%d/%m/%Y') as caducidad FROM tb_cb WHERE F_Cb='" + Cb + "'  group by F_ClaLot order by F_ClaLot");
                                        while (rset.next()) {
                                            out.println("<option value = '" + rset.getString("caducidad") + "'>" + rset.getString("caducidad") + "</option>");
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {
                                    }
                                %>
                            </select>
                            <%
                                }
                            %>
                        </div>
                        <label for="FecFab" class="col-sm-1 control-label">Fec Fab</label>
                        <div class="col-sm-2">
                            <input data-date-format="dd" type="text" class="form-control" id="fdd" name="fdd" placeholder="Fabricación" onKeyPress="return handleEnter(this, even)" onkeyup="putDaysf()" maxlength="2" value="<%=F_FecFab%>" />
                        </div>
                        <div class="col-sm-2">
                            <%
                                if (numLot != 1) {
                            %>
                            <select class="form-control" name="list_fabri" onKeyPress="return tabular(event, this)" id="list_fabri" onchange="fabri();">
                                <option value="">Fabricación</option>
                                <%
                                    try {
                                        con.conectar();
                                        ResultSet rset = con.consulta("SELECT DATE_FORMAT(F_FecFab,'%d/%m/%Y') as fabricacion FROM tb_cb WHERE F_Cb='" + Cb + "'  group by F_ClaLot order by F_ClaLot");
                                        while (rset.next()) {
                                            out.println("<option value = '" + rset.getString("fabricacion") + "'>" + rset.getString("fabricacion") + "</option>");
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {
                                    }
                                %>
                            </select>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <%}%>
                    <br/>
                    <h5><strong>Tarimas Completas</strong></h5>
                    <div class="row">

                        <label for="Cajas" class="col-sm-2 control-label">Tarimas</label>
                        <div class="col-sm-1">
                            <input type="Cajas" class="form-control" id="TarimasC" name="TarimasC" placeholder="0" onKeyPress="return justNumbers(event);
                                    return handleEnter(even);" onkeyup="totalPiezas();"  />
                        </div>
                        <label for="pzsxcaja" class="col-sm-2 control-label">Cajas x Tarima</label>
                        <div class="col-sm-1">
                            <input type="pzsxcaja" class="form-control" id="CajasxTC" name="CajasxTC" placeholder="0" onKeyPress="return justNumbers(event);" onkeyup="totalPiezas();" />
                        </div>
                        <label for="Resto" class="col-sm-2 control-label">Piezas x Caja</label>
                        <div class="col-sm-1">
                            <input type="Resto" class="form-control" id="PzsxCC" name="PzsxCC" placeholder="0" onKeyPress="return justNumbers(event);" onkeyup="totalPiezas();"  />
                        </div>
                    </div>
                    <br/>
                    <h5><strong>Tarimas Incompletas</strong></h5>
                    <div class="row">

                        <label for="Cajas" class="col-sm-2 control-label">Tarimas</label>
                        <div class="col-sm-1">
                            <input type="Cajas" class="form-control" id="TarimasI" name="TarimasI" placeholder="0" onKeyPress="return justNumbers(event);
                                    return handleEnter(even);" onkeyup="totalPiezas();"  />
                        </div>
                        <label for="pzsxcaja" class="col-sm-2 control-label">Cajas x Tarima</label>
                        <div class="col-sm-1">
                            <input type="pzsxcaja" class="form-control" id="CajasxTI" name="CajasxTI" placeholder="0" onKeyPress="return justNumbers(event);" onkeyup="totalPiezas();" />
                        </div>
                    </div>
                    <br/>
            </div>
            <div class="panel-body">
                <h5><strong>Totales</strong></h5>
                <div class="row">

                    <label for="Cajas" class="col-sm-2 control-label">Tarimas</label>
                    <div class="col-sm-1">
                        <input type="text" class="form-control" id="Tarimas" name="Tarimas" placeholder="0" readonly="" onKeyPress="return justNumbers(event);
                                return handleEnter(even);" onkeyup="totalPiezas();"  />
                    </div>
                    <label for="pzsxcaja" class="col-sm-2 control-label">Cajas x Tarima</label>
                    <div class="col-sm-1">
                        <input type="text" class="form-control" id="Cajas" name="Cajas" placeholder="0" readonly="" onKeyPress="return justNumbers(event);" onkeyup="totalPiezas();" />
                    </div>
                    <label for="Resto" class="col-sm-2 control-label">Piezas x Caja</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="Piezas" name="Piezas" placeholder="0" readonly="" onKeyPress="return justNumbers(event);" onkeyup="totalPiezas();"  />
                    </div>
                </div>
                <br/>
                <!-- En duda -->
                <%
                    if (Cuenta == 0) {
                %>
                <button class="btn btn-block btn-primary" type="submit" name="accion" value="capturar" onclick="return (validaCapturaVacios());">Capturar</button>
                <%} else {%>
                <button class="btn btn-block btn-primary" type="submit" name="accion" value="capturarcb" onclick="return (validaCapturaVacioscb());">Capturar</button>
                <%}%>
                <!-- En duda -->
            </div>
        </form>
    </div>
    <div class="panel-body panel-default">
        <table class="table table-bordered table-striped">
            <tr>
                <td><a name="ancla"></a>Código de Barras</td>
                <td>Clave</td>
                <td>Descripción</td>                       
                <td>Lote</td>
                <td>Caducidad</td>                        
                <td>Existencia</td>
                <td></td>
            </tr>
            <%
                int banCompra = 0;
                String obser = "";
                try {
                    con.conectar();
                    ResultSet rset = con.consulta("SELECT C.F_Cb,C.F_ClaPro,M.F_DesPro,C.F_Lote,C.F_FecCad,C.F_Pz,F_IdCom FROM tb_compratemp C INNER JOIN tb_medica M ON C.F_ClaPro=M.F_ClaPro WHERE F_FecApl=CURDATE() AND F_User='" + usua + "'");
                    while (rset.next()) {
                        banCompra = 1;

            %>
            <tr>
                <td><%=rset.getString(1)%></td>
                <td><%=rset.getString(2)%></td>
                <td><%=rset.getString(3)%></td>
                <td><%=rset.getString(4)%></td>
                <td><%=rset.getString(5)%></td>
                <td><%=rset.getString(6)%></td>                        
                <td>

                    <form method="get" action="Modificaciones">
                        <input name="id" type="text" style="" class="hidden" value="<%=rset.getString(7)%>" />
                        <button class="btn btn-warning" name="accion" value="modificar"><span class="glyphicon glyphicon-pencil" ></span></button>
                        <button class="btn btn-danger" onclick="return confirm('¿Seguro de que desea eliminar?');" name="accion" value="eliminar"><span class="glyphicon glyphicon-remove"></span>
                        </button>
                    </form>
                </td>
            </tr>
            <%
                    }
                    con.cierraConexion();
                } catch (Exception e) {

                }
            %>
            <%
                if (banCompra == 1) {
            %>
            <tr>

                <td colspan="7">
                    <div class="col-lg-3 col-lg-offset-6">
                        <form action="Nuevo" method="post">
                            <input name="fol_gnkl" type="text" style="" class="hidden" value="<%=folio_gnk%>" />
                            <button  value="Eliminar" name="accion" class="btn btn-danger btn-block" onclick="return confirm('Seguro que desea eliminar la compra?');">Cancelar Compra</button>
                        </form>
                    </div>
                    <div class="col-lg-3">
                        <form action="Nuevo" method="post">
                            <input name="fol_gnkl" type="text" style="" class="hidden" value="<%=folio_gnk%>" />
                            <button  value="Guardar" name="accion" class="btn btn-success  btn-block" onclick="return confirm('Seguro que desea realizar la compra?');
                                    return validaCompra();">Confirmar Compra</button>
                        </form>
                    </div>
                    <!--div class="col-lg-3">
                        <form action="reimpReporte.jsp" target="_blank">
                            <input class="hidden" name="fol_gnkl" value="<%=folio_gnk%>">
                            <button class="btn btn-success btn-block">Imprimir Compra</button>
                        </form>
                    </div>
                    <div class="col-lg-3">
                        <form action="reimp_marbete.jsp" target="_blank">
                            <input class="hidden" name="fol_gnkl" value="<%=folio_gnk%>">
                            <button class="btn btn-primary btn-block">Imprimir Marbete</button>
                        </form>
                    </div-->
                </td>
                <!--td colspan="2"><a href="Reporte.jsp" target="_blank" class="btn btn-success btn-block">Imprimir</a></td-->
            </tr>
            <%
                }
            %>

        </table>

    </div>
</div>

<br><br><br>
<div class="navbar navbar-inverse">
    <div class="text-center text-muted">
        GNK Logística || Desarrollo de Aplicaciones 2009 - 2014 <span class="glyphicon glyphicon-registration-mark"></span><br />
        Todos los Derechos Reservados
    </div>
</div>
</body>
</html>


<!-- 
================================================== -->
<!-- Se coloca al final del documento para que cargue mas rapido -->
<!-- Se debe de seguir ese orden al momento de llamar los JS -->

<script src="js/jquery-1.9.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery-ui-1.10.3.custom.js"></script>
<script src="js/bootstrap-datepicker.js"></script>

<script>


                                var formatNumber = {
                                    separador: ",", // separador para los miles
                                    sepDecimal: '.', // separador para los decimales
                                    formatear: function(num) {
                                        num += '';
                                        var splitStr = num.split('.');
                                        var splitLeft = splitStr[0];
                                        var splitRight = splitStr.length > 1 ? this.sepDecimal + splitStr[1] : '';
                                        var regx = /(\d+)(\d{3})/;
                                        while (regx.test(splitLeft)) {
                                            splitLeft = splitLeft.replace(regx, '$1' + this.separador + '$2');
                                        }
                                        return this.simbol + splitLeft + splitRight;
                                    },
                                    new : function(num, simbol) {
                                        this.simbol = simbol || '';
                                        return this.formatear(num);
                                    }
                                }

                                function totalPiezas() {
                                    var TarimasC = document.getElementById('TarimasC').value;
                                    var CajasxTC = document.getElementById('CajasxTC').value;
                                    var PzsxCC = document.getElementById('PzsxCC').value;
                                    var TarimasI = document.getElementById('TarimasI').value;
                                    var CajasxTI = document.getElementById('CajasxTI').value;
                                    if (TarimasC === "") {
                                        TarimasC = 0;
                                    }
                                    if (CajasxTC === "") {
                                        CajasxTC = 0;
                                    }
                                    if (PzsxCC === "") {
                                        PzsxCC = 0;
                                    }
                                    if (TarimasI === "") {
                                        TarimasI = 0;
                                    }
                                    if (CajasxTI === "") {
                                        CajasxTI = 0;
                                    }
                                    var totalTarimas = parseInt(TarimasC) + parseInt(TarimasI);
                                    document.getElementById('Tarimas').value = formatNumber.new(totalTarimas);
                                    var totalCajas = parseInt(CajasxTC) * parseInt(TarimasC) + parseInt(CajasxTI);
                                    document.getElementById('Cajas').value = formatNumber.new(totalCajas);
                                    var totalTarimas = parseInt(TarimasC) + parseInt(TarimasI);
                                    document.getElementById('Tarimas').value = formatNumber.new(totalTarimas);


                                    var totalPiezas = parseInt(PzsxCC) * parseInt(totalCajas);
                                    document.getElementById('Piezas').value = formatNumber.new(totalPiezas);
                                }

                                function cambiaLoteCadu(elemento) {
                                    var indice = elemento.selectedIndex;
                                    document.getElementById('list_cadu').selectedIndex = indice;
                                    document.getElementById('list_fabri').selectedIndex = indice;
                                    document.getElementById('cdd').value = document.getElementById('list_cadu').value;
                                    document.getElementById('fdd').value = document.getElementById('list_fabri').value;
                                    document.getElementById('TarimasC').focus();
                                }

                                $(function() {
                                    var availableTags = [
    <%
        try {
            con.conectar();
            ResultSet rset = con.consulta("SELECT F_DesPro  FROM tb_medica");
            while (rset.next()) {
                out.println("\'" + rset.getString("F_DesPro") + "\',");
            }
            con.cierraConexion();
        } catch (Exception e) {
        }
    %>
                                    ];
                                    $("#descr").autocomplete({
                                        source: availableTags
                                    });
                                });
                                $(function() {
                                    var availableTags = [
    <%
        try {
            con.conectar();
            ResultSet rset = con.consulta("SELECT F_NomPro  FROM tb_proveedor");
            while (rset.next()) {
                out.println("\'" + rset.getString("F_NomPro") + "\',");
            }
            con.cierraConexion();
        } catch (Exception e) {
        }
    %>
                                    ];
                                    $("#provee").autocomplete({
                                        source: availableTags
                                    });
                                });
                                function ubi() {
                                    var ubi = document.formulario1.ubica.value;
                                    document.formulario1.ubicacion.value = ubi;
                                }
                                function proveedor() {
                                    var proveedor = document.formulario1.list_provee.value;
                                    document.formulario1.provee.value = proveedor;
                                    document.formulario1.codigo.focus();
                                }
                                function marca() {
                                    var marca = document.formulario1.list_marca.value;
                                    document.formulario1.Marca.value = marca;
                                    document.formulario1.Lote.focus();
                                }
                                function clave() {
                                    var clave = document.formulario1.list_clave.value;
                                    document.formulario1.clave1.value = clave;
                                }
                                function lotes() {
                                    var lote = document.formulario1.list_lote.value;
                                    document.formulario1.Lote.value = lote;
                                }
                                function cadu() {
                                    var cadu = document.formulario1.list_cadu.value;
                                    document.formulario1.cdd.value = cadu;
                                }
                                function fabri() {
                                    var fabri = document.formulario1.list_fabri.value;
                                    document.formulario1.fdd.value = fabri;
                                }
                                function orig() {
                                    var origen = document.formulario1.ori.value;
                                    document.formulario1.origen.value = origen;
                                }


                                function tabular(e, obj)
                                {
                                    tecla = (document.all) ? e.keyCode : e.which;
                                    if (tecla != 13)
                                        return;
                                    frm = obj.form;
                                    for (i = 0; i < frm.elements.length; i++)
                                        if (frm.elements[i] == obj)
                                        {
                                            if (i == frm.elements.length - 1)
                                                i = -1;
                                            break
                                        }
                                    /*ACA ESTA EL CAMBIO*/
                                    if (frm.elements[i + 1].disabled == true)
                                        tabular(e, frm.elements[i + 1]);
                                    else
                                        frm.elements[i + 1].focus();
                                    return false;
                                }

                                function foco() {
                                    document.formulario1.folio_remi.focus();
                                    var provee = document.formulario1.provee.value;
                                    if (provee !== "") {
                                        document.formulario1.codigo.focus();
                                        window.scrollTo(0, 380);
                                    }
                                    if (document.getElementById('clave1').value !== "") {
                                        document.getElementById('list_marca').focus();
                                        window.scrollTo(0, 380);
                                    }
    <%
        try {
            if (sesion.getAttribute("CBInex").equals("1") && Cuenta == 0) {
    %>
                                    document.formulario1.cb.value = ('<%=(String) sesion.getAttribute("cb")%>');
                                    if (provee !== "") {

                                        document.formulario1.clave.focus();
                                        window.scrollTo(0, 380);
                                    }

                                    if (document.getElementById('clave1').value !== "") {
                                        document.getElementById('list_marca').focus();
                                        window.scrollTo(0, 380);
                                    }
    <%
            }
        } catch (Exception e) {

        }
    %>
                                }





                                function validaCompra() {
                                    var RegExPattern = /^\d{1,2}\/\d{1,2}\/\d{2,4}$/;
                                    var folio_remi = document.formulario1.folio_remi.value;
                                    var orden = document.formulario1.orden.value;
                                    var provee = document.formulario1.provee.value;
                                    var recib = document.formulario1.recib.value;

                                    if (folio_remi === "" || orden === "" || provee === "" || recib === "") {
                                        alert("Tiene campos vacíos, verifique.");
                                        return false;
                                    }
                                    return true;
                                }
                                function justNumbers(e)
                                {
                                    var keynum = window.event ? window.event.keyCode : e.which;
                                    if ((keynum == 8) || (keynum == 46))
                                        return true;

                                    return /\d/.test(String.fromCharCode(keynum));
                                }
                                otro = 0;
                                function LP_data() {
                                    var key = window.event.keyCode;//codigo de tecla. 
                                    if (key < 48 || key > 57) {//si no es numero 
                                        window.event.keyCode = 0;//anula la entrada de texto. 
                                    }
                                }
                                function anade(esto) {
                                    if (esto.value.length > otro) {
                                        if (esto.value.length == 2) {
                                            esto.value += "/";
                                        }
                                    }
                                    if (esto.value.length > otro) {
                                        if (esto.value.length == 5) {
                                            esto.value += "/";
                                        }
                                    }
                                    if (esto.value.length < otro) {
                                        if (esto.value.length == 2 || esto.value.length == 5) {
                                            esto.value = esto.value.substring(0, esto.value.length - 1);
                                        }
                                    }
                                    otro = esto.value.length
                                }
                                function putDays()
                                {
                                    var dayv = document.formulario1.cdd.value;
                                    if (dayv >= 0 && dayv <= 31)
                                    {
                                        var day = document.formulario1.cdd.value.length + 1;
                                        if (day <= 2)
                                        {
                                            document.formulario1.cdd.focus()
                                        }
                                        else
                                        {
                                            document.formulario1.cmm.focus()
                                        }
                                    } else
                                    {
                                        alert("DIA Fuera de Rango: " + dayv);
                                        document.formulario1.cdd.value = "";
                                        document.formulario1.cdd.focus();
                                    }
                                }
                                function putMonthss() {
                                    var month = document.formulario1.cmm.value.length + 1;
                                    var monthv = document.formulario1.cmm.value;
                                    if (monthv >= 0 && monthv <= 12)
                                    {
                                        if (month <= 2)
                                        {
                                            document.formulario1.cmm.focus()
                                        } else {
                                            document.formulario1.caa.focus()
                                        }
                                    } else {
                                        alert("MES Fuera de Rango: " + monthv);
                                        document.formulario1.cmm.value = "";
                                        document.formulario1.cmm.focus();
                                    }
                                }
                                function putYearss() {
                                    var year = document.formulario1.caa.value.length + 1;
                                    var yearv = document.formulario1.caa.value;
                                    if (year <= 4) {
                                        document.formulario1.caa.focus()
                                    } else {
                                        document.formulario1.TarimasC.focus()
                                    }
                                    if (year == 5) {
                                        var dtFechaActual = new Date();
                                        var sumarDias = parseInt(276);
                                        dtFechaActual.setDate(dtFechaActual.getDate() + sumarDias);
                                        var d = new Date();
                                        var day = document.formulario1.cdd.value;
                                        var month = document.formulario1.cmm.value;
                                        var years = document.formulario1.caa.value;
                                        var cadu = years + "-" + month + "-" + day;

                                        if (Date.parse(dtFechaActual) > Date.parse(cadu)) {
                                            alert("La fecha de caducidad no puede ser menor a 9 meses próximos");
                                            document.formulario1.cdd.value = "";
                                            document.formulario1.cmm.value = "";
                                            document.formulario1.caa.value = "";
                                            document.formulario1.cdd.focus();
                                            return false;
                                        }
                                        /*
                                         if ((yearv <= 2013 || yearv > 2030) || (day < d.getDate() && month <= (d.getMonth() + 1) && yearv <= 2014)) {
                                         if ((yearv <= 2013 || yearv > 2030)) {
                                         alert("Año Fuera de Rango: " + yearv);
                                         document.formulario1.caa.value = "";
                                         document.formulario1.caa.focus();
                                         }
                                         if ((day < d.getDate() && month <= (d.getMonth() + 9) && yearv <= 2014)) {
                                         alert("Fecha Caduca, Fíjate Mano!: " + day + "/" + month + "/" + yearv);
                                         document.formulario1.cdd.value = "";
                                         document.formulario1.cmm.value = "";
                                         document.formulario1.caa.value = "";
                                         document.formulario1.cdd.focus();
                                         }
                                         }*/
                                    }
                                }

                                function validaCapturaVacios() {
                                    var missinginfo = "";
                                    if ($("#folio_remi").val() == "") {
                                        missinginfo += "\n El campo Folio Remisión no debe de estar vacío";
                                    }
                                    if ($("#orden").val() == "") {
                                        missinginfo += "\n El campo Número Compra no debe de estar vacío";
                                    }
                                    if ($("#provee").val() == "") {
                                        missinginfo += "\n El campo Proveedor no debe de estar vacío";
                                    }
                                    if ($("#clave1").val() == "") {
                                        missinginfo += "\n El campo Clave no debe de estar vacío";
                                    }
                                    if ($("#cb").val() == "") {
                                        missinginfo += "\n El campo Código Barra no debe de estar vacío";
                                    }
                                    if ($("#Marca").val() == "") {
                                        missinginfo += "\n El campo Marca no debe de estar vacío";
                                    }
                                    if ($("#Lote").val() == "") {
                                        missinginfo += "\n El campo Lote no debe de estar vacío";
                                    }
                                    if ($("#cdd").val() == "") {
                                        missinginfo += "\n El campo Caducidad no debe de estar vacío";
                                    }
                                    if ($("#fdd").val() == "") {
                                        missinginfo += "\n El campo Fabricación no debe de estar vacío";
                                    }
                                    if ($("#Piezas").val() === "" || $("#Piezas").val() === "0") {
                                        var caja = parseInt(0);
                                    }

                                    if (missinginfo != "") {
                                        missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA ENVIAR PETICIÓN DE SOPORTE:\n" + missinginfo + "\n\n ¡INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ!\n";
                                        alert(missinginfo);

                                        return false;
                                    } else {
                                        if (parseInt(caja) === 0) {
                                            missinginfo = "\n El total de piezas no puede ser \'0\'";
                                            alert(missinginfo);
                                            return false;
                                        }
                                        return true;
                                    }


                                }
                                function validaCapturaVacioscb() {
                                    var cv = $("#clave1").val();

                                    var missinginfo = "";
                                    if ($("#folio_remi").val() == "") {
                                        missinginfo += "\n El campo Folio Remisión no debe de estar vacío";
                                    }
                                    if ($("#orden").val() == "") {
                                        missinginfo += "\n El campo Número Compra no debe de estar vacío";
                                    }
                                    if ($("#provee").val() == "") {
                                        missinginfo += "\n El campo Proveedor no debe de estar vacío";
                                    }
                                    if ($("#clave1").val() == "") {
                                        missinginfo += "\n El campo Clave no debe de estar vacío";
                                    }
                                    if ($("#cb").val() == "") {
                                        missinginfo += "\n El campo Código Barra no debe de estar vacío";
                                    }
                                    if ($("#Marca").val() == "") {
                                        missinginfo += "\n El campo Marca no debe de estar vacío";
                                    }
                                    if ($("#Lote").val() == "") {
                                        missinginfo += "\n El campo Lote no debe de estar vacío";
                                    }
                                    if ($("#cdd").val() == "") {
                                        missinginfo += "\n El campo Caducidad no debe de estar vacío";
                                    }
                                    if ($("#fdd").val() == "") {
                                        missinginfo += "\n El campo Fabricación no debe de estar vacío";
                                    }
                                    if ($("#Piezas").val() === "" || $("#Piezas").val() === "0") {
                                        var caja = parseInt(0);
                                    }

                                    var total = (caja * piezas) + resto;

                                    if (missinginfo != "") {
                                        missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA ENVIAR PETICIÓN DE SOPORTE:\n" + missinginfo + "\n\n ¡INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ!\n";
                                        alert(missinginfo);

                                        return false;
                                    } else {
                                        if (parseInt(total) === 0) {
                                            missinginfo = "\n El total de piezas no puede ser \'0\'";
                                            alert(missinginfo);
                                            return false;
                                        }
                                        return true;
                                    }


                                }
                                function mueveReloj() {
                                    momentoActual = new Date()
                                    hora = ((momentoActual.getHours() < 10 ? '0' : '') + momentoActual.getHours())
                                    minuto = ((momentoActual.getMinutes() < 10 ? '0' : '') + momentoActual.getMinutes())
                                    segundo = ((momentoActual.getSeconds() < 10 ? '0' : '') + momentoActual.getSeconds())

                                    horaImprimible = hora + " : " + minuto + " : " + segundo

                                    document.formulario1.hora.value = horaImprimible

                                    setTimeout("mueveReloj()", 1000)
                                }



</script> 