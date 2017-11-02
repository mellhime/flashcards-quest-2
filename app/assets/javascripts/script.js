console.log('greeting');
$('#card_block_id').on('change',function(){
  if( $(this).val()==="1"){
    $("#test").show()
    }
    else{
    $("#test").hide()
    }
});
