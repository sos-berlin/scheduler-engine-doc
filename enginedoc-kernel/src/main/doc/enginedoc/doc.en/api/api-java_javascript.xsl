<?xml version='1.0'?>
<!-- $Id: api-java:javascript.xsl 12125 2013-08-28 12:00:39Z fs $ -->

<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
                version   = "1.0">

<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

<xsl:variable name="selected_programming_language" select="'java_javascript'"/>
<xsl:variable name="language_has_properties"       select="true()"/>

<xsl:include href="api.xsl" />

<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

<xsl:template match="property [ java ] | method [ java ]" mode="table_rows">
    <xsl:param name="show_title"  select="true()"/>
    <xsl:param name="is_in_table" select="false()"/>

    <xsl:apply-templates select="java" mode="table_row">
        <xsl:with-param name="show_title"  select="$show_title"/>
        <xsl:with-param name="is_in_table" select="$is_in_table"/>
    </xsl:apply-templates>

</xsl:template>

<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

<xsl:template match="property | method " mode="method_name">
    <xsl:param name="access"/>
    <xsl:param name="com_param"/>

    <xsl:if test="parent::api.class/@object_name">
        <span class="api_object_name">
            <xsl:value-of select="parent::api.class/@object_name"/>
            <xsl:text>.</xsl:text>
        </span>
    </xsl:if>

    <xsl:if test="$com_param">
        <span class="mono">
            <xsl:if test="$access='write'">set_</xsl:if>
            <!--xsl:if test="$access='read'">&#160;&#160;&#160;&#160;</xsl:if>-->
        </span>
    </xsl:if>

    <span class="mono" style="font-weight: bold">
        <xsl:value-of select="@name"/>
    </span>
</xsl:template>


<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

<xsl:template match="java.type">
    <span class="mono"><xsl:value-of select="@type"/></span>
</xsl:template>

<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

<xsl:template match="com.type [ @type='bool' ]" mode="no_array">
    <span class="mono">boolean</span>
</xsl:template>

<xsl:template match="com.type [ @type='BSTR' ]" mode="no_array">
    <span class="mono" title="java.lang.String">String</span>
</xsl:template>

<xsl:template match="com.type [ @type='DATE' ]" mode="no_array">
    <span class="mono">java.util.Date</span>
</xsl:template>

<xsl:template match="com.type [ @type='VARIANT' and not( com.type ) ]" mode="no_array">
    <span class="mono" title="java.lang.String">String</span>
</xsl:template>

<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

<xsl:template match="api.empty" mode="description">
    <code>undefined</code>
</xsl:template>

<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->


</xsl:stylesheet>
