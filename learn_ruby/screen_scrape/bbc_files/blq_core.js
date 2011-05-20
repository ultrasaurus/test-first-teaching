// onLoad handler
function addLoadEvent(func)
{
	var oldonload = window.onload;
	if (typeof window.onload != 'function') {window.onload = func;}
	else {window.onload = function() {
		if (oldonload) {oldonload();}
		func();}}
}

// IF&L's LINKTRACK SCRIPT
var LinkTrack = function ()	{
	this.docLinks  = document.links;
	this.location= location.pathname;
}

LinkTrack.prototype.updateHrefs = function () {
	var currlink, hostname, protocol, linktext;
	if (!(!document.getElementsByTagName && document.all)) {
		for (var i=0; i<this.docLinks.length; i++) {
			currlink = this.docLinks[i];
			hostname = currlink.hostname ? currlink.hostname.toLowerCase() : "";
			protocol = currlink.protocol.toLowerCase();
			linktext = currlink.innerText;
			if (protocol == 'http:' && (hostname != 'bbc.co.uk' && hostname.indexOf('.bbc.co.uk') == -1 && hostname.indexOf('doubleclick.net') == -1)) {
				currlink.href = this.getNewUrl(currlink.href);
				if (document.all && currlink.innerText.toLowerCase() == currlink.href.toLowerCase()) currlink.innerText = linktext;
			}
		}
	}
}

LinkTrack.prototype.getNewUrl = function (destination) {
	var newUrl = '/go';
	newUrl += this.location;
	newUrl += (newUrl.substr(newUrl.length-1) == '/')? 'ext/_auto/-/' : '/ext/_auto/-/';
	newUrl += destination;
	return newUrl;
}

var myC = new LinkTrack();
addLoadEvent(function(){myC.updateHrefs();});

// PopUp Opener
function popupWindow(src, features)
{
	var popup = window.open(src.getAttribute('href'), 'BBCPopupWindow', features);
	popup.focus();
	return popup;
}

// ATK JS Object
var DisplayOptions = new function ()
{
	this.DEFAULT	= "00";
	this.HIGH_VIZ	= "01";
	this.SIMPLE		= "02";
	this.NEWS_PRINT	= "03";
	this.SLATE		= "04";
	this.REFLECT	= "05";
	this.REVERSED	= "06";
	this.SOFT_1		= "07";
	this.SOFT_2		= "08";
	this.BLUE_1		= "09";
	this.BLUE_2		= "10";
	this.BLUE_3		= "11";

	this.M2			= "12";
	this.M1			= "11";
	this.P1			= "01";
	this.P2			= "02";
	this.P3			= "03";
	this.P4			= "04";
	this.P5			= "05";
	this.P6			= "06";

	var sizeOrder   = { "12" : 1,
						"11" : 2,
						"00" : 3,
						"01" : 4,
						"02" : 5,
						"03" : 6,
						"04" : 7,
						"05" : 8,
						"06" : 9
					  }

	this.SPACING_1	= "01";
	this.SPACING_2	= "02";
	this.SPACING_3	= "03";

	this.ARIAL		= "01";
	this.VERDANA	= "02";
	this.COURIER	= "03";
	this.TIMES		= "04";

	var linearity	= "00";
	var colours		= "00";
	var font		= "00";
	var size		= "00";
	var spacing		= "00";
	var links		= "00";
	var graphics	= "00";
	var atkValue 	= "a00b00c00d00e00f00g00";

	var isParsed = false;

	function _parseCookie()
	{
		if(!isParsed)
		{
			var allCookies = document.cookie;
			var atkCookie = allCookies.indexOf("ATKoptions");
			if(atkCookie != -1)
			{
				var atkStart = allCookies.indexOf("=", atkCookie);
				var atkEnd = allCookies.indexOf(";", atkStart);
				if (atkEnd == -1) {atkValue = allCookies.substring(atkStart + 1);}
				else {atkValue = allCookies.substring(atkStart + 1, atkEnd);}
				linearity	= _readValue("a");
				colours 	= _readValue("b");
				size		= _readValue("c");
				spacing		= _readValue("d");
				font		= _readValue("e");
				links		= _readValue("f");
				graphics	= _readValue("g");
			}
			isParsed = true;
		}
	}

	function _readValue(id)
	{
		return atkValue.substr(atkValue.indexOf(id) + 1, 2);
	}

	function isLinear()
	{
		_parseCookie();
		return (linearity != this.DEFAULT);
	}
	this.isLinear = isLinear;

	function getColourScheme()
	{
		_parseCookie();
		return colours;
	}
	this.getColourScheme = getColourScheme;

	function getTextSize()
	{
		_parseCookie();
		return size;
	}
	this.getTextSize = getTextSize;

	function compareTextSizeTo(testSize)
	{
		var diff = sizeOrder[size] - sizeOrder[testSize];
		if(diff == 0) return 0;
		else if(isNaN(diff)) return -2;
		else return (Math.abs(diff)/diff);
	}
	this.compareTextSizeTo = compareTextSizeTo;

	function getTextSpacing()
	{
		_parseCookie();
		return spacing;
	}
	this.getTextSpacing = getTextSpacing;

	function getPageFont()
	{
		_parseCookie();
		return font;
	}
	this.getPageFont = getPageFont;

	function isHighlighted()
	{
		_parseCookie();
		return (links != this.DEFAULT);
	}
	this.isHighlighted = isHighlighted;

	function isLowGraphics()
	{
		_parseCookie();
		return (graphics != this.DEFAULT);
	}
	this.isLowGraphics = isLowGraphics;

	function getSettingsValue()
	{
		_parseCookie();
		return atkValue;
	}
	this.getSettingsValue = getSettingsValue;
	this.toString = getSettingsValue;

	function isDefault()
	{
		_parseCookie();
		return (atkValue == "a00b00c00d00e00f00g00");
	}
	this.isDefault = isDefault;
}
