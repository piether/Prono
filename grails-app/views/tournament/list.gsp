
<%@ page import="prono.Tournament" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tournament.label', default: 'Tournament')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'tournament.id.label', default: 'Id')}" />
                        
                            <th><g:message code="tournament.theFinal.label" default="The Final" /></th>
                   	    
                            <g:sortableColumn property="name" title="${message(code: 'tournament.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tournamentInstanceList}" status="i" var="tournamentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tournamentInstance.id}">${fieldValue(bean: tournamentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: tournamentInstance, field: "theFinal")}</td>
                        
                            <td>${fieldValue(bean: tournamentInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tournamentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
