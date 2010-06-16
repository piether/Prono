<%@ page import="prono.Tournament" %>
<%@ page import="prono.WkReadOnlyService" %>
<%
  def wkService = grailsApplication.classLoader.loadClass('prono.WkReadOnlyService').newInstance()
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'tournament.label', default: 'Tournament')}"/>
  <title><g:message code="default.create.label" args="[entityName]"/></title>

  <script type="text/javascript">
    $(document).ready(function() {
      $("input[name^='r']").change(function() {
        if ($(this).attr("checked") == true) {

          var winningTeam = $(this).attr("name");
          var round = winningTeam[1]
          var game = winningTeam[3]
          var teamNum = winningTeam[5]
          var newRound = round - 1
          var newGame = Math.ceil(game / 2)
          var nextTeamNum = (1 + parseInt(game)) % 2 + 1
          var otherTeamNum = teamNum == 1 ? 2 : 1
          var otherTeamSelector = "input[name=" + winningTeam.substring(0, 5) + otherTeamNum + "]"
          $(otherTeamSelector).attr('checked', false)
          var otherTeamId = $(otherTeamSelector).attr('name')
          $("input[name='loser_" + winningTeam.substring(0, 4) + "']").attr('value', $(otherTeamSelector).attr('value'))
          var divId = "r" + newRound + "g" + newGame + "t" + nextTeamNum
          $("#" + divId).html($("#" + $(this).attr("name")).html())
          var checkBoxId = "input[name='" + divId + "']"
          $(checkBoxId).attr('value', $(this).attr('value'))

          var roundAndGame = $(this).attr("name").substring(0, 4)
          var losingTeamId = $(otherTeamSelector).attr('value')
          $("input[name='loser_" + roundAndGame + "']").attr('value', losingTeamId)
          if (newRound == 1) {
            var consolidationFinalDivId = "r1g2t" + game
            var consolidationFinalCheckboxId = "input[name='" + consolidationFinalDivId + "']"
            $(consolidationFinalCheckboxId).attr('value', losingTeamId)
            $("#" + consolidationFinalDivId).html($("#" + otherTeamId).html())
          }
        }
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
  <g:hasErrors bean="${tournamentInstance}">
    <div class="errors">
      <g:renderErrors bean="${tournamentInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="saveKnockoutRounds" method="post">
    <g:hiddenField name="tournamentInstance.id" value="${tournamentInstance.id}"/>
    <div class="dialog">

      <table border="0" cellpadding="0" cellspacing="0" style="font-size: 90%; margin:1em 2em 1em 1em;">
        <tr>
          <td>&#160;</td>
          <td align="center" colspan="3" style="border:1px solid #aaa;" bgcolor="#F2F2F2">Achtste finales<br/>
          </td>
          <td colspan="2"></td>
          <td align="center" colspan="3" style="border:1px solid #aaa;" bgcolor="#F2F2F2">Kwartfinales<br/>
          </td>
          <td colspan="2"></td>
          <td align="center" colspan="3" style="border:1px solid #aaa;" bgcolor="#F2F2F2">Halve finales<br/>
          </td>
          <td colspan="2"></td>
          <td align="center" colspan="3" style="border:1px solid #aaa;" bgcolor="#F2F2F2">Finale & kleine finale<br/>
          </td>
        </tr>
        <tr>
          <td width="1">&#160;</td>
          <td width="25">&#160;</td>
          <td width="130">&#160;</td>
          <td width="25">&#160;</td>
          <td width="5">&#160;</td>
          <td width="5">&#160;</td>
          <td width="25">&#160;</td>
          <td width="130">&#160;</td>
          <td width="25">&#160;</td>
          <td width="5">&#160;</td>
          <td width="5">&#160;</td>
          <td width="25">&#160;</td>
          <td width="130">&#160;</td>
          <td width="25">&#160;</td>
          <td width="5">&#160;</td>
          <td width="5">&#160;</td>
          <td width="25">&#160;</td>
          <td width="130">&#160;</td>
          <td width="25">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;"></td>
          <td style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g1t1'><g:team team='${tournamentInstance.groupRounds[2].winner}'/></div></td>
          <td align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g1t1" value="${tournamentInstance.groupRounds[2].winner.id}"/></td>
          <td align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">

          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g1t2'><g:team team='${tournamentInstance.groupRounds[3].second}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g1t2" value="${tournamentInstance.groupRounds[3].second.id}"/></td>
          <td rowspan="6" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r3g1t1'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r3g1t1"/></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" colspan="3" align="center">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r3g1t2'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r3g1t2"/></td>
          <td rowspan="12" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g2t1'><g:team team='${tournamentInstance.groupRounds[0].winner}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g2t1" value="${tournamentInstance.groupRounds[0].winner.id}"/></td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g2t2'><g:team team='${tournamentInstance.groupRounds[1].second}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g2t2" value="${tournamentInstance.groupRounds[1].second.id}"/></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td colspan="5"></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r2g1t1'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r2g1t1"/></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" colspan="8" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r2g1t2'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r2g1t2"/></td>
          <td rowspan="24" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g3t1'><g:team team='${tournamentInstance.groupRounds[6].winner}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g3t1" value="${tournamentInstance.groupRounds[6].winner.id}"/></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g3t2'><g:team team='${tournamentInstance.groupRounds[7].second}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g3t2" value="${tournamentInstance.groupRounds[7].second.id}"/></td>
          <td rowspan="6" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r3g2t1'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r3g2t1"/></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" colspan="3" align="center">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r3g2t2'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r3g2t2"/></td>
          <td rowspan="12" align="center" style="border-width:2px 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g4t1'><g:team team='${tournamentInstance.groupRounds[4].winner}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g4t1" value="${tournamentInstance.groupRounds[4].winner.id}"/></td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;"></td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g4t2'><g:team team='${tournamentInstance.groupRounds[5].second}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g4t2" value="${tournamentInstance.groupRounds[5].second.id}"/></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td colspan="10"></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r1g1t1'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r1g1t1"/></td>
        </tr>
        <tr>
          <td rowspan="2"></td>
          <td height="7"></td>
          <td rowspan="2" colspan="12" align="center"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r1g1t2'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r1g1t2"/></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">

          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g5t1'><g:team team='${tournamentInstance.groupRounds[1].winner}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g5t1" value="${tournamentInstance.groupRounds[1].winner.id}"/></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">

          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g5t2'><g:team team='${tournamentInstance.groupRounds[0].second}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g5t2" value="${tournamentInstance.groupRounds[0].second.id}"/></td>
          <td rowspan="6" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r3g3t1'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r3g3t1"/></td>
          <!-- bijgekomen -->
          <td colspan="6">&#160;&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F2F2F2">&#160;&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r1g2t1'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r1g2t1"/></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" colspan="3" align="center">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r3g3t2'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r3g3t2"/></td>
          <td rowspan="12" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
          <!-- bijgekomen -->
          <td colspan="6">&#160;&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F2F2F2">&#160;&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r1g2t2'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r1g2t2"/></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g6t1'><g:team team='${tournamentInstance.groupRounds[3].winner}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g6t1" value="${tournamentInstance.groupRounds[3].winner.id}"/></td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">

          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g6t2'><g:team team='${tournamentInstance.groupRounds[2].second}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g6t2" value="${tournamentInstance.groupRounds[2].second.id}"/></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td colspan="5"></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r2g2t1'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r2g2t1"/></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" colspan="8" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r2g2t2'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r2g2t2"/></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g7t1'><g:team team='${tournamentInstance.groupRounds[7].winner}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g7t1" value="${tournamentInstance.groupRounds[7].winner.id}"/></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g7t2'><g:team team='${tournamentInstance.groupRounds[6].second}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g7t2" value="${tournamentInstance.groupRounds[6].second.id}"/></td>
          <td rowspan="6" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r3g4t1'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r3g4t1"/></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" colspan="3" align="center">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r3g4t2'/></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r3g4t2"/></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">

          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g8t1'><g:team team='${tournamentInstance.groupRounds[5].winner}'/></div></td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g8t1" value="${tournamentInstance.groupRounds[5].winner.id}"/></td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">

          </td>
          <td style="border:1px solid #aaa;" bgcolor="#F9F9F9"><div id='r4g8t2'><g:team team='${tournamentInstance.groupRounds[4].second}'/></div></td>
          <td align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r4g8t2" value="${tournamentInstance.groupRounds[4].second.id}"/></td>
          <td align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
      </table>

      <input type='hidden' name='loser_r4g1'/>
      <input type='hidden' name='loser_r4g2'/>
      <input type='hidden' name='loser_r4g3'/>
      <input type='hidden' name='loser_r4g4'/>
      <input type='hidden' name='loser_r4g5'/>
      <input type='hidden' name='loser_r4g6'/>
      <input type='hidden' name='loser_r4g7'/>
      <input type='hidden' name='loser_r4g8'/>

      <input type='hidden' name='loser_r3g1'/>
      <input type='hidden' name='loser_r3g2'/>
      <input type='hidden' name='loser_r3g3'/>
      <input type='hidden' name='loser_r3g4'/>

      <input type='hidden' name='loser_r2g1'/>
      <input type='hidden' name='loser_r2g2'/>

      <input type='hidden' name='loser_r1g1'/>
      <input type='hidden' name='loser_r1g2'/>

    </div>
    <div class="buttons">
      <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
    </div>

  </g:form>
</div>
</body>
</html>
