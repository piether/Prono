
<%@ page import="prono.KnockoutRound" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'knockoutRound.label', default: 'KnockoutRound')}" />
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
            <g:hasErrors bean="${knockoutRoundInstance}">
            <div class="errors">
                <g:renderErrors bean="${knockoutRoundInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="winner"><g:message code="knockoutRound.winner.label" default="Winner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: knockoutRoundInstance, field: 'winner', 'errors')}">
                                    <g:select name="winner.id" from="${prono.Team.list()}" optionKey="id" value="${knockoutRoundInstance?.winner?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="second"><g:message code="knockoutRound.second.label" default="Second" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: knockoutRoundInstance, field: 'second', 'errors')}">
                                    <g:select name="second.id" from="${prono.Team.list()}" optionKey="id" value="${knockoutRoundInstance?.second?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="possibleWinners"><g:message code="knockoutRound.possibleWinners.label" default="Possible Winners" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: knockoutRoundInstance, field: 'possibleWinners', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
