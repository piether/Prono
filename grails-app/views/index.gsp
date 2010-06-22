<html>
<head>
  <title>HET SYSTEEM</title>
  <meta name="layout" content="main"/>
  <style type="text/css" media="screen">

  #nav {
    margin-top: 20px;
    margin-left: 30px;
    width: 228px;
    float: left;

  }

  .homePagePanel * {
    margin: 0px;
  }

  .homePagePanel .panelBody ul {
    list-style-type: none;
    margin-bottom: 10px;
  }

  .homePagePanel .panelBody h1 {
    text-transform: uppercase;
    font-size: 1.1em;
    margin-bottom: 10px;
  }

  .homePagePanel .panelBody {
    background: url(images/leftnav_midstretch.png) repeat-y top;
    margin: 0px;
    padding: 15px;
  }

  .homePagePanel .panelBtm {
    background: url(images/leftnav_btm.png) no-repeat top;
    height: 20px;
    margin: 0px;
  }

  .homePagePanel .panelTop {
    background: url(images/leftnav_top.png) no-repeat top;
    height: 11px;
    margin: 0px;
  }

  h2 {
    margin-top: 15px;
    margin-bottom: 15px;
    font-size: 1.2em;
  }

  #pageBody {
    margin-left: 280px;
    margin-right: 20px;
  }
  </style>
</head>
<body>

<div style="margin-left: 10px">
  <h1>HET SYSTEEM</h1>

  <ul>
    <li>2de ronde
      <ul>
        <li>
          juiste ploeg op de juiste plaats: 3 punten
        </li>
        <li>
          juiste ploeg door maar op de foute plaats: 2 punten
        </li>
      </ul></li>
    <li>juiste ploeg in de kwartfinale (plaats heeft gn belang): 4 punten</li>
    <li>juiste ploeg in de halve finale: 5 punten</li>
    <li>juiste ploeg in de finale: 6 punten</li>
    <li>juiste ploeg in de troostfinale: 3 punten</li>
    <li>Wereldkampioen: 8 punten</li>
  </ul>
  <br/>
  <ul>
    <li>Hyundai Best Young Player: 4 punten</li>
    <li>Adidas Golden Ball: 4 punten (beste speler)</li>
    <li>Adidas Golden Shoe: 4 punten (topschutter)</li>
    <li>Yashin Award for Best Goal Keeper: 4 punten</li>
    <li>FIFA Fair Play Award: 0 punten</li>
    <li>FIFA Award for most entertaining team: 0 punten</li>
    <li>Volgende premier van België: 0 punten</li>
  </ul>

  <br/>

  <g:ifAllGranted role="ROLE_USER">
    <g:link controller="tournament" action="create">Maak je prono aan!</g:link>
  </g:ifAllGranted>

  <g:link controller="standing" action="index">De stand</g:link>

  <g:ifAllGranted role="ROLE_ADMIN">
    <div id="controllerList" class="dialog">
      <h2>Available Controllers:</h2>
      <ul>
        <g:each var="c" in="${grailsApplication.controllerClasses}">
          <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
        </g:each>
      </ul>
    </div>
  </g:ifAllGranted>

  <div style='padding-top:10px'>
    <iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fpiether.s43.eatj.com%2FProno-0.1%2F&amp;layout=standard&amp;show_faces=true&amp;width=450&amp;action=like&amp;colorscheme=light&amp;height=80" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:80px;" allowTransparency="true"></iframe>
  </div>
</div>
</body>
</html>