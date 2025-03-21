<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    expand-text="yes"
    version="3.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:include href="../../lib/libhtml.xsl"/>
    <xsl:template match="/prediccion">
        <html>
            <head>
                <xsl:call-template name="meta">
                    <xsl:with-param name="titulo" select="'07 XSLT Óscar Pozuelo Villamandos.'"/>
                </xsl:call-template>
            </head>
            <body>
                <h1>Predicción por municipios.</h1>
                <table>
                    <caption>EL TIEMPO. upper-case(<xsl:value-of select="municipio/nombre"/> (<xsl:value-of select="municipio/provincia"/>))</caption>
                    <thead>
                        <xsl:call-template name="encabezado"/>
                    </thead>
                    <tbody>
                        <xsl:for-each select="dia">
                            <tr>
                                <td><xsl:value-of select="substring(@fecha,9,2)"/></td>
                                <td><xsl:value-of select="concat(prob_precipitacion,'%')"/></td>
                                <td><img src="{concat('images/',estado_cielo,'.gif')}" alt="{descripcion}"/></td>
                                <td>
                                    <span class="TemMinima"><xsl:value-of select="temperatura/minima"/></span>
                                    /<span class="TemMaxima"><xsl:value-of select="temperatura/maxima"/></span>
                                </td>
                                <td>
                                    <img src="{concat('images/',viento/direccion,'.gif')}" alt="{viento/direccion}"/>
                                    <xsl:value-of select="viento/velocidad"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="encabezado">
        <tr>
            <th>Día</th>
            <th>Prob. precip.</th>
            <th>Estado del cielo</th>
            <th>Temperatura (ºC)</th>
            <th>Viento(Km/h)</th>
        </tr>
    </xsl:template>
</xsl:stylesheet>