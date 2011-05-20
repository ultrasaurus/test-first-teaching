
document.write("<meta HTTP-EQUIV='expires' CONTENT='0'></meta>");
document.write("<meta HTTP-EQUIV='Pragma' CONTENT='no-cache'></meta>");


var nRequiredVersion = 8;
var bIsRightVersion = false;
var isIE = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
var isWin = (navigator.appVersion.toLowerCase().indexOf("win") != -1) ? true : false;
var isOpera = (navigator.userAgent.indexOf("Opera") != -1) ? true : false;
if(isIE && isWin){
document.writeln('<SCR' + 'IPT LANGUAGE=VBScript\>');
document.writeln('on error resume next');
document.writeln('Set oFlashPlayer = CreateObject("ShockwaveFlash.ShockwaveFlash." & nRequiredVersion)');
document.writeln('If IsObject(oFlashPlayer) Then');
document.writeln('bIsRightVersion = True');
document.writeln('End If');
document.writeln('If (Not bIsRightVersion) And (nRequiredVersion < 3) Then');
document.writeln('Set oFlashPlayer = CreateObject("ShockwaveFlash.ShockwaveFlash")');
document.writeln('If IsObject(oFlashPlayer) Then');
document.writeln('bIsRightVersion = True');
document.writeln('End If');
document.writeln('End If');
document.writeln('</SCR' + 'IPT\>');
}

function detectPluginLAD1268581406793()
{

if (!bIsRightVersion)
{
if (navigator.plugins != null && navigator.plugins.length > 0) {
if (navigator.plugins["Shockwave Flash 2.0"] || navigator.plugins["Shockwave Flash"]) {
var swVer2 = navigator.plugins["Shockwave Flash 2.0"] ? " 2.0" : "";
var flashDescription = navigator.plugins["Shockwave Flash" + swVer2].description;
var descArray = flashDescription.split(" ");
var tempArrayMajor = descArray[2].split(".");
var versionMajor = tempArrayMajor[0];
bIsRightVersion = (versionMajor >= nRequiredVersion);
}
}
else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.6") != -1)
{
bIsRightVersion = (4 >= nRequiredVersion);
}
else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.5") != -1)
{
bIsRightVersion = (3 >= nRequiredVersion);
}
else if (navigator.userAgent.toLowerCase().indexOf("webtv") != -1)
{
bIsRightVersion = (2 >= nRequiredVersion);
}
}


}
detectPluginLAD1268581406793();

var _LAD1268581406793_Instance =
{
  click : "http://ad.doubleclick.net/click%3Bh%3Dv8/396b/3/0/%2a/o%3B222788272%3B0-0%3B0%3B19196799%3B4307-300/250%3B34809817/34827672/1%3B%3B%7Eokv%3D%3Bsectn%3Dnonnews%3Bctype%3Dindex%3Bnnsec%3Dhomepage_int%3Breferrer%3Dnonbbc%3Breferrer_domain%3Dwww.google.com%3Brsi%3DJ08781_10055%3Brsi%3DJ08781_10126%3Brsi%3DJ08781_10139%3Brsi%3DJ08781_10153%3Brsi%3DJ08781_10170%3B%7Esscs%3D%3f",
  clickThruUrl: "http://clk.atdmt.com/go/193850326/direct;wi.300;hi.250;ai.152624606;ct.$num$/01/",
  imgs : []
};

if (!window.armapi_a1_a1)
{
  var armapi_a1_a1 =
  {
    initialize : function(unique_id){},
    click : function(unique_id, num, suffix)
    {
      this.clickTrack(unique_id);
      this.clickThru(unique_id, num, suffix);
    },
    clickTrack : function(unique_id, num)
    {
      var instance = window[unique_id + "_Instance"];
      if (instance.click != "")
      {
        var img = new Image();
        img.src = instance.click + "http://t.atdmt.com";
        instance.imgs.push(img);
      }
    },
    clickThru : function(unique_id, num, suffix) {
      var instance = window[unique_id + "_Instance"];
      var url = instance.clickThruUrl.replace("$num$", num) + suffix;
      window.open(url, "_blank");
    }
  };
}

var armapi_ArmClickType = isIE ? "ext" : "";

var _strContentLAD1268581406793 = '';
if(bIsRightVersion)
{
 	var strFQDN = "HTTP://spe.atdmt.com/ds/LRLDRLADDLAD/";
var index = strFQDN.indexOf("/ds/");
strFQDN = strFQDN.substring(0, index);
_strContentLAD1268581406793 = '' + '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="HTTP://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab" id="idSWFLAD1268581406793" width="300" height="250">'
+ '<param name="movie" value="HTTP://spe.atdmt.com/ds/LRLDRLADDLAD/testim_t1_cta1_300x250.swf?ver=1&clickTag1=!~!click!~!http://clk.atdmt.com/go/193850326/direct;wi.300;hi.250;ai.152624606;ct.1/01&clickTag=!~!click!~!http://clk.atdmt.com/go/193850326/direct;wi.300;hi.250;ai.152624606;ct.1/01" />'
+ '<param name="base" value="HTTP://spe.atdmt.com/ds/LRLDRLADDLAD/" />'
+ '<param name="FlashVars" value="ArmClickType='+ armapi_ArmClickType + '&unique_id=_LAD1268581406793&ArmApi=armapi_a1_a1&ArmClickUrl=http://clk.atdmt.com/go/193850326/direct;wi.300;hi.250;ai.152624606;ct.$num$/01/&ArmClickToken=$num$" />'
+ '<param name="quality" value="high" />'
+ '<param name="salign" value="lt" />'
+ '<param name="loop" value="true" />'
+ '<param name="wmode" value="opaque" />'
+ '<param name="allowScriptAccess" value="always" />'
+ '<embed allowScriptAccess="always" quality="high" salign="LT" loop="true" type="application/x-shockwave-flash" pluginspace="HTTP://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" base="HTTP://spe.atdmt.com/ds/LRLDRLADDLAD/" wmode="opaque" src="HTTP://spe.atdmt.com/ds/LRLDRLADDLAD/testim_t1_cta1_300x250.swf?ver=1&clickTag1=!~!click!~!http://clk.atdmt.com/go/193850326/direct;wi.300;hi.250;ai.152624606;ct.1/01&clickTag=!~!click!~!http://clk.atdmt.com/go/193850326/direct;wi.300;hi.250;ai.152624606;ct.1/01" width="300" height="250" FlashVars="unique_id=_LAD1268581406793&ArmApi=armapi_a1_a1&ArmClickUrl=http://clk.atdmt.com/go/193850326/direct;wi.300;hi.250;ai.152624606;ct.$num$/01/&ArmClickToken=$num$" />'
+ '</object>'
+ '';

if ( "%OOB%" == "1" )
  _strContentLAD1268581406793 = _strContentLAD1268581406793.replace(/!~!click!~!/g,'');
else
  _strContentLAD1268581406793 = _strContentLAD1268581406793.replace(/!~!click!~!/g,'http://ad.doubleclick.net/click%3Bh%3Dv8/396b/3/0/%2a/o%3B222788272%3B0-0%3B0%3B19196799%3B4307-300/250%3B34809817/34827672/1%3B%3B%7Eokv%3D%3Bsectn%3Dnonnews%3Bctype%3Dindex%3Bnnsec%3Dhomepage_int%3Breferrer%3Dnonbbc%3Breferrer_domain%3Dwww.google.com%3Brsi%3DJ08781_10055%3Brsi%3DJ08781_10126%3Brsi%3DJ08781_10139%3Brsi%3DJ08781_10153%3Brsi%3DJ08781_10170%3B%7Esscs%3D%3f');



}
else
{
_strContentLAD1268581406793 = '<a target="_blank" href="http://clk.atdmt.com/go/193850326/direct;wi.300;hi.250;ai.152624606;ct.1/01/" onclick="if(\'http://ad.doubleclick.net/click%3Bh%3Dv8/396b/3/0/%2a/o%3B222788272%3B0-0%3B0%3B19196799%3B4307-300/250%3B34809817/34827672/1%3B%3B%7Eokv%3D%3Bsectn%3Dnonnews%3Bctype%3Dindex%3Bnnsec%3Dhomepage_int%3Breferrer%3Dnonbbc%3Breferrer_domain%3Dwww.google.com%3Brsi%3DJ08781_10055%3Brsi%3DJ08781_10126%3Brsi%3DJ08781_10139%3Brsi%3DJ08781_10153%3Brsi%3DJ08781_10170%3B%7Esscs%3D%3f\')(new Image).src=\'http://ad.doubleclick.net/click%3Bh%3Dv8/396b/3/0/%2a/o%3B222788272%3B0-0%3B0%3B19196799%3B4307-300/250%3B34809817/34827672/1%3B%3B%7Eokv%3D%3Bsectn%3Dnonnews%3Bctype%3Dindex%3Bnnsec%3Dhomepage_int%3Breferrer%3Dnonbbc%3Breferrer_domain%3Dwww.google.com%3Brsi%3DJ08781_10055%3Brsi%3DJ08781_10126%3Brsi%3DJ08781_10139%3Brsi%3DJ08781_10153%3Brsi%3DJ08781_10170%3B%7Esscs%3D%3fhttp://t.atdmt.com\'"><img border="0" src="HTTP://spe.atdmt.com/ds/LRLDRLADDLAD/testim_t1_cta1_300x250.jpg?ver=1" width="300" height="250" /></a>';
}

 document.write(_strContentLAD1268581406793);
