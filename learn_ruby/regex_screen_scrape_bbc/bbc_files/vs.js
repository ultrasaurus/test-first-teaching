var _JT=new Object();
_JT.protocol=location.protocol;//override "https:"
_JT.v="JT01.02";
_JT.nspace="pt";
_JT.log="1";

//assign site code values
_JT.site=new Array();
_JT.site['sensor']='visualscience.external.bbc.co.uk/zaguk.gif';
_JT.site['lt']=1;

//DO NOT EDIT BELOW
_JT.ES=function(a){return (_JT.D(encodeURI))?encodeURI(a):escape(a)}
_JT.NA=function(){return new Array()};_JT.D=function(v){return(typeof v!="undefined")?1:0};_JT.L=function(a){return _JT.D(a)?a.length:0};
_JT.I=function(a,b,c){return a.indexOf(b,c?c:0)};_JT.S=function(a,b,c){return b>_JT.L(a)?"":a.substring(b,c!=null?c:_JT.L(a))};
_JT.Q=function(a,b){if(_JT.hf==1)_JT.hf=0;else{a+="&vid="+Math.random();b=_JT.ii;if(b>=_JT.im)_JT.ii=0;_JT.ia[b]="";
_JT.ia[b]=new Image();a=(a.split('+')).join('%2B');_JT.ia[b].src=a;_JT.last=a;_JT.ii++}};
_JT.EL=function(a,b,c,d){if(a.addEventListener){a.addEventListener(b,c,false)}else if(a.attachEvent){a.attachEvent(((d==1)?"":"on")+b,c)}};
_JT.EI=function(a,b,c){if(typeof eval("window._JTOn"+a)=="function")eval("window._JTOn"+a+"(b)")};
_JT.LT=function(e){if((e.which&&e.which==1)||(e.button&&e.button==1)){var a=document.all?window.event.srcElement:this;var x='',y='';
if(e.pageX||e.pageY){x=e.pageX;y=e.pageY}else if(e.clientX||e.clientY){x=e.clientX+document.body.scrollLeft+document.documentElement.scrollLeft;
y=e.clientY+document.body.scrollTop+document.documentElement.scrollTop}_JT.SET('lidx',x);_JT.SET('lidy',y);
if(a.tagName&&a.tagName.toLowerCase()=="a"){_JT.SET("lid",a.href);_JT.SET("ev","link");_JT.SEND("Link",a)}}};
_JT.SET=function(a,b,c){_JT.da[a]=(c==0)?b:_JT.ES(b)};_JT.SEND=function(a,b){if(_JT.D(a))_JT.EI(a,b);a="";try{_JT.SET('hpCookie',Homepage.VSGet())}catch(e){};for(var i in _JT.da){
if(typeof _JT.da[i]!="function"){a+="&"+i+"=";a+=_JT.da[i]}}_JT.Q(_JT.rq+a);_JT.da=_JT.NA()};_JT.HALT=function(){_JT.hf=1}
_JT.P=function(v,n,s,r){v=11;n=navigator;s=screen;r=_JT.NA();_JT.SET("t",document.title);_JT.SET("r",eval("document"+".ref"+"errer"));
_JT.SET("l",(n.userLanguage)?n.userLanguage:(n.language)?n.language:"");if(window.screen){v=12;_JT.SET("ss",s.width+"*"+s.height);
_JT.SET("sc",(s.colorDepth)?s.colorDepth:s.pixelDepth)}if(r.toSource||(_JT.I(n.appName,"Microsoft")>-1&&r.shift))v=13;
eval("try{throw v=14}catch(e){}");if((new Date()).toDateString)v=15;if(r.every)v=16;_JT.SET("jv",v);if(document.body&&document.body.addBehavior){
eval("try{document.body.addBehavior('#default#clientCaps');_JT.SET('ct',document.body.connectionType)}catch(e){}");
eval("try{document.body.addBehavior('#default#homePage');_JT.SET('hp',document.body.isHomePage(location.href)?'y':'n')}catch(e){}")}};
_JT.hf=0;_JT.ii=0;_JT.im=10;_JT.ia=_JT.NA();for(var i=0;i<_JT.im;i++){_JT.ia[i]=new Image()};_JT.da=_JT.NA();_JT.vs=eval("window."+_JT.nspace);
_JT.vs=(_JT.D(_JT.vs))?_JT.vs:new Object();if(_JT.D(_JT.site))for(var i in _JT.site){if(_JT.D(_JT.vs[i])==0)_JT.vs[i]=_JT.site[i]};
if(typeof _JT.vs=="object"){if(_JT.D('Init'))_JT.EI('Init');for(var i in _JT.vs){if(typeof _JT.vs[i]!='function'&&i!='sensor')_JT.da[i]=_JT.ES(_JT.vs[i])}
_JT.rq=_JT.protocol+"//"+_JT.vs['sensor']+"?Log="+_JT.log+"&v="+_JT.v;if(_JT.vs['lt']&&_JT.vs['lt']=="1"){_JT.t1=document.links;_JT.t2=0;
for(_JT.t2=0;_JT.t2<_JT.L(_JT.t1);_JT.t2++)_JT.EL(_JT.t1[_JT.t2],'mousedown',_JT.LT)}_JT.P();_JT.SEND("PageView");_JT.EI("PostPageView",_JT.last)}