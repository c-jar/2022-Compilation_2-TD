<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="utf-8" indent="yes" />
	<xsl:template match="/ListePieces">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<title>Boutique Voitures Collection</title>
			</head>
			<body>
				<h1>2CV</h1>
				<p><xsl:value-of select="count(Piece[@modele='2CV'])"/> pièces</p>
				<table>
					<tr><td>Description</td><td>État</td><td>Prix</td></tr>
					<xsl:for-each select="Piece[@modele='2CV']">
						<xsl:sort select="@reference"/>
						<tr>
							<td><xsl:value-of select="Description"/></td>
							<td><xsl:value-of select="@etat"/></td>
							<td><xsl:value-of select="Prix"/></td>
						</tr>
					</xsl:for-each>
				</table>
				<h1>Mini</h1>
				<p><xsl:value-of select="count(Piece[@modele='Mini'])"/> pièces</p>
				<table>
					<tr><td>Description</td><td>État</td><td>Prix</td></tr>
					<xsl:for-each select="Piece[@modele='Mini']">
						<xsl:sort select="@reference"/>
						<tr>
							<td><xsl:value-of select="Description"/></td>
							<td><xsl:value-of select="@etat"/></td>
							<td><xsl:value-of select="Prix"/></td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
