/* 카테고리별 입고량(매입)통계 */
$(function(){
	
	var ctx = document.getElementById('Purchase');
			
	var myChart = new Chart(ctx, {
		
		
		type: 'bar', 
		data: { labels: ['아우터', '상의', '하의', '신발'], 
		datasets: [{ 
			
			label: '# 입고량', 
			data: [	$("#1").val(),$("#2").val(), $("#3").val(), $("#4").val()], 
			backgroundColor: [ 	
				'rgba(255, 99, 132, 0.2)', 
				'rgba(54, 162, 235, 0.2)', 
				'rgba(255, 206, 86, 0.2)', 
				'rgba(75, 192, 192, 0.2)'	
				],
		 borderColor: [ 
			 'rgba(255, 99, 132, 1)',
			 'rgba(54, 162, 235, 1)', 
			 'rgba(255, 206, 86, 1)',
			 'rgba(75, 192, 192, 1)', 
			  ], 
			  borderWidth: 1 
			  }] 
	}, 
	options: {
		scales: { 
			yAxes: [{ 
				ticks: { 
					beginAtZero: true 
					}
}] } } }); 
});



/* 카테고리별 촐고량(판매)통계 */
$(function(){
	
	var ctx = document.getElementById('Sales');
			
	var myChart = new Chart(ctx, {
		
		
		type: 'bar', 
		data: { labels: ['아우터', '상의', '하의', '신발'], 
		datasets: [{ 
			
			label: '# 출고량', 
			data: [	$("#5").val(),$("#6").val(), $("#7").val(), $("#8").val()], 
			backgroundColor: [ 	
				'rgba(255, 206, 86, 0.2)', 
				'rgba(75, 192, 192, 0.2)', 
				'rgba(153, 102, 255, 0.2)', 
				'rgba(255, 159, 64, 0.2)'

				],
		 borderColor: [ 
			 'rgba(255, 206, 86, 0.2)', 
			 'rgba(75, 192, 192, 0.2)', 
			 'rgba(153, 102, 255, 0.2)', 
			  'rgba(255, 159, 64, 0.2)'
			  ], 
			  borderWidth: 1 
			  }] 
	}, 
	options: {
		scales: { 
			yAxes: [{ 
				ticks: { 
					beginAtZero: true 
					}
}] } } }); 
});


/* 카테고리별 촐고량(판매)통계 */
$(function(){
	
	var ctx = document.getElementById('Return');
			
	var myChart = new Chart(ctx, {
		
		
		type: 'bar', 
		data: { labels: ['아우터', '상의', '하의', '신발'], 
		datasets: [{ 
			
			label: '# 반품량', 
			data: [	$("#9").val(),$("#10").val(), $("#11").val(), $("#12").val()], 
			backgroundColor: [ 	
				'rgba(255, 255, 102, 0.2)', 
				'rgba(153, 255, 153, 0.2)', 
				'rgba(255, 102, 255, 0.2)', 
				'rgba(255, 153, 153, 0.2)'

				],
		 borderColor: [ 
				'rgba(255, 255, 102, 0.2)', 
				'rgba(153, 255, 153, 0.2)', 
				'rgba(255, 102, 255, 0.2)', 
				'rgba(255, 153, 153, 0.2)'
			  ], 
			  borderWidth: 1 
			  }] 
	}, 
	options: {
		scales: { 
			yAxes: [{ 
				ticks: { 
					beginAtZero: true 
					}
}] } } }); 
});