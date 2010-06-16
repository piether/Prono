
<%@ page import="prono.GroupRound" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groupRound.label', default: 'GroupRound')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'groupRound.id.label', default: 'Id')}" />
                        
                            <th><g:message code="groupRound.winner.label" default="Winner" /></th>
                   	    
                            <th><g:message code="groupRound.second.label" default="Second" /></th>
                   	    
                            <g:sortableColumn property="possibleWinners" title="${message(code: 'groupRound.possibleWinners.label', default: 'Possible Winners')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${groupRoundInstanceList}" status="i" var="groupRoundInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${groupRoundInstance.id}">${fieldValue(bean: groupRoundInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: groupRoundInstance, field: "winner")}</td>
                        
                            <td>${fieldValue(bean: groupRoundInstance, field: "second")}</td>
                        
                            <td>${fieldValue(bean: groupRoundInstance, field: "possibleWinners")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${groupRoundInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
