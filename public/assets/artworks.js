(function(){$(document).ready(function(){return $(".file-uploader").change(function(e){var t,n;t=e.target;if(t.files&&t.files[0])return n=new FileReader,n.onload=function(e){return $("#img_field").show().attr("src",e.target.result)},n.readAsDataURL(t.files[0])})})}).call(this);