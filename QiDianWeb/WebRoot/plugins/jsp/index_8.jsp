<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="modal fade in" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
      <div class="modal-dialog" role="document" style="height:338.717px;">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            <h4 class="modal-title"  id="buy_title" style="color: red;">【初中一对一精品课程】购买信息</h4>
          </div>
          <div class="modal-body" style="height: 261px;">
            <form style="width:300px;float: left;">
              <div class="form-group col-md-12">
                <label for="recipient-name" class="control-label pull-left">课次:</label>
                <label id="buy_count" for="recipient-name" class="control-label pull-left" style="color: red;">10</label>
              </div>
              <div class="form-group col-md-12" style="">
                <label for="recipient-name" class="control-label pull-left" style="">课程单价/次:</label>
                <label for="recipient-name" class="control-label pull-left price" style="color: red;">288元</label>
              </div>
              <div class="form-group col-md-12" style="">
                <label for="recipient-name" class="control-label pull-left" style="">课程总价:</label>
                <label id="buy_money" for="recipient-name" class="control-label pull-left" style="color: red;">288元</label>
              </div>
              <div class="form-group col-md-12" style="">
                <label for="recipient-name" class="control-label pull-left" style="">使用方法:</label>
                <label for="recipient-name" class="control-label pull-left" style="color: #A1A1A1;">提前预约，上门可直接上课！<br>预约电话13516553143,欧老师!</label>
              </div> 
              <div class="form-group col-md-12" style="">
                <label for="recipient-name" class="control-label pull-left" style="">支付方式:</label>
                <label for="recipient-name" class="control-label pull-left" style="color: #A1A1A1;">微信支付</label>
              </div>
              <br>         
            </form>
            <div class="pull-left" style="width: 200px;margin-left: 50px;margin-top: -12px;">
            	<img alt="" src="plugins/img/pay.JPG" style="width: 180px;">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">支付完毕</button>
          </div>
        </div>
      </div>
    </div>
