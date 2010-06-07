
<%@ page import="prono.Tournament" %>
<%@ page import="prono.WkReadOnlyService" %>
<%
    def wkService = grailsApplication.classLoader.loadClass('prono.WkReadOnlyService').newInstance()
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tournament.label', default: 'Tournament')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tournamentInstance}">
            <div class="errors">
                <g:renderErrors bean="${tournamentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">

                  <table border="0" cellpadding="0" cellspacing="0" style="font-size: 90%; margin:1em 2em 1em 1em;">
<tr>
<td>&#160;</td>
<td align="center" colspan="3" style="border:1px solid #aaa;" bgcolor="#F2F2F2">Achtste finales<br />
</td>
<td colspan="2"></td>
<td align="center" colspan="3" style="border:1px solid #aaa;" bgcolor="#F2F2F2">Kwartfinales<br />
</td>
<td colspan="2"></td>
<td align="center" colspan="3" style="border:1px solid #aaa;" bgcolor="#F2F2F2">Halve finales<br />
</td>
<td colspan="2"></td>
<td align="center" colspan="3" style="border:1px solid #aaa;" bgcolor="#F2F2F2">Finale<br />
</td>
</tr>
<tr>
<td width="1">&#160;</td>
<td width="25">&#160;</td>
<td width="130">&#160;</td>
<td width="25">&#160;</td>
<td width="5">&#160;</td>
<td width="5">&#160;</td>
<td width="25">&#160;</td>
<td width="130">&#160;</td>
<td width="25">&#160;</td>
<td width="5">&#160;</td>
<td width="5">&#160;</td>
<td width="25">&#160;</td>
<td width="130">&#160;</td>
<td width="25">&#160;</td>
<td width="5">&#160;</td>
<td width="5">&#160;</td>
<td width="25">&#160;</td>
<td width="130">&#160;</td>
<td width="25">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
   ${tournamentInstance.groupRounds[0].winner}
</td>
<td style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
   ${tournamentInstance.groupRounds[2].second}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="6" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" colspan="3" align="center">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="12" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
   ${tournamentInstance.groupRounds[2].winner}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
</tr>
<tr>
<td height="7"></td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
     ${tournamentInstance.groupRounds[3].second}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td colspan="5"></td>
<td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" colspan="8" align="center">&nbsp;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="24" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
      ${tournamentInstance.groupRounds[4].winner}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
    ${tournamentInstance.groupRounds[5].second}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="6" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" colspan="3" align="center">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="12" align="center" style="border-width:2px 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
      ${tournamentInstance.groupRounds[6].winner}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
</tr>
<tr>
<td height="7"></td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
      ${tournamentInstance.groupRounds[7].second}</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td colspan="10"></td>
<td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
</tr>
<tr>
<td rowspan="2"></td>
<td height="7"></td>
<td rowspan="2" colspan="12" align="center"></td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
   ${tournamentInstance.groupRounds[3].winner}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
  ${tournamentInstance.groupRounds[2].second}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="6" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" colspan="3" align="center">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="12" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
  ${tournamentInstance.groupRounds[1].winner}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
</tr>
<tr>
<td height="7"></td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
  ${tournamentInstance.groupRounds[0].second}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td colspan="5"></td>
<td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" colspan="8" align="center">&nbsp;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
  ${tournamentInstance.groupRounds[7].winner}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
   ${tournamentInstance.groupRounds[6].second}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="6" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" colspan="3" align="center">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
<tr>
<td height="7"></td>
<td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
  ${tournamentInstance.groupRounds[5].winner}
</td>
<td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
</tr>
<tr>
<td height="7"></td>
</tr>
<tr>
<td height="7"></td>
<td align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
  ${tournamentInstance.groupRounds[4].second}
</td>
<td style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
<td align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
<td align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
</tr>
</table> 

                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
