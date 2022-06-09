function totalPrice(){
  var zong = 0;
  $(".subtotal").each(function (){
     var all = parseInt($(this).text());  
     zong +=all;
  })
  $("#sum").text(zong);
}
$(function(){
totalPrice();
})
