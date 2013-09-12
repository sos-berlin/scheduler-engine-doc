<?xml version='1.0'?>
<!-- $Id: api-java:javascript.xsl 12125 2013-08-28 12:00:39Z fs $ -->

<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
                version   = "1.0">

<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

<xsl:variable name="selected_programming_language" select="'java_javascript'"/>
<xsl:variable name="language_has_properties"       select="true()"/>

<xsl:include href="api.xsl" />


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

<xsl:template match="com.type [ @type='VARIANT' and not( com.type ) ]" mode="no_array">
    <span class="mono">var</span>
</xsl:template>

<xsl:template match="com.type [ @type='bool' ]" mode="no_array">
    <span class="mono">boolean</span>
</xsl:template>

<xsl:template match="com.type [ @type='DATE' ]" mode="no_array">
    <span class="mono">Date</span>
</xsl:template>

<xsl:template match="com.type [ @type='BSTR' ]" mode="no_array">
    <span class="mono">string</span>
</xsl:template>

<!--xsl:template match="com.type [ @type='BSTR' and @array ]">
    <span class="mono" title="Array of strings">string[]</span>
</xsl:template-->

<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

<xsl:template match="api.empty" mode="description">
    <code>undefined</code>
</xsl:template>

<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->


</xsl:stylesheet>
