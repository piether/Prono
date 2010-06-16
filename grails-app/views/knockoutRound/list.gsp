
<%@ page import="prono.KnockoutRound" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'knockoutRound.label', default: 'KnockoutRound')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'knockoutRound.id.label', default: 'Id')}" />
                        
                            <th><g:message code="knockoutRound.winner.label" default="Winner" /></th>
                   	    
                            <th><g:message code="knockoutRound.second.label" default="Second" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${knockoutRoundInstanceList}" status="i" var="knockoutRoundInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${knockoutRoundInstance.id}">${fieldValue(bean: knockoutRoundInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: knockoutRoundInstance, field: "winner")}</td>
                        
                            <td>${fieldValue(bean: knockoutRoundInstance, field: "second")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${knockoutRoundInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
