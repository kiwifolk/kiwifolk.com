
<html> <head>
  <title>NZ-Folk Administrator Authentication</title>
<script>function sf(){document.f.adminpw.focus();}</script> </head>
<body bgcolor="#ffffff" onLoad="sf()"> <FORM METHOD=POST
ACTION="/mailman/admin/nz-folk_kiwifolk.com" name="f">

  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="4" CELLPADDING="5">
    <TR>
      <TD COLSPAN="2" WIDTH="100%" BGCOLOR="#99CCFF" ALIGN="CENTER">
	<B><FONT COLOR="#000000" SIZE="+1">NZ-Folk Administrator
	    Authentication</FONT></B>
      </TD>
    </TR>
    <tr>
      <td colspan="2"><b>If you have mailman Administrator
access:</b></td>
    </tr>
    <tr>
      <TD><div ALIGN="Right">List Administrator Password:</div></TD>
      <TD>
          <INPUT TYPE="password" NAME="adminpw" SIZE="30">
          <INPUT type="SUBMIT" name="admlogin" value="Let me in...">
      </TD>
    </tr>
    <tr>
      <td colspan="2"><b>If you have been delegated access and have a
username and password:</b></td>
    </tr>
    <tr>
      <td align="right">cPanel Webmail Access</td>
      <td><a
href="/webmail/mailman_service/admin/nz-folk_kiwifolk.com">Login
here</a></td>
    </tr>
  </TABLE>
      <p><strong><em>Important:</em></strong> From this point on, you
      must have cookies enabled in your browser, otherwise no
      administrative changes will take effect.

      <p>Session cookies are used in Mailman's
      administrative interface so that you don't need to
      re-authenticate with every administrative operation.  This
      cookie will expire automatically when you exit your browser, or
      you can explicitly expire the cookie by hitting the
      <em>Logout</em> link under <em>Other Administrative
      Activities</em> (which you'll see once you successfully log in).
</FORM> </body> </html>

<hr><address><a href="../listinfo/nz-folk_kiwifolk.com">NZ-Folk</a> list run by <a href="mailto:nz-folk-owner@kiwifolk.com">mikem at kiwifolk.com</a><br><a href="../admin/nz-folk_kiwifolk.com">NZ-Folk administrative interface</a> (requires authorization)<br><a href="../listinfo">Overview of all kiwifolk.com mailing lists</a><p>
<table WIDTH="100%" BORDER="0">
  <tr>
    <td><img src="/img-sys/mailman.jpg" alt="Delivered by Mailman" border=0><br>version 2.1.20</td>
    <td><img src="/img-sys/PythonPowered.png" alt="Python Powered" border=0></td>
    <td><img src="/img-sys/gnu-head-tiny.jpg" alt="GNU's Not Unix" border=0></td>
  </tr>
</table>
</address>
