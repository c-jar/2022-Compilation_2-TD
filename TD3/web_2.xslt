<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="utf-8" indent="yes" />
	<xsl:template match="/ListePieces">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>

		<html>
			<head>
				<title>Boutique Voitures Collection</title>
			</head>
			<body>
				<xsl:for-each-group select="Piece" group-by="@modele">
					<h1><xsl:value-of select="current-grouping-key()"/></h1>
					<p><xsl:value-of select="count(current-group())"/> pièces</p>
					<table>
						<tr><td>Description</td><td>État</td><td>Prix</td></tr>
						<xsl:for-each select="current-group()">
							<xsl:sort select="@reference"/>
							<tr>
								<td><xsl:value-of select="Description"/></td>
								<td><xsl:value-of select="@etat"/></td>
								<td><xsl:value-of select="Prix"/></td>
							</tr>
						</xsl:for-each>
					</table>
				</xsl:for-each-group>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
