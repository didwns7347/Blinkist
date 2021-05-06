//카테고리별 상품출력
$(function() {
	  $("select[name=category]").change(function() {

			// select[name=category] option의 value값가져오기
		    var a = $(this).val(); 
		    
		    //상품이름태그가져오기
		    var temp = $("select[name=goodsName]");
		    
		   if(temp!=null){
			   
			   $("select[name=goodsName] option").remove();
		   }
		   
		   temp.html("<option>--------------------------------</option>");
		   	    
	    $("input[name='test']").each(function (i) {

	    	test1=  $("input[name='test']").eq(i).attr('id');
    		test2= $("input[name='test']").eq(i).val();
    		      	
	    	if(a== test1){
	    		
	    	   var option = $("<option>"+test2+"</option>"); //카테고리별 상품출력
	 		   temp.append(option);
	 		   
	    	}
	    });
	  });});


//상품에 따른 출고량값 동적변화
$(function() {
	$("select[name=goodsName]").change(function() {
		
	     var temp = $("select[name=export]");
	     var a = $(this).val(); //option의 value값가져오기
	     var option;
	     
		if(temp!=null){
			   
			   $("select[name=export] option").remove();
			   
		   }
   
	 $("input[name='test']").each(function (i) {
		 
		 var test1= $("input[name='test']").eq(i).val();
	     var test2 = $("input[name='test']").eq(i).attr('class');
 
    if(test1==a){
      	
    	  for(var i=1; i<=test2;  i++){

    		   option = $("<option>"+i+"</option>");
    		   temp.append(option);
    	   }
    }
	 });
	   var name = $("select[name=goodsName] option:checked").text();
	   $('#name').val(name); 
	});});
 


//상품에 따른 반품값 동적변화
$(function() {
	$("select[name=goodsName]").change(function() {
		
	     var temp = $("select[name=back]");
	     var a = $(this).val(); //option의 value값가져오기
	     var option;
	     
		if(temp!=null){
			   
			   $("select[name=back] option").remove();
			   
		   }
   
	 $("input[name='test']").each(function (i) {
		 
		 var test1= $("input[name='test']").eq(i).val();
	     var test2 = $("input[name='test']").eq(i).attr('class');
 
    if(test1==a){
      	
    	  for(var i=1; i<=test2;  i++){

    		   option = $("<option>"+i+"</option>");
    		   temp.append(option);
    	   }
    }
	 });
	   var name = $("select[name=goodsName] option:checked").text();
	   $('#name').val(name); 
	});});