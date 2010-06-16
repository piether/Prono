
<%@ page import="prono.Team" %>
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
            <g:form action="saveGroupRounds" method="post" >
                <div class="dialog">

                  <g:each var="i" in="${ (1..8) }">
                    <table width='400'>
                      <tr>Poule ${ ['A','B','C','D','E','F','G','H'][i-1] }</tr>
                    <tr>
                      <td width='20'>1.</td>
                      <td><g:select name="group.${i}.winner.id" from="${wkService.getGroupRound(i-1)}" optionKey="id"  /></td>
                    </tr>

                    <tr>
                      <td width='20'>2.</td>
                      <td><g:select name="group.${i}.second.id" from="${wkService.getGroupRound(i-1)}" optionKey="id" value="${wkService.getGroupRound(i-1)[1].id}"/></td>
                    </tr>
                    </table>
                  </g:each>
                  
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
