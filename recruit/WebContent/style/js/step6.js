$(function() {
	$(function() {
		$("#expectPositionspan").click(function(){
			var url = "position/getPositions";
			$.get(url,function(d){
				alert(123)
			});
		});
	});
	var count;
	var idArrs = new Array();
	$("#labels").on("mouseenter", "li", function() {
		$(this).find("i").addClass("visible")
	}), $("#labels").on("mouseleave", "li", function() {
		$(this).find("i").removeClass("visible")
	}), $("#labels").on("click", "li i", function() {
		var a = $(this).prev("span").text();
		$("#box_labels dl").each(function() {
			$("li.selected", this).each(function() {
				$(this).text() == a && $(this).removeClass("selected")
			})
		}), $(this).parents("li").remove()
	}), $("#add_label").bind("click", function() {
		var a = $("#label"),
			b = $.trim(a.val()),
			c = !0;
		b.length <= 6 && b.length > 0 ? ($("#labels li").each(function() {
			$("span", this).text() == b && (c = !1)
		}), c ? $("#labels").append("<li><span>" + b + "</span><i></i></li>") : alert("此标签已存在，请从新输入")) : alert("请输入1-6字的自定义标签"), a.val("")
	}), $("#label").keydown(function(a) {
		13 == a.which && (a.stopPropagation(), $("#add_label").trigger("click"))
	}), $("#box_labels").on("click", "li", function() {
		if (!$(this).hasClass("selected")) {
			$(this).addClass("selected");
			var a = $(this).text();
			var id = $(this).attr("name");
			count++;
			$("#labels").append("<li><span>" + a + "</span><i></i></li>");
			idArrs.push(id);
			$("#idAddr").click(function(){
				/*var href="myresume/myresume.jsp?id="+idArrs+"&name="+a;*/
				var href="myresume/myresume.jsp?id="+idArrs;
				alert(href);
				return false;
			});
		}
	}), $("#step2Submit").click(function() {
		var a = [],
			b = $("#companyId").val();
		$("#labels li").each(function() {
			a.push($(this).children("span").text())
		}), $.ajax({
			type : "POST",
			data : {
				companyId : b,
				labels : a.join()
			},
			url : ctx + "/companyLabel/pasteLabelToCompany.json"
		}).done(function(a) {
			"" != a ? window.location.href = ctx + "/c/founder.html" : alert("保存失败")
		})
	})
});