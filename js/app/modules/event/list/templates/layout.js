window.JST||(window.JST={}),window.JST["event/list/templates/layout"]=function(e){e||(e={});var n,i=[],a=e.safe,t=e.escape;return n=e.safe=function(e){if(e&&e.ecoSafe)return e;("undefined"==typeof e||null==e)&&(e="");var n=new String(e);return n.ecoSafe=!0,n},t||(t=e.escape=function(e){return(""+e).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;")}),function(){(function(){i.push('<div class="ui container">\n  <div id="header-region"></div>\n  <div id="events-region" class="ui centered grid"></div>\n</div>\n')}).call(this)}.call(e),e.safe=a,e.escape=t,i.join("")};