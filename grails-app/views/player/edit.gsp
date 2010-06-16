
<%@ page import="prono.Player" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
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
            <g:hasErrors bean="${playerInstance}">
            <div class="errors">
                <g:renderErrors bean="${playerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${playerInstance?.id}" />
                <g:hiddenField name="version" value="${playerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nr"><g:message code="player.nr.label" default="Nr" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'nr', 'errors')}">
                                    <g:textField name="nr" value="${fieldValue(bean: playerInstance, field: 'nr')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="player.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${playerInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateOfBirth"><g:message code="player.dateOfBirth.label" default="Date Of Birth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'dateOfBirth', 'errors')}">
                                    <g:datePicker name="dateOfBirth" precision="day" value="${playerInstance?.dateOfBirth}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pos"><g:message code="player.pos.label" default="Pos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'pos', 'errors')}">
                                    <g:textField name="pos" maxlength="3" value="${playerInstance?.pos}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="clubs"><g:message code="player.clubs.label" default="Clubs" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'clubs', 'errors')}">
                                    <g:textField name="clubs" value="${playerInstance?.clubs}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="height"><g:message code="player.height.label" default="Height" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'height', 'errors')}">
                                    <g:textField name="height" value="${fieldValue(bean: playerInstance, field: 'height')}" />
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
