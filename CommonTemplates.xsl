<?xml version="1.0" encoding="utf-8"?>
<!--
******************************************************************************************************************

		PEPPOL Instance Documentation	

		title= PEPPOL_BIS 3CommonTemplates.xml	
		publisher= "SFTI tekniska kansli"
		Creator= SFTI/SL
		created= 2014-02-12
		conformsTo= UBL-Invoice-2.1.xsd
		description= "Common templates for displaying PEPPOL BIS 3, version 2.0"
		
		Derived from work by OIOUBL, Denmark. For more information, see www.sfti.se or email tekniskt.kansli@skl.se
		
******************************************************************************************************************
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:n2="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:cdl="http://docs.oasis-open.org/codelist/ns/genericode/1.0/" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:oasis:names:specification:ubl:schema:xsd:CoreComponentParameters-2" xmlns:sdt="urn:oasis:names:specification:ubl:schema:xsd:SpecializedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="n1 n2 cac cdl cbc ccts sdt udt">
  <xsl:include href="user_config.xsl"/>
  <xsl:variable name="moduleDocBT_en" select="document('Headlines-BT_en.xml')"/>
  <xsl:variable name="moduleDocBT" select="document(concat('Headlines-BT_', $lang, '.xml'))"/>
  <xsl:variable name="invoiceBaseType" select="document(concat('UBLInvoiceBaseType_',$lang, '.xml'))"/>
  <xsl:variable name="UNCL1001" select="document(concat('UNCL1001_', $lang, '.xml'))"/>
  <xsl:variable name="UNCL4461" select="document(concat('UNCL4461_', $lang, '.xml'))"/>
  <xsl:variable name="UNCL7161" select="document(concat('UNCL7161_', $lang, '.xml'))"/>
  <xsl:variable name="UNCL5189" select="document(concat('UNCL5189_', $lang, '.xml'))"/>
  <xsl:variable name="UNCL1153" select="document(concat('UNCL1153_', $lang, '.xml'))"/>
  <xsl:variable name="UNCL4343_T76" select="document(concat('UNCL4343_T76_', $lang, '.xml'))"/>
  <xsl:variable name="UNCL4343_T111" select="document(concat('UNCL4343_T111_', $lang, '.xml'))"/>
  <xsl:variable name="UNCL1229_T76" select="document(concat('UNCL1229_T76_', $lang, '.xml'))"/>
  <xsl:variable name="UBLDescriptionCode" select="document(concat('UBLPeriodDescriptionCode_', $lang, '.xml'))"/>
  <xsl:variable name="UBLTaxCategoryCode" select="document(concat('UBLTaxCategoryCode_', $lang, '.xml'))"/>
  <xsl:variable name="UBLClassificationCode" select="document(concat('UBLClassificationCode_', $lang, '.xml'))"/>
  <xsl:variable name="UBLStatusClarificationReasonCode" select="document(concat('UBLStatusClarificationReasonCode_', $lang, '.xml'))"/>
  <xsl:variable name="UBLStatusClarificationActionCode" select="document(concat('UBLStatusClarificationActionCode_', $lang, '.xml'))"/>
  <xsl:variable name="UNECE" select="document(concat('UNECE_', $lang, '.xml'))"/>
  <xsl:variable name="UNCL1001_en" select="document('UNCL1001_en.xml')"/>
  <xsl:variable name="UNCL4461_en" select="document('UNCL4461_en.xml')"/>
  <xsl:variable name="UNCL7161_en" select="document('UNCL7161_en.xml')"/>
  <xsl:variable name="UNCL5189_en" select="document('UNCL5189_en.xml')"/>
  <xsl:variable name="UNCL1153_en" select="document('UNCL1153_en.xml')"/>
  <xsl:variable name="UNCL4343_T76_en" select="document('UNCL4343_T76_en.xml')"/>
  <xsl:variable name="UNCL4343_T111_en" select="document('UNCL4343_T111_en.xml')"/>
  <xsl:variable name="UNCL1229_T76_en" select="document('UNCL1229_T76_en.xml')"/>
  <xsl:variable name="UBLDescriptionCode_en" select="document('UBLPeriodDescriptionCode_en.xml')"/>
  <xsl:variable name="UBLTaxCategoryCode_en" select="document('UBLTaxCategoryCode_en.xml')"/>
  <xsl:variable name="UBLClassificationCode_en" select="document('UBLClassificationCode_en.xml')"/>
  <xsl:variable name="UBLStatusClarificationReasonCode_en" select="document('UBLStatusClarificationReasonCode_en.xml')"/>
  <xsl:variable name="UBLStatusClarificationActionCode_en" select="document('UBLStatusClarificationActionCode_en.xml')"/>
  <xsl:variable name="invoiceBaseType_en" select="document('UBLInvoiceBaseType_en.xml')"/>
  <xsl:variable name="UNECE_en" select="document('UNECE_en.xml')"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  <!-- Return TermName or in case it exists the DisplayName -->
  <xsl:template name="LabelName">
    <xsl:param name="BT-ID"/>
    <!-- BT inparameter -->
    <xsl:param name="Colon-Suffix"/>
    <xsl:choose>
      <xsl:when test="$moduleDocBT/SemanticModel/BusinessTerm[@id=$BT-ID]/DisplayName">
        <xsl:value-of select="$moduleDocBT/SemanticModel/BusinessTerm[@id=$BT-ID]/DisplayName"/>
        <xsl:choose>
          <xsl:when test="$Colon-Suffix ='true' and $moduleDocBT/SemanticModel/BusinessTerm[@id=$BT-ID]/DisplayName!=''">:&#160;</xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$moduleDocBT/SemanticModel/BusinessTerm[@id=$BT-ID]/TermName">
            <xsl:value-of select="$moduleDocBT/SemanticModel/BusinessTerm[@id=$BT-ID]/TermName"/>
            <xsl:choose>
              <xsl:when test="$Colon-Suffix ='true'">:&#160;</xsl:when>
            </xsl:choose>
          </xsl:when>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!--A function to display currencies with spaces as thousand delimiter-->
  <xsl:template name="Currency">
    <xsl:param name="currencyvalue"/>
    <xsl:variable name="integers" select="substring-before($currencyvalue, '.')"/>
    <xsl:choose>
      <xsl:when test="$integers != ''">
        <xsl:variable name="decimals" select="substring-after($currencyvalue, '.')"/>
        <xsl:variable name="transformedIntegers" select="translate(format-number(number($integers), '#,###'), ',', ' ' )"/>
        <xsl:choose>
          <xsl:when test="$transformedIntegers !='NaN'">
            <xsl:value-of select="concat($transformedIntegers,'.', $decimals)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$currencyvalue"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="transformedIntegers" select="translate(format-number($currencyvalue, '#,###'), ',', ' ' )"/>
        <xsl:choose>
          <xsl:when test="$transformedIntegers !='NaN'">
            <xsl:value-of select="$transformedIntegers"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$currencyvalue"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="getGenericCode">
    <xsl:param name="documentName"/>
    <xsl:param name="documentName_en"/>
    <xsl:param name="documentCode"/>
    <xsl:choose>
      <xsl:when test="$documentName/cdl:CodeList/cdl:SimpleCodeList/cdl:Row/cdl:Value/cdl:SimpleValue[../@ColumnRef='name' and ../../cdl:Value[@ColumnRef='code']/cdl:SimpleValue=$documentCode]">
        <xsl:value-of select="$documentName/cdl:CodeList/cdl:SimpleCodeList/cdl:Row/cdl:Value/cdl:SimpleValue[../@ColumnRef='name' and ../../cdl:Value[@ColumnRef='code']/cdl:SimpleValue=$documentCode]"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$documentName_en/cdl:CodeList/cdl:SimpleCodeList/cdl:Row/cdl:Value/cdl:SimpleValue[../@ColumnRef='name' and ../../cdl:Value[@ColumnRef='code']/cdl:SimpleValue=$documentCode]">
            <xsl:value-of select="$documentName_en/cdl:CodeList/cdl:SimpleCodeList/cdl:Row/cdl:Value/cdl:SimpleValue[../@ColumnRef='name' and ../../cdl:Value[@ColumnRef='code']/cdl:SimpleValue=$documentCode]"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$documentCode"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!--Function to pick the Base Type codes for document header-->
  <xsl:template name="DocumentHeader">
    <xsl:param name="DocumentCode"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$invoiceBaseType"/>
      <xsl:with-param name="documentName_en" select="$invoiceBaseType_en"/>
      <xsl:with-param name="documentCode" select="$DocumentCode"/>
    </xsl:call-template>
  </xsl:template>
  <!--Function to pick the UNCL1001 codes for document header-->
  <xsl:template name="DocumentCode">
    <xsl:param name="DCode"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UNCL1001"/>
      <xsl:with-param name="documentName_en" select="$UNCL1001_en"/>
      <xsl:with-param name="documentCode" select="$DCode"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="UBLDescriptionCode">
    <xsl:param name="Code"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UBLDescriptionCode"/>
      <xsl:with-param name="documentName_en" select="$UBLDescriptionCode_en"/>
      <xsl:with-param name="documentCode" select="$Code"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="UBLTaxCategoryCode">
    <xsl:param name="Code"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UBLTaxCategoryCode"/>
      <xsl:with-param name="documentName_en" select="$UBLTaxCategoryCode_en"/>
      <xsl:with-param name="documentCode" select="$Code"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="UBLClassificationCode">
    <xsl:param name="Code"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UBLClassificationCode"/>
      <xsl:with-param name="documentName_en" select="$UBLClassificationCode_en"/>
      <xsl:with-param name="documentCode" select="$Code"/>
    </xsl:call-template>
  </xsl:template>
  <!--Function to pick the AllowanceReasonCodes-->
  <xsl:template name="AllowanceReasonCode">
    <xsl:param name="AllowanceCode"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UNCL5189"/>
      <xsl:with-param name="documentName_en" select="$UNCL5189_en"/>
      <xsl:with-param name="documentCode" select="$AllowanceCode"/>
    </xsl:call-template>
  </xsl:template>
  <!--Function to pick the ChargeReasonCodes-->
  <xsl:template name="ChargeReasonCode">
    <xsl:param name="ChargeCode"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UNCL7161"/>
      <xsl:with-param name="documentName_en" select="$UNCL7161_en"/>
      <xsl:with-param name="documentCode" select="$ChargeCode"/>
    </xsl:call-template>
  </xsl:template>
  <!--Function to pick up payment means code-->
  <xsl:template name="PaymentMeansCode">
    <xsl:param name="PaymentCode"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UNCL4461"/>
      <xsl:with-param name="documentName_en" select="$UNCL4461_en"/>
      <xsl:with-param name="documentCode" select="$PaymentCode"/>
    </xsl:call-template>
  </xsl:template>
  <!--Function to pick the UNECE codes-->
  <xsl:template name="UNECECode">
    <xsl:param name="Code"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UNECE"/>
      <xsl:with-param name="documentName_en" select="$UNECE_en"/>
      <xsl:with-param name="documentCode" select="$Code"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="InvoicedObjectIdentifierScheme">
    <xsl:param name="InvoicedObjectIdentifier"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UNCL1153"/>
      <xsl:with-param name="documentName_en" select="$UNCL1153_en"/>
      <xsl:with-param name="documentCode" select="$InvoicedObjectIdentifier"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="OrderResponseCode">
    <xsl:param name="Code"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UNCL4343_T76"/>
      <xsl:with-param name="documentName_en" select="$UNCL4343_T76_en"/>
      <xsl:with-param name="documentCode" select="$Code"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="OrderResponseLineCode">
    <xsl:param name="Code"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UNCL1229_T76"/>
      <xsl:with-param name="documentName_en" select="$UNCL1229_T76_en"/>
      <xsl:with-param name="documentCode" select="$Code"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="InvoiceResponseCode">
    <xsl:param name="Code"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UNCL4343_T111"/>
      <xsl:with-param name="documentName_en" select="$UNCL4343_T111_en"/>
      <xsl:with-param name="documentCode" select="$Code"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="StatusClarificationActionCode">
    <xsl:param name="Code"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UBLStatusClarificationActionCode"/>
      <xsl:with-param name="documentName_en" select="$UBLStatusClarificationActionCode_en"/>
      <xsl:with-param name="documentCode" select="$Code"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="StatusClarificationReasonCode">
    <xsl:param name="Code"/>
    <xsl:call-template name="getGenericCode">
      <xsl:with-param name="documentName" select="$UBLStatusClarificationReasonCode"/>
      <xsl:with-param name="documentName_en" select="$UBLStatusClarificationReasonCode_en"/>
      <xsl:with-param name="documentCode" select="$Code"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="replace">
    <xsl:param name="string"/>
    <xsl:choose>
      <xsl:when test="contains($string,'&#10;')">
        <xsl:value-of select="substring-before($string,'&#10;')"/>
        <br/>
        <xsl:call-template name="replace">
          <xsl:with-param name="string" select="substring-after($string,'&#10;')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$string"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="cbc:Note">
    <xsl:call-template name="replace">
      <xsl:with-param name="string" select="."/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="cac:Item/cbc:Description">
    <xsl:call-template name="replace">
      <xsl:with-param name="string" select="."/>
    </xsl:call-template>
  </xsl:template>
  <!--Party templates from here:-->
  <xsl:template match="cac:AccountingSupplierParty | cac:SellerSupplierParty">
    <xsl:call-template name="SellerParty"/>
  </xsl:template>
  <xsl:template match="cac:AccountingCustomerParty | cac:BuyerCustomerParty | cac:ContractorCustomerParty">
    <xsl:call-template name="BuyerParty"/>
  </xsl:template>
  <!--SELLER PARTY STARTS HERE-->  
  <xsl:template name="SellerParty">
    <xsl:call-template name="LabelName">
      <xsl:with-param name="BT-ID" select="'BT-27'"/>
      <xsl:with-param name="Colon-Suffix" select="'true'"/>
    </xsl:call-template>
    <b>
      <xsl:choose>
        <xsl:when test="cac:Party/cac:PartyName">
          <xsl:apply-templates select="cac:Party/cac:PartyName"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
        </xsl:otherwise>
      </xsl:choose>
    </b>
    <br/>
    <b>
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BG-5'"/>
        <xsl:with-param name="Colon-Suffix" select="'false'"/>
      </xsl:call-template>
    </b>
    <xsl:call-template name="SellerPostalAddress"/>
    <xsl:for-each select="cac:Party/cac:PartyIdentification">
      <xsl:if test="cbc:ID">
        <br/>
        <small>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-29'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cbc:ID"/>
          <xsl:if test="cbc:ID/@schemeID !='' ">&#160;[<xsl:apply-templates select="cbc:ID/@schemeID"/>]

					</xsl:if>&#160;</small>
      </xsl:if>
    </xsl:for-each>
    <!--Party legal registration: -->
    <xsl:if test="cac:Party/cac:PartyLegalEntity">
      <xsl:if test="cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
        <br/>
        <small>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-30'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cbc:CompanyID"/>
          <xsl:if test="cac:Party/cac:PartyLegalEntity/cbc:CompanyID/@schemeID">&#160;[<xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cbc:CompanyID/@schemeID"/>]
						
					</xsl:if>
        </small>
      </xsl:if>
      <xsl:if test="cac:Party/cac:PartyLegalEntity/cbc:RegistrationName !=''">
        <br/>
        <small>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-27'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
        </small>
      </xsl:if>
      <xsl:if test="cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalForm">
        <small>
          <br/>
          <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalForm"/>
        </small>
      </xsl:if>
      <xsl:if test="cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress">
        <br/>
        <small>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-33'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:choose>
            <xsl:when test="cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName !='' and 

							cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country !=''">
              <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>,&#160;<xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName !=''">
                <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName"/>
              </xsl:if>
              <xsl:if test="cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country !=''">
                <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country"/>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>
        </small>
      </xsl:if>
    </xsl:if>
    <!--Party VAT registration: -->
    <xsl:if test="cac:Party/cac:PartyTaxScheme">
      <small>
        <xsl:for-each select="cac:Party/cac:PartyTaxScheme">
          <br/>
          <xsl:choose>
            <xsl:when test="cac:TaxScheme/cbc:ID = 'GST'">
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-31-GST'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
              <xsl:apply-templates select="cbc:CompanyID"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-32'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
              <xsl:apply-templates select="cbc:CompanyID"/> [<xsl:value-of select="cac:TaxScheme/cbc:ID"/>]
					</xsl:otherwise>
          </xsl:choose>
          <xsl:if test="cbc:ExemptionReason">
            <br/>&#160;<xsl:apply-templates select="cbc:ExemptionReason"/>
          </xsl:if>
        </xsl:for-each>
      </small>
    </xsl:if>
  </xsl:template>
  <xsl:template name="SellerPartyName">
    <xsl:if test="cac:Party/cbc:Name !=''">
      <xsl:apply-templates select="cbc:Name"/>
    </xsl:if>
  </xsl:template>
  <xsl:template name="SellerPostalAddress">
    <xsl:if test="cac:Party/cac:PostalAddress/cbc:StreetName !=''">
      <br/>
      <span class="UBLStreetName">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-35'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:StreetName"/>
      </span>
    </xsl:if>
    <xsl:if test="cac:Party/cac:PostalAddress/cbc:AdditionalStreetName !=''">
      <br/>
      <span class="UBLAdditionalStreetName">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-36'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:AdditionalStreetName"/>
      </span>
    </xsl:if>
    <xsl:if test="cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line !=''">
      <br/>
      <span class="UBLAdditionalStreetName">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-162'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line"/>
      </span>
    </xsl:if>
    <xsl:if test="cac:Party/cac:PostalAddress/cbc:PostalZone !='' or cac:Party/cac:PostalAddress/cbc:CityName !=''">
      <br/>
      <span class="UBLCityName">
        <xsl:choose>
          <xsl:when test="cac:Party/cac:PostalAddress/cbc:PostalZone !=''">
            <xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BT-38'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
            <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:PostalZone"/>&#160;<xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BT-37'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
            <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:CityName"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BT-37'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
            <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:CityName"/>
          </xsl:otherwise>
        </xsl:choose>
      </span>
    </xsl:if>
    <xsl:if test="cac:Party/cac:PostalAddress/cbc:CountrySubentity !='' or cac:Party/cac:PostalAddress/cac:Country !=''">
      <xsl:choose>
        <xsl:when test="cac:Party/cac:PostalAddress/cbc:CountrySubentity !='' and cac:Party/cac:PostalAddress/cac:Country !=''">
          <br/>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-39'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
          <br/>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-40'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cac:Party/cac:PostalAddress/cac:Country"/>
        </xsl:when>
        <xsl:otherwise>
          <br/>
          <xsl:if test="cac:Party/cac:PostalAddress/cbc:CountrySubentity !=''">
            <xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BT-39'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
            <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
          </xsl:if>
          <xsl:if test="cac:Party/cac:PostalAddress/cac:Country !=''">
            <xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BT-40'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
            <xsl:apply-templates select="cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode"/>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
  <xsl:template name="SellerContact">
    <xsl:if test="cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Name !=''">
      <br/>
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BT-41'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
      <xsl:apply-templates select="cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Name"/>
    </xsl:if>
    <xsl:if test="cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone !=''">
      <br/>
      <span class="UBLTelephone">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-42'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone"/>
      </span>
    </xsl:if>
    <xsl:if test="cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax !=''">
      <br/>
      <span class="UBLTelefax">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-22'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax"/>
      </span>
    </xsl:if>
    <xsl:if test="cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail !=''">
      <br/>
      <span class="UBLElectronicMail">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-43'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>
      </span>
    </xsl:if>
  </xsl:template>
  <xsl:template name="SellerContact_Order">
    <xsl:if test="cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name !=''">
      <br/>
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BT-41'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
      <xsl:apply-templates select="cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name"/>
    </xsl:if>
    <xsl:if test="cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone !=''">
      <br/>
      <span class="UBLTelephone">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-42'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone"/>
      </span>
    </xsl:if>
    <xsl:if test="cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax !=''">
      <br/>
      <span class="UBLTelefax">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-22'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax"/>
      </span>
    </xsl:if>
    <xsl:if test="cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail !=''">
      <br/>
      <span class="UBLElectronicMail">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-43'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>
      </span>
    </xsl:if>
  </xsl:template>
  <!--BUYER PARTY STARTS HERE-->
  <xsl:template name="BuyerParty">
    <xsl:call-template name="LabelName">
      <xsl:with-param name="BT-ID" select="'BT-45'"/>
      <xsl:with-param name="Colon-Suffix" select="'false'"/>
    </xsl:call-template>
    <xsl:choose>
      <xsl:when test="cac:Party/cac:PartyName">
        <xsl:apply-templates select="cac:Party/cac:PartyName"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
      </xsl:otherwise>
    </xsl:choose>
    <br/>
    <b>
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BG-8'"/>
        <xsl:with-param name="Colon-Suffix" select="'false'"/>
      </xsl:call-template>
    </b>
    <xsl:call-template name="BuyerPostalAddress"/>
    <xsl:if test="cac:Party/cac:PartyIdentification/cbc:ID">
      <br/>
      <small>
        <b>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-46'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
        </b>
        <xsl:apply-templates select="cac:Party/cac:PartyIdentification/cbc:ID"/>
        <xsl:if test="cac:Party/cac:PartyIdentification/cbc:ID/@schemeID !='' ">&#160;[<xsl:apply-templates select="cac:Party/cac:PartyIdentification/cbc:ID/@schemeID"/>]

					</xsl:if>
      </small>
    </xsl:if>
    <!--Party legal registration: -->
    <xsl:if test="cac:Party/cac:PartyLegalEntity">
      <xsl:if test="cac:Party/cac:PartyLegalEntity/cbc:CompanyID">
        <br/>
        <small>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-47'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cbc:CompanyID"/>
          <xsl:if test="cac:Party/cac:PartyLegalEntity/cbc:CompanyID/@schemeID !='' ">&#160;[<xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cbc:CompanyID/@schemeID"/>]

					</xsl:if>
        </small>
      </xsl:if>
      <xsl:if test="cac:Party/cac:PartyLegalEntity/cbc:RegistrationName !=''">
        <br/>
        <small>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-44'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
        </small>
      </xsl:if>
    </xsl:if>
    <!--Party VAT registration: -->
    <xsl:if test="cac:Party/cac:PartyTaxScheme">
      <small>
        <xsl:if test="cac:Party/cac:PartyTaxScheme">
          <br/>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-48-GST'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cac:Party/cac:PartyTaxScheme/cbc:CompanyID"/>
          <xsl:if test="cac:Party/cac:PartyTaxScheme/cbc:CompanyID/@schemeID !='' ">&#160;[<xsl:apply-templates select="cac:Party/cac:PartyTaxScheme/cbc:CompanyID/@schemeID"/>]

					</xsl:if>
        </xsl:if>
        <xsl:if test="cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason">
          <br/>
          <xsl:apply-templates select="cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason"/>
        </xsl:if>
      </small>
    </xsl:if>
  </xsl:template>
  <xsl:template name="BuyerPartyName">
    <xsl:if test="cac:Party/cbc:Name !=''">
      <xsl:apply-templates select="cbc:Name"/>
    </xsl:if>
  </xsl:template>
  <xsl:template name="BuyerPostalAddress">
    <xsl:if test="cac:Party/cac:PostalAddress/cbc:StreetName !=''">
      <br/>
      <span class="UBLStreetName">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-50'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:StreetName"/>
      </span>
    </xsl:if>
    <xsl:if test="cac:Party/cac:PostalAddress/cbc:AdditionalStreetName !=''">
      <br/>
      <span class="UBLAdditionalStreetName">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-51'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:AdditionalStreetName"/>
      </span>
    </xsl:if>
    <xsl:if test="cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line !=''">
      <br/>
      <span class="UBLAdditionalStreetName">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-163'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line"/>
      </span>
    </xsl:if>
    <xsl:if test="cac:Party/cac:PostalAddress/cbc:PostalZone !='' or cac:Party/cac:PostalAddress/cbc:CityName !=''">
      <span class="UBLCityName">
        <xsl:choose>
          <xsl:when test="cac:Party/cac:PostalAddress/cbc:PostalZone !=''">
            <br/>
            <xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BT-53'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
            <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:PostalZone"/>&#160;<xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BT-52'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
            <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:CityName"/>
          </xsl:when>
          <xsl:otherwise>
            <br/>
            <xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BT-52'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
            <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:CityName"/>
          </xsl:otherwise>
        </xsl:choose>
      </span>
    </xsl:if>
    <xsl:if test="cac:Party/cac:PostalAddress/cbc:CountrySubentity !='' or cac:Party/cac:PostalAddress/cac:Country !=''">
      <xsl:choose>
        <xsl:when test="cac:Party/cac:PostalAddress/cbc:CountrySubentity !='' and cac:Party/cac:PostalAddress/cac:Country !=''">
          <br/>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-54'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>,
							<xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-55'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cac:Party/cac:PostalAddress/cac:Country"/>
        </xsl:when>
        <xsl:otherwise>
          <br/>
          <xsl:if test="cac:Party/cac:PostalAddress/cbc:CountrySubentity !=''">
            <xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BT-54'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
            <xsl:apply-templates select="cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
          </xsl:if>
          <xsl:if test="cac:Party/cac:PostalAddress/cac:Country !=''">
            <xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BT-55'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
            <xsl:apply-templates select="cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode"/>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
  <!-- Invoice BuyerContact -->
  <xsl:template name="BuyerContact">
    <xsl:if test="cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Name !=''">
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BT-56'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
      <xsl:apply-templates select="cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Name"/>
      <br/>
    </xsl:if>
    <xsl:if test="cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone !=''">
      <span class="UBLTelephone">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-57'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone"/>
      </span>
      <br/>
    </xsl:if>
    <xsl:if test="cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax !=''">
      <span class="UBLTelefax">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-22'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax"/>
      </span>
      <br/>
    </xsl:if>
    <xsl:if test="cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail !=''">
      <span class="UBLElectronicMail">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-58'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>
      </span>
      <br/>
    </xsl:if>
  </xsl:template>
  <!-- Order BuyerContact -->
  <xsl:template name="OrderBuyerContact">
    <xsl:if test="cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name !=''">
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BT-56'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
      <xsl:apply-templates select="cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name"/>
      <br/>
    </xsl:if>
    <xsl:if test="cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone !=''">
      <span class="UBLTelephone">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-57'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone"/>
      </span>
      <br/>
    </xsl:if>
    <xsl:if test="cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax !=''">
      <span class="UBLTelefax">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-22'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax"/>
      </span>
      <br/>
    </xsl:if>
    <xsl:if test="cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail !=''">
      <span class="UBLElectronicMail">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-58'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>
      </span>
      <br/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="cac:Contact" mode="OrderGenericContact">
    <xsl:if test="cbc:Name">
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BT-56'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
      <xsl:apply-templates select="cbc:Name"/>
      <br/>
    </xsl:if>
    <xsl:if test="cbc:Telephone">
      <span class="UBLTelephone">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-57'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cbc:Telephone"/>
      </span>
      <br/>
    </xsl:if>
    <xsl:if test="cbc:Telefax">
      <span class="UBLTelefax">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-22'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cbc:Telefax"/>
      </span>
      <br/>
    </xsl:if>
    <xsl:if test="cbc:ElectronicMail">
      <span class="UBLElectronicMail">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-58'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cbc:ElectronicMail"/>
      </span>
      <br/>
    </xsl:if>
  </xsl:template>
  <!-- PAYEE PARTY STARTS HERE-->
  <xsl:template name="PayeeParty">
    <xsl:call-template name="LabelName">
      <xsl:with-param name="BT-ID" select="'BT-59'"/>
      <xsl:with-param name="Colon-Suffix" select="'true'"/>
    </xsl:call-template>
    <xsl:apply-templates select="cac:PayeeParty/cac:PartyName"/>
    <xsl:if test="cac:PayeeParty/cac:PartyIdentification/cbc:ID">
      <br/>
      <small>
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-60'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:PayeeParty/cac:PartyIdentification/cbc:ID"/>
        <xsl:if test="cac:PayeeParty/cac:PartyIdentification/cbc:ID/@schemeID !='' ">&#160;[<xsl:apply-templates select="cac:PayeeParty/cac:PartyIdentification/cbc:ID/@schemeID"/>]

					</xsl:if>
      </small>
    </xsl:if>
    <!--Party legal registration: -->
    <xsl:if test="cac:PayeeParty/cac:PartyLegalEntity">
      <xsl:if test="cac:PayeeParty/cac:PartyLegalEntity">
        <br/>
        <small>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-61'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID"/>
          <xsl:if test="cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID/@schemeID !='' ">&#160;[<xsl:apply-templates select="cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID/@schemeID"/>]

					</xsl:if>
        </small>
      </xsl:if>
    </xsl:if>
    <!--Party VAT registration: -->
    <xsl:if test="cac:PayeeParty/cac:PartyTaxScheme">
      <small>
        <xsl:if test="cac:PayeeParty/cac:PartyTaxScheme">
          <br/>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-63-GST'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cac:PayeeParty/cac:PartyTaxScheme/cbc:CompanyID"/>
          <xsl:if test="cac:PayeeParty/cac:PartyTaxScheme/cbc:CompanyID/@schemeID !='' ">&#160;[<xsl:apply-templates select="cac:PayeeParty/cac:PartyTaxScheme/cbc:CompanyID/@schemeID"/>]

					</xsl:if>
        </xsl:if>
      </small>
    </xsl:if>
  </xsl:template>
  <xsl:template name="PayeePartyName">
    <xsl:if test="cac:PayeeParty/cbc:Name !=''">
      <xsl:apply-templates select="cbc:Name"/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="cac:PartyName">
    <xsl:if test="cbc:Name !=''">
      <xsl:apply-templates select="cbc:Name"/>
    </xsl:if>
  </xsl:template>
  <!-- Originator PARTY STARTS HERE-->
  <xsl:template name="OriginatorParty">
    <xsl:apply-templates select="cac:OriginatorCustomerParty/cac:Party/cac:PartyName"/>
    <xsl:if test="cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
      <br/>
      <small>
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'tir01-081'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
        <xsl:if test="cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID !='' ">&#160;[<xsl:apply-templates select="cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID"/>]

					</xsl:if>
      </small>
    </xsl:if>
    <br/>
    <xsl:apply-templates select="cac:OriginatorCustomerParty/cac:Party/cac:Contact" mode="OrderGenericContact"/>
  </xsl:template>
  <!-- DELIVERY PARTY STARTS HERE-->
  <xsl:template name="DeliveryParty">
    <xsl:apply-templates select="cac:Delivery/cac:DeliveryParty/cac:PartyName"/>
    <xsl:if test="cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID">
      <br/>
      <small>
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'tir01-101'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID"/>
        <xsl:if test="cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID/@schemeID !='' ">&#160;[<xsl:apply-templates select="cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID/@schemeID"/>]

					</xsl:if>
      </small>
    </xsl:if>
    <br/>
    <xsl:apply-templates select="cac:Delivery/cac:DeliveryParty/cac:Contact" mode="OrderGenericContact"/>
  </xsl:template>
  <xsl:template match="cac:PostalAddress | cac:DeliveryAddress | cac:Address ">
    <xsl:if test="cbc:StreetName !=''">
      <br/>
      <span class="UBLStreetName">
        <xsl:apply-templates select="cbc:StreetName"/>
      </span>
    </xsl:if>
    <xsl:if test="cbc:AdditionalStreetName !=''">
      <br/>
      <span class="UBLAdditionalStreetName">
        <xsl:apply-templates select="cbc:AdditionalStreetName"/>
      </span>
    </xsl:if>
    <xsl:if test="cac:AddressLine/cbc:Line !=''">
      <br/>
      <span class="UBLAdditionalStreetName">
        <xsl:apply-templates select="cac:AddressLine/cbc:Line"/>
      </span>
    </xsl:if>
    <xsl:if test="cbc:PostalZone !='' or cbc:CityName !=''">
      <br/>
      <span class="UBLCityName">
        <xsl:choose>
          <xsl:when test="cbc:PostalZone !=''">
            <xsl:apply-templates select="cbc:PostalZone"/>&#160;<xsl:apply-templates select="cbc:CityName"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="cbc:CityName"/>
          </xsl:otherwise>
        </xsl:choose>
      </span>
    </xsl:if>
    <xsl:if test="cbc:CountrySubentity !='' or cac:Country !=''">
      <xsl:choose>
        <xsl:when test="cbc:CountrySubentity !='' and cac:Country !=''">
          <br/>
          <xsl:apply-templates select="cbc:CountrySubentity"/>,
							<xsl:apply-templates select="cac:Country"/>
          <br/>
        </xsl:when>
        <xsl:otherwise>
          <br/>
          <xsl:if test="cbc:CountrySubentity !=''">
            <xsl:apply-templates select="cbc:CountrySubentity"/>
          </xsl:if>
          <xsl:if test="cac:Country !=''">
            <xsl:apply-templates select="cac:Country/cbc:IdentificationCode"/>
          </xsl:if>
          <br/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
  <xsl:template match="cac:Country">
    <span>
      <xsl:apply-templates select="cbc:IdentificationCode"/>
      <!-- Checking of listID (normally NOT a function of a stylesheet): -->
      <xsl:if test="cbc:IdentificationCode/@listID !=''">
        <xsl:if test="cbc:IdentificationCode/@listID !='ISO3166-1:Alpha2'">&#160;<small>
            <em>[<xsl:apply-templates select="cbc:IdentificationCode/@listID"/>&#160;-invalid listID]</em>
          </small>
        </xsl:if>
      </xsl:if>
    </span>
  </xsl:template>
  <xsl:template match="cac:SenderParty | cac:ReceiverParty | cac:IssuerParty | cac:ReceipientParty" mode="InvResp">
    <xsl:apply-templates select="cbc:EndpointID"/>
    <xsl:if test="cbc:EndpointID/@schemeID">
		[<xsl:value-of select="cbc:EndpointID/@schemeID"/>]
	</xsl:if>
    <br/>
    <xsl:choose>
      <xsl:when test="cac:PartyName">
        <xsl:apply-templates select="cac:PartyName"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="cac:PartyLegalEntity/cbc:RegistrationName"/>
      </xsl:otherwise>
    </xsl:choose>
    <br/>
    <xsl:apply-templates select="cac:PartyIdentification/cbc:ID"/>
    <xsl:if test="cac:PartyIdentification/cbc:ID/@schemeID !='' ">&#160;[<xsl:apply-templates select="cac:PartyIdentification/cbc:ID/@schemeID"/>]
			</xsl:if>
    <br/>
    <xsl:apply-templates select="cac:Contact"/>
  </xsl:template>
  <xsl:template match="cac:ReceiverParty" mode="Catalogue">
   
    <xsl:apply-templates select="cbc:EndpointID"/>
    <xsl:if test="cbc:EndpointID/@schemeID">
		[<xsl:value-of select="cbc:EndpointID/@schemeID"/>]
	</xsl:if>
    <br/>
    <xsl:choose>
      <xsl:when test="cac:PartyName">
        <xsl:apply-templates select="cac:PartyName"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="cac:PartyLegalEntity/cbc:RegistrationName"/>
      </xsl:otherwise>
    </xsl:choose>
    <br/>
    <xsl:apply-templates select="cac:PartyIdentification/cbc:ID"/>
    <xsl:if test="cac:PartyIdentification/cbc:ID/@schemeID !='' ">&#160;[<xsl:apply-templates select="cac:PartyIdentification/cbc:ID/@schemeID"/>]
			</xsl:if>
    <br/>
    <xsl:apply-templates select="cac:Contact"/>
  </xsl:template>
  <!--TaxRepresentativeParty Starts here:-->
  <xsl:template match="cac:TaxRepresentativeParty | cac:AccountingCustomerParty/cac:Party">
    <xsl:if test="cac:PartyName/cbc:Name !=''">
      <xsl:value-of select="cac:PartyName/cbc:Name"/>
      <br/>
    </xsl:if>
    <xsl:if test="cac:PostalAddress/cbc:StreetName !=''">
      <xsl:apply-templates select="cac:PostalAddress/cbc:StreetName"/>
      <br/>
    </xsl:if>
    <xsl:if test="cac:PostalAddress/cbc:AdditionalStreetName !=''">
      <xsl:apply-templates select="cac:PostalAddress/cbc:AdditionalStreetName"/>
      <br/>
    </xsl:if>
    <xsl:if test="cac:PostalAddress/cac:AddressLine/cbc:Line !=''">
      <xsl:apply-templates select="cac:PostalAddress/cac:AddressLine/cbc:Line"/>
      <br/>
    </xsl:if>
    <xsl:if test="cac:PostalAddress/cbc:PostalZone !='' or cac:PostalAddress/cbc:CityName !=''">
      <xsl:choose>
        <xsl:when test="cac:PostalAddress/cbc:PostalZone !=''">
          <xsl:apply-templates select="cac:PostalAddress/cbc:PostalZone"/>&#160;<xsl:apply-templates select="cac:PostalAddress/cbc:CityName"/>
          <br/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="cac:PostalAddress/cbc:CityName"/>
          <br/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
    <xsl:if test="cac:PostalAddress/cbc:CountrySubentity !='' or cac:PostalAddress/cac:Country !=''">
      <xsl:choose>
        <xsl:when test="cac:PostalAddress/cbc:CountrySubentity !='' and cac:PostalAddress/cac:Country !=''">
          <xsl:apply-templates select="cac:PostalAddress/cbc:CountrySubentity"/>,
							<xsl:apply-templates select="cac:PostalAddress/cac:Country"/>
          <br/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="cac:PostalAddress/cbc:CountrySubentity !=''">
            <xsl:apply-templates select="cac:PostalAddress/cbc:CountrySubentity"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:PostalAddress/cac:Country !=''">
            <xsl:apply-templates select="cac:PostalAddress/cac:Country/cbc:IdentificationCode"/>
            <br/>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
    <xsl:if test="cac:PartyTaxScheme/cbc:CompanyID !=''">
      <small>
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-63-GST'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:value-of select="cac:PartyTaxScheme/cbc:CompanyID"/>
      </small>
    </xsl:if>
  </xsl:template>
  <!--Delivery templates start: -->
  <xsl:template match="cac:Delivery" mode="DocumentHeader">
    <p>
      <xsl:if test="cac:DeliveryLocation">
        <b>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BG-13'"/>
            <xsl:with-param name="Colon-Suffix" select="'false'"/>
          </xsl:call-template>
          <br/>
        </b>
        <xsl:if test="cac:DeliveryParty/cac:PartyName/cbc:Name">
          <xsl:apply-templates select="cac:DeliveryParty/cac:PartyName/cbc:Name"/>
          <br/>
        </xsl:if>
        <xsl:if test="cac:DeliveryLocation/cbc:ID">
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-71'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="cac:DeliveryLocation/cbc:ID"/>
          <xsl:choose>
            <xsl:when test="cac:DeliveryLocation/cbc:ID/@schemeID !=''">&#160;[<xsl:apply-templates select="cac:DeliveryLocation/cbc:ID/@schemeID"/>]
						</xsl:when>
            <xsl:otherwise>&#160;[No schemeID]
						</xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:if test="cac:DeliveryLocation/cac:Address">
          <br/>
          <xsl:call-template name="DeliveryAddress"/>
        </xsl:if>
        <br/>
      </xsl:if>
      <xsl:if test="cac:DeliveryParty/cac:PostalAddress">
        <xsl:call-template name="FinalDeliveryAddress"/>
      </xsl:if>
    </p>
  </xsl:template>
  <xsl:template name="DeliveryAddress">
    <b>
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BG-15'"/>
        <xsl:with-param name="Colon-Suffix" select="'false'"/>
      </xsl:call-template>
    </b>
    <xsl:apply-templates select="cac:DeliveryLocation/cac:Address"/>
  </xsl:template>
  <xsl:template name="FinalDeliveryAddress">
    <b>
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'Order_FinalDeliveryAddress'"/>
        <xsl:with-param name="Colon-Suffix" select="'false'"/>
      </xsl:call-template>
    </b>
    <xsl:apply-templates select="cac:DeliveryParty/cac:PostalAddress"/>
  </xsl:template>
  <!--Contact from here: -->
  <xsl:template match="cac:AccountingSupplierParty/cac:Party" mode="accsupcontact">
    <xsl:apply-templates select="cac:Contact"/>
  </xsl:template>
  <xsl:template match="cac:AccountingCustomerParty/cac:Party" mode="acccuscontact">
    <xsl:apply-templates select="cac:Contact"/>
  </xsl:template>
  <xsl:template match="cac:Condition" mode="InvRespCondition">
    <xsl:apply-templates select="cbc:AttributeID"/>
  :
  <xsl:apply-templates select="cbc:Description"/>
    <br/>
  </xsl:template>
  <!-- invc response status line -->
  <xsl:template match="cac:Status" mode="InvRespStatus">
    <tr>
      <td>
        <xsl:choose>
          <xsl:when test="cbc:StatusReasonCode/@listID='OPStatusAction'">
            <xsl:call-template name="StatusClarificationActionCode">
              <xsl:with-param name="Code" select="cbc:StatusReasonCode"/>
            </xsl:call-template>
            <small>&#160;[<xsl:apply-templates select="cbc:StatusReasonCode"/>]</small>
          </xsl:when>
          <xsl:when test="cbc:StatusReasonCode/@listID='OPStatusReason'">
            <xsl:call-template name="StatusClarificationReasonCode">
              <xsl:with-param name="Code" select="cbc:StatusReasonCode"/>
            </xsl:call-template>
            <small>&#160;[<xsl:apply-templates select="cbc:StatusReasonCode"/>]</small>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="cbc:StatusReasonCode"/>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
        <xsl:apply-templates select="cbc:StatusReason"/>
      </td>
      <td>
        <xsl:apply-templates select="cac:Condition" mode="InvRespCondition"/>
      </td>
    </tr>
  </xsl:template>
  
  
  
   <!-- Catalogue line -->
  <xsl:template match="cac:CatalogueLine" mode="catalogue">
    <tr>
		<td>
			<xsl:apply-templates select="cbc:ID"/>
		</td>
      <td>
       <xsl:if test="cac:Item/cac:SellersItemIdentification">
			<xsl:apply-templates select="cac:Item/cac:SellersItemIdentification"/>
		</xsl:if>
      </td>
      <td>
      <xsl:if test="cac:Item/cac:StandardItemIdentification">
        <xsl:apply-templates select="cac:Item/cac:StandardItemIdentification"/>
       </xsl:if>
      </td>
      <td>
        <xsl:apply-templates select="cac:Item/cbc:Name"/>
      </td>
      <td>
        <small>
         <xsl:if test="cbc:ActionCode">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-033'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:ActionCode"/>
            <br/>
          </xsl:if>
           <xsl:if test="cbc:OrderableIndicator">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-034'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:OrderableIndicator"/>
            <br/>
          </xsl:if>
             <xsl:if test="cbc:OrderableUnit">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-035'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:OrderableUnit"/>
            <br/>
          </xsl:if>
           <xsl:if test="cbc:ContentUnitQuantity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-061'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:ContentUnitQuantity"/>
            <xsl:choose>
              <xsl:when test="cbc:ContentUnitQuantity/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:ContentUnitQuantity/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
          </xsl:if>
           <xsl:if test="cbc:OrderQuantityIncrementNumeric">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-037'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:OrderQuantityIncrementNumeric"/>
            <br/>
          </xsl:if>
          <xsl:if test="cbc:MinimumOrderQuantity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-038'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:MinimumOrderQuantity"/>
            <xsl:choose>
              <xsl:when test="cbc:MinimumOrderQuantity/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:MinimumOrderQuantity/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
          </xsl:if>
           <xsl:if test="cbc:MaximumOrderQuantity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-039'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:MaximumOrderQuantity"/>
            <xsl:choose>
              <xsl:when test="cbc:MaximumOrderQuantity/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:MaximumOrderQuantity/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
          </xsl:if>
           <xsl:if test="cbc:WarrantyInformation">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-040'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:WarrantyInformation"/>
            <br/>
          </xsl:if>
            <xsl:if test="cbc:PackLevelCode">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-102'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:PackLevelCode"/>
            <br/>
          </xsl:if>
             <xsl:if test="cac:LineValidityPeriod/cbc:StartDate">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-041'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:LineValidityPeriod/cbc:StartDate"/>
            <br/>
          </xsl:if>
             <xsl:if test="cac:LineValidityPeriod/cbc:EndDate">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-042'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:LineValidityPeriod/cbc:EndDate"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:ItemComparison">
			  <xsl:apply-templates select="cac:ItemComparison"/>
			</xsl:if>
           <xsl:if test="cac:ComponentRelatedItem">
			  <xsl:apply-templates select="cac:ComponentRelatedItem"/>
			</xsl:if>
          <xsl:if test="cac:AccessoryRelatedItem">
			  <xsl:apply-templates select="cac:AccessoryRelatedItem"/>
          </xsl:if>
           <xsl:if test="cac:RequiredRelatedItem">
			  <xsl:apply-templates select="cac:RequiredRelatedItem"/>
          </xsl:if>
           <xsl:if test="cac:ReplacedRelatedItem">
			  <xsl:apply-templates select="cac:ReplacedRelatedItem"/>
          </xsl:if>
           <xsl:if test="cac:RequiredItemLocationQuantity">
			  <xsl:apply-templates select="cac:RequiredItemLocationQuantity"/>
          </xsl:if>
           <xsl:if test="cac:Item/cbc:Description">
			<xsl:apply-templates select="cac:Item/cbc:Description" mode="CatalogueLineItem"/>
          </xsl:if>
           <xsl:if test="cac:Item/cbc:PackQuantity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-066'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cbc:PackQuantity"/>
            <xsl:choose>
              <xsl:when test="cac:Item/cbc:PackQuantity/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cac:Item/cbc:PackQuantity/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
          </xsl:if>
           <xsl:if test="cac:Item/cbc:PackSizeNumeric">
             <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-036'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
			<xsl:apply-templates select="cac:Item/cbc:PackSizeNumeric"/>
            <br/>
          </xsl:if>
             <xsl:if test="cac:Item/cbc:Name">
             <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-078'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
			<xsl:apply-templates select="cac:Item/cbc:Name"/>
            <br/>
          </xsl:if>
             <xsl:if test="cac:Item/cbc:Keyword">
             <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-064'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
			<xsl:apply-templates select="cac:Item/cbc:Keyword"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cbc:BrandName">
             <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-p018'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
			<xsl:apply-templates select="cac:Item/cbc:BrandName"/>
            <br/>
          </xsl:if>
           <xsl:if test="cac:Item/cac:BuyersItemIdentification/cbc:ID">
             <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-p040'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
			<xsl:apply-templates select="cac:Item/cac:BuyersItemIdentification/cbc:ID"/>
            <br/>
          </xsl:if>
            <xsl:if test="cac:Item/cac:ManufacturersItemIdentification/cbc:ID">
             <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-114'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
			<xsl:apply-templates select="cac:Item/cac:ManufacturersItemIdentification/cbc:ID"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:StandardItemIdentification/cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-092'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cac:StandardItemIdentification/cbc:ID"/>
            <xsl:choose>
              <xsl:when test="cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID !=''">
                <small>&#160;[<xsl:apply-templates select="cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No schemeID]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:ItemSpecificationDocumentReference">
			  <xsl:apply-templates select="cac:Item/cac:ItemSpecificationDocumentReference" mode="CatalogueLineItem"/>
          </xsl:if>
             <xsl:if test="cac:Item/cac:OriginCountry/cbc:IdentificationCode">
             <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-071'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
			<xsl:apply-templates select="cac:Item/cac:OriginCountry/cbc:IdentificationCode"/>
            <br/>
          </xsl:if>
		 <xsl:if test="cac:Item/cac:CommodityClassification">
            <xsl:apply-templates select="cac:Item/cac:CommodityClassification"/>
          </xsl:if>
           <xsl:if test="cac:Item/cac:TransactionConditions/cbc:ActionCode">
             <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-p027'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
			<xsl:apply-templates select="cac:Item/cac:TransactionConditions/cbc:ActionCode"/>
            <br/>
          </xsl:if>
           <xsl:if test="cac:Item/cac:HazardousItem">
			  <xsl:apply-templates select="cac:Item/cac:HazardousItem"/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:ClassifiedTaxCategory">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-094'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
			<xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cbc:ID"/>
            <br/>
            <xsl:if test="cac:Item/cac:ClassifiedTaxCategory/cbc:Percent">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-050'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
			<xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cbc:Percent"/>
            <br/>
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-p048'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
			<xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID"/>
            <br/>
          </xsl:if>
          </xsl:if>
          <xsl:if test="cac:Item/cac:AdditionalItemProperty">
            <xsl:apply-templates select="cac:Item/cac:AdditionalItemProperty" mode="CatalogueLineItem"/>
          </xsl:if>
          
           <xsl:if test="cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name">
             <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-075'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
			<xsl:apply-templates select="cac:Item/cac:ManufacturerParty/cac:PartyName/cbc:Name"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:ItemInstance">
            <xsl:apply-templates select="cac:Item/cac:ItemInstance" mode="CatalogueLineItem"/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:Certificate">
            <xsl:apply-templates select="cac:Item/cac:Certificate" mode="CatalogueLineItem"/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:Dimension">
            <xsl:apply-templates select="cac:Item/cac:Dimension" mode="CatalogueLineItem"/>
          </xsl:if>
        </small>
      </td>
      <td align="right">
        <xsl:if test="cac:RequiredItemLocationQuantity[1]/cac:Price/cbc:PriceAmount">
          <xsl:apply-templates select="cac:RequiredItemLocationQuantity[1]/cac:Price/cbc:PriceAmount"/>&#160;
          <xsl:apply-templates select="cac:RequiredItemLocationQuantity[1]/cac:Price/cbc:PriceAmount/@currencyID"/>
        </xsl:if>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="cac:AdditionalItemProperty" mode="CatalogueLineItem">
    <b>
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'tir19-additionalitemproperty'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
    </b>
    <xsl:if test="cbc:ID">
		<xsl:apply-templates select="cbc:ID"/>
			<xsl:if test="cbc:ID/@schemeDataURI">
			  (<xsl:apply-templates select="cbc:ID/@schemeDataURI"/>)
			</xsl:if>
			<xsl:if test="cbc:ID/@schemeID">
			  (<xsl:apply-templates select="cbc:ID/@schemeID"/>)
			</xsl:if>
			<xsl:if test="cbc:ID/@schemeVersionID">
			  (<xsl:apply-templates select="cbc:ID/@schemeVersionID"/>)
			</xsl:if>
      <br/>
      </xsl:if>
  
       
    <xsl:apply-templates select="cbc:Name"/>
    <xsl:if test="cbc:NameCode">
      (
       <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'tir19-p039'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
      <xsl:apply-templates select="cbc:NameCode"/>)
		</xsl:if>
		= <xsl:apply-templates select="cbc:Value"/>
    <xsl:if test="cbc:ValueQuantity">

      (<xsl:apply-templates select="cbc:ValueQuantity"/>&#160;<xsl:apply-templates select="cbc:ValueQuantity/@unitCode"/>)
		</xsl:if>
    <xsl:if test="cbc:ValueQualifier">
      <small>&#160;[
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'tir19-103'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cbc:ValueQualifier"/>]
      </small>
    </xsl:if>
    <br/>
  </xsl:template>
	<xsl:template match="cac:AccessoryRelatedItem">
	  <xsl:if test="cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-118'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:ID"/>
            <br/>
          </xsl:if>
             <xsl:if test="cbc:Quantity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-119'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:Quantity"/>
            <xsl:choose>
              <xsl:when test="cbc:Quantity/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:Quantity/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
          </xsl:if>
  </xsl:template>
	<xsl:template match="cac:ComponentRelatedItem">
		<xsl:if test="cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-045'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:ID"/>
            <br/>
          </xsl:if>
		<xsl:if test="cbc:Quantity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-046'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:Quantity"/>
            <xsl:choose>
              <xsl:when test="cbc:Quantity/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:Quantity/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
         </xsl:if>
	</xsl:template>
	<xsl:template match="cac:ItemComparison">
		 <xsl:if test="cbc:PriceAmount">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-043'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:PriceAmount"/>
            <xsl:choose>
              <xsl:when test="cbc:PriceAmount/@currencyID !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:PriceAmount/@currencyID"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No currency]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
          </xsl:if>
          <xsl:if test="cbc:Quantity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-044'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:Quantity"/>
            <xsl:choose>
              <xsl:when test="cbc:Quantity/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:Quantity/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
          </xsl:if>
	</xsl:template>
	<xsl:template match="cac:RequiredRelatedItem">
		<xsl:if test="cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-048'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:ID"/>
            <br/>
          </xsl:if>
		<xsl:if test="cbc:Quantity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-049'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:Quantity"/>
            <xsl:choose>
              <xsl:when test="cbc:Quantity/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:Quantity/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
         </xsl:if>
	</xsl:template>
	<xsl:template match="cac:ReplacedRelatedItem">
		<xsl:if test="cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-120'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:ID"/>
            <br/>
          </xsl:if>
		<xsl:if test="cbc:Quantity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-121'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:Quantity"/>
            <xsl:choose>
              <xsl:when test="cbc:Quantity/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:Quantity/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
         </xsl:if>
	</xsl:template>
	<xsl:template match="cac:RequiredItemLocationQuantity">
	<xsl:if test="cbc:LeadTimeMeasure">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-053'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:LeadTimeMeasure"/>
            <xsl:choose>
              <xsl:when test="cbc:LeadTimeMeasure/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:LeadTimeMeasure/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
         </xsl:if>
       <xsl:if test="cbc:MinimumQuantity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-p025'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:MinimumQuantity"/>
            <xsl:choose>
              <xsl:when test="cbc:MinimumQuantity/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:MinimumQuantity/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
         </xsl:if>
            <xsl:if test="cbc:MaximumQuantity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-p026'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:MaximumQuantity"/>
            <xsl:choose>
              <xsl:when test="cbc:MaximumQuantity/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:MaximumQuantity/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
         </xsl:if>
          <xsl:if test="cac:ApplicableTerritoryAddress">
			  <xsl:apply-templates select="cac:ApplicableTerritoryAddress"/>
          </xsl:if>
          <xsl:if test="cac:Price">
			  <xsl:apply-templates select="cac:Price" mode="CatalogueLine"/>
          </xsl:if>
	</xsl:template>
	<xsl:template match="cac:ApplicableTerritoryAddress">
		<xsl:if test="cbc:StreetName">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-108'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:StreetName"/>
            <br/>
          </xsl:if>
          <xsl:if test="cbc:AdditionalStreetName">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-109'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:AdditionalStreetName"/>
            <br/>
          </xsl:if>
           <xsl:if test="cbc:CityName">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-110'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:CityName"/>
            <br/>
          </xsl:if>
            <xsl:if test="cbc:PostalZone">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-111'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:PostalZone"/>
            <br/>
          </xsl:if>
             <xsl:if test="cbc:CountrySubentity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-112'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:CountrySubentity"/>
            <br/>
          </xsl:if>
             <xsl:if test="cac:AddressLine/cbc:Line">
            <xsl:apply-templates select="cac:AddressLine/cbc:Line"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Country/cbc:IdentificationCode">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-063'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Country/cbc:IdentificationCode"/>
          </xsl:if>
          <br/>
	</xsl:template>	
	<xsl:template match="cac:Price" mode="CatalogueLine">
	<xsl:if test="cbc:PriceAmount">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-051'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:PriceAmount"/>
            <xsl:choose>
              <xsl:when test="cbc:PriceAmount/@currencyID !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:PriceAmount/@currencyID"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No currency code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
         </xsl:if>
         <xsl:if test="cbc:BaseQuantity">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-p024'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:BaseQuantity"/>
            <xsl:choose>
              <xsl:when test="cbc:BaseQuantity/@unitCode !=''">
                <small>&#160;[<xsl:apply-templates select="cbc:BaseQuantity/@unitCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No unit code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
         </xsl:if>
         <xsl:if test="cbc:PriceType">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-093'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:PriceType"/>
            <br/>
          </xsl:if>
          <xsl:if test="cbc:OrderableUnitFactorRate">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-p035'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:OrderableUnitFactorRate"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:ValidityPeriod/cbc:StartDate">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-056'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:ValidityPeriod/cbc:StartDate"/>
            <br/>
          </xsl:if>
           <xsl:if test="cac:ValidityPeriod/cbc:EndDate">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-057'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:ValidityPeriod/cbc:EndDate"/>
            <br/>
          </xsl:if>
	</xsl:template>	
	<xsl:template match="cac:Item/cac:CommodityClassification" mode="CatalogueLineItem">
	<xsl:if test="cbc:ItemClassificationCode">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-069'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:ItemClassificationCode"/>
            <small>&#160;[listID: <xsl:apply-templates select="cbc:ItemClassificationCode/@listID"/>]</small>
            <xsl:if test="cbc:ItemClassificationCode/@listVersionID">
            <small>&#160;[List Version ID: <xsl:apply-templates select="cbc:ItemClassificationCode/@listVersionID"/>]</small>
            </xsl:if>
            <xsl:if test="cbc:ItemClassificationCode/@name">
            <small>&#160;[Name: <xsl:apply-templates select="cbc:ItemClassificationCode/@name"/>]</small>
            </xsl:if>
            <br/>
          </xsl:if>
	</xsl:template>
	<xsl:template match="cac:Item/cac:ItemSpecificationDocumentReference" mode="CatalogueLineItem">
	<xsl:if test="cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-105'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:ID"/>
            <br/>
      </xsl:if>
      <xsl:if test="cbc:DocumentTypeCode">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-086a'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:DocumentTypeCode"/>
            <br/>
      </xsl:if>
        <xsl:if test="cbc:DocumentDescription">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-106'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:DocumentDescription"/>
            <br/>
      </xsl:if>
      <xsl:if test="cac:Attachment/cbc:EmbeddedDocumentBinaryObject">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-107'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Attachment/cbc:EmbeddedDocumentBinaryObject"/>
            <xsl:choose>
              <xsl:when test="cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode !=''">
                <small>&#160;[<xsl:apply-templates select="cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No mime code]</small>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@filename !=''">
                <small>&#160;[<xsl:apply-templates select="cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@filename"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No filename]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
      </xsl:if>
       <xsl:if test="cac:Attachment/cac:ExternalReference/cbc:URI">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-086'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Attachment/cac:ExternalReference/cbc:URI"/>
            <br/>
      </xsl:if>
	</xsl:template>
	<xsl:template match="cac:Item/cac:HazardousItem">
		 <xsl:if test="cbc:UNDGCode">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-072'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:UNDGCode"/>
            <br/>
          </xsl:if>
          <xsl:if test="cbc:HazardClassID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-073'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:HazardClassID"/>
            <br/>
          </xsl:if>
	</xsl:template>
	<xsl:template match="cac:Item/cbc:Description" mode="CatalogueLineItem">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-067'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="."/>
            <br/>
	</xsl:template>
	<xsl:template match="cac:Item/cac:ItemInstance" mode="CatalogueLineItem">
            <xsl:if test="cbc:BestBeforeDate">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-058'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:BestBeforeDate"/>
            <br/>
          </xsl:if>
           <xsl:if test="cac:LotIdentification/cbc:LotNumberID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-059'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:LotIdentification/cbc:LotNumberID"/>
            <br/>
          </xsl:if>
	</xsl:template>
	<xsl:template match="cac:Item/cac:Certificate" mode="CatalogueLineItem">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-087'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:ID"/>
            <br/>
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-089'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:CertificateType"/>
            <br/>
			<xsl:if test="cbc:Remarks">
				<xsl:apply-templates select="cbc:Remarks" mode="CatalogueLineItem"/>
          </xsl:if>
          <xsl:if test="cac:DocumentReference">
				<xsl:apply-templates select="cac:DocumentReference" mode="CatalogueLineItem"/>
          </xsl:if>
         
	</xsl:template>
	<xsl:template match="cac:Item/cac:Dimension" mode="CatalogueLineItem">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-104'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:AttributeID"/>
            <br/>
            <xsl:if test="cbc:Measure">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-098'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:Measure"/>
            <small>&#160;[<xsl:apply-templates select="cbc:Measure/@unitCode"/>]</small>
            <br/>
          </xsl:if>
          <xsl:if test="cbc:Description">
            <xsl:apply-templates select="cbc:Description" mode="CatalogueLineItem"/>
          </xsl:if>
           <xsl:if test="cbc:MinimumMeasure">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-115'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:MinimumMeasure"/>
            <small>&#160;[<xsl:apply-templates select="cbc:MinimumMeasure/@unitCode"/>]</small>
            <br/>
          </xsl:if>
          <xsl:if test="cbc:MaximumMeasure">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-116'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:MaximumMeasure"/>
            <small>&#160;[<xsl:apply-templates select="cbc:MaximumMeasure/@unitCode"/>]</small>
            <br/>
          </xsl:if>
	</xsl:template>
	<xsl:template match="cbc:Remarks" mode="CatalogueLineItem">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-088'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="."/>
            <br/>
            
	</xsl:template>
	<xsl:template match="cac:DocumentReference" mode="CatalogueLineItem">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-090'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:ID"/>
            <br/>
	</xsl:template>
	<xsl:template match="cbc:Description" mode="CatalogueLineItem">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir19-p038'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="."/>
            <br/>
	</xsl:template>














<!-- order line -->
  <xsl:template match="cac:OrderLine/cac:LineItem" mode="order">
    <tr>
      <td>
        <xsl:apply-templates select="cbc:ID"/>
      </td>
      <td>
        <xsl:apply-templates select="cac:Item/cac:SellersItemIdentification"/>
      </td>
      <td>
        <xsl:apply-templates select="cac:Item/cbc:Name"/>
        <br/>
        <br/>
        <small>
          <xsl:if test="cac:Item/cac:StandardItemIdentification/cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-157'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cac:StandardItemIdentification/cbc:ID"/>
            <xsl:choose>
              <xsl:when test="cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID !=''">
                <small>&#160;[<xsl:apply-templates select="cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No schemeID]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:BuyersItemIdentification/cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-156'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cac:BuyersItemIdentification/cbc:ID"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cbc:Description">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-154'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cbc:Description"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:AdditionalItemProperty">
            <xsl:apply-templates select="cac:Item/cac:AdditionalItemProperty"/>
          </xsl:if>
          <xsl:if test="../cbc:Note">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-127'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="../cbc:Note"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:CommodityClassification">
            <xsl:apply-templates select="cac:Item/cac:CommodityClassification"/>
          </xsl:if>
          <xsl:if test="cbc:AccountingCost">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-19'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:AccountingCost"/>
            <br/>
          </xsl:if>
          <xsl:if test="cbc:PartialDeliveryIndicator">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir01-124'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:PartialDeliveryIndicator"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:ItemSpecificationDocumentReference">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'Order_ItemSpecReference'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Delivery/cac:RequestedDeliveryPeriod">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'Order_RequestedDeliveryPeriod'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Delivery/cac:RequestedDeliveryPeriod"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:OriginatorParty">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'Order_OriginatorInformation'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:if test="cac:OriginatorParty/cac:PartyName/cbc:Name">
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir01-122'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
              <xsl:apply-templates select="cac:OriginatorParty/cac:PartyName/cbc:Name"/>&#160;</xsl:if>
            <xsl:if test="cac:OriginatorParty/cac:PartyIdentification/cbc:ID">
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir01-121'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
              <xsl:apply-templates select="cac:OriginatorParty/cac:PartyIdentification/cbc:ID"/>
            </xsl:if>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Price/cac:AllowanceCharge !=''">
            <xsl:apply-templates select="cac:Price/cac:AllowanceCharge" mode="PriceUnit-new"/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:ItemInstance">
            <xsl:apply-templates select="cac:Item/cac:ItemInstance"/>
          </xsl:if>
        </small>
      </td>
      <td align="left">
        <xsl:if test="cbc:Quantity">
          <xsl:apply-templates select="cbc:Quantity"/>&#160;<xsl:if test="cbc:Quantity/@unitCode">
            <xsl:value-of select="cbc:Quantity/@unitCode"/>
            <br/>
            <small>(<xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-130'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
              <xsl:call-template name="UNECECode">
                <xsl:with-param name="Code" select="cbc:Quantity/@unitCode"/>
              </xsl:call-template>)</small>
          </xsl:if>
        </xsl:if>
      </td>
      <td>
        <xsl:apply-templates select="cac:Price"/>
        <xsl:if test="cac:Price/cbc:BaseQuantity">
          <small>
            <br/>
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-149'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Price/cbc:BaseQuantity"/>
          </small>
        </xsl:if>
      </td>
      <td>
        <xsl:if test="cac:Item/cac:ClassifiedTaxCategory">
          <xsl:choose>
            <xsl:when test="cac:Item/cac:ClassifiedTaxCategory/cbc:Percent !=''">
              <xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cbc:ID"/>,&#160;<xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cbc:Percent"/>%

						</xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID"/>:&#160;<xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cbc:ID"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:if test="cac:TaxTotal/cbc:TaxAmount">
          <small>
            <xsl:choose>
              <xsl:when test="cac:Item/cac:ClassifiedTaxCategory/cbc:Percent">
                <br/>(<xsl:call-template name="Currency">
                  <xsl:with-param name="currencyvalue" select="cac:TaxTotal/cbc:TaxAmount"/>
                </xsl:call-template>)

						</xsl:when>
              <xsl:otherwise>
							(<xsl:call-template name="Currency">
                  <xsl:with-param name="currencyvalue" select="cac:TaxTotal/cbc:TaxAmount"/>
                </xsl:call-template>)

						</xsl:otherwise>
            </xsl:choose>
          </small>
        </xsl:if>
      </td>
      <td>
        <xsl:if test="cac:AllowanceCharge">
          <xsl:apply-templates select="cac:AllowanceCharge" mode="LineLevel-new"/>
        </xsl:if>
      </td>
      <td align="right">
        <xsl:call-template name="Currency">
          <xsl:with-param name="currencyvalue" select="cbc:LineExtensionAmount"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <!-- order response line -->
  <xsl:template match="cac:OrderLine/cac:LineItem" mode="orderresponse">
    <tr>
      <td>
        <xsl:apply-templates select="cbc:ID"/>
        <br/>
        <small>
          (<xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'tir76-201'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
          <xsl:apply-templates select="../cac:OrderLineReference/cbc:LineID"/>)
        </small>
      </td>
      <td>
        <xsl:call-template name="OrderResponseLineCode">
          <xsl:with-param name="Code" select="cbc:LineStatusCode"/>
        </xsl:call-template>
        <br/>
        <small>
          <xsl:apply-templates select="../cbc:Note"/>
        </small>
      </td>
      <td align="left">
        <xsl:if test="cbc:Quantity">
          <xsl:apply-templates select="cbc:Quantity"/>&#160;<xsl:if test="cbc:Quantity/@unitCode">
            <xsl:value-of select="cbc:Quantity/@unitCode"/>
            <br/>
            <small>(<xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-130'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
              <xsl:call-template name="UNECECode">
                <xsl:with-param name="Code" select="cbc:Quantity/@unitCode"/>
              </xsl:call-template>)</small>
          </xsl:if>
        </xsl:if>
        <br/>
        <xsl:if test="cbc:MaximumBackorderQuantity">
          <small>
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir76-p005'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:MaximumBackorderQuantity"/>
          </small>
        </xsl:if>
      </td>
      <td>
        <xsl:apply-templates select="cac:Item/cbc:Name"/>
        <br/>
        <small>
          <xsl:if test="cac:Item/cac:SellersItemIdentification/cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir01-p020'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cac:SellersItemIdentification/cbc:ID"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:StandardItemIdentification/cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-157'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cac:StandardItemIdentification/cbc:ID"/>
            <xsl:choose>
              <xsl:when test="cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID !=''">
                <small>&#160;[<xsl:apply-templates select="cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No schemeID]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:BuyersItemIdentification/cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-156'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cac:BuyersItemIdentification/cbc:ID"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Delivery/cac:PromisedDeliveryPeriod">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'OrderResponse_DeliveryPeriod'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Delivery/cac:PromisedDeliveryPeriod"/>
            <br/>
          </xsl:if>
        </small>
      </td>
      <td>
        <xsl:apply-templates select="cac:Price"/>
        <xsl:if test="cac:Price/cbc:BaseQuantity">
          <small>
            <br/>
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-149'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Price/cbc:BaseQuantity"/>
          </small>
        </xsl:if>
      </td>
      <!-- substituted item -->
      <td>
        <xsl:apply-templates select="../cac:SellerSubstitutedLineItem/cac:Item/cbc:Name"/>
        <br/>
        <small>
          <xsl:if test="../cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir01-p020'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="../cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID"/>
            <br/>
          </xsl:if>
          <xsl:if test="../cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-157'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="../cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID"/>
            <xsl:choose>
              <xsl:when test="../cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID !=''">
                <small>&#160;[<xsl:apply-templates select="../cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No schemeID]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
          </xsl:if>
          <xsl:if test="../cac:SellerSubstitutedLineItem/cac:Item/cac:BuyersItemIdentification/cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-156'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="../cac:SellerSubstitutedLineItem/cac:Item/cac:BuyersItemIdentification/cbc:ID"/>
            <br/>
          </xsl:if>
          <xsl:if test="../cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'OrderResponse_ItemTax'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="../cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent"/>&#160;<xsl:apply-templates select="../cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID"/>&#160;<xsl:apply-templates select="../cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID"/>
            <br/>
          </xsl:if>
          <xsl:if test="../cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty">
            <xsl:apply-templates select="../cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty"/>
          </xsl:if>
          <xsl:if test="../cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification">
            <xsl:apply-templates select="../cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification"/>
          </xsl:if>
        </small>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="cac:CommodityClassification">
    <xsl:if test="cbc:CommodityCode !=''">
      <b>
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-158'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
      </b>
      <xsl:apply-templates select="cbc:CommodityCode"/>
      <xsl:choose>
        <xsl:when test="cbc:CommodityCode/@listID !=''">
          <small>&#160;[<xsl:call-template name="UBLClassificationCode">
              <xsl:with-param name="Code" select="cbc:CommodityCode/@listID"/>
            </xsl:call-template>]</small>
        </xsl:when>
        <xsl:otherwise>
          <small>&#160;[No listID]</small>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="cbc:CommodityCode/@listVersionID !=''">
				 [<xsl:apply-templates select="cbc:CommodityCode/@listeVersionID"/>]
			</xsl:if>
      <br/>
    </xsl:if>
    <xsl:if test="cbc:ItemClassificationCode !=''">
      <b>
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-158'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
      </b>
      <xsl:apply-templates select="cbc:ItemClassificationCode"/>
      <xsl:choose>
        <xsl:when test="cbc:ItemClassificationCode/@listID !=''">
          <small>&#160;[<xsl:call-template name="UBLClassificationCode">
              <xsl:with-param name="Code" select="cbc:ItemClassificationCode/@listID"/>
            </xsl:call-template>]</small>
        </xsl:when>
        <xsl:otherwise>
          <small>&#160;[No listID]</small>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="cbc:ItemClassificationCode/@listVersionID !=''">
				 [ver.&#160;<xsl:apply-templates select="cbc:ItemClassificationCode/@listVersionID"/>]
			</xsl:if>
		<xsl:if test="cbc:ItemClassificationCode/@name !=''">
				 [Name:&#160;<xsl:apply-templates select="cbc:ItemClassificationCode/@name"/>]
			</xsl:if>
      <br/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="cac:ItemInstance">
    <b>
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'Order_ItemInstanceInformation'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
    </b>
    <xsl:call-template name="LabelName">
      <xsl:with-param name="BT-ID" select="'tir01-p023'"/>
      <xsl:with-param name="Colon-Suffix" select="'true'"/>
    </xsl:call-template>
    <xsl:apply-templates select="cbc:SerialID"/>&#160;<xsl:call-template name="LabelName">
      <xsl:with-param name="BT-ID" select="'tir01-p022'"/>
      <xsl:with-param name="Colon-Suffix" select="'true'"/>
    </xsl:call-template>
    <xsl:apply-templates select="cac:LotIdentification/cbc:LotNumberID"/>
    <br/>
  </xsl:template>
  <xsl:template match="cac:AdditionalItemProperty">
    <b>
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BT-160'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
    </b>
    <xsl:if test="cbc:ID">
		<xsl:apply-templates select="cbc:ID"/>
			<xsl:if test="cbc:ID/@schemeDataURI">
      (  <xsl:apply-templates select="cbc:ID/@schemeDataURI"/>)
      </xsl:if>
      <xsl:apply-templates select="cbc:ID"/>
			<xsl:if test="cbc:ID/@schemeID">
      (  <xsl:apply-templates select="cbc:ID/@schemeID"/>)
      </xsl:if>
      <xsl:apply-templates select="cbc:ID"/>
			<xsl:if test="cbc:ID/@schemeVersionID">
      (  <xsl:apply-templates select="cbc:ID/@schemeVersionID"/>)
      </xsl:if>
      <br/>
      </xsl:if>
    <xsl:apply-templates select="cbc:Name"/>
    <xsl:if test="cbc:NameCode">
      (
       <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'tir01-p024'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
      <xsl:apply-templates select="cbc:NameCode"/>)
		</xsl:if>
		= <xsl:apply-templates select="cbc:Value"/>
    <xsl:if test="cbc:ValueQuantity">

      (<xsl:apply-templates select="cbc:ValueQuantity"/>&#160;<xsl:apply-templates select="cbc:ValueQuantity/@unitCode"/>)
		</xsl:if>
    <xsl:if test="cbc:ValueQualifier">
      <small>
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'tir01-p021'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cbc:ValueQualifier"/>
      </small>
    </xsl:if>
    <br/>
  </xsl:template>
  <xsl:template match="cac:SellersItemIdentification">
    <xsl:apply-templates select="cbc:ID"/>
  </xsl:template>
  <xsl:template match="cac:Price">
    <xsl:call-template name="Currency">
      <xsl:with-param name="currencyvalue" select="cbc:PriceAmount"/>
    </xsl:call-template>&#160;<xsl:apply-templates select="cbc:PriceAmount/@currencyID"/>
  </xsl:template>
  
  
  
  
  
  <!--Invoiceline start: -->
  <xsl:template match="cac:InvoiceLine | cac:CreditNoteLine">
    <tr>
      <td>
        <xsl:apply-templates select="cbc:ID"/>
      </td>
      <td>
        <xsl:apply-templates select="cac:Item/cac:SellersItemIdentification"/>
      </td>
      <td>
        <xsl:apply-templates select="cac:Item/cbc:Name"/>
        <br/>
        <br/>
        <small>
          <xsl:if test="cac:Item/cac:StandardItemIdentification/cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-157'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cac:StandardItemIdentification/cbc:ID"/>
            <xsl:choose>
              <xsl:when test="cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID !=''">
                <small>&#160;[<xsl:apply-templates select="cac:Item/cac:StandardItemIdentification/cbc:ID/@schemeID"/>]</small>
              </xsl:when>
              <xsl:otherwise>
                <small>&#160;[No schemeID]</small>
              </xsl:otherwise>
            </xsl:choose>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cbc:Description !=''">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-154'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cbc:Description"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:AdditionalItemProperty !=''">
            <xsl:apply-templates select="cac:Item/cac:AdditionalItemProperty"/>
          </xsl:if>
          <xsl:if test="cbc:Note !=''">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-127'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:Note"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:CommodityClassification !=''">
            <xsl:apply-templates select="cac:Item/cac:CommodityClassification"/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:BuyersItemIdentification/cbc:ID">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-156'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cac:BuyersItemIdentification/cbc:ID"/>
            <br/>
          </xsl:if>
          <xsl:if test="cbc:AccountingCost !=''">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-19'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cbc:AccountingCost"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:InvoicePeriod !=''">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BG-14'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:InvoicePeriod"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:Price/cac:AllowanceCharge !=''">
            <xsl:apply-templates select="cac:Price/cac:AllowanceCharge" mode="PriceUnit-new"/>
          </xsl:if>
          <xsl:if test="cac:Item/cac:OriginCountry/cbc:IdentificationCode !=''">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-159'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Item/cac:OriginCountry/cbc:IdentificationCode"/>
            <xsl:if test="cac:Item/cac:OriginCountry/cbc:IdentificationCode/@listID !=''">
              <small>&#160;[<xsl:apply-templates select="cac:Item/cac:OriginCountry/cbc:IdentificationCode/@listID"/>]</small>
            </xsl:if>
            <br/>
          </xsl:if>
          <xsl:if test="cac:OrderLineReference/cbc:LineID !=''">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-132'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:OrderLineReference/cbc:LineID"/>
            <br/>
          </xsl:if>
          <xsl:if test="cac:DocumentReference/cbc:ID !=''">
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-128'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:DocumentReference/cbc:ID"/> [<xsl:call-template name="InvoicedObjectIdentifierScheme">
              <xsl:with-param name="InvoicedObjectIdentifier" select="cac:DocumentReference/cbc:ID/@schemeID"/>
            </xsl:call-template>]
						<br/>
          </xsl:if>
        </small>
      </td>
      <td align="left">
        <xsl:if test="cbc:InvoicedQuantity !=''">
          <xsl:apply-templates select="cbc:InvoicedQuantity"/>&#160;<xsl:if test="cbc:InvoicedQuantity/@unitCode !=''">
            <xsl:value-of select="cbc:InvoicedQuantity/@unitCode"/>
            <br/>
            <small>(<xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-130'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
              <xsl:call-template name="UNECECode">
                <xsl:with-param name="Code" select="cbc:InvoicedQuantity/@unitCode"/>
              </xsl:call-template>)</small>
          </xsl:if>
        </xsl:if>
        <xsl:if test="cbc:CreditedQuantity !=''">
          <xsl:apply-templates select="cbc:CreditedQuantity"/>&#160;<xsl:if test="cbc:CreditedQuantity/@unitCode !=''">
            <xsl:value-of select="cbc:CreditedQuantity/@unitCode"/>
            <br/>
            <small>(<xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-130'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
              <xsl:call-template name="UNECECode">
                <xsl:with-param name="Code" select="cbc:CreditedQuantity/@unitCode"/>
              </xsl:call-template>)</small>
          </xsl:if>
        </xsl:if>
      </td>
      <td>
        <xsl:apply-templates select="cac:Price"/>
        <xsl:if test="cac:Price/cbc:BaseQuantity">
          <small>
            <br/>
            <b>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'BT-149'"/>
                <xsl:with-param name="Colon-Suffix" select="'true'"/>
              </xsl:call-template>
            </b>
            <xsl:apply-templates select="cac:Price/cbc:BaseQuantity"/>
          </small>
        </xsl:if>
      </td>
      <td>
        <xsl:if test="cac:Item/cac:ClassifiedTaxCategory !='' ">
          <xsl:choose>
            <xsl:when test="cac:Item/cac:ClassifiedTaxCategory/cbc:Percent !=''">
              <xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cbc:ID"/>,&#160;<xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cbc:Percent"/>%

						</xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID"/>:&#160;<xsl:apply-templates select="cac:Item/cac:ClassifiedTaxCategory/cbc:ID"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
        <xsl:if test="cac:TaxTotal/cbc:TaxAmount">
          <small>
            <xsl:choose>
              <xsl:when test="cac:Item/cac:ClassifiedTaxCategory/cbc:Percent !=''">
                <br/>(<xsl:call-template name="Currency">
                  <xsl:with-param name="currencyvalue" select="cac:TaxTotal/cbc:TaxAmount"/>
                </xsl:call-template>)

						</xsl:when>
              <xsl:otherwise>
							(<xsl:call-template name="Currency">
                  <xsl:with-param name="currencyvalue" select="cac:TaxTotal/cbc:TaxAmount"/>
                </xsl:call-template>)

						</xsl:otherwise>
            </xsl:choose>
          </small>
        </xsl:if>
      </td>
      <td>
        <xsl:if test="cac:AllowanceCharge !=''">
          <xsl:apply-templates select="cac:AllowanceCharge" mode="LineLevel-new"/>
        </xsl:if>
      </td>
      <td align="right">
        <xsl:call-template name="Currency">
          <xsl:with-param name="currencyvalue" select="cbc:LineExtensionAmount"/>
        </xsl:call-template>
      </td>
    </tr>
    <!-- Invoice line/part 3: -->
    <xsl:if test="cac:Delivery !=''">
      <tr>
        <td>
        </td>
        <td>
        </td>
        <td class="UBLName">
          <table border="0" width="90%" cellspacing="0" cellpadding="2">
            <xsl:apply-templates select="cac:Delivery" mode="line-new"/>
          </table>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>

  <!--Invoiceline end-->
  <!-- Document legal totals from here-->
  <!-- Document legal totals until here-->
  <!--Allowance/Charge from here-->
  <!-- 1) A/C on document level -->
  <xsl:template match="cac:AllowanceCharge" mode="DocumentLevel-new">
    <tr>
      <td valign="top" colspan="2">
        <xsl:choose>
          <xsl:when test="cbc:ChargeIndicator ='true'">
            <xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BG-21'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="cbc:ChargeIndicator ='false'">
            <xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BG-20'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise/>
        </xsl:choose>
      </td>
      <xsl:if test="cbc:AllowanceChargeReasonCode !=''">
        <td valign="top" colspan="2">
          <xsl:apply-templates select="cbc:AllowanceChargeReasonCode"/>
        </td>
      </xsl:if>
      <xsl:if test="cbc:AllowanceChargeReason !=''">
        <td valign="top" colspan="2">
          <xsl:apply-templates select="cbc:AllowanceChargeReason"/>
        </td>
      </xsl:if>
      <td>
        <xsl:if test="cac:TaxCategory !='' ">
          <xsl:choose>
            <xsl:when test="cac:TaxCategory/cbc:Percent !=''">
              <xsl:apply-templates select="cac:TaxCategory/cac:TaxScheme/cbc:ID"/>:&#160;<xsl:apply-templates select="cac:TaxCategory/cbc:ID"/>,
							&#160;<xsl:apply-templates select="cac:TaxCategory/cbc:Percent"/>%

						</xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="cac:TaxCategory/cac:TaxScheme/cbc:ID"/>:&#160;<xsl:apply-templates select="cac:TaxCategory/cbc:ID"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </td>
      <td valign="top" align="right">
        <xsl:call-template name="Currency">
          <xsl:with-param name="currencyvalue" select="cbc:Amount"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="Allowance">
    <tr>
      <td valign="top" colspan="2">
        <xsl:apply-templates select="cbc:AllowanceChargeReasonCode"/>
      </td>
      <td valign="top" colspan="2">
        <xsl:apply-templates select="cbc:AllowanceChargeReason"/>
      </td>
      <td>
        <xsl:if test="cac:TaxCategory !='' ">
          <xsl:choose>
            <xsl:when test="cac:TaxCategory/cbc:Percent !=''">
              <xsl:apply-templates select="cac:TaxCategory/cac:TaxScheme/cbc:ID"/>:&#160;<xsl:apply-templates select="cac:TaxCategory/cbc:ID"/>,
							&#160;<xsl:apply-templates select="cac:TaxCategory/cbc:Percent"/>%

						</xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="cac:TaxCategory/cac:TaxScheme/cbc:ID"/>:&#160;<xsl:apply-templates select="cac:TaxCategory/cbc:ID"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </td>
      <td valign="top" align="right">
        <xsl:if test="cbc:MultiplierFactorNumeric">
          <xsl:apply-templates select="cbc:MultiplierFactorNumeric"/>% of 
				</xsl:if>
        <xsl:call-template name="Currency">
          <xsl:with-param name="currencyvalue" select="cbc:BaseAmount"/>
        </xsl:call-template>
      </td>
      <td valign="top" align="right">
        <xsl:call-template name="Currency">
          <xsl:with-param name="currencyvalue" select="cbc:Amount"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="Charge">
    <tr>
      <td valign="top" colspan="2">
        <xsl:apply-templates select="cbc:AllowanceChargeReasonCode"/>
      </td>
      <td valign="top" colspan="2">
        <xsl:apply-templates select="cbc:AllowanceChargeReason"/>
      </td>
      <td>
        <xsl:if test="cac:TaxCategory !='' ">
          <xsl:choose>
            <xsl:when test="cac:TaxCategory/cbc:Percent !=''">
              <xsl:apply-templates select="cac:TaxCategory/cac:TaxScheme/cbc:ID"/>:&#160;<xsl:apply-templates select="cac:TaxCategory/cbc:ID"/>,
							&#160;<xsl:apply-templates select="cac:TaxCategory/cbc:Percent"/>%

						</xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="cac:TaxCategory/cac:TaxScheme/cbc:ID"/>:&#160;<xsl:apply-templates select="cac:TaxCategory/cbc:ID"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </td>
      <td valign="top" align="right">
        <xsl:if test="cbc:MultiplierFactorNumeric">
          <xsl:apply-templates select="cbc:MultiplierFactorNumeric"/>% of 
				</xsl:if>
        <xsl:call-template name="Currency">
          <xsl:with-param name="currencyvalue" select="cbc:BaseAmount"/>
        </xsl:call-template>
      </td>
      <td valign="top" align="right">
        <xsl:call-template name="Currency">
          <xsl:with-param name="currencyvalue" select="cbc:Amount"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <!-- 2) A/C on line level -->
  <xsl:template match="cac:AllowanceCharge" mode="LineLevel-new">
    <xsl:choose>
      <xsl:when test="cbc:ChargeIndicator ='true'">
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BG-28'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:choose>
          <xsl:when test="cbc:BaseAmount !='' ">
            <xsl:call-template name="Currency">
              <xsl:with-param name="currencyvalue" select="cbc:Amount"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BT-142'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
            <xsl:call-template name="Currency">
              <xsl:with-param name="currencyvalue" select="cbc:BaseAmount"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="Currency">
              <xsl:with-param name="currencyvalue" select="cbc:Amount"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BG-27'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:choose>
          <xsl:when test="cbc:BaseAmount !='' ">
            <xsl:call-template name="Currency">
              <xsl:with-param name="currencyvalue" select="cbc:Amount"/>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="LabelName">
              <xsl:with-param name="BT-ID" select="'BT-137'"/>
              <xsl:with-param name="Colon-Suffix" select="'true'"/>
            </xsl:call-template>
            <xsl:call-template name="Currency">
              <xsl:with-param name="currencyvalue" select="cbc:BaseAmount"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="Currency">
              <xsl:with-param name="currencyvalue" select="cbc:Amount"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
    <small>
      <xsl:if test="cbc:AllowanceChargeReason !=''">
        <br/>
        <xsl:apply-templates select="cbc:AllowanceChargeReason"/>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="cbc:AllowanceChargeReasonCode">
					(<xsl:apply-templates select="cbc:AllowanceChargeReasonCode"/>)
					</xsl:when>
      </xsl:choose>
      <xsl:if test="cbc:MultiplierFactorNumeric">&#160;<xsl:apply-templates select="cbc:MultiplierFactorNumeric"/>%
			</xsl:if>
      <br/>
    </small>
  </xsl:template>
  <!-- 3) A/C on price unit level (for information only) -->
  <xsl:template match="cac:AllowanceCharge" mode="PriceUnit-new">
    <b>
      <xsl:choose>
        <xsl:when test="cbc:ChargeIndicator ='true'">
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-147'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="cbc:ChargeIndicator ='false'">
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-147'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
        </xsl:when>
      </xsl:choose>
    </b>
    <xsl:choose>
      <xsl:when test="cbc:BaseAmount !='' ">
        <xsl:call-template name="Currency">
          <xsl:with-param name="currencyvalue" select="cbc:Amount"/>
        </xsl:call-template>
        <br/>
        <b>
          <xsl:call-template name="LabelName">
            <xsl:with-param name="BT-ID" select="'BT-148'"/>
            <xsl:with-param name="Colon-Suffix" select="'true'"/>
          </xsl:call-template>
        </b>
        <xsl:call-template name="Currency">
          <xsl:with-param name="currencyvalue" select="cbc:BaseAmount"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="Currency">
          <xsl:with-param name="currencyvalue" select="cbc:Amount"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
    <br/>
  </xsl:template>
  <!-- AllowanceCharge end -->
  <!-- Tax (VAT) totals from here: -->
  <xsl:template match="cac:TaxTotal/cac:TaxSubtotal">
    <tr class="TAXInformation">
      <td colspan="2">
        <xsl:apply-templates select="cac:TaxCategory/cac:TaxScheme/cbc:ID"/>
				:&#160;<xsl:apply-templates select="cac:TaxCategory/cbc:ID"/>&#160;<small>(<xsl:call-template name="UBLTaxCategoryCode">
            <xsl:with-param name="Code" select="cac:TaxCategory/cbc:ID"/>
          </xsl:call-template>),</small>
        <xsl:choose>
          <xsl:when test="cac:TaxCategory/cbc:Percent !=''">&#160;<xsl:apply-templates select="cac:TaxCategory/cbc:Percent"/>%
					</xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <td colspan="2">
        <xsl:if test="cac:TaxCategory/cbc:TaxExemptionReason !=''">
          <xsl:apply-templates select="cac:TaxCategory/cbc:TaxExemptionReason"/>
          <xsl:if test="cac:TaxCategory/cbc:TaxExemptionReasonCode !=''"> [<xsl:apply-templates select="cac:TaxCategory/cbc:TaxExemptionReasonCode"/>] </xsl:if>
        </xsl:if>
      </td>
      <td colspan="2">
        <xsl:call-template name="Currency">
          <xsl:with-param name="currencyvalue" select="cbc:TaxableAmount"/>
        </xsl:call-template>
      </td>
      <td align="right">
        <xsl:call-template name="Currency">
          <xsl:with-param name="currencyvalue" select="cbc:TaxAmount"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <!--TaxTotal until here-->
  <!--PaymentMeans from here-->
  <xsl:template name="cac:PaymentMeans">
    <tr>
      <td valign="top">
        <xsl:apply-templates select="cbc:PaymentMeansCode"/>
        <smaller> (<xsl:choose>
            <xsl:when test="cbc:PaymentMeansCode/@name">
              <xsl:apply-templates select="cbc:PaymentMeansCode/@name"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="PaymentMeansCode">
                <xsl:with-param name="PaymentCode" select="cbc:PaymentMeansCode"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>) 
			</smaller>
      </td>
      <td valign="top" colspan="2">
        <xsl:if test="cac:CardAccount/cbc:PrimaryAccountNumberID !='' or cac:CardAccount/cbc:NetworkID !=''">
          <xsl:apply-templates select="cac:CardAccount/cbc:NetworkID"/>
        </xsl:if>
        <xsl:if test="cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID !='' ">
          <xsl:apply-templates select="cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cbc:ID"/>&#160;</xsl:if>
        <xsl:if test="cac:PaymentMandate/cbc:ID !='' or cac:PaymentMandate/cac:PayerFinancialAccount !=''">
          <xsl:apply-templates select="cac:PaymentMandate/cac:PayerFinancialAccount/cbc:ID"/>
        </xsl:if>
      </td>
      <td valign="top" colspan="2">
        <xsl:if test="cac:CardAccount/cbc:PrimaryAccountNumberID !='' or cac:CardAccount/cbc:NetworkID !=''">
					***<xsl:apply-templates select="cac:CardAccount/cbc:PrimaryAccountNumberID"/>&#160;</xsl:if>
        <xsl:if test="cac:PayeeFinancialAccount/cbc:ID !=''">
          <xsl:if test="cac:CardAccount/cbc:PrimaryAccountNumberID !='' or cac:CardAccount/cbc:NetworkID !=''"/>
          <xsl:apply-templates select="cac:PayeeFinancialAccount/cbc:ID"/>&#160;</xsl:if>
        <xsl:if test="cac:PaymentMandate/cbc:ID !='' or cac:PaymentMandate/cac:PayerFinancialAccount !=''">
          <xsl:apply-templates select="cac:PaymentMandate/cbc:ID"/>
        </xsl:if>
      </td>
      <xsl:if test="cac:PaymentMandate">
        <td valign="top" colspan="2">
          <xsl:if test="../cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID = 'SEPA'">
            <xsl:value-of select="../cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID = 'SEPA']"/>
          </xsl:if>
          <xsl:if test="../cac:PayeeParty/cac:PartyIdentification/cbc:ID/@schemeID = 'SEPA'">
            <xsl:value-of select="../cac:PayeeParty/cac:PartyIdentification/cbc:ID"/>
          </xsl:if>
        </td>
      </xsl:if>
      <xsl:if test="cac:PayeeFinancialAccount !=''">
        <td valign="top" colspan="2">
          <xsl:apply-templates select="cac:PayeeFinancialAccount/cbc:Name"/>
        </td>
      </xsl:if>
      <xsl:if test="not(cac:PaymentMandate) and not(cac:CardAccount) and not(cac:PayeeFinancialAccount)">
        <td valign="top" colspan="2"/>
      </xsl:if>
      <xsl:if test="cac:CardAccount !=''">
        <td valign="top" colspan="2">
          <xsl:apply-templates select="cac:CardAccount/cbc:HolderName"/>
        </td>
      </xsl:if>
      <td valign="top" align="right">
        <xsl:if test="cbc:PaymentID !=''">
          <xsl:apply-templates select="cbc:PaymentID"/>
        </xsl:if>
      </td>
      <!--td valign="top" align="right">
			
			</td-->
    </tr>
  </xsl:template>
  <!--PaymentMeans template until here-->
  <!-- PaymentTerms from here: -->
  <xsl:template match="cac:PaymentTerms">
    <xsl:if test="cbc:Note !=''">
      <xsl:apply-templates select="cbc:Note"/>
    </xsl:if>
  </xsl:template>
  <!-- Document references from here: -->
  <xsl:template match="cac:AdditionalDocumentReference" mode="InvoicedObject">
    <xsl:if test="cbc:DocumentTypeCode='130'">
      <br/>
      <b>
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-18'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
      </b>
      <xsl:value-of select="cbc:ID"/>
      <xsl:if test="cbc:ID/@schemeID"> [<xsl:call-template name="InvoicedObjectIdentifierScheme">
          <xsl:with-param name="InvoicedObjectIdentifier" select="cbc:ID/@schemeID"/>
        </xsl:call-template>]</xsl:if>
    </xsl:if>
    <xsl:if test="cbc:DocumentTypeCode='50'">
      <br/>
      <b>
        <xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-11'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
      </b>
      <xsl:value-of select="cbc:ID"/>
      <xsl:if test="cbc:ID/@schemeID"> [<xsl:call-template name="InvoicedObjectIdentifierScheme">
          <xsl:with-param name="InvoicedObjectIdentifier" select="cbc:ID/@schemeID"/>
        </xsl:call-template>]</xsl:if>
    </xsl:if>
  </xsl:template>
  <xsl:template match="cac:AdditionalDocumentReference" mode="Supporting">
    <xsl:if test="cbc:ID !=''">
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BT-122'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
      <xsl:apply-templates select="cbc:ID"/>
      <xsl:if test="cbc:ID/@schemeID"> [<xsl:call-template name="InvoicedObjectIdentifierScheme">
          <xsl:with-param name="InvoicedObjectIdentifier" select="cbc:ID/@schemeID"/>
        </xsl:call-template>]</xsl:if>
    </xsl:if>
    <small>
      <xsl:if test="cbc:DocumentType !='' or cbc:DocumentTypeCode !=''">
        <br/>
			-&#160;<xsl:call-template name="LabelName">
          <xsl:with-param name="BT-ID" select="'BT-123'"/>
          <xsl:with-param name="Colon-Suffix" select="'true'"/>
        </xsl:call-template>
        <xsl:apply-templates select="cbc:DocumentType"/>
        <xsl:if test="cbc:DocumentTypeCode !=''">&#160;[<xsl:apply-templates select="cbc:DocumentTypeCode"/>]</xsl:if>
      </xsl:if>
      <xsl:if test="cbc:DocumentDescription">	
			-&#160;<xsl:apply-templates select="cbc:DocumentDescription"/>
      </xsl:if>
      <br/>
      <xsl:apply-templates select="cac:Attachment"/>
    </small>
  </xsl:template>
  <xsl:template match="cac:Attachment">
    <!-- No processing of attached document, just info: -->
    <xsl:if test="cbc:EmbeddedDocumentBinaryObject/@mimeCode !=''">
				-&#160;<xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BT-125-1'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
      <xsl:apply-templates select="cbc:EmbeddedDocumentBinaryObject/@mimeCode"/>
      <br/>
    </xsl:if>
    <xsl:if test="cbc:EmbeddedDocumentBinaryObject/@format !=''">
				-&#160;<xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BT-125-1'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
      <xsl:apply-templates select="cbc:EmbeddedDocumentBinaryObject/@format"/>
      <br/>
    </xsl:if>
    <xsl:if test="cbc:EmbeddedDocumentBinaryObject/@filename !=''">
				-&#160;<xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BT-125-2'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
      <xsl:apply-templates select="cbc:EmbeddedDocumentBinaryObject/@filename"/>
      <br/>
    </xsl:if>
    <xsl:if test="cac:ExternalReference !=''">
			-&#160;<xsl:apply-templates select="cac:ExternalReference"/>
      <br/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="cac:ExternalReference">
    <xsl:if test="cbc:URI !=''">
      <xsl:call-template name="LabelName">
        <xsl:with-param name="BT-ID" select="'BT-124'"/>
        <xsl:with-param name="Colon-Suffix" select="'true'"/>
      </xsl:call-template>
      <xsl:apply-templates select="cbc:URI"/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="cac:BillingReference">
    <br/>
    <xsl:if test="cac:CreditNoteDocumentReference !=''">
      <xsl:apply-templates select="cac:CreditNoteDocumentReference/cbc:ID"/>&#160;</xsl:if>
    <xsl:if test="cac:InvoiceDocumentReference !=''">
      <xsl:if test="cac:CreditNoteDocumentReference !=''">
        <br/>
      </xsl:if>
      <xsl:apply-templates select="cac:InvoiceDocumentReference/cbc:ID"/>&#160;</xsl:if>
  </xsl:template>
  <!-- Document references end -->
  <!--Periods from here-->
  <xsl:template match="cac:InvoicePeriod | cac:RequestedDeliveryPeriod | cac:PromisedDeliveryPeriod">
    <xsl:if test="cbc:StartDate">
      <xsl:apply-templates select="cbc:StartDate"/>&#160;-&#160;</xsl:if>
    <xsl:if test="cbc:EndDate">
      <xsl:apply-templates select="cbc:EndDate"/>&#160;</xsl:if>
  </xsl:template>
  <!--Periods end-->
</xsl:stylesheet>