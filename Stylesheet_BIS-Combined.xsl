<!-- main.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:inv="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:cat="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2"
                xmlns:ord="urn:oasis:names:specification:ubl:schema:xsd:Order-2"
                xmlns:ordr="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2"
                exclude-result-prefixes="inv cat ord ordr">

    <!-- Import the individual stylesheets -->
    <xsl:import href="Stylesheet_BIS-BILLING-3_Invoice+CreditNote.xsl"/>
    <xsl:import href="Stylesheet_BIS-Catalogue.xsl"/>
    <xsl:import href="Stylesheet_BIS-Order.xsl"/>
    <xsl:import href="Stylesheet_BIS-OrderResponse.xsl"/>

    <!-- General template that matches any document -->
    <xsl:template match="/">
        <!-- Check the root element and apply appropriate template -->
        <xsl:choose>
            <xsl:when test="inv:Invoice">
                <xsl:apply-templates select="inv:Invoice"/>
            </xsl:when>
            <xsl:when test="cat:Catalogue">
                <xsl:apply-templates select="cat:Catalogue"/>
            </xsl:when>
            <xsl:when test="ord:Order">
                <xsl:apply-templates select="ord:Order"/>
            </xsl:when>
            <xsl:when test="ordr:OrderResponse">
                <xsl:apply-templates select="ordr:OrderResponse"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Unrecognized document type</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>