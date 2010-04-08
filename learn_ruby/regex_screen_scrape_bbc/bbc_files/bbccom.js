gloader.load(["glow","1","glow.dom"],{
	onLoad: function(glow){
		BBC.adverts = function () {
			var
			UNDEFINED = "undefined",
			KEY_VALUES = "keyValues",
			EMPTY = "",
			SLASH = "/",
			SEMI = ";",
			EQUALS = "=",
			DISPLAY_NONE = "bbccom_display_none",
			SCRIPT_START = "<script type=\"text/javascript\" src=\"",
			SCRIPT_END = "\"></script>",
			SCRIPT_ROOT = "/js/app/bbccom/",
			SCRIPT_TEST = "bbccom_capable",
			JS = ".js",
			LOCATION = "location",
			DOMAIN = "domain",
			ADS_BLOCKED = true,
			ZONE_VERSION = "zoneVersion",
			ZONE_OVERRIDE = "zoneOverride",
			REFERRER = "zoneReferrer",
			YES = "yes",
			NO = "no",
			ID_START = "bbccom_",
			BBC_ORD = "&ord=",
			DC_BASE = "http://ad.doubleclick.net/adj/",
			DC_BASE_COMPANION = "http://ad.doubleclick.net/pfadx/bbccom.live.site.news/;tile=6;sz=512x288;dcgzip=0",
			DC_PREROLL_BASE = "http://ad.doubleclick.net/pfadx/",
			DC_SLOT = ";slot=",
			DC_SZ = ";sz=",
			DC_TILE = ";tile=",
			DC_ORD = ";ord=",
			DC_END = "?",
			BODY_CLASS_PREFIX = "bbccom_slot_",
			AD_LABEL = "<div class=\"bbccom_text\"><a href=\"http://faq.external.bbc.co.uk/questions/bbc_online/adverts_general\">Advertisement</a></div>",
			AD_INFO = {
				leaderboard: {
					tile: 1,
					size: "728x90,970x66"
				},
				skyscraper: {
					tile: 2,
					size: "120x600,160x600"
				},
				bottom: {
					tile: 3,
					size: "468x60"
				},
				mpu250x250: {
					tile: 4,
					size: "250x250"
				},
				mpu: {
					tile: 4,
					size: "300x250"
				},
				mpu600: {
					tile: 4,
					size: "200x600"
				},
				button: {
					tile: 5,
					size: "120x240"
				},
				companion: {
					tile: 6,
					size: "512x288"
				},
				storyprintsponsorship: {
					tile: 7,
					size: "88x31"
				},
				printableversionsponsorship: {
					tile: 8,
					size: "120x60"
				},
				sponsor_1: {
					tile: 9,
					size: "88x31"
				},
				sponsor_2: {
					tile: 10,
					size: "88x31"
				},
				sponsor_3: {
					tile: 11,
					size: "88x31"
				},
				sponsor_4: {
					tile: 12,
					size: "88x31"
				},
				sponsor_section: {
					tile: 13,
					size: "88x31"
				},
				sponsor_section_news: {
					tile: 13,
					size: "88x31"
				},
				partner_button1: {
					tile: 15,
					size: "120x30"
				},
				partner_button2: {
					tile: 16,
					size: "120x30"
				},
				partner_button3: {
					tile: 17,
					size: "120x30"
				},
				partner_button4: {
					tile: 18,
					size: "120x30"
				},
				partner_button5: {
					tile: 19,
					size: "120x30"
				},
				partner_button6: {
					tile: 20,
					size: "120x30"
				},
				partner_button7: {
					tile: 21,
					size: "120x30"
				},
				partner_button8: {
					tile: 22,
					size: "120x30"
				},
				module			: {tile: 23, size: "88x31"},		// Homepage modules catch-all (module_*)
				module_0004l	: {tile: 24, size: "88x31"},
				module_0000o	: {tile: 25, size: "88x31"},
				module_0000p	: {tile: 26, size: "88x31"},
				module_000zb	: {tile: 27, size: "88x31"},
				module_000yy	: {tile: 28, size: "88x31"},
				module_0000q	: {tile: 29, size: "88x31"},
				module_000kc	: {tile: 30, size: "88x31"},
				module_0000s	: {tile: 31, size: "88x31"},
				module_0005f	: {tile: 32, size: "88x31"},
				module_00094	: {tile: 33, size: "88x31"},
				module_0000u	: {tile: 34, size: "88x31"},
				module_000e6	: {tile: 35, size: "88x31"},
				module_0000y	: {tile: 36, size: "88x31"},
				module_000ks	: {tile: 37, size: "88x31"},
				module_000ji	: {tile: 38, size: "88x31"},
				module_000ip	: {tile: 39, size: "88x31"},
				module_0000x	: {tile: 40, size: "88x31"},
				module_000p1	: {tile: 41, size: "88x31"},
				module_000cm	: {tile: 42, size: "88x31"},
				module_a	: {tile: 6, size: "88x31"},			// Homepage V2
				module_b	: {tile: 7, size: "88x31"},
				module_c	: {tile: 8, size: "88x31"},
				module_d	: {tile: 9, size: "88x31"},
				module_e	: {tile: 10, size: "88x31"},
				module_f	: {tile: 11, size: "88x31"},
				module_g	: {tile: 12, size: "88x31"},
				module_h	: {tile: 13, size: "88x31"},
				module_i	: {tile: 14, size: "88x31"},
				module_j	: {tile: 15, size: "88x31"},
				module_k	: {tile: 16, size: "88x31"},
				module_l	: {tile: 17, size: "88x31"},
				module_m	: {tile: 18, size: "88x31"},
				module_n	: {tile: 19, size: "88x31"},
				module_o	: {tile: 20, size: "88x31"},
				module_p	: {tile: 21, size: "88x31"},
				module_q	: {tile: 22, size: "88x31"},
				module_r	: {tile: 23, size: "88x31"},
				module_s	: {tile: 24, size: "88x31"},
				module_t	: {tile: 25, size: "88x31"},
				module_u	: {tile: 26, size: "88x31"},
				module_v	: {tile: 27, size: "88x31"},
				module_w	: {tile: 28, size: "88x31"},
				module_x	: {tile: 29, size: "88x31"},
				module_y	: {tile: 30, size: "88x31"},
				module_z	: {tile: 31, size: "88x31"}
			};
			var ordLength = 14,
			ord = EMPTY;
			var pageVersion = undefined,
			SITEVERSION = "4";
			var cssPostFix = ["_v4", "_v3_5", "_v3"];
			var mastHeadPresent = false;
			while (ordLength--) ord += (Math.floor(Math.random() * 10));
			var config = {},
			zoneData = {};
			var getCustomKeyValues = function (slot) {
				var customKeyValues = [];
				var len = 0;
				if (zoneData.keyValues) {
					for (var key in zoneData.keyValues) {
						customKeyValues[len] = SEMI;
						customKeyValues[len + 1] = key;
						customKeyValues[len + 2] = EQUALS;
						customKeyValues[len + 3] = zoneData.keyValues[key];
						len += 4;
					}
				}
				if (zoneData.domValues) {
					for (var domKey in zoneData.domValues) {
                        var domValue = glow.dom.get(zoneData.domValues[domKey]);
                        if("undefined" !== typeof(domValue[0])) {
                            customKeyValues[len] = SEMI;
                            customKeyValues[len + 1] = domKey;
                            customKeyValues[len + 2] = EQUALS;
                            customKeyValues[len + 3] = escape(domValue[0].innerHTML.split(' ').join('_'));
                            len += 4;
                        }
					}
				}
				return customKeyValues.join(EMPTY);
			};
			var getAdvertTag = function (slot) {
				var slot_size = getAdvertSize(slot);
				if (slot == "companion") {
					return [DC_PREROLL_BASE, zoneData.site, SLASH, zoneData.zone, getCustomKeyValues(slot), DC_SLOT, slot, DC_SZ, slot_size, DC_TILE, AD_INFO[slot].tile].join(EMPTY);
				} else {
					return [SCRIPT_START, DC_BASE, zoneData.site, SLASH, zoneData.zone, getCustomKeyValues(slot), DC_SLOT, slot, DC_SZ, slot_size, DC_TILE, AD_INFO[slot].tile, DC_ORD, ord, DC_END, SCRIPT_END].join(EMPTY);
				}
			};
			var hide = function (slot) {
				config[slot] = NO;
				document.getElementById(ID_START + slot).className = DISPLAY_NONE;
			};
			var loadTestFile = function () {
				var str = [SCRIPT_START, SCRIPT_ROOT, SCRIPT_TEST, JS, DC_END, ord, SCRIPT_END, ].join(EMPTY);
				document.write(str);
			};
			var loadZonefile = function () {
				var src = config[ZONE_OVERRIDE] === true ? config[ZONE_VERSION] : SCRIPT_ROOT + config[ZONE_VERSION] + JS;
				var str = [SCRIPT_START, src, SCRIPT_END].join(EMPTY);
				document.write(str);
			};
			var getAdvertSize = function (slot) {
				if (!zoneData.slotSize || (typeof(zoneData.slotSize[slot]) == "undefined")) {
					return AD_INFO[slot].size;
				} else {
					return zoneData.slotSize[slot];
				}
			};
			var configure = function (data) {
				for (var id in data) config[id] = data[id];
			};
			return {
				init: function (data) {
					configure(data);
					loadTestFile();
					loadZonefile();
				},
				isCapable: function () {
					ADS_BLOCKED = false;
				},
				setAdsBlocked: function (adsBlocked) {
					ADS_BLOCKED = adsBlocked;
				},
				getConfig: function (key) {
					return config[key];
				},
				getZoneData: function () {
					return zoneData;
				},
				getAdvertTag: function (slot) {
					return getAdvertTag(slot);
				},
				getMetaData: function (zoneMeta) {
					var meta_object, meta_value, meta_data = {};
					for (var i = 0; i < zoneMeta.length; i++) {
						if ((meta_object = window[ID_START + zoneMeta[i]])) {
							for (var key in meta_object) {
								meta_value = escape(meta_object[key].replace(/\s+/g, ''));
								if (meta_value.length > 0 && meta_value.length <= 64) {
									meta_data[zoneMeta[i] + "_" + key] = meta_value;
								}
							}
						}
					}
					return meta_data;
				},
				setZone: function (zones) {
					var url = config[LOCATION];
					var site = config[DOMAIN];
					var referrer = config[REFERRER];
					var data = {
						keyValues: {}
					};
					var process = function (base, level) {
						for (var key in level.data) {
							if (key === KEY_VALUES) {
								for (var kw in level.data.keyValues) {
									data.keyValues[kw] = level.data.keyValues[kw];
								}
							}
							else {
								data[key] = level.data[key];
							}
						}
						if (level.zones) {
							var ct = level.zones.length;
							while (ct--) {
								if (url.indexOf(base + level.zones[ct].uri) !== -1) {
									return process(base + level.zones[ct].uri, level.zones[ct]);
								}
							}
						}
						return data;
					}
					if (site.indexOf('.external.') !== -1) {
						// External eg winterolympics.external.bbc.co.uk
						url = '/'+site+url;
					} else if ((url == '/') || url.indexOf('/internationalhomepage/') !== -1) {
						// V3 Homepage.  Supports live, stage, test, int and sandbox.
						url = '/home/';
					}
					zoneData = zones.process(process(EMPTY, zones.zones), site, url, referrer);
				},
				write: function (slot, showLabel) {
					if (ADS_BLOCKED === false && zoneData.ads) {
                        if((!zoneData.slots || (zoneData.slots[slot] != false)) && config[slot] !== NO) {
							config[slot] = YES;

							glow.dom.get("body").addClass(BODY_CLASS_PREFIX + slot);

							if (showLabel || typeof(showLabel) == "undefined") {
								document.write(AD_LABEL + getAdvertTag(slot));
							} else {
								document.write(getAdvertTag(slot));
							}
						}
						else hide(slot);
					}
					else hide(slot);
				},
				checkWrite: function (slot) {
					if (ADS_BLOCKED === false && zoneData.ads) {
                        if((!zoneData.slots || (zoneData.slots[slot] != false)) && config[slot] !== NO) {
							config[slot] = YES;
							return true;
						}
						else hide(slot);
						return false;
					}
					else hide(slot);
					return false;
				},
				writeAttr: function (elementAttr, elementId) {
					if (ADS_BLOCKED === false && zoneData.ads) {
						if (!zoneData.styles || (typeof(zoneData.styles[elementId]) == "undefined")) {
							return false;
						}
						return zoneData.styles[elementId][elementAttr];
					}
					return false;
				},
				hasStyles: function () {
					if (!zoneData.styles || (typeof(zoneData.styles) == "undefined")) {
						return false;
					}
					return true;
				},
				show: function (slot, companionId, newClass) {
					if (config[slot] === YES) {
						if (mastHeadPresent && pageVersion === SITEVERSION) {
							newClass = slot + cssPostFix[0];
						}
						else if (mastHeadPresent && pageVersion !== SITEVERSION) {
							newClass = slot + cssPostFix[1];
						}
						else {
							newClass = slot + cssPostFix[2];
						}
						var id;
						if (companionId == undefined) {
							id = ID_START + slot;
						} else {
							id = companionId;
						}
						// Remove 'hide' class and append new class
						if('bbccom_visibility_show' != document.getElementById(id).className) {
							document.getElementById(id).className = document.getElementById(id).className.replace(DISPLAY_NONE,'')+' '+newClass;
						} else {
							document.getElementById(id).className = document.getElementById(id).className + ' ' + newClass;
						}
						// v2 Homepage
						var regMatch = slot.match(/^module_([a-z]+)$/);
						if(regMatch && document.getElementById(ID_START + id) != null) {
							document.getElementById(ID_START + id).className = "bbccom_module";
						}
						return true;
					}
					return false;
				},
				close: function (slot) {
					config[slot] = NO;
					glow.dom.get("body").removeClass(BODY_CLASS_PREFIX + slot);

					// Homepage
					var adHideClass;
					switch(slot) {
						case "leaderboard":
							adHideClass = "bbcdotcomAdvertsResetTop";
							break;
						case "bottom":
							adHideClass = "bbcdotcomAdvertsResetBottom";
							break;
						case "mpu":
							adHideClass = "bbcdotcomAdvertsResetMpu";
							break;
						default:
							adHideClass = "";
					}
					glow.dom.get("body").addClass(adHideClass);
				},
				setPageVersion: function (version) {
					mastHeadPresent = true;
					if (version === "4") {
						pageVersion = version;
					}
				},
				empCompanion: function () {
					var prerollURL = getAdvertTag("companion");
					return prerollURL;
				},
				empCompanionResponse: function (src, companionId) {
					if (companionId == undefined) {
						companionId = "bbccom_companion";
					}
					var slot = "companion";
					config[slot] = YES;
					var companionHolderDiv = document.createElement("div");
					companionHolderDiv.setAttribute("class", "comp_banner_holder")
					var companionHolder = document.createElement("iframe");
					companionHolder.setAttribute("width", "300");
					companionHolder.setAttribute("height", "100%");
					companionHolder.setAttribute("align", "left")
					companionHolder.setAttribute("scrolling", "no");
					companionHolder.setAttribute("frameBorder", "no");
					companionHolder.setAttribute("src", src)
					var parentDiv = document.getElementById(companionId);
					parentDiv.className = "bbccom_visibility_show";
					companionHolderDiv.appendChild(companionHolder)
					parentDiv.appendChild(companionHolderDiv);
					var compidarg;
					if (companionId != "bbccom_companion") {
						compidarg = companionId;
					}
					this.show(slot, compidarg);
				},
				setScriptRoot: function(scriptRoot){
					SCRIPT_ROOT = scriptRoot;
				}
			};
		} ();
	}
});
