// css.js

function get_css(rule_name,stylesheet,delete_flag){if(!document.styleSheets)return false;rule_name=rule_name.toLowerCase();stylesheet=stylesheet||0;for(var i=stylesheet;i<document.styleSheets.length;i++){var styleSheet=document.styleSheets[i];css_rules=document.styleSheets[i].cssRules||document.styleSheets[i].rules;if(!css_rules)continue;var j=0;do{if(css_rules[j].selectorText.toLowerCase()==rule_name){if(delete_flag==true){if(document.styleSheets[i].removeRule)document.styleSheets[i].removeRule(j);if(document.styleSheets[i].deleteRule)document.styleSheets[i].deleteRule(j);return true;}
else return css_rules[j];}}
while(css_rules[++j]);}
return false;}
function add_css(rule_name,stylesheet){rule_name=rule_name.toLowerCase();stylesheet=stylesheet||0;if(!document.styleSheets||get_css(rule_name,stylesheet))return false;(document.styleSheets[stylesheet].addRule)?document.styleSheets[stylesheet].addRule(rule_name,null,0):document.styleSheets[stylesheet].insertRule(rule_name+' { }',0);return get_css(rule_name);}
function get_sheet_num(href_name){if(!document.styleSheets)return false;for(var i=0;i<document.styleSheets.length;i++){if(document.styleSheets[i].href&&document.styleSheets[i].href.toString().match(href_name))return i;}
return false;}
function remove_css(rule_name,stylesheet){return get_css(rule_name,stylesheet,true);}
function add_sheet(url,media){if(document.createStyleSheet){document.createStyleSheet(url);}
else{var newSS=document.createElement('link');newSS.rel='stylesheet';newSS.type='text/css';newSS.media=media||"all";newSS.href=url;document.getElementsByTagName("head")[0].appendChild(newSS);}}

// jquery.metadata.js

(function($){$.extend({metadata:{defaults:{type:'class',name:'metadata',cre:/({.*})/,single:'metadata'},setType:function(type,name){this.defaults.type=type;this.defaults.name=name;},get:function(elem,opts){var settings=$.extend({},this.defaults,opts);if(!settings.single.length)settings.single='metadata';var data=$.data(elem,settings.single);if(data)return data;data="{}";if(settings.type=="class"){var m=settings.cre.exec(elem.className);if(m)
data=m[1];}else if(settings.type=="elem"){if(!elem.getElementsByTagName)
return undefined;var e=elem.getElementsByTagName(settings.name);if(e.length)
data=$.trim(e[0].innerHTML);}else if(elem.getAttribute!=undefined){var attr=elem.getAttribute(settings.name);if(attr)
data=attr;}
if(data.indexOf('{')<0)
data="{"+data+"}";data=eval("("+data+")");$.data(elem,settings.single,data);return data;}}});$.fn.metadata=function(opts){return $.metadata.get(this[0],opts);};})(jQuery);

// jquery.cookie.js

jQuery.cookie=function(name,value,options){if(typeof value!='undefined'){options=options||{};if(value===null){value='';options.expires=-1;}
var expires='';if(options.expires&&(typeof options.expires=='number'||options.expires.toUTCString)){var date;if(typeof options.expires=='number'){date=new Date();date.setTime(date.getTime()+(options.expires*24*60*60*1000));}else{date=options.expires;}
expires='; expires='+date.toUTCString();}
var path=options.path?'; path='+(options.path):'';var domain=options.domain?'; domain='+(options.domain):'';var secure=options.secure?'; secure':'';document.cookie=[name,'=',encodeURIComponent(value),expires,path,domain,secure].join('');}else{var cookieValue=null;if(document.cookie&&document.cookie!=''){var cookies=document.cookie.split(';');for(var i=0;i<cookies.length;i++){var cookie=jQuery.trim(cookies[i]);if(cookie.substring(0,name.length+1)==(name+'=')){cookieValue=decodeURIComponent(cookie.substring(name.length+1));break;}}}
return cookieValue;}};