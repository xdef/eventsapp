define(["backbone","backbone.stickit","pikaday","moment"],function(){var e,t;return t=require("moment"),e=require("pikaday"),Backbone.Stickit.addHandler({selector:"input.datepicker",initialize:function(n,a,i){var r,o,d;return d=_.extend({},i.defaultOptions,{theme:"semantic_ui",field:n[0],format:"LL",firstDay:1,container:n.parents("div")[0],bound:!0,i18n:{months:t.months(),weekdays:t.weekdays(),weekdaysShort:t.weekdaysShort()}}),d.setDefaultDate&&d.defaultDate&&(o=t(d.defaultDate).toISOString(),r=i.observe,a.set(r,o)),this.pikaday=new e(d)},onSet:function(e,n){return t(e,"LL").toISOString()},onGet:function(e,n){return t(e).format("LL")},destroy:function(e,t,n){return this.pikaday.destroy()}})});