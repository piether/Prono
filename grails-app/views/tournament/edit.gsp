
<%@ page import="prono.Tournament" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'tournament.label', default: 'Tournament')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tournamentInstance}">
            <div class="errors">
                <g:renderErrors bean="${tournamentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${tournamentInstance?.id}" />
                <g:hiddenField name="version" value="${tournamentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fourthRound"><g:message code="tournament.fourthRound.label" default="Fourth Round" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tournamentInstance, field: 'fourthRound', 'errors')}">
                                    <g:select name="fourthRound" from="${prono.KnockoutRound.list()}" multiple="yes" optionKey="id" size="5" value="${tournamentInstance?.fourthRound*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="theFinal"><g:message code="tournament.theFinal.label" default="The Final" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tournamentInstance, field: 'theFinal', 'errors')}">
                                    <g:select name="theFinal.id" from="${prono.KnockoutRound.list()}" optionKey="id" value="${tournamentInstance?.theFinal?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quarterFinals"><g:message code="tournament.quarterFinals.label" default="Quarter Finals" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tournamentInstance, field: 'quarterFinals', 'errors')}">
                                    <g:select name="quarterFinals" from="${prono.KnockoutRound.list()}" multiple="yes" optionKey="id" size="5" value="${tournamentInstance?.quarterFinals*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="tournament.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tournamentInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${tournamentInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="semiFinals"><g:message code="tournament.semiFinals.label" default="Semi Finals" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tournamentInstance, field: 'semiFinals', 'errors')}">
                                    <g:select name="semiFinals" from="${prono.KnockoutRound.list()}" multiple="yes" optionKey="id" size="5" value="${tournamentInstance?.semiFinals*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="groupRounds"><g:message code="tournament.groupRounds.label" default="Group Rounds" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tournamentInstance, field: 'groupRounds', 'errors')}">
                                    <g:select name="groupRounds" from="${prono.GroupRound.list()}" multiple="yes" optionKey="id" size="5" value="${tournamentInstance?.groupRounds*.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
