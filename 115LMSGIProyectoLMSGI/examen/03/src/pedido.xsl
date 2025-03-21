<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:import href="../../../ud5/lib/libhtml.xsl"/>
    <!-- Plantilla que dado una fecha la escribe en otro formato -->
    <xsl:template match="pedido/@fecha" name="fecha">
        <xsl:variable name="anio" select="substring(., 1, 4)"/>
        <xsl:variable name="mes" select="substring(., 6, 2)"/>
        <xsl:variable name="dia" select="substring(., 9, 2)"/>
        <xsl:value-of select="$dia"/> de
        <xsl:choose>
            <xsl:when test="$mes='01'">enero</xsl:when>
            <xsl:when test="$mes='02'">febrero</xsl:when>
            <xsl:when test="$mes='03'">marzo</xsl:when>
            <xsl:when test="$mes='04'">abril</xsl:when>
            <xsl:when test="$mes='05'">mayo</xsl:when>
            <xsl:when test="$mes='06'">junio</xsl:when>
            <xsl:when test="$mes='07'">julio</xsl:when>
            <xsl:when test="$mes='08'">agosto</xsl:when>
            <xsl:when test="$mes='09'">septiembre</xsl:when>
            <xsl:when test="$mes='10'">octubre</xsl:when>
            <xsl:when test="$mes='11'">noviembre</xsl:when>
            <xsl:when test="$mes='12'">diciembre</xsl:when>
        </xsl:choose> de <xsl:value-of select="$anio"/>
    </xsl:template>

    <xsl:template match="/pedido">
        <html>
            <head>
                <xsl:call-template name="meta">
                    <xsl:with-param name="titulo" select="'Pedidos Óscar Pozuelo Villamandos'"/>
                </xsl:call-template>
                <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <header>
                    <h1>Pedido ID: <xsl:value-of select="@idPedido"/></h1>
                    <h2>Fecha: <xsl:call-template name="fecha"/></h2><!--<xsl:apply-templates select="@fecha"/>-->
                </header>
                <main>
                    <div></div><!--<option value="">Todos</option>-->
                    <div>
                        <xsl:for-each select="tractor">
                            <div class="Fabricante">
                                <img src="{concat('../target/images/',@codigoFabricante,'.png')}" alt="{concat('Fabricante:',document('../input/fabricantes.xml')/fabricantes/fabricante[current()/@codigoFabricante=@codigo]/@nombre)}" width="100" height="75"/>
                                <h3>Fabricante: <xsl:value-of select="document('../input/fabricantes.xml')/fabricante[current()/@codigoFabricante=@codigo]/@nombre"/></h3>
                            </div>
                            <table>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Referencia</th>
                                        <th>Descripción</th>
                                        <th>Fecha Entrega</th>
                                        <th>Peso</th>
                                        <th>Número se Serie</th>
                                        <th>Km Máximos</th>
                                        <th>Cantidad</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:for-each select="componente">
                                        <tr>
                                            <td><img src="{concat('../target/images/',@referencia,'.png')}" alt="{concat('Componente:',document('../input/componentes.xml')/componentes/componente[current()/@referencia=@codigo]/@nombre)}" width="75" height="75"/></td>
                                            <td><xsl:value-of select="@referencia"/></td>
                                            <td><xsl:value-of select="document('../input/componentes.xml')/componentes/componente[current()/@referencia=@codigo]/@nombre"/></td>
                                            <td><xsl:value-of select="fechaEntrega/@dia"/>-<xsl:value-of select="fechaEntrega/@mes"/>-<xsl:value-of select="fechaEntrega/@anio"/></td>
                                            <td><xsl:value-of select="peso"/></td>
                                            <td><xsl:value-of select="numeroSerie"/></td>
                                            <td><xsl:value-of select="kmMaximos"/></td>
                                            <td><xsl:value-of select="cantidad"/></td>
                                        </tr>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                        </xsl:for-each>
                    </div>
                </main>
            </body>
        </html>
    </xsl:template>

    <!-- Plantilla que dado un pedido lo escribe en una tabla -->

</xsl:stylesheet>
