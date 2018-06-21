<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<xsl:param name="quantity_total" /> <!-- To be used for quantity total of invoice -->
	<xsl:param name="invoice_total" />	<!-- To be used for total of invoice -->
	
	<invoice_document xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="invoice.xsd">
		<order_info>
			<order_id><xsl:value-of select="order/@orderid"/></order_id>
			<currency><xsl:value-of select="order/currency"/></currency>
		</order_info>
		
		<parties>
			<bill_to>
				<name><xsl:value-of select="order/billto/name"/></name>
				<address>
					<address_line1><xsl:value-of select="order/billto/address"/></address_line1>
					<city><xsl:value-of select="order/billto/city"/></city>
					<country><xsl:value-of select="order/billto/country"/></country>
				</address>
			</bill_to>
		</parties>
		
		<items>
			<!-- Loop through items -->
			<xsl:for-each select="order/item">
				<item>
					<product_id><xsl:value-of select="product_id"/></product_id>
					<product_name><xsl:value-of select="name"/></product_name>
					<price><xsl:value-of select="price"/></price>
					<quantity><xsl:value-of select="quantity"/></quantity>
					<note><xsl:value-of select="note"/></note>
				</item>
			</xsl:for-each>
		</items>
		
		<payment_info><xsl:value-of select="order/payment_information"/></payment_info>
		<quantity_total><xsl:value-of select="order/payment_information"/></quantity_total>
		<invoice_total><xsl:value-of select="order/payment_information"/></invoice_total>
	</invoice_document>
</xsl:template>

</xsl:stylesheet>