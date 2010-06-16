
<%@ page import="prono.OtherPredictions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'otherPredictions.label', default: 'OtherPredictions')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'otherPredictions.id.label', default: 'Id')}" />
                        
                            <th><g:message code="otherPredictions.bestYoungPlayer.label" default="Best Young Player" /></th>
                   	    
                            <th><g:message code="otherPredictions.goldenBall.label" default="Golden Ball" /></th>
                   	    
                            <th><g:message code="otherPredictions.fairPlayAward.label" default="Fair Play Award" /></th>
                   	    
                            <th><g:message code="otherPredictions.bestGoalie.label" default="Best Goalie" /></th>
                   	    
                            <th><g:message code="otherPredictions.mostEntertainingTeam.label" default="Most Entertaining Team" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${otherPredictionsInstanceList}" status="i" var="otherPredictionsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${otherPredictionsInstance.id}">${fieldValue(bean: otherPredictionsInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: otherPredictionsInstance, field: "bestYoungPlayer")}</td>
                        
                            <td>${fieldValue(bean: otherPredictionsInstance, field: "goldenBall")}</td>
                        
                            <td>${fieldValue(bean: otherPredictionsInstance, field: "fairPlayAward")}</td>
                        
                            <td>${fieldValue(bean: otherPredictionsInstance, field: "bestGoalie")}</td>
                        
                            <td>${fieldValue(bean: otherPredictionsInstance, field: "mostEntertainingTeam")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${otherPredictionsInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
