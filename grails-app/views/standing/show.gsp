<%@ page import="prono.User" %>
<head>
  <meta name="layout" content="main"/>
  <title>User List</title>
</head>

<body>

<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}">Home</a></span>
</div>

<div class="body">
  <h1>De stand</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>
        <g:sortableColumn property="username" title="Naam"/>
        <g:sortableColumn property="points" title="Points"/>
        <th>&nbsp;</th>
      </tr>
      </thead>
      <tbody>
      <g:each in="${personList}" status="i" var="person">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <td>${person.username?.encodeAsHTML()}</td>
          <td>${person.points}</td>
          <td class="actionButtons">
            <span class="actionButton">
              <g:link controller="user" action="show" id="${person.id}">Show</g:link>
            </span>
          </td>
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

  <div class="paginateButtons">
    <g:paginate total="${User.count()}"/>
  </div>

</div>
</body>
