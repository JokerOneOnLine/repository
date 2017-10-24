// 获取hopejob
function getHopejob() {
	$.ajax({
				async : false,
				url : "hopeJob/getHopejob",
				type : "get",
				dataType : "json",
				cache : false,
				data : {
					userId : $("#userId").val()
				},
				success : function(data) {
					if (data.hopeJob != null) {
						$("#jobDiv").show();
						$("#city").text(data.hopeJob.city);
						$("#salary").text(data.hopeJob.hopeSalary);
						$("#job").text(data.hopeJob.hopejob);
						$("#description").text(data.hopeJob.description);
					} else {
						$("#jobDiv").hide();
					}
				}
			});
}

// 获取工作经历
function getPractice() {
	$.ajax({
				async : false,
				url : "PracticeController/getPractice",
				type : "get",
				dataType : "json",
				cache : false,
				data : {
                    userId : $("#userId").val()
                },
				success : function(data) {
					if (data.practice != null) {
						$("#prac").show();
						$("#company").text(data.practice.company);
						$("#position").text(data.practice.position);
						$("#practiceTime").text(data.practice.strStarttime
								+ "至" + data.practice.strEndtime);
						$("#workContent").text(data.practice.workContent);
					} else {
						$("#prac").hide()
					}
				}
			});
}

// 获取项目经验
function getProject() {
	$.ajax({
				async : false,
				url : "project/getProject",
				type : "get",
				dataType : "json",
				cache : false,
				data : {
                    userId : $("#userId").val()
                },
				success : function(data) {
					if (data.project != null) {
						$("#proj").show();
						$("#projName").text(data.project.projectName);
						$("#projDuty").text(data.project.duty);
						$("#projTime").text(data.project.strStartTime + "至"
								+ data.project.strEndTime);
						$("#projDescription").text(data.project.description);
					} else {
						$("#proj").hide()
					}
				}
			});
}
// 获取项目经教育经历
function getEducation() {
	$.ajax({
				async : false,
				url : "education/getEdu",
				type : "get",
				dataType : "json",
				cache : false,
				data : {
                    userId : $("#userId").val()
                },
				success : function(data) {
					if (data.education != null) {
						$("#edudiv").show();
						$("#eduSchool").text(data.education.schoolName);
						$("#eduMajor").text(data.education.major);
						$("#eduTime").text(data.education.strGraduate);
					} else {
						$("#edudiv").hide()
					}
				}
			});
}
// 用户信息
function getUserInfo() {
	$.ajax({
				async : false,
				url : "userController/getUser",
				type : "get",
				cache : false,
				data : {
                    userId : $("#userId").val()
                },
				success : function(data) {
					//alert(JSON.stringify(data));
					var gender = data.gender;
					$("#namespan").text("姓名：" + data.name);
					$("#titleName").text(data.name+"的简历")
					if (gender == 0) {
						$("#genderspan").text("性别：女");
					} else {
						$("#genderspan").text("性别：男");
					}
					$("#birthspan").text("生日：" + data.birth);
					$("#addrspan").text("地址：" + data.addr);
					$("#telspan").text("电话：" + data.tel);
					$("#decspan").text("个人宣言：" + data.declaration);
				}
			});
}
