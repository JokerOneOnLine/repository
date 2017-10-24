$(function() {
		var i=0;
		$("#addPractice").click(function() {
			var input=$("<form  action='' method='post' >公司:<input type='text' name='company' value=''>职位:<input type='text' name='profession' value=''><br><br>在职时间：<input type='text' name='startTime' placeholder='2017-05'>--<input type=text name='endTime' placeholder='2017-05'><br><br>工作内容：<br><textarea rows='5' cols='20' width='440px'></textarea><br><input type='submit' value='保存' class='btn btn-default'><button id='dismiss'  class='btn btn-default'>取消</button></form><hr>");
			var pre=$(this).after();
			
			window.onload=function(){ 
				  var a = document.getElementById("dismiss");
				  a.parentNode.removeChild(a);
				}
			pre.after(input); 
			
		});
		$("#addEducation").click(function(){
			var input=$("<form action='' method='post'>学校名称:<input type='text' name='company' value=''>所学专业:<input type='text' name='profession' value=''><br><br>学历：<select><option>大专</option><option>本科</option><option>硕士</option><option>博士</option><option>其他</option></select>毕业年份：<select><option>2019</option><option>2018</option><option>2017</option><option>2016</option><option>2015</option><option>2014</option><option>2013</option><option>2012</option><br></select><input type='submit' value='保存' class='btn btn-default'><button class='btn btn-default' data-dismiss='modal' id = 'dismis'>取消</button></form></div><hr>");
			var pre = $(this).after();
		
			window.onload=function(){ 
				  var a = document.getElementById("dismis");
				  a.parentNode.removeChild(a);
				}
			pre.after(input);
		});
	});