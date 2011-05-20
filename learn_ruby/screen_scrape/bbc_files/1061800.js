
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

function detectPluginLAD1267208107791()
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
detectPluginLAD1267208107791();

var _LAD1267208107791_Instance =
{
  click : "http://ad.doubleclick.net/click%3Bh%3Dv8/396b/3/0/%2a/o%3B222788188%3B0-0%3B0%3B19196799%3B3454-728/90%3B35737056/35754897/1%3B%3B%7Eokv%3D%3Bsectn%3Dnonnews%3Bctype%3Dindex%3Bnnsec%3Dhomepage_int%3Breferrer%3Dnonbbc%3Breferrer_domain%3Dwww.google.com%3Brsi%3DJ08781_10055%3Brsi%3DJ08781_10126%3Brsi%3DJ08781_10139%3Brsi%3DJ08781_10153%3Brsi%3DJ08781_10170%3B%7Esscs%3D%3f",
  clickThruUrl: "http://clk.atdmt.com/go/207961714/direct;wi.728;hi.90;ai.150043771;ct.$num$/01/",
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

var _strContentLAD1267208107791 = '';
if(bIsRightVersion)
{
 	var strFQDN = "HTTP://spe.atdmt.com/ds/LRLDRLADDLAD/";
var index = strFQDN.indexOf("/ds/");
strFQDN = strFQDN.substring(0, index);
_strContentLAD1267208107791 = '' + '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="HTTP://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab" id="idSWFLAD1267208107791" width="728" height="90">'
+ '<param name="movie" value="HTTP://spe.atdmt.com/ds/LRLDRLADDLAD/pump_na_na_728x90.swf?ver=1&clickTag1=!~!click!~!http://clk.atdmt.com/go/207961714/direct;wi.728;hi.90;ai.150043771;ct.1/01&clickTag=!~!click!~!http://clk.atdmt.com/go/207961714/direct;wi.728;hi.90;ai.150043771;ct.1/01" />'
+ '<param name="base" value="HTTP://spe.atdmt.com/ds/LRLDRLADDLAD/" />'
+ '<param name="FlashVars" value="ArmClickType='+ armapi_ArmClickType + '&unique_id=_LAD1267208107791&ArmApi=armapi_a1_a1&ArmClickUrl=http://clk.atdmt.com/go/207961714/direct;wi.728;hi.90;ai.150043771;ct.$num$/01/&ArmClickToken=$num$" />'
+ '<param name="quality" value="high" />'
+ '<param name="salign" value="lt" />'
+ '<param name="loop" value="true" />'
+ '<param name="wmode" value="opaque" />'
+ '<param name="allowScriptAccess" value="always" />'
+ '<embed allowScriptAccess="always" quality="high" salign="LT" loop="true" type="application/x-shockwave-flash" pluginspace="HTTP://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" base="HTTP://spe.atdmt.com/ds/LRLDRLADDLAD/" wmode="opaque" src="HTTP://spe.atdmt.com/ds/LRLDRLADDLAD/pump_na_na_728x90.swf?ver=1&clickTag1=!~!click!~!http://clk.atdmt.com/go/207961714/direct;wi.728;hi.90;ai.150043771;ct.1/01&clickTag=!~!click!~!http://clk.atdmt.com/go/207961714/direct;wi.728;hi.90;ai.150043771;ct.1/01" width="728" height="90" FlashVars="unique_id=_LAD1267208107791&ArmApi=armapi_a1_a1&ArmClickUrl=http://clk.atdmt.com/go/207961714/direct;wi.728;hi.90;ai.150043771;ct.$num$/01/&ArmClickToken=$num$" />'
+ '</object>'
+ '';

if ( "%OOB%" == "1" )
  _strContentLAD1267208107791 = _strContentLAD1267208107791.replace(/!~!click!~!/g,'');
else
  _strContentLAD1267208107791 = _strContentLAD1267208107791.replace(/!~!click!~!/g,'http://ad.doubleclick.net/click%3Bh%3Dv8/396b/3/0/%2a/o%3B222788188%3B0-0%3B0%3B19196799%3B3454-728/90%3B35737056/35754897/1%3B%3B%7Eokv%3D%3Bsectn%3Dnonnews%3Bctype%3Dindex%3Bnnsec%3Dhomepage_int%3Breferrer%3Dnonbbc%3Breferrer_domain%3Dwww.google.com%3Brsi%3DJ08781_10055%3Brsi%3DJ08781_10126%3Brsi%3DJ08781_10139%3Brsi%3DJ08781_10153%3Brsi%3DJ08781_10170%3B%7Esscs%3D%3f');



}
else
{
_strContentLAD1267208107791 = '<a target="_blank" href="http://clk.atdmt.com/go/207961714/direct;wi.728;hi.90;ai.150043771;ct.1/01/" onclick="if(\'http://ad.doubleclick.net/click%3Bh%3Dv8/396b/3/0/%2a/o%3B222788188%3B0-0%3B0%3B19196799%3B3454-728/90%3B35737056/35754897/1%3B%3B%7Eokv%3D%3Bsectn%3Dnonnews%3Bctype%3Dindex%3Bnnsec%3Dhomepage_int%3Breferrer%3Dnonbbc%3Breferrer_domain%3Dwww.google.com%3Brsi%3DJ08781_10055%3Brsi%3DJ08781_10126%3Brsi%3DJ08781_10139%3Brsi%3DJ08781_10153%3Brsi%3DJ08781_10170%3B%7Esscs%3D%3f\')(new Image).src=\'http://ad.doubleclick.net/click%3Bh%3Dv8/396b/3/0/%2a/o%3B222788188%3B0-0%3B0%3B19196799%3B3454-728/90%3B35737056/35754897/1%3B%3B%7Eokv%3D%3Bsectn%3Dnonnews%3Bctype%3Dindex%3Bnnsec%3Dhomepage_int%3Breferrer%3Dnonbbc%3Breferrer_domain%3Dwww.google.com%3Brsi%3DJ08781_10055%3Brsi%3DJ08781_10126%3Brsi%3DJ08781_10139%3Brsi%3DJ08781_10153%3Brsi%3DJ08781_10170%3B%7Esscs%3D%3fhttp://t.atdmt.com\'"><img border="0" src="HTTP://spe.atdmt.com/ds/LRLDRLADDLAD/pump_na_na_728x90.gif?ver=1" width="728" height="90" /></a>';
}

 document.write(_strContentLAD1267208107791);
