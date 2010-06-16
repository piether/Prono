<html>
<head>
  <title><g:layoutTitle default="Grails"/></title>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
  <g:javascript library="jquery"/>
  <g:layoutHead/>
  <g:javascript library="application"/>

</head>
<body>
<div id="spinner" class="spinner" style="display:none;">
  <img src="${resource(dir: 'images', file: 'spinner.gif')}" alt="Spinner"/>
</div>
<div id="loginInfo">
  <g:isNotLoggedIn>
    <g:link url="login" absolute='true'>Login</g:link>
  </g:isNotLoggedIn>
  <g:isLoggedIn>
    Ingelogd als <g:loggedInUserInfo field="username"/>
    <g:link controller="logout">Logout</g:link>
    <g:link url='logout' absolute='true'>Logout</g:link>
  </g:isLoggedIn>
</div>
<div id="grailsLogo" class="logo">
  <a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails" border="0"/></a>
</div>
<g:layoutBody/>
</body>
</html>
