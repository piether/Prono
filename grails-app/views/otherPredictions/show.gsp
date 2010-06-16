
<%@ page import="prono.OtherPredictions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'otherPredictions.label', default: 'OtherPredictions')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherPredictions.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherPredictionsInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherPredictions.bestYoungPlayer.label" default="Best Young Player" /></td>
                            
                            <td valign="top" class="value"><g:link controller="player" action="show" id="${otherPredictionsInstance?.bestYoungPlayer?.id}">${otherPredictionsInstance?.bestYoungPlayer?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherPredictions.goldenBall.label" default="Golden Ball" /></td>
                            
                            <td valign="top" class="value"><g:link controller="player" action="show" id="${otherPredictionsInstance?.goldenBall?.id}">${otherPredictionsInstance?.goldenBall?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherPredictions.fairPlayAward.label" default="Fair Play Award" /></td>
                            
                            <td valign="top" class="value"><g:link controller="team" action="show" id="${otherPredictionsInstance?.fairPlayAward?.id}">${otherPredictionsInstance?.fairPlayAward?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherPredictions.bestGoalie.label" default="Best Goalie" /></td>
                            
                            <td valign="top" class="value"><g:link controller="player" action="show" id="${otherPredictionsInstance?.bestGoalie?.id}">${otherPredictionsInstance?.bestGoalie?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherPredictions.mostEntertainingTeam.label" default="Most Entertaining Team" /></td>
                            
                            <td valign="top" class="value"><g:link controller="team" action="show" id="${otherPredictionsInstance?.mostEntertainingTeam?.id}">${otherPredictionsInstance?.mostEntertainingTeam?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherPredictions.goldenShoe.label" default="Golden Shoe" /></td>
                            
                            <td valign="top" class="value"><g:link controller="player" action="show" id="${otherPredictionsInstance?.goldenShoe?.id}">${otherPredictionsInstance?.goldenShoe?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="otherPredictions.nextPrimeMinister.label" default="Next Prime Minister" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: otherPredictionsInstance, field: "nextPrimeMinister")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${otherPredictionsInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
