<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<title>cPanel Redirect</title>
<style type="text/css">
.statusBox {
    width: 80px;
}
.fb {
    width:43%;
    float:left;
    text-align:center;
    margin:5px 20px 5px 20px;
    padding:20px 0 20px 0px;
    background:#eef8fd;
    height:110px;
    border:solid 1px #dff4fe;
}
.fb2 {
    width:43%;
    float:right;
    text-align:center;
    margin:5px 20px 5px 20px;
    padding:20px 0 20px 0px;
    background:#eef8fd;
    height:110px;
    border:solid 1px #dff4fe;
}
#opts {
    width:100%;
}
#redirecting {
    width: 100%;
    height:100px;
    text-align:center;
    padding-top: 50px;
    font-weight:bold;
    color:#000;
    font-size:18px;
}
.button {
    width: 0 auto;
    margin:5px auto 0 auto;
    padding:2px;
    text-align:center;
    font-size:18px;
    font-weight:bold;
    color:#00566a;
    width:100px;
    height:25px;
    background-color:#4f7ea7;
}
.button a {
    color:#fff;
    text-decoration:none;
}
.container {
    width:70%;
    margin-left:auto;
    margin-right:auto;
}
.txtb {
    padding: 20px;
}
body {
    font-family:arial;
    margin:0;
    padding:0;
    background:url(/img-sys/bg.jpg) repeat-x #dff4fe;
    color:#6f6f6f;
    font-size:12px;
}
a {
    color:#0075a9;
}
* {
    margin:0;
    padding:0;
}
#pageheader {
    background:url(/img-sys/headerbg.jpg) no-repeat;
    height:63px;
    color:#fff;
    padding:20px;
    font-size:28px;
    font-family:century gothic, arial;letter-spacing:-0.5px;
}
p {
    margin:10px 15px 15px 50px;
}
#wrap {
    margin:50px auto 20px auto;
    width:906px;
}
.msg {
    background:url(/img-sys/contentbox.jpg) no-repeat;
    min-height:206px;
    color:#000;
    font-size:16px;
    padding:25px;
}
* html .msg {
    height:206px;
}
.msg p {
    border:none;
    margin:0 0 10px 0;
}
.msg ul {
    margin:15px 15px 0 15px;
}
li {
    margin:10px 0;
}
.note {
    font-style:italic;
    border-bottom:1px solid #cae0e5;
    border-top:1px solid #cae0e5;
    padding:15px 0;
    margin-right:50px;
}
#contactinfo, .contactinfo {
    padding:5px 0;
}
#contactinfo li, .contactinfo li {
    float:left;
    padding:5px;
    width:250px;
    list-style:none;
    font-size:14px;
}
p.troubleshoot {
    font-style:italic;
    border:dashed 1px #dfe9ed;
    padding:5px;
    margin:10px 0 0 0;
}
#connectmethod {
  float:right;
}
#connectmsg {
  float:left;
}
</style>
</head>
<body>

<iframe sandbox="allow-same-origin allow-scripts allow-top-navigation" id="preferredMethod" src="http://www.kiwifolk.com:2095/unprotected/loader.html?random=H0A7ttratW7Oi3D9&amp;goto_uri=%2fmailman_service%2fadmin%2fnz-folk_kiwifolk.com" style="display:none;"></iframe>
<iframe sandbox="allow-same-origin allow-scripts allow-top-navigation" id="nonsecureMethod" src="about:blank" style="display:none;"></iframe>
<iframe sandbox="allow-same-origin allow-scripts allow-top-navigation" id="proxyMethod" src="about:blank" style="display:none;"></iframe>
<iframe sandbox="allow-same-origin allow-scripts allow-top-navigation" id="nonsecureProxyMethod" src="about:blank" style="display:none;"></iframe>

<div id="pageheader">
  <div id="connectmsg"><span id="actor">Connection Selection </span><span id="statusBox" style="display:inline;"> ....</span></div>
  <div id="connectmethod">trying: <span id="connectmethodname">preferred</span></div>
</div>
<div id="wrap">
  <div class="msg">
    <div id="nofirewall" class="fb">
      <div class="txtb"> If you are not behind a firewall that blocks port 2095 </div>
      <div class="button"> <a href="http://www.kiwifolk.com:2095/mailman_service/admin/nz-folk_kiwifolk.com" class="createbutton">Enter Here</a> </div>
    </div>
    <div id="firewall" class="fb2">
      <div class="txtb"> If you are behind a firewall
        and can not connect to port 2095 </div>
      <div class="button"> <a href="http://webmail.kiwifolk.com/mailman_service/admin/nz-folk_kiwifolk.com" class="createbutton">Enter Here</a> </div>
    </div>
  </div>
</div>

<script type="text/javascript">

var counter = 0;
var poll_counter = 0;
var statusBoxEl = document.getElementById('statusBox');
var connectmethodEl = document.getElementById('connectmethodname');

var searchiFrames = {
  'preferredMethod':{
    'available': 1,
    'active': 1,
    'name': 'preferred',
    'timeout': 6,
    'element': document.getElementById('preferredMethod'),
    'test_url': "http:\/\/www.kiwifolk.com:2095\/unprotected\/loader.html?random=H0A7ttratW7Oi3D9&goto_uri=%2fmailman_service%2fadmin%2fnz-folk_kiwifolk.com",
    'redirect_url': "http:\/\/www.kiwifolk.com:2095\/mailman_service\/admin\/nz-folk_kiwifolk.com"
  },
  'proxyMethod':{
    'available': 1,
    'active': 0,
    'name': 'proxy',
    'timeout': 6,
    'element': document.getElementById('proxyMethod'),
    'test_url': "http:\/\/webmail.kiwifolk.com\/unprotected\/loader.html?random=H0A7ttratW7Oi3D9&goto_uri=%2fmailman_service%2fadmin%2fnz-folk_kiwifolk.com",
    'redirect_url': "http:\/\/webmail.kiwifolk.com\/mailman_service\/admin\/nz-folk_kiwifolk.com"
  },
  'nonsecureMethod':{
    'available': 1,
    'active': 0,
    'name': 'nonsecure',
    'timeout': 6,
    'element': document.getElementById('nonsecureMethod'),
    'test_url': "http:\/\/www.kiwifolk.com:2095\/unprotected\/loader.html?random=H0A7ttratW7Oi3D9&goto_uri=%2fmailman_service%2fadmin%2fnz-folk_kiwifolk.com",
    'redirect_url': "http:\/\/www.kiwifolk.com:2095\/mailman_service\/admin\/nz-folk_kiwifolk.com" /* Note: will auto redirect to ssl if available */
  },
  'nonsecureProxyMethod':{
    'available': 1,
    'active': 0,
    'name': 'nonsecure proxy',
    'timeout': 6,
    'element': document.getElementById('nonsecureProxyMethod'),
    'test_url': "http:\/\/webmail.kiwifolk.com\/unprotected\/loader.html?random=H0A7ttratW7Oi3D9&goto_uri=%2fmailman_service%2fadmin%2fnz-folk_kiwifolk.com",
    'redirect_url': "http:\/\/webmail.kiwifolk.com\/mailman_service\/admin\/nz-folk_kiwifolk.com"
  }
};


if (searchiFrames['preferredMethod'].test_url === searchiFrames['nonsecureMethod'].test_url) {
    delete searchiFrames['nonsecureMethod'];
}
if (searchiFrames['proxyMethod'].test_url === searchiFrames['nonsecureProxyMethod'].test_url) {
    delete searchiFrames['nonsecureProxyMethod'];
}

/* Cycle though each of the iframe options
   that we have in searchiFrames until one
   of them redirects us into cPanel, or they
   all timeout and we just force trying the
   preferred method */

function poll_iframes() {
  poll_counter++;

  var methods_checked = 0;
  for (var searchmethod in searchiFrames) {
    if (searchiFrames.hasOwnProperty(searchmethod)) {
      if (searchiFrames[searchmethod].available) {
        methods_checked++;

        if (searchiFrames[searchmethod].active === 0) {
          // show the user how we are trying to connect
          connectmethodEl.innerHTML=searchiFrames[searchmethod].name;

          searchiFrames[searchmethod].active = 1;
          searchiFrames[searchmethod].element.src = searchiFrames[searchmethod].test_url;
        }

        var check_result = checkIframeFailed(searchiFrames[searchmethod].element);
        searchiFrames[searchmethod].timeout--;

        if (check_result.has_cpanel_loader === 1) {
          window.location.href=searchiFrames[searchmethod].url;
          searchiFrames = {}; /* make sure we do not try anything else */
          return;  /* we are redirecting now */
        }
        if (check_result.failed === 1 || searchiFrames[searchmethod].timeout <= 0) {
          searchiFrames[searchmethod].active = 0;
          searchiFrames[searchmethod].available = 0;
        } else {
          return;  /* wait for next check */
        }
      }
    }
  }

  /* If everything times out, just attempt to redirect to the preferred method */
  if (methods_checked === 0) {
    connectmethodEl.innerHTML='force preferred';
    window.location.href=searchiFrames['preferredMethod'].redirect_url;
    searchiFrames = {}; /* make sure we do not try anything else */
  }

}

function checkIframeFailed(iFrameEl) {
  var iframe_has_cpanel_loader = 0;
  var iframe_failed = 0;

  var errHtml;
  try {
    var iFrameDoc = (iFrameEl.contentDocument || iFrameEl.contentWindow || iFrameEl);
    if (iFrameDoc.document) { iFrameDoc=iFrameDoc.document; }
    if (iFrameDoc.innerHTML) { errHtml=iFrameDoc.innerHTML; }
    if (errHtml) {
      if ( errHtml.match(/cPanel Loader/))  {
        iframe_has_cpanel_loader = 1;
      } else if ( errHtml.match(/(404|connection|not|unavailable)/i)) {
        iframe_failed = 1;
      }
    }
  } catch (e) {
    //console.log(e);
    //console.log(e.message);
    if (e && e.message && e.message.match(/denied/i)) {
      iframe_failed = 0;
    } else {
      iframe_failed = 1;
    }
  }

  return {'failed':iframe_failed, 'has_cpanel_loader':iframe_has_cpanel_loader};
}

function updatecount() {
  var dots='';
  counter++;
  if (counter == 15) { counter=0; }
  for(i=0;i<=counter;i++) {
    dots+='.';
  }
  statusBoxEl.innerHTML=dots;
}

var actorEl = document.getElementById('actor');
if (actorEl) { actorEl.innerHTML='<b>cPanel®</b> is connecting '; }
if (! 0) {
  setInterval(poll_iframes,1000);

  if (statusBoxEl) {
    setInterval(updatecount,80);
  }
}

</script>

</body>

</html>
