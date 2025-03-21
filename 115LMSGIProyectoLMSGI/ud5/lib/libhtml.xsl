<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    expand-text="yes"
    version="3.0">
    <xsl:template name="meta">
        <xsl:param name="titulo"/>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="author" content="Óscar Pozuelo"/>
        <meta name="Keywords" content="Horario,Clase"/>
        <meta name="generator" content="Html5"/>
        <meta name="refresh" content="300"/>
        <meta name="robots" content="index,follow"/>
        <title><xsl:value-of select="$titulo"/></title>
    </xsl:template>
</xsl:stylesheet>