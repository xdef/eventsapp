var extend=function(e,t){function r(){this.constructor=e}for(var o in t)hasProp.call(t,o)&&(e[o]=t[o]);return r.prototype=t.prototype,e.prototype=new r,e.__super__=t.prototype,e},hasProp={}.hasOwnProperty;define(["app/app","base.views","bindings.datepicker","./templates/layout","./templates/header","./templates/form"],function(){var e,t;return e=require("app/app"),t=require("base.views"),e.module("Event.New",function(e,r,o,n,p,a){return e.Layout=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return extend(t,e),t.prototype.template="event/new/templates/layout",t.prototype.className="page-layout",t.prototype.regions={header:"#header-region",form:"#form-region"},t}(t.LayoutView),e.Header=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return extend(t,e),t.prototype.template="event/new/templates/header",t.prototype.className="ui basic segment",t}(t.ItemView),e.Form=function(e){function t(){return t.__super__.constructor.apply(this,arguments)}return extend(t,e),t.prototype.template="event/new/templates/form",t.prototype.tagName="form",t.prototype.className="ui form",t.prototype.bindings={"[name=start_date]":{observe:"start_date"},"[name=title]":{observe:"title"},"[name=description]":{observe:"description"}},t.prototype.triggers={submit:"submit"},t}(t.ItemView)})});