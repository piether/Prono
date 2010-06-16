
<%@ page import="prono.GroupRound" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groupRound.label', default: 'GroupRound')}" />
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
            <g:hasErrors bean="${groupRoundInstance}">
            <div class="errors">
                <g:renderErrors bean="${groupRoundInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="winner"><g:message code="groupRound.winner.label" default="Winner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groupRoundInstance, field: 'winner', 'errors')}">
                                    <g:select name="winner.id" from="${prono.Team.list()}" optionKey="id" value="${groupRoundInstance?.winner?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="second"><g:message code="groupRound.second.label" default="Second" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groupRoundInstance, field: 'second', 'errors')}">
                                    <g:select name="second.id" from="${prono.Team.list()}" optionKey="id" value="${groupRoundInstance?.second?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="possibleWinners"><g:message code="groupRound.possibleWinners.label" default="Possible Winners" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: groupRoundInstance, field: 'possibleWinners', 'errors')}">
                                    
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
