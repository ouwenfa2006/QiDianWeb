<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="col-md-12"
	style="padding-left:2%;padding-right:2%;padding-top: 15px;">
	<div class="col-md-12"
		style="border:1px solid silver;line-height:50px;">
		<div class="pull-left"
			style="font-size:30px;margin-left: 2%;color: red;">资讯</div>
		<div class="pull-left" style="margin-left: 3%;">
			<div class="btn-group" id="courses1">
				<button type="button" class="btn btn-default" style="border: 0px;">小学</button>
				<button type="button" class="btn btn-default" style="border: 0px;">初中</button>
				<button type="button" class="btn btn-default" style="border: 0px;">高中</button>
				<button type="button" class="btn btn-default" style="border: 0px;">小升初</button>
				<button type="button" class="btn btn-default" style="border: 0px;">中考</button>
				<button type="button" class="btn btn-default" style="border: 0px;">高考</button>
			</div>
		</div>
	</div>
	<div class="col-md-12" style="border:1px solid silver;border-top:0;">
		<div class="col-md-12">
			<div class="col-md-3" style="padding:2%;">
				<img alt="" src="${basePath }plugins/img/zixun_1.jpg">
			</div>
			<div class="col-md-9">
				<div class="col-md-12">
					<h4 style="float:left;margin-left:-5%;margin-top:20px;">小学六年级数学学习方法推荐</h4>
					<div>
						<h5
							style="margin-left:-5%;float:left;color:silver;margin-top:0px;">做任何事都是有方法的，对于小学六年级的学生来说，数学期末的复习很重要，在复习......</h5>
						<a class="pull-left" style="margin-top:-5px;" href="#">[更多]</a>
					</div>
				</div>
				<div class="col-md-12">
					<div style="margin-left:-5%;color:silver;">2016-12-25 23:15:26</div>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="col-md-3" style="padding:2%;">
				<img alt="" src="${basePath }plugins/img/zixun_2.jpg">
			</div>
			<div class="col-md-9">
				<div class="col-md-12">
					<h4 style="float:left;margin-left:-5%;margin-top:20px;">小学语文期末怎么备考更有效</h4>
					<div>
						<h5
							style="margin-left:-5%;float:left;color:silver;margin-top:0px;">做任何事都是有方法的，对于小学六年级的学生来说，数学期末的复习很重要......</h5>
						<a class="pull-left" style="margin-top:-5px;" href="#">[更多]</a>
					</div>
				</div>
				<div class="col-md-12">
					<div style="margin-left:-5%;color:silver;">2016-12-25 23:15:26</div>
				</div>
			</div>
		</div>
		
		<div class="col-md-12">
			<div class="col-md-3" style="padding:2%;">
				<img alt="" src="${basePath }plugins/img/zixun_3.jpg">
			</div>
			<div class="col-md-9">
				<div class="col-md-12">
					<h4 style="float:left;margin-left:-5%;margin-top:20px;">孩子在小学里最重要的5件事</h4>
					<div>
						<h5
							style="margin-left:-5%;float:left;color:silver;margin-top:0px;">做任何事都是有方法的，对于小学六年级的学生来说，数学期末的复习很重要......</h5>
						<a class="pull-left" style="margin-top:-5px;" href="#">[更多]</a>
					</div>
				</div>
				<div class="col-md-12">
					<div style="margin-left:-5%;color:silver;">2016-12-25 23:15:26</div>
				</div>
			</div>
		</div>
		
		<div class="col-md-12">
			<div class="col-md-3" style="padding:2%;">
				<img alt="" src="${basePath }plugins/img/zixun_4.jpg">
			</div>
			<div class="col-md-9">
				<div class="col-md-12">
					<h4 style="float:left;margin-left:-5%;margin-top:20px;">小学六年级数学学习方法推荐</h4>
					<div>
						<h5
							style="margin-left:-5%;float:left;color:silver;margin-top:0px;">做任何事都是有方法的，对于小学六年级的学生来说，数学期末的复习很重要......</h5>
						<a class="pull-left" style="margin-top:-5px;" href="#">[更多]</a>
					</div>
				</div>
				<div class="col-md-12">
					<div style="margin-left:-5%;color:silver;">2016-12-25 23:15:26</div>
				</div>
			</div>
		</div>
		
		<div class="col-md-12">
			<div class="col-md-3" style="padding:2%;">
				<img alt="" src="${basePath }plugins/img/zixun_5.jpg">
			</div>
			<div class="col-md-9">
				<div class="col-md-12">
					<h4 style="float:left;margin-left:-5%;margin-top:20px;">初中生不养成这三个习惯，再努力也没用</h4>
					<div>
						<h5
							style="margin-left:-5%;float:left;color:silver;margin-top:0px;">做任何事都是有方法的，对于小学六年级的学生来说，数学期末的复习很重要......</h5>
						<a class="pull-left" style="margin-top:-5px;" href="#">[更多]</a>
					</div>
				</div>
				<div class="col-md-12">
					<div style="margin-left:-5%;color:silver;">2016-12-25 23:15:26</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$("#courses1>button").click(function(){
	window.open(basePath+"systemController/getQiDianInfos","mainIframe");
});
</script>

