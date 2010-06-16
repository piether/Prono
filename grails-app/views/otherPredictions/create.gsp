<%@ page import="prono.OtherPredictions" %>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'otherPredictions.label', default: 'OtherPredictions')}"/>
  <title><g:message code="default.create.label" args="[entityName]"/></title>
  <link rel="stylesheet" href="http://dev.jquery.com/view/trunk/plugins/autocomplete/jquery.autocomplete.css" type="text/css"/>
  <script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/autocomplete/lib/jquery.bgiframe.min.js"></script>
  <script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/autocomplete/lib/jquery.dimensions.js"></script>
  <script type="text/javascript" src="http://dev.jquery.com/view/trunk/plugins/autocomplete/jquery.autocomplete.js"></script>
  <script type="text/javascript">



    $(document).ready(function() {
      var url = "${createLink(controller:'player', action:'youngPlayersAsJson')}"

	$("#byp").autocomplete(url, {
		minChars: 0,
		width: 500,
		matchContains: true,
		autoFill: false,
		scrollHeight: 300,
		scroll: true,
		max: 25,
        datatype: 'json',
        parse: function(data) {
          // alert('parse!')
          var rows = new Array();
          for (var i = 0; i < data.length; i++) {
            // alert(data[i].name)
            rows[i] = { data:data[i], value:data[i].name, result:data[i].name };
          }
          return rows;
        },
		formatItem: function(row, i, max) {
			return row.name;
		},
		formatMatch: function(row, i, max) {
			return "<strong>" + row.name + "</strong>";
		},
		formatResult: function(row) {
			return row.name;
		}
	});
	$("#byp").result(function(event, data, formatted) {
		$("#bestYoungPlayer\\.id").val(data["id"]);
	});

    });
  </script>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.create.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${otherPredictionsInstance}">
    <div class="errors">
      <g:renderErrors bean="${otherPredictionsInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="save" method="post">
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">

          <td valign="top" class="name">
            <label for="byp"><g:message code="otherPredictions.bestYoungPlayer.label" default="Best Young Player"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'bestYoungPlayer', 'errors')}">
            <input type="text" id="byp" size="50" />
            <input type="hidden" id="bestYoungPlayer.id" name="bestYoungPlayer.id" value="" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="goldenBall"><g:message code="otherPredictions.goldenBall.label" default="Golden Ball"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'goldenBall', 'errors')}">
            <g:select name="goldenBall.id" from="${prono.Player.list()}" optionKey="id" value="${otherPredictionsInstance?.goldenBall?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="fairPlayAward"><g:message code="otherPredictions.fairPlayAward.label" default="Fair Play Award"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'fairPlayAward', 'errors')}">
            <g:select name="fairPlayAward.id" from="${prono.Team.list()}" optionKey="id" value="${otherPredictionsInstance?.fairPlayAward?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="bestGoalie"><g:message code="otherPredictions.bestGoalie.label" default="Best Goalie"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'bestGoalie', 'errors')}">
            <g:select name="bestGoalie.id" from="${prono.Player.list()}" optionKey="id" value="${otherPredictionsInstance?.bestGoalie?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="mostEntertainingTeam"><g:message code="otherPredictions.mostEntertainingTeam.label" default="Most Entertaining Team"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'mostEntertainingTeam', 'errors')}">
            <g:select name="mostEntertainingTeam.id" from="${prono.Team.list()}" optionKey="id" value="${otherPredictionsInstance?.mostEntertainingTeam?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="goldenShoe"><g:message code="otherPredictions.goldenShoe.label" default="Golden Shoe"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'goldenShoe', 'errors')}">
            <g:select name="goldenShoe.id" from="${prono.Player.list()}" optionKey="id" value="${otherPredictionsInstance?.goldenShoe?.id}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="nextPrimeMinister"><g:message code="otherPredictions.nextPrimeMinister.label" default="Next Prime Minister"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: otherPredictionsInstance, field: 'nextPrimeMinister', 'errors')}">
            <g:textField name="nextPrimeMinister" value="${otherPredictionsInstance?.nextPrimeMinister}"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
