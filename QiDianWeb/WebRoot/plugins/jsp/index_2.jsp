<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="col-md-12"
	style="padding-left:2%;padding-right:2%;padding-top: 10px;">
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox" style="height:400px;">
			<div class="item active">
				<img src="${basePath }plugins/img/IMG_0299.JPG" alt="...">
			</div>
			<div class="item">
				<img src="${basePath }plugins/img/IMG_0219.JPG" alt="...">
			</div>
			<div class="item">
				<img src="${basePath }plugins/img/IMG_0302.JPG" alt="...">
			</div>
		</div>

	</div>
</div>
<div class="col-md-12"
	style="padding-left:0.8%;padding-right:0.5%;margin-top: 15px;"
	id="ontToOne">
	<div class="btn-group col-md-12">
		<button type="button" class="btn btn-default btn-info col-md-3"
			style="line-height:90px;font-size:20px;">
			<i class="glyphicon glyphicon-usd pull-left"
				style="margin-top:25px;margin-right: 5%;margin-left: 6%;font-size:40px;"></i><span
				class="pull-left">一对一费用</span>
		</button>
		<button type="button" class="btn btn-default btn-info col-md-3"
			style="line-height:90px;font-size:20px;">
			<i class="glyphicon glyphicon-thumbs-up pull-left"
				style="margin-top:25px;margin-right: 5%;margin-left: 6%;font-size:40px;"></i><span
				class="pull-left">一对一辅导优势</span>
		</button>
		<button type="button" class="btn btn-default btn-info col-md-3"
			style="line-height:90px;font-size:20px;">
			<i class="glyphicon glyphicon-list-alt pull-left"
				style="margin-top:25px;margin-right: 5%;margin-left: 6%;font-size:40px;"></i><span
				class="pull-left">一对一效果分析</span>
		</button>
		<button type="button" class="btn btn-default btn-info col-md-3"
			style="line-height:90px;font-size:20px;">
			<i class="glyphicon glyphicon-time pull-left"
				style="margin-top:25px;margin-right: 5%;margin-left: 6%;font-size:40px;"></i><span
				class="pull-left">一对一见效时间</span>
		</button>

	</div>
</div>
