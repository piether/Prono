
<%@ page import="prono.OtherPredictions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'otherPredictions.label', default: 'OtherPredictions')}" />
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
            <g:hasErrors bean="${otherPredictionsInstance}">
            <div class="errors">
                <g:renderErrors bean="${otherPredictionsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${otherPredictionsInstance?.id}" />
                <g:hiddenField name="version" value="${otherPredictionsInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bestYoungPlayer"><g:message code="otherPredictions.bestYoungPlayer.label" default="Best Young Player" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'bestYoungPlayer', 'errors')}">
                                    <g:select name="bestYoungPlayer.id" from="${prono.Player.list()}" optionKey="id" value="${otherPredictionsInstance?.bestYoungPlayer?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="goldenBall"><g:message code="otherPredictions.goldenBall.label" default="Golden Ball" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'goldenBall', 'errors')}">
                                    <g:select name="goldenBall.id" from="${prono.Player.list()}" optionKey="id" value="${otherPredictionsInstance?.goldenBall?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fairPlayAward"><g:message code="otherPredictions.fairPlayAward.label" default="Fair Play Award" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'fairPlayAward', 'errors')}">
                                    <g:select name="fairPlayAward.id" from="${prono.Team.list()}" optionKey="id" value="${otherPredictionsInstance?.fairPlayAward?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bestGoalie"><g:message code="otherPredictions.bestGoalie.label" default="Best Goalie" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'bestGoalie', 'errors')}">
                                    <g:select name="bestGoalie.id" from="${prono.Player.list()}" optionKey="id" value="${otherPredictionsInstance?.bestGoalie?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mostEntertainingTeam"><g:message code="otherPredictions.mostEntertainingTeam.label" default="Most Entertaining Team" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'mostEntertainingTeam', 'errors')}">
                                    <g:select name="mostEntertainingTeam.id" from="${prono.Team.list()}" optionKey="id" value="${otherPredictionsInstance?.mostEntertainingTeam?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="goldenShoe"><g:message code="otherPredictions.goldenShoe.label" default="Golden Shoe" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'goldenShoe', 'errors')}">
                                    <g:select name="goldenShoe.id" from="${prono.Player.list()}" optionKey="id" value="${otherPredictionsInstance?.goldenShoe?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nextPrimeMinister"><g:message code="otherPredictions.nextPrimeMinister.label" default="Next Prime Minister" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'nextPrimeMinister', 'errors')}">
                                    <g:textField name="nextPrimeMinister" value="${otherPredictionsInstance?.nextPrimeMinister}" />
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
