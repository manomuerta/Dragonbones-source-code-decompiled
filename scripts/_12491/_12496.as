package _12491
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1081;
   import _1045._1105;
   import _12465._12467;
   import _12908._12909;
   import _1529._1528;
   import _1529._1530;
   import _97._125;
   import egret.utils.tr;
   
   public class _12496 extends _12499
   {
      protected static const mainTitleBgRes:Class = _12496_mainTitleBgRes;
      
      protected var _13039:Group;
      
      public var radioGroup:_1081;
      
      private var _12880:_12467;
      
      public function _12496(param1:_12467)
      {
         this.radioGroup = new _1081();
         super();
         this._12880 = param1;
      }
      
      override protected function _2438() : void
      {
         var _loc3_:* = null;
         var _loc4_:Group = null;
         super._2438();
         this._13039 = new Group();
         this._13039.horizontalCenter = 0;
         this._13039.top = 285;
         this._13039.addElement(new _1105(mainTitleBgRes));
         var _loc1_:Label = _125._12836(tr("Pay.confirm.title1"));
         _loc1_.horizontalCenter = _loc1_.verticalCenter = 0;
         this._13039.addElement(_loc1_);
         _2527.addElement(this._13039);
         _2512.addElement(new _12909(tr("Pay.confirm.title2")));
         this._12765(tr("Pay.open.account"),userModel.mail);
         var _loc2_:Date = this._13042(this._12880._12722);
         if(_1528.language == _1530.zh_CN)
         {
            _loc3_ = String(_loc2_.getFullYear()) + "年" + String(_loc2_.getMonth() + 1) + "月" + String(_loc2_.getDate()) + "日";
         }
         else
         {
            _loc3_ = _loc2_.toLocaleDateString();
            _loc3_ = _loc3_.slice(_loc3_.search(" "));
         }
         this._12765(tr("Pay.open.time"),tr("Pay.time.to",this._12880._12722,_loc3_));
         this._12765(tr("Pay.need.pay"),tr("Pay.money.unit",this._12880.price));
         _loc4_ = _125._2414();
         _loc4_.addElement(_13041(tr("Pay.pay.channel"),100));
         if(_1528.language == _1530.zh_CN)
         {
            _loc4_.addElement(_12879(tr("Pay.weixin"),0,this.radioGroup,true));
            _loc4_.addElement(_12879(tr("Pay.ali"),1,this.radioGroup,false));
         }
         else
         {
            _loc4_.addElement(_12879(tr("Pay.paypal"),0,this.radioGroup,true));
         }
         this.radioGroup._5568 = 0;
         _2512.addElement(_loc4_);
         _12878(tr("Pay.step.prev"),tr("Pay.pay"));
      }
      
      private function _13042(param1:int) : Date
      {
         var _loc2_:uint = cloudPayModel._13021();
         var _loc3_:Number = Math.round(365 / 12 * param1 * 3600 * 24) * 1000 + _loc2_ * 1000;
         return new Date(_loc3_);
      }
      
      protected function _12765(param1:String, param2:String) : void
      {
         var _loc3_:Group = _125._2414();
         _loc3_.percentWidth = 100;
         _loc3_.addElement(_13041(param1,100));
         _loc3_.addElement(_125._12836(param2));
         _2512.addElement(_loc3_);
      }
   }
}

