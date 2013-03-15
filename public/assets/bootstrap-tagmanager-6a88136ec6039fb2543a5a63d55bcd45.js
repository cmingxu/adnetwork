/* ===================================================
 * bootstrap-tagmanager.js v2.3
 * http://welldonethings.com/tags/manager
 * ===================================================
 * Copyright 2012 Max Favilli
 *
 * Licensed under the Mozilla Public License, Version 2.0 You may not use this work except in compliance with the License.
 *
 * http://www.mozilla.org/MPL/2.0/
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */
"use strict";(function(e){if(typeof console=="undefined"||typeof console.log=="undefined")console={},console.log=function(){};e.fn.tagsManager=function(t,n){var r={prefilled:null,CapitalizeFirstLetter:!1,preventSubmitOnEnter:!0,isClearInputOnEsc:!0,typeahead:!1,typeaheadAjaxSource:null,typeaheadAjaxPolling:!1,typeaheadOverrides:null,typeaheadSource:null,AjaxPush:null,delimeters:[44,188,13,9],backspace:[8],maxTags:0,hiddenTagListName:null,hiddenTagListId:null,deleteTagsOnBackspace:!0,tagsContainer:null,tagCloseIcon:"x",tagClass:"",validator:null},i=function(){function t(){this.instanceSelectHandler=null,this.selectedClass="selected",this.select=null,"typeahead"in e.fn&&(this.instanceSelectHandler=e.fn.typeahead.Constructor.prototype.select,this.select=function(e){this.$menu.find(".active").addClass(e.selectedClass),e.instanceSelectHandler.apply(this,arguments)})}return t}();if(0 in this){r.typeaheadOverrides=new i,e.extend(r,t),r.hiddenTagListName===null&&(r.hiddenTagListName="hidden-"+this.attr("name"));var s=this,o=s.attr("name").replace(/[^\w]/g,"_"),u="",a=r.delimeters,f=r.backspace,l=function(){if(!s.typeahead)return;r.typeaheadSource!=null&&e.isFunction(r.typeaheadSource)?s.typeahead({source:r.typeaheadSource}):r.typeaheadSource!=null?(s.typeahead(),h(r.typeaheadSource)):r.typeaheadAjaxSource!=null?r.typeaheadAjaxPolling?r.typeaheadAjaxPolling&&s.typeahead({source:p}):(s.typeahead(),typeof r.typeaheadAjaxSource=="string"&&e.ajax({cache:!1,type:"POST",contentType:"application/json",dataType:"json",url:r.typeaheadAjaxSource,data:JSON.stringify({typeahead:""}),success:function(e){c(e,!0)}})):r.typeaheadDelegate&&s.typeahead(r.typeaheadDelegate);var t=s.data("typeahead");t&&(t.select=e.proxy(r.typeaheadOverrides.select,s.data("typeahead"),r.typeaheadOverrides))},c=function(t,n,r){"d"in t&&(t=t.d);if(t&&t.tags){var i=[];i.length=0,e.each(t.tags,function(e,t){i.push(t.tag),n&&h(i)}),e.isFunction(r)&&r(i)}},h=function(e){s.data("active",!0),s.data("typeahead").source=e,s.data("active",!1)},p=function(t,n){typeof r.typeaheadAjaxSource=="string"&&e.ajax({cache:!1,type:"POST",contentType:"application/json",dataType:"json",url:r.typeaheadAjaxSource,data:JSON.stringify({typeahead:t}),success:function(e){c(e,!1,n)}})},d=function(t){var n=e.trim(t),r=n.length,i=0;for(var s=r-1;s>=0;s--){if(-1==e.inArray(n.charCodeAt(s),a))break;i++}n=n.substring(0,r-i),r=n.length,i=0;for(var s=0;s<r;s++){if(-1==e.inArray(n.charCodeAt(s),a))break;i++}return n=n.substring(i,r),n},v=function(){var t=s.data("tlis"),n=s.data("tlid");if(n.length>0){var r=n.pop();t.pop(),e("#"+o+"_"+r).remove(),g()}},m=function(){var t=s.data("tlis"),n=s.data("tlid");while(n.length>0){var r=n.pop();t.pop(),e("#"+o+"_"+r).remove(),g()}},g=function(){var t=s.data("tlis"),n=s.data("lhiddenTagList");if(n==undefined)return;e(n).val(t.join(",")).change()},y=function(t){var n=s.data("tlis"),i=s.data("tlid"),u=e.inArray(t,i);-1!=u&&(e("#"+o+"_"+t).remove(),n.splice(u,1),i.splice(u,1),g()),r.maxTags>0&&n.length<r.maxTags&&s.show()},b=function(t,n,i){if(!t||!i||t.length<=0)return;r.CapitalizeFirstLetter&&t.length>1&&(t=t.charAt(0).toUpperCase()+t.slice(1).toLowerCase());if(e.isFunction(r.validator)&&!r.validator(t))return;var u=s.data("tlis"),a=s.data("tlid");if(r.maxTags>0&&u.length>=r.maxTags)return;var f=!1,l=u.map(function(e){return e.toLowerCase()}),c=e.inArray(t.toLowerCase(),l);-1!=c&&(f=!0);if(f){var h=a[c];e("#"+o+"_"+h).stop().animate({backgroundColor:r.blinkBGColor_1},100).animate({backgroundColor:r.blinkBGColor_2},100).animate({backgroundColor:r.blinkBGColor_1},100).animate({backgroundColor:r.blinkBGColor_2},100).animate({backgroundColor:r.blinkBGColor_1},100).animate({backgroundColor:r.blinkBGColor_2},100)}else{var p=Math.max.apply(null,a);p=p==-Infinity?0:p;var d=++p;u.push(t),a.push(d),r.AjaxPush!=null&&e.post(r.AjaxPush,{tag:t});var v=o+"_"+d,m=o+"_Remover_"+d,b="",w=r.tagClass?" "+r.tagClass:"";b+='<span class="myTag'+w+'" id="'+v+'"><span>'+t+'&nbsp;&nbsp;</span><a href="#" class="myTagRemover" id="'+m+'" TagIdToRemove="'+d+'" title="Remove">'+r.tagCloseIcon+"</a></span> ",r.tagsContainer!=null?e(r.tagsContainer).append(b):s.before(b),e("#"+m).on("click",s,function(t){t.preventDefault();var n=parseInt(e(this).attr("TagIdToRemove"));y(n,t.data)}),g(),r.maxTags>0&&u.length>=r.maxTags&&s.hide()}s.val("")};return this.each(function(){var i=!1,o=!1;if(typeof t=="string"){switch(t){case"empty":m();break;case"popTag":v();break;case"pushTag":b(n,null,!0)}return}var c=new Array,h=new Array;s.data("tlis",c),s.data("tlid",h);if(r.hiddenTagListId==null){var p=$("input[name='"+r.hiddenTagListName+"']");p.length>0&&p.remove();var g="";g+="<input name='"+r.hiddenTagListName+"' type='hidden' value=''/>",s.after(g),s.data("lhiddenTagList",s.siblings("input[name='"+r.hiddenTagListName+"']")[0])}else s.data("lhiddenTagList",e("#"+r.hiddenTagListId));r.typeahead&&l(),s.on("focus",function(t){e(this).popover&&e(this).popover("hide")}),r.isClearInputOnEsc&&s.on("keyup",function(t){t.which==27&&(e(this).val(""),t.cancelBubble=!0,t.returnValue=!1,t.stopPropagation(),t.preventDefault())}),s.on("keypress",function(t){e(this).popover&&e(this).popover("hide"),r.preventSubmitOnEnter&&t.which==13&&(t.cancelBubble=!0,t.returnValue=!1,t.stopPropagation(),t.preventDefault());var n=e.inArray(t.which,a);if(-1!=n){i=!0;var s=e(this).val();s=d(s),b(s,t.data,i),t.preventDefault()}else i=!1}),r.deleteTagsOnBackspace&&s.on("keydown",s,function(t){var n=e.inArray(t.which,f);if(-1!=n){var r=e(this).val(),i=r.length;i<=0&&(t.preventDefault(),v())}}),s.change(function(t){t.cancelBubble=!0,t.returnValue=!1,t.stopPropagation(),t.preventDefault();var n=r.typeaheadOverrides.selectedClass,s="."+n,a=$(this).data("typeahead");a&&(o=$(this).data("typeahead").$menu.find("*").filter(s).hasClass(n),o&&(i=!0));if(!i)return;var f=navigator.userAgent.indexOf("Chrome")>-1,l=navigator.userAgent.indexOf("MSIE")>-1,c=navigator.userAgent.indexOf("Firefox")>-1,h=navigator.userAgent.indexOf("Safari")>-1;!f&&!h&&e(this).focus();var p=e(".typeahead:visible");if(p[0]!=undefined){var v=!o;if(o){var m=$(this).data("typeahead").$menu.find(s).attr("data-value");m=d(m),u==e(this).val()&&u==m?v=!0:(b(m,null,!0),u=m),o=!1,$(this).data("typeahead").$menu.find(s).removeClass(n)}v&&(u="",e(this).val(u))}else{var m=e(this).val();m=d(m),b(m,null,!0)}i=!1}),s.on("blur",function(t){t.cancelBubble=!0,t.returnValue=!1,t.stopPropagation(),t.preventDefault();var n=!0;if(r.typeahead){var s=e(".typeahead:visible");s[0]!=undefined?n=!1:n=!0}if(n){var o=e(this).val();o=d(o),b(o,null,i)}});if(r.prefilled!=null)if(typeof r.prefilled=="object"){var y=r.prefilled;e.each(y,function(e,t){var n=1;b(t,s,!0)})}else if(typeof r.prefilled=="string"){var y=r.prefilled.split(",");e.each(y,function(e,t){var n=1;b(t,s,!0)})}})}return this}})(jQuery);