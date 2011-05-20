BBC.adverts.setZone({zones:{
	data:{ads:false, site:"bbccom.live.site.news", zone:"_default",keyValues:{sectn:"news",ctype:"content"},slots:{sponsor_section_news:false} },
		zones:[
			{
				uri:"/home/",
				data:{
					ads:true,
					site: "bbccom.live.site.www",
					zone: "bbc_homepage_int",
					keyValues: {nnsec: "homepage_int",sectn: "nonnews"},
					domValues: {spotlight_title:".featuredToday h3 a",spotlight_title_v3:"#featuredToday_sponsorAd h3 a"},
					slots:{bottom:false,module_a:false, module_b:true, module_c:true, module_h:false, module_k: false, module_n:false, module_v:true}
				}
			},
			{
				uri:"/2/hi",
				data:{
					ads:true,
					zone: "news_homepage_int",
					keyValues:{
						news:"homepage_int",
						adsense_middle:"adsense_middle",
						adsense_mpu:"adsense_mpu"
					},
					slots:{
						sponsor_section:false
					}
				},
				zones:[
					{
						uri:"/default.stm",
						data:{
							ads:true,
							zone: "news_homepage_int",
							keyValues:{
								news:"homepage_int",
								adsense_middle:"adsense_middle",
								adsense_mpu:"adsense_mpu"
							},
							slots:{
								sponsor_section:false
							},
							slotSize:{
								leaderboard: "970x66"
							}
						}
					},
					{
					uri:"/also_in_the_news/",
					data:{ads:true, zone: "news_alsointhenews_content", keyValues:{news:"alsointhenews"}, slots:{} }
					},
					{
					uri:"/africa/",
					data:{ads:true, zone: "news_africa_content", keyValues:{news:"africa"}, slots:{} }
					},
					{
					uri:"/americas/",
					data:{ads: true, zone: "news_america_content", keyValues:{news:"america"}, slots:{} }
					},
					{
					uri:"/americas/obama_inauguration/",
					data:{ads: true, zone: "news_obama_content", keyValues:{news:"obama"}, slots:{} }
					},
					{
					uri:"/americas/us_elections_2008/",
					data:{ads:true, zone: "news_uselection_content", keyValues:{news:"uselection"}, slots:{} }
					},
					{
					uri:"/asia-pacific/",
					data:{ads: true, zone: "news_asiapacific_content", keyValues:{news:"asiapacific"}, slots:{} }
					},
					{
					uri:"/europe/",
					data:{ads: true, zone: "news_europe_content", keyValues:{news:"europe"}, slots:{} }
					},
					{
					uri:"/in_pictures/",
					data:{ads: true, zone: "news_inpictures_content", keyValues:{news:"inpictures"}, slots:{} }
					},
					{
					uri:"/middle_east/",
					data:{ads: true, zone: "news_middleeast_content", keyValues:{news:"middleeast"}, slots:{} }
					},
					{
					uri:"/south_asia/",
					data:{ads: true, zone: "news_southasia_content", keyValues:{news:"southasia"}, slots:{} }
					},
					{
					uri:"/uk_news/",
					data:{ads: true, zone: "news_uk_content", keyValues:{news:"uk"}, slots:{} }
					},
					{
					uri:"/uk_news/education/",
					data:{ads: true, zone: "news_education_content", keyValues:{news:"education"}, slots:{} }
					},
					{
					uri:"/uk_news/magazine/",
					data:{ads: true, zone: "news_magazine_content", keyValues:{news:"magazine"}, slots:{} }
					},
					{
					uri:"/business/",
					data:{ads: true, zone: "news_business_content", keyValues:{news:"business"}, slots:{} }
					},
					{
					uri:"/business/davos/",
					data:{ads: true, zone: "news_davos_content", keyValues:{news:"davos"}, slots:{} }
					},
					{
					uri:"/business/economy/",
					data:{ads: true, zone: "news_economy_content", keyValues:{news:"economy"}, slots:{} }
					},
					{
					uri:"/business/companies/",
					data:{ads: true, zone: "news_companies_content", keyValues:{news:"companies"}, slots:{} }
					},
					{
					uri:"/health/",
					data:{ads: true, zone: "news_health_content", keyValues:{news:"health"}, slots:{} }
					},
					{
					uri:"/health/medical_notes/",
					data:{ads: true, zone: "news_medicalnotes_content", keyValues:{news:"medicalnotes"}, slots:{} }
					},
					{
					uri:"/science/nature/",
					data:{ads: true, zone: "news_science_content", keyValues:{news:"science"}, slots:{} }
					},
					{
					uri:"/science/nature/portal/climate_change/",
					data:{ads: true, zone: "news_sciencenatureportalclimatechange_content", keyValues:{news:"science"}, slots:{} }
					},
					{
					uri:"/technology/",
					data:{ads: true, zone: "news_technology_content", keyValues:{news:"technology"}, slots:{} }
					},
					{
					uri:"/entertainment/",
					data:{ads: true, zone: "news_entertainment_content", keyValues:{news:"entertainment"}, slots:{sponsor_section_news:true} }
					},
					{
					uri:"/entertainment/oscars/",
					data:{ads: true, zone: "news_oscars_content", keyValues:{news:"oscars"}, slots:{} }
					},
					{
					uri:"/entertainment/arts_and_culture/",
					data:{ads: true, zone: "news_artsandculture_content", keyValues:{news:"artsandculture"}, slots:{} }
					},
					{
					uri:"/in_depth/",
					data:{ads:true, zone: "news_indepth_content", keyValues:{news:"indepth"}, slots:{} }
					},
					{
					uri:"/in_depth/americas/2008/vote_usa_2008/",
					data:{ads:true, zone: "news_uselection_content", keyValues:{news:"uselection"}, slots:{} }
					},
					{
					uri:"/in_depth/sci_tech/green_room/",
					data:{ads:true, zone: "news_greenroom_content", keyValues:{news:"greenroom"}, slots:{} }
					},
					{
					uri:"/in_depth/americas/2008/obama_presidency/",
					data:{ads:true, zone: "news_obama_content", keyValues:{news:"obama"}, slots:{} }
					},
					{
					uri:"/in_depth/business/2003/small_business/",
					data:{ads:true, zone: "news_smallbusiness_content", keyValues:{news:"smallbusiness"}, slots:{} }
					},
					{
					uri:"/in_depth/business/2009/davos/",
					data:{ads:true, zone: "news_davos_content", keyValues:{news:"davos"}, slots:{} }
					},
					{
					uri:"/in_depth/business/2010/davos/",
					data:{ads:true, zone: "news_davos_content", keyValues:{news:"davos"}, slots:{} }
					},
					{
					uri:"/in_depth/business/aerospace/",
					data:{ads:true, zone: "news_parisairshow_content", keyValues:{news:"parisairshow"}, slots:{} }
					},
					{
					uri:"/in_depth/entertainment/2009/oscars_2009/",
					data:{ads:true, zone: "news_oscars_content", keyValues:{news:"oscars"}, slots:{} }
					},
					{
					uri:"/in_depth/entertainment/2010/oscars_2010/default.stm",
					data:{ads:true, zone: "news_oscars_index", keyValues:{news:"oscars"}, slots:{} }
					},
					{
					uri:"/in_depth/entertainment/2010/oscars_2010/",
					data:{ads:true, zone: "news_oscars_content", keyValues:{news:"oscars"}, slots:{} }
					},
					{
					uri:"/in_depth/south_asia/2009/indian_election/",
					data:{ads:true, zone: "news_indianelection_default", keyValues:{news:"indiaelection"}, slots:{} }
					},
					{
					uri:"/in_depth/business/africa_business/",
					data:{ads:true, zone: "news_africa_business", keyValues:{news:"africabus"}, slots:{} }
					},
					{
					uri:"/in_depth/business/2007/creditcrunch/",
					data:{ads:true, zone: "news_creditcrunch_content", keyValues:{news:"newscreditcrunchcontent"}, slots:{} }
					},
					{
					uri:"/in_depth/business/2009/business_of_sport/",
					data:{ads:true, zone: "news_businessofsport_content", keyValues:{news:"newsbusinessofsportcontent"}, slots:{} }
					},
					{
					uri:"/in_depth/sci_tech/2009/copenhagen/",
					data:{ads:true, zone: "news_scitechcopenhagen_content", keyValues:{news:"newsscitechcopenhagencontent"}, slots:{} }
					},
					{
					uri:"/in_depth/sci_tech/digital_giants/",
					data:{ads:true, zone: "news_scitechdigitalgiants_content", keyValues:{news:"newsscitechdigitalgiantscontent"}, slots:{} }
					},
					{
					uri:"/programmes/gmt/",
					data:{ads:true, zone: "news_gmt_content", keyValues:{news:"gmt"}, slots:{} }
					},
					{
					uri:"/programmes/the_hub/",
					data:{ads:true, zone: "news_thehub_content", keyValues:{news:"thehub"}, slots:{} }
					},
					{
					uri:"/programmes/impact_asia/",
					data:{ads:true, zone: "news_impactasia_content", keyValues:{news:"impactasia"}, slots:{} }
					},
					{
					uri:"/programmes/world_news_today/",
					data:{ads:true, zone: "news_worldnewstoday_content", keyValues:{news:"worldnewstoday"}, slots:{} }
					},
					{
					uri:"/programmes/business_edition/",
					data:{ads:true, zone: "news_businessedition_content", keyValues:{news:"businessedition"}, slots:{} }
					},
					{
					uri:"/programmes/world_news_america/",
					data:{ads:true, zone: "news_worldnewsamerica_content", keyValues:{news:"worldnewsamerica"}, slots:{} }
					},
					{
					uri:"/programmes/world_news_america/highlights/",
					data:{ads:true, zone: "news_worldnewsamericahighlights_content", keyValues:{news:"worldnewsamericahighlights"}, slots:{} }
					},
					{
					uri:"/programmes/click_online/default.stm",
					data:{
						ads:true,
						zone: "news_click_online",
						keyValues:{news:"click"},
						slots:{},
						styles: {
							'sponsor_section' : {
								style: 'top:19px; left:486px; color:#fff; text-align:left; width:400px;'
							},
							'sponsor_section_text' : {
								style: 'padding:10px; float:left;'
							},
							'sponsor_section_image' : {
								style: 'float:left;'
							}
						}
					}
					},
					{
					uri:"/programmes/hardtalk/",
					data:{
						ads:true,
						zone: "news_hardtalk_content",
						keyValues:{news:"hardtalk"},
						slots:{
							adsense_middle:false,
							adsense_mpu:false
						}
					}
					},
					{
					uri:"/talking_point/",
					data:{ads:true, zone: "news_talkingpoint_content", keyValues:{news:"talkingpoint"}, slots:{} }
					},
					{
					uri:"/8070822",
					data:{ads:true, zone: "news_oneminute_content", keyValues:{news:"newsoneminutecontent"}, slots:{} }
					},
					{
					uri:"/video_and_audio/news_summary/8070822",
					data:{ads:true, zone: "news_oneminute_content", keyValues:{news:"newsoneminutecontent"}, slots:{} }
					},
					{
					uri:"/programmes/real_cities/",
					data:{
                        ads:true, zone: "news_realcities_content",
                        keyValues:{news:"newsrealcitiescontent"},
                        slots:{adsense_mpu:false, adsense_middle:false, storyprintsponsorship:false, sponsor_section_news:false, leaderboard:true, mpu:true, sponsor_section:true},
                        styles: {
                            'sponsor_section' : {
                                style: 'top:35px; left:200px; color:#333; text-align:left; width:400px;'
                            },
                            'sponsor_section_text' : {
                                style: 'padding:10px; float:left;'
                            },
                            'sponsor_section_image' : {
                                style: 'float:left;'
                            }
                        }
                    }
					}
				]
			},

			{
			uri:"/earth/hi",
			data:{ads:true, zone: "earth", keyValues:{news:"earth",adsense_middle:"adsense_middle", adsense_mpu:"adsense_mpu"}, slots:{leaderboard:false,sponsor_section:false}  },
			zones:[
				{
					uri:"/earth_news/",
					data:{ads: true, zone: "news_earth", keyValues:{news:"earth"}, slots:{} }
				}
				]
			},

			{
			uri:"/news",
			data:{ads:false, zone: "_default", keyValues:{news:"marketdata",adsense_middle:"adsense_middle"}, slots:{}  },
			zones:[
				{
					uri:"/business/market_data/overview/",
					data:{ads: false, zone: "news_marketdata_content", keyValues:{news:"marketdata"}, slots:{} }
				},
				{
					uri:"/business/market_data/stockmarket/",
					data:{ads: false, zone: "news_marketdatastockmarket_content", keyValues:{news:"marketdata"}, slots:{} }
				},
				{
					uri:"/business/market_data/shares/",
					data:{ads: false, zone: "news_marketdatashares_content", keyValues:{news:"marketdata"}, slots:{} }
				},
				{
					uri:"/business/market_data/currency/",
					data:{ads: false, zone: "news_marketdatacurrency_content", keyValues:{news:"marketdata"}, slots:{} }
				},
				{
					uri:"/business/market_data/commodities/",
					data:{ads: false, zone: "news_marketdatacommodities_content", keyValues:{news:"marketdata"}, slots:{} }
				},
				{
					uri:"/business/market_data/gilt/",
					data:{ads: false, zone: "news_marketdatagilt_content", keyValues:{news:"marketdata"}, slots:{} }
				},
				{
					uri:"/business/market_data/earnings/",
					data:{ads: false, zone: "news_marketdataearnings_content", keyValues:{news:"marketdata"}, slots:{} }
				}
				]
			},

			{
				uri:"/blogs",
				data:{ads:false, zone: "_default", keyValues:{adsense_middle:"adsense_middle",adsense_mpu:"adsense_mpu",sectn:"blogs"}},
				zones:[
					{
						uri:"/testadverts/",
						data:{ads: true, zone: "test", site: "bbccom.test.site.flash", keyValues:{blogs:"blogs",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/bendirs/",
						data:{ads: true, zone: "blogs_sport_content", keyValues:{blogs:"bendirs",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/chrischarles/",
						data:{ads: true, zone: "blogs_sport_football_content", keyValues:{blogs:"chrischarles",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/ethicalman/",
						data:{ads: true, zone: "blogs_news_science_content", keyValues:{blogs:"ethicalman",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/f1mole/",
						data:{ads: true, zone: "blogs_sport_motorsport_content", keyValues:{blogs:"f1mole",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/gordonfarquhar/",
						data:{ads: true, zone: "blogs_sport_football_content", keyValues:{blogs:"gordonfarquhar",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/magazinemonitor/",
						data:{ads: true, zone: "blogs_sport_motorsport_content", keyValues:{blogs:"magazinemonitor",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/nickrobinson/",
						data:{ads: true, zone: "blogs_news_business_content", keyValues:{blogs:"nickrobinson",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/paulfletcher/",
						data:{ads: true, zone: "blogs_sport_cricket_content", keyValues:{blogs:"paulfletcher",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/philmcnulty/",
						data:{ads: true, zone: "blogs_sport_football_content", keyValues:{blogs:"philmcnulty",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/philminshull/",
						data:{ads: true, zone: "blogs_sport_football_content", keyValues:{blogs:"philminshull",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/photoblog/",
						data:{ads: true, zone: "blogs_news_inpictures_content", keyValues:{blogs:"photoblog",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/robborobson/",
						data:{ads: true, zone: "blogs_sport_football_content", keyValues:{blogs:"robborobson",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/technology/",
						data:{ads: true, zone: "blogs_news_technology_content", keyValues:{blogs:"technology",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/thereporters/franzstrasser/",
						data:{ads: true, zone: "blogs_news_america_content", keyValues:{blogs:"thereportersfranzstrasser",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/thereporters/gavinhewitt/",
						data:{ads: true, zone: "blogs_news_europe_content", keyValues:{blogs:"thereportersgavinhewitt",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/thereporters/jonathanamos/",
						data:{ads: true, zone: "blogs_news_technology_content", keyValues:{blogs:"thereportersjonathanamos",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/thereporters/markeaston/",
						data:{ads: true, zone: "blogs_news_uk_content", keyValues:{blogs:"thereportersmarkeaston",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/thereporters/markmardell/",
						data:{ads: true, zone: "blogs_news_america_content", keyValues:{blogs:"thereportersmarkmardell",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/thereporters/nickbryant/",
						data:{ads: true, zone: "blogs_news_australia_content", keyValues:{blogs:"thereportersnickbryant",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/thereporters/richardblack/",
						data:{ads: true, zone: "blogs_news_science_content", keyValues:{blogs:"thereportersrichardblack",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/thereporters/robertpeston/",
						data:{ads: true, zone: "blogs_news_business_content", keyValues:{blogs:"thereportersrobertpeston",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/thereporters/soutikbiswas/",
						data:{ads: true, zone: "blogs_news_india_content", keyValues:{blogs:"thereporterssoutikbiswas",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/thereporters/stephanieflanders/",
						data:{ads: true, zone: "blogs_news_business_content", keyValues:{blogs:"thereportersstephanieflanders",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/timvickery/",
						data:{ads: true, zone: "blogs_sport_football_content", keyValues:{blogs:"timvickery",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/tomfordyce/",
						data:{ads: true, zone: "blogs_sport", keyValues:{blogs:"tomfordyce",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/simonaustin/",
						data:{ads: true, zone: "blogs_sport", keyValues:{blogs:"simonaustin",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/stevewilson/",
						data:{ads: true, zone: "blogs_sport_football_content", keyValues:{blogs:"stevewilson",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/oliverbrett/",
						data:{ads: true, zone: "blogs_sport_cricket_content", keyValues:{blogs:"oliverbrett",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/mattslater/",
						data:{ads: true, zone: "blogs_sport", keyValues:{blogs:"mattslater",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/chrisbevan/",
						data:{ads: true, zone: "blogs_sport", keyValues:{blogs:"chrisbevan",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/danwalker/",
						data:{ads: true, zone: "blogs_sport_football_content", keyValues:{blogs:"danwalker",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/jakehumphrey/",
						data:{ads: true, zone: "blogs_sport_formulaone_content", keyValues:{blogs:"jakehumphrey",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/sarahholt/",
						data:{ads: true, zone: "blogs_sport_football_content", keyValues:{blogs:"sarahholt",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/jonathanlegard/",
						data:{ads: true, zone: "blogs_sport_formulaone_content", keyValues:{blogs:"jonathanlegard",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/annathompson/",
						data:{ads: true, zone: "blogs_sport", keyValues:{blogs:"annathompson",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/robhodgetts/",
						data:{ads: true, zone: "blogs_sport", keyValues:{blogs:"robhodgetts",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/jonathanoverend/",
						data:{ads: true, zone: "blogs_sport_tennis_content", keyValues:{blogs:"jonathanoverend",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/iaincarter/",
						data:{ads: true, zone: "blogs_sport_golf_content", keyValues:{blogs:"iaincarter",sectn:"blogs"}, slots:{} }
					},
					{
						uri:"/piersedwards/",
						data:{ads: true, zone: "blogs_sport_football_content", keyValues:{blogs:"piersedwards",sectn:"blogs"}, slots:{} }
					}
				]
			},

			{
			uri:"/weather",
			data:{ads: true, zone: "weather_forcast", keyValues:{weather:"forcast", adsense_mpu:"adsense_mpu_weather", adsense_middle:"adsense_middle_weather"}, slots:{leaderboard:true} },
			zones:[
				{
				uri:"/hi/news/",
				data:{ads: true, zone: "weather_news", keyValues:{weather:"news"}, slots:{} }
				},
				{
				uri:"/hi/photogallery/",
				data:{ads: true, zone: "weather_photogallery", keyValues:{weather:"photogallery"}, slots:{} }
				},
				{
				uri:"/hi/weatherwise/",
				data:{ads: true, zone: "weather_weatherwise", keyValues:{weather:"weatherwise"}, slots:{} }
				},
				{
				uri:"/hi/about/",
				data:{ads: true, zone: "weather_about", keyValues:{weather:"about"}, slots:{} }
				},
				{
				uri:"/hi/ukreviews/",
				data:{ads: true, zone: "weather_ukreviews", keyValues:{weather:"ukreviews"}, slots:{} }
				},
				{
				uri:"/hi/ukwarnings/",
				data:{ads: true, zone: "weather_ukwarnings", keyValues:{weather:"weather_ukwarnings"}, slots:{} }
				}
				]
			},

			{
			uri:"/sport2/hi",
			data:{ads:true, zone: "_default", keyValues:{adsense_middle:"adsense_middle",adsense_mpu:"adsense_mpu",sectn:"sport"}},
			zones:[
				{
				uri:"/default.stm",
				data:{
					ads:true,
					zone: "sport_homepage_int",
					keyValues:{
						sport:"homepage_int",
						adsense_middle:"adsense_middle",
						adsense_mpu:"adsense_mpu",
						sectn:"sport"
					},
					slots:{},
					styles: {
						'sponsor_section' : {
							style: ''
						},
						'sponsor_section_text' : {
							style: 'height:auto'
						},
						'sponsor_section_image' : {
							style: ''
						}
					},
					slotSize:{
						leaderboard: "970x66"
					}
				}
				},
				{
				uri:"/archery/",
				data:{ads: true, zone: "sport_archery_content", keyValues:{sport:"archery"}, slots:{} }
				},
				{
				uri:"/athletics/",
				data:{ads: true, zone: "sport_athletics_content", keyValues:{sport:"athletics"}, slots:{} }
				},
				{
				uri:"/fencing/",
				data:{ads: true, zone: "sport_fencing_content", keyValues:{sport:"fencing"}, slots:{} }
				},
				{
				uri:"/football/",
				data:{ads: true, zone: "sport_football_content", keyValues:{sport:"football"}, slots:{} }
				},
				{
				uri:"/football/eng_prem/",
				data:{ads: true, zone: "sport_engprem_content", keyValues:{sport:"engprem"}, slots:{},
						styles: {
							'sponsor_section' : {
								style: 'top:19px; left:320px; color:#fff; text-align:left; width:400px;'
							},
							'sponsor_section_text' : {
								style: 'padding:10px; float:left;'
							},
							'sponsor_section_image' : {
								style: 'float:left;'
							}
						}
					}
				},
				{
				uri:"/football/gossip_and_transfers/",
				data:{ads: true, zone: "sport_gossipandtransfers_content", keyValues:{sport:"gossipandtransfers"}, slots:{} }
				},
				{
				uri:"/football/internationals/",
				data:{ads: true, zone: "sport_footballinternationals_content", keyValues:{sport:"footballinternationals"}, slots:{} }
				},
				{
				uri:"/football/teams/",
				data:{ads: true, zone: "sport_footballteams_content", keyValues:{sport:"footballteams"}, slots:{} }
				},
				{
				uri:"/football/world_cup_2010/",
				data:{ads: true, zone: "sport_footballworldcup_content", keyValues:{sport:"footballworldcup"}, slots:{} }
				},
				{
				uri:"/front_page/",
				data:{ads: true, zone: "sport_frontpage_content", keyValues:{sport:"frontpage"}, slots:{} }
				},
				{
				uri:"/cricket/",
				data:{ads: true, zone: "sport_cricket_content", keyValues:{sport:"cricket"}, slots:{} }
				},
				{
				uri:"/handball/",
				data:{ads: true, zone: "sport_handball_content", keyValues:{sport:"handball"}, slots:{} }
				},
				{
				uri:"/rugby_union/",
				data:{ads: true, zone: "sport_rugby_content", keyValues:{sport:"rugby"}, slots:{} }
				},
				{
				uri:"/rugby_league/",
				data:{ads: true, zone: "sport_rugbyleague_content", keyValues:{sport:"rugbyleague"}, slots:{} }
				},
				{
				uri:"/tennis/",
				data:{ads: true, zone: "sport_tennis_content", keyValues:{sport:"tennis"}, slots:{} }
				},
				{
				uri:"/modernpentathlon/",
				data:{ads: true, zone: "sport_modernpentathlon_content", keyValues:{sport:"modernpentathlon"}, slots:{} }
				},
				{
				uri:"/motorsport/",
				data:{ads: true, zone: "sport_motorsport_content", keyValues:{sport:"motorsport"}, slots:{} }
				},
				{
				uri:"/motorsport/formula_one/",
				data:{ads: true, zone: "sport_formulaone_content", keyValues:{sport:"formulaone"}, slots:{} }
				},
				{
				uri:"/other_sports/snooker/",
				data:{ads: true, zone: "sport_snooker_content", keyValues:{sport:"snooker"}, slots:{} }
				},
				{
				uri:"/other_sports/american_football/",
				data:{ads: true, zone: "sport_americanfootball_content", keyValues:{sport:"americanfootball"}, slots:{} }
				},
				{
				uri:"/other_sports/horse_racing/",
				data:{ads: true, zone: "sport_equestrian_content", keyValues:{sport:"equestrian"}, slots:{} }
				},
				{
				uri:"/other_sports/basketball/",
				data:{ads: true, zone: "sport_basketball_content", keyValues:{sport:"basketball"}, slots:{} }
				},
				{
				uri:"/other_sports/cycling/",
				data:{ads: true, zone: "sport_cycling_content", keyValues:{sport:"cycling"}, slots:{} }
				},
				{
				uri:"/olympics/",
				data:{ads: true, zone: "sport_2008olympics_content", keyValues:{sport:"2008olympics"}, slots:{} }
				},
				{
				uri:"/olympic_games",
				data:{ads: true, zone: "sport_olympics_content", keyValues:{adsense_middle:"adsense_middle",adsense_mpu:"adsense_mpu",sport:"olympics"}, slots:{} },
				zones:[
					{
						uri:"/vancouver_2010/",
						data:{ads: true, zone: "sport_2010olympics_content", keyValues:{sport:"2010olympics"}, slots:{} }
					},
					{
						uri:"/vancouver_2010/8468789.stm",
						data:{ads: true, zone: "sport_olympicsminigame_content", keyValues:{sport:"2010olympics"}, slots:{} }
					},
					{
						uri:"/london_2012/",
						data:{ads: true, zone: "sport_2012olympics_content", keyValues:{sport:"2012olympics"}, slots:{} }
					}
				]
				},
				{
				uri:"/other_sports/sailing/",
				data:{ads: true, zone: "sport_sailing_content", keyValues:{sport:"sailing"}, slots:{} }
				},
				{
				uri:"/golf/",
				data:{ads: true, zone: "sport_golf_content", keyValues:{sport:"golf"}, slots:{} }
				},
				{
				uri:"/northern_ireland/",
				data:{ads: true, zone: "sport_northernireland_content", keyValues:{sport:"northernireland"}, slots:{} }
				},
				{
				uri:"/scotland/",
				data:{ads: true, zone: "sport_scotland_content", keyValues:{sport:"scotland"}, slots:{} }
				},
				{
				uri:"/wales/",
				data:{ads: true, zone: "sport_scotland_content", keyValues:{sport:"wales"}, slots:{} }
				},
				{
				uri:"/volleyball/",
				data:{ads: true, zone: "sport_volleyball_content", keyValues:{sport:"volleyball"}, slots:{} }
				},
				{
				uri:"/wrestling/",
				data:{ads: true, zone: "sport_wrestling_content", keyValues:{sport:"wrestling"}, slots:{} }
				}
				]
			},
			{
				uri:"/sport/",
				data:{ads:true, zone: "_default", keyValues:{adsense_middle:"adsense_middle",adsense_mpu:"adsense_mpu",sectn:"sport"}},
				zones:[
					{
						uri:"winter_olympics/vancouver_2010/",
						data:{ads: true, zone: "sport_2010olympics_content", keyValues:{sport:"2010olympics",sectn:"sport"}, slots:{} }
					}
				]
			},
			{
				uri:"/winterolympics.external.bbc.co.uk/",
				data:{ads: true, zone: "sport_2010olympics_content", keyValues:{sport:"2010olympics",sectn:"sport",adsense_middle:"adsense_middle",adsense_mpu:"adsense_mpu"}, slots:{} }
			}

		]
	},
	process: function(zoneData, domain, path, referrer) {

			if( path.match( /\/$|\/default.stm$/ ) ){
				if(zoneData.keyValues.ctype){
					zoneData.keyValues.ctype = "index";
				}
				if(zoneData.zone){
					zoneData.zone = zoneData.zone.replace(/content$/,"index");
				}
			}

            // Referrer KeyValue
            if (referrer == "") {
                // Non-bbc
                zoneData.keyValues.referrer = "nonbbc";
            } else if((matchArr = referrer.match(/^(http[s]?:\/\/[a-z0-9\.]*bbc\.co\.uk)((?:\/(?:\w|-|\+|\.)+)*)(\/.*)$/)) && zoneData.keyValues) {
                // Within bbc website
                var refString;
                refString = matchArr[2].replace(/\//g,"");
                if(refString.length > 0 && refString.length <= 64) {
                    zoneData.keyValues.referrer = escape(refString);
                } else {
                    zoneData.keyValues.referrer = "";
                }
            } else {
                // Catch exceptions
                zoneData.keyValues.referrer = "nonbbc";
            }

			// Referrer_Domain KeyValue
			var refDomain;
			if ((refDomain = referrer.match(/^(http[s]?:\/\/)([a-z0-9\.]*)((?:\/(?:\w|-|\+|\.)+)*)(\/.*)$/))) {
				zoneData.keyValues.referrer_domain = refDomain[2];
			} else {
				zoneData.keyValues.referrer_domain = "";
			}

			// Retrieve meta data for this zone
			if ((zoneData.meta) && (meta_data = BBC.adverts.getMetaData(zoneData.meta))) {
				for(var key in meta_data) zoneData.keyValues[key] = meta_data[key];
			}

			// Behavioral targeting adserver integration
			var rsi_segs = [];
			var segs_beg=document.cookie.indexOf('rsi_segs=');
			if(segs_beg>=0){
				segs_beg=document.cookie.indexOf('=',segs_beg)+1;
				if(segs_beg>0){
					var segs_end=document.cookie.indexOf(';',segs_beg);
					if(segs_end==-1)segs_end=document.cookie.length;
					rsi_segs=document.cookie.substring(segs_beg,segs_end).split('|');
				}
			}
			var segQS = rsi_segs.length> 0 ? "rsi=" + rsi_segs[0] +";" : "";
			for (var i = 1; i <rsi_segs.length && i <20; i++)
				segQS += ("rsi" + "=" + rsi_segs[i] + ";");


			//add rsi variables to keyValues
			zoneData.keyValues.rsi = segQS.substring(4,segQS.length-1);

			//event sponsorhip  keyvalue
			if(document.getElementsByName('Slug').length != 0){
				zoneData.keyValues.slug = escape(document.getElementsByName('Slug')[0].getAttribute('content').toLowerCase());
			}

			if(document.getElementsByName('Headline').length != 0){
				var headline = document.getElementsByName('Headline')[0].getAttribute('content').toLowerCase();
				headline = headline.split(' ').join('');
				if (headline.indexOf(':') == -1) {
					zoneData.keyValues.headline = escape(headline);
				} else {
					zoneData.keyValues.headline = escape(headline.substr(0,headline.indexOf(':')));
				}
			}

            // Weather location keyValues
            if (typeof(bbccom_weather) !== "undefined") {
                for(var weatherKey in bbccom_weather) {
                    zoneData.keyValues[weatherKey] = escape(bbccom_weather[weatherKey].toLowerCase().replace(/[^a-zA-Z 0-9]/g,''));
                }
            }

			zoneData.slots.bottom = false;
			//zoneData.slots.sponsor_section = false;
			//zoneData.slots.sponsor_section_news = false;


			return zoneData;
	}
});
