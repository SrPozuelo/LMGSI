<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0">
    <xsl:param name="corregido" select="'no'"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/examen">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Cuestionario.</title>
            </head>
            <body>
                <header>
                    <h1><xsl:value-of select="datos/nombreCiclo"/></h1>
                    <h2><xsl:value-of select="document('../input/modulosdaw1.xml')/modulos/modulo[@codM=current()/datos/nombreModulo]"/></h2>
                    <h3>Fecha:<xsl:value-of select="/datos/fecha/dia"/> del
                        <xsl:value-of select="document('../input/meses.xml')/meses/mes[@id=current()/datos/fecha/mes]"/> del
                        <xsl:value-of select="datos/fecha/anyo"/>
                    </h3>
                </header>
                <main>
                    <form action="text.php" method="GET">
                        <xsl:for-each select="preguntas/pregunta">
                            <div class="preegunta">
                                <div>
                                    <xsl:value-of select="@id"/>.-
                                    <xsl:value-of select="enunciado"/>
                                </div>
                                <xsl:for-each select="respuestas/respuesta">
                                    <div class="respuesta">
                                        <label>
                                            <xsl:element name="input">
                                                <xsl:attribute name="type" select="'radio'"/>
                                                <xsl:attribute name="name" select="concat('p',../../@id)"/>
                                                <xsl:attribute name="value" select="position()"/>
                                                <xsl:if test="$corregido='si' and @correcta='correcta'">
                                                    <xsl:attribute name="checked"/>
                                                </xsl:if>
                                                <xsl:if test="$corregido">
                                                    <xsl:attribute name="disable"/>
                                                </xsl:if>
                                            </xsl:element>
                                            <xsl:value-of select="./text()"/>
                                        </label>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </xsl:for-each> 
                        <div>
                            <xsl:if test="$corregido='no'">
                                <input type="submit"/>
                                <input type="reset"/>
                            </xsl:if>
                        </div>
                    </form>
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>