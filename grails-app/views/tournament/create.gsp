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
      $("input").change(function() {
        if ($(this).attr("checked") == true) {
          alert('')
          var round = $(this).attr("name")[1]
          var game = $(this).attr("name")[3]
          var newRound = round - 1
          var newGame = Math.ceil(game / 2)
          var teamNum = (1 + parseInt(game)) % 2 + 1
          var otherTeamNum = (teamNum + 1) % 2 + 1
          var selector = "input[name=" + $(this).attr("name").substring(0, 5) + otherTeamNum + "]"
          $(selector).attr('checked', false)
          var divId = newRound + "g" + newGame + "t" + teamNum
          $("#r" + divId).html($("#" + $(this).attr("name")).html())
          var checkBoxId = "input[name=" + divId + "]"
          $(checkBoxId).attr('value', $(this).attr('value'))
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
  <g:form action="save" method="post">
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
          <td align="center" colspan="3" style="border:1px solid #aaa;" bgcolor="#F2F2F2">Finale<br/>
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
          <td align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            1C. <div id='r4g1t1'>${tournamentInstance.groupRounds[2].winner}</div> <input type="checkbox" name="r4g1t1" value="${tournamentInstance.groupRounds[2].winner.id}"/>
          </td>
          <td style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            2D. <div id='r4g1t2'>${tournamentInstance.groupRounds[3].second}</div> <input type="checkbox" name="r4g1t2" value="${tournamentInstance.groupRounds[3].second.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
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
            1A. <div id='r4g2t1'>${tournamentInstance.groupRounds[0].winner}</div> <input type="checkbox" name="r4g2t1" value="${tournamentInstance.groupRounds[0].winner.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            2B. <div id='r4g2t2'>${tournamentInstance.groupRounds[1].second}</div> <input type="checkbox" name="r4g2t2" value="${tournamentInstance.groupRounds[1].second.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
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
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9"><input type="checkbox" name="r3g1t2"/></td>
          <td rowspan="24" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            1G. <div id='r4g3t1'>${tournamentInstance.groupRounds[6].winner}</div> <input type="checkbox" name="r4g3t1" value="${tournamentInstance.groupRounds[6].winner.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            2H. <div id='r4g3t2'>${tournamentInstance.groupRounds[7].second}</div> <input type="checkbox" name="r4g3t2" value="${tournamentInstance.groupRounds[7].second.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td rowspan="6" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
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
            1E. <div id='r4g4t1'>${tournamentInstance.groupRounds[4].winner}</div> <input type="checkbox" name="r4g4t1" value="${tournamentInstance.groupRounds[4].winner.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            2F. <div id='r4g4t2'>${tournamentInstance.groupRounds[5].second}</div> <input type="checkbox" name="r4g4t2" value="${tournamentInstance.groupRounds[5].second.id}"/></td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
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
            1B. <div id='r4g5t1'>${tournamentInstance.groupRounds[1].winner}</div> <input type="checkbox" name="r4g5t1" value="${tournamentInstance.groupRounds[1].winner.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            2A. <div id='r4g5t2'>${tournamentInstance.groupRounds[0].second}</div> <input type="checkbox" name="r4g5t2" value="${tournamentInstance.groupRounds[0].second.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td rowspan="6" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" colspan="3" align="center">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td rowspan="12" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            1D. <div id='r4g6t1'>${tournamentInstance.groupRounds[3].winner}</div> <input type="checkbox" name="r4g6t1" value="${tournamentInstance.groupRounds[3].winner.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            2C. <div id='r4g6t2'>${tournamentInstance.groupRounds[2].second}</div> <input type="checkbox" name="r4g6t2" value="${tournamentInstance.groupRounds[2].second.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td colspan="5"></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" colspan="8" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            1H. <div id='r4g7t1'>${tournamentInstance.groupRounds[7].winner}</div> <input type="checkbox" name="r4g7t1" value="${tournamentInstance.groupRounds[7].winner.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            2G. <div id='r4g7t2'>${tournamentInstance.groupRounds[6].second}</div> <input type="checkbox" name="r4g7t2" value="${tournamentInstance.groupRounds[6].second.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td rowspan="6" align="center" style="border-width:2px 2px 2px 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:0 0 2px 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" colspan="3" align="center">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">&#160;</td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td rowspan="2" align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
          <td rowspan="2" align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            1F. <div id='r4g8t1'>${tournamentInstance.groupRounds[5].winner}</div> <input type="checkbox" name="r4g8t1" value="${tournamentInstance.groupRounds[5].winner.id}"/>
          </td>
          <td rowspan="2" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td rowspan="2" align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
        </tr>
        <tr>
          <td height="7"></td>
        </tr>
        <tr>
          <td height="7"></td>
          <td align="center" bgcolor="#F2F2F2" style="border:1px solid #aaa;">
            2E. <div id='r4g8t2'>${tournamentInstance.groupRounds[4].second}</div> <input type="checkbox" name="r4g8t1" value="${tournamentInstance.groupRounds[4].second.id}"/>
          </td>
          <td style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;&#160;</td>
          <td align="center" style="border:1px solid #aaa;" bgcolor="#F9F9F9">&#160;</td>
          <td align="center" style="border-width:2px 0 0 0; border-style:solid;border-color:black;">&#160;</td>
        </tr>
      </table>

    </div>
    <div class="buttons">
      <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
