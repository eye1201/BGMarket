<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output  method="html" version="5.0" encoding="UTF-8" indent="yes"  omit-xml-declaration="yes"/>
  <xsl:template match="/bgmarket">
    <html lang="es">
    <head>
      <title>Productos y Servicios | BGMarket</title>
      <meta charset="UTF-8"/>
      <link rel="icon" href="..\img\bgmarketlogo.png"/>
      <link rel="stylesheet" href="..\css\eyexslstyle.css" type="text/css"/>
      <meta name= "keywords" content= "bg, market, magazin, balkanica, orehite, familia, lukanka, dobrudzha, shpek,sirene, queso, pate, kashkaval, lyutenitsa, bomboni, bonbones, sezoni, wafle, borovec,medenka, pancito de miel,"/>
    </head>
    <body>
      <!--encabezado-->
      <header>
        <table>
          <tr>
            <td>
              <a href="#"><img type="img" id="logo" src="..\img\bgmarketlogo.png" alt="BGMarketLogo"/></a>
            </td>
            <th><h1><xsl:value-of select="//nombre"/></h1></th>
            <td>
              <ul class="navbar">
                  <li><a href="#">Inicio</a></li>
                  <li><a href="#">Productos</a></li>
                  <li><a href="#">Contacto</a></li>
                  <li><a href="#">Quiénes somos</a></li>
                  <li><a href="#">Registro</a></li>
              </ul>
            </td>
          </tr>
        </table>
      </header>
      <!--fin encabezado-->
      <!--contenido de pagina de pagina-->
      <div class="info">
        <h3>Información</h3>
        <div>
          <xsl:for-each select="infoempresa/descripcion">
           <xsl:copy-of select="p"/>
          </xsl:for-each>
        </div>
        <br/>
        <p> 
            <xsl:for-each select="infoempresa/direccion">
              <xsl:value-of select="../nombre"/>, <xsl:value-of select="lugar"/>, <xsl:value-of select="calle"/>, <xsl:value-of select="numero"/>, <xsl:value-of select="codpostal"/>, <xsl:value-of select="provincia"/>
          </xsl:for-each>
        </p>
        <p>Web oficicial: <a href="{infoempresa/web}"><xsl:value-of select="infoempresa/web"/></a></p>
        <p>Contacta con nosotros: <br/>
          <span>- visitándonos en: <xsl:for-each select="infoempresa/direccion">
              <xsl:value-of select="../nombre"/>, <xsl:value-of select="lugar"/>, <xsl:value-of select="calle"/>, <xsl:value-of select="numero"/>, <xsl:value-of select="codpostal"/>, <xsl:value-of select="provincia"/>
          </xsl:for-each></span><br/>
          <span>- llamándonos: <xsl:value-of select="infoempresa/telefono"/></span><br/>
          <span>- escribiéndonos un mail: <xsl:value-of select="infoempresa/email"/></span><br/><br/>
          <span>Web diseñada por: <xsl:value-of select="infoempresa/disennoweb"/></span><br/><br/>
        </p>
      </div>
      <h3>Productos</h3><br/><br/>
      <div>
        <table class="productos">
          <thead>
            <tr>
              <th>Imagen del producto</th>
              <th>Nombre del producto</th>
              <th>Descripción</th>
              <th>Precio (€)</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Imagen del producto</th>
              <th>Nombre del producto</th>
              <th>Descripción</th>
              <th>Precio (€)</th>
            </tr>
          </tfoot>
          <tbody class="productos2">
            <xsl:for-each select="productos/producto">
            <xsl:sort select="@id"/>
              <xsl:element name="tr">
                <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
               <td>
                <xsl:choose>
                  <xsl:when test="not(img)">
                    <img src="..\img\productos\noproductos.png" alt="Imagen del producto no disponible"/>
                  </xsl:when>
                  <xsl:otherwise>
                   <xsl:copy-of select="img"/>
                  </xsl:otherwise>
                </xsl:choose>
               </td>
                <th><xsl:value-of select="nombreproducto"/></th>
                <td>
                  <xsl:value-of select="descripcionproducto/div"/><br/><br/>
                  <details>
                    <xsl:for-each select="descripcionproducto/detalles/p">
                      <xsl:value-of select="."/><br/>
                    </xsl:for-each>
                  </details>
                </td>
                <td>
                  <xsl:if test="count(precio) = 1">
                    <p><xsl:value-of select="precio"/> &#160; <xsl:value-of select="precio/@moneda"/>(s) </p>
                  </xsl:if>
                  <xsl:if test="count(precio) = 2">
                    <p><xsl:value-of select="precio"/> &#160; <xsl:value-of select="precio/@moneda"/>(s) </p>
                    <p><xsl:value-of select="precio[last()]"/> &#160; <xsl:value-of select="precio/@moneda"/>(s) </p>
                  </xsl:if>
                </td>
              </xsl:element>
            </xsl:for-each>
          </tbody>
        </table>
      </div>
      <!--fin contenido de pagina de pagina-->
      <!--pie de pagina-->
      <footer>
        <p>BGMarket, C.C. Espacio León, Avda. País Leonés, 12, 24010, León.   &#160;    Teléfono de contacto:600 000 000.   &#160;    Correo: eyereviews@protonmail.com</p>
        <p>©Copyright 2018 - 2019 | designed by: E.Y.E.</p>
      </footer>
      <!--fin pie de pagina-->
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>