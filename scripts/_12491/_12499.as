package _12491
{
   import _1033._12501;
   import _1033._12504;
   import _1045.Group;
   import _1045.Label;
   import _1045.RadioButton;
   import _1045._1081;
   import _1045._1105;
   import _1185._1197;
   import _12465._12466;
   import _1374.Window;
   import _1404._1407;
   import _1529._1528;
   import _1529._1530;
   import _648._12463;
   import _97._125;
   import flash.display.NativeWindowType;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _12499 extends Window
   {
      protected var _2512:Group;
      
      public var _2527:Group;
      
      public var _10525:Group;
      
      public var _10524:Group;
      
      public function _12499()
      {
         this.userModel = _1407.getInstance(_12463);
         this.cloudPayModel = _1407.getInstance(_12466);
         this._2512 = _125._2402(new _1197());
         super();
         this.width = 574;
         this.skinName = _12501;
         this.type = NativeWindowType.UTILITY;
         this.setStyle("textColor",6513507);
         this.setStyle("size",_1528.language == _1530.zh_CN ? 16 : 15);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.addElement(this._2512);
         (this._2512.layout as _1197).gap = _1528.language == _1530.zh_CN ? 16 : 12;
         this._2512.top = this._2512.bottom = this._2512.left = this._2512.right = 0;
      }
      
      protected function _12878(param1:String, param2:String) : void
      {
         var _loc3_:Group = _125._2397(20);
         _loc3_.percentWidth = 100;
         _loc3_.bottom = 0;
         this._10525 = this._12887(_12501._12886,param1,0.8);
         this._10524 = this._12887(_12501._12885,param2);
         _loc3_.addElement(this._10525);
         _loc3_.addElement(this._10524);
         this._10525.addEventListener(MouseEvent.CLICK,this._12876);
         this._10524.addEventListener(MouseEvent.CLICK,this._12874);
         this.addElement(_loc3_);
      }
      
      protected function _12879(param1:String, param2:*, param3:_1081, param4:Boolean = false) : RadioButton
      {
         var _loc5_:RadioButton = null;
         (_loc5_ = new RadioButton()).skinName = _12504;
         _loc5_.label = param1;
         _loc5_.value = param2;
         _loc5_.group = param3;
         _loc5_.selected = param4;
         return _loc5_;
      }
      
      protected function _13041(param1:String, param2:Number) : Label
      {
         var _loc3_:Label = _125._12836(param1);
         _loc3_.width = param2;
         _loc3_.textAlign = "right";
         return _loc3_;
      }
      
      private function _12887(param1:Object, param2:String, param3:Number = 1) : Group
      {
         var _loc4_:Group;
         (_loc4_ = new Group()).width = 164;
         _loc4_.height = 50;
         var _loc5_:_1105;
         (_loc5_ = new _1105(param1)).alpha = param3;
         var _loc6_:Label;
         (_loc6_ = new Label()).text = param2;
         _loc6_.verticalCenter = 0;
         _loc6_.horizontalCenter = 0;
         _loc6_.textColor = 16777215;
         _loc6_.size = _1528.language == _1530.zh_CN ? 20 : 17;
         _loc4_.addElement(_loc5_);
         _loc4_.addElement(_loc6_);
         return _loc4_;
      }
      
      protected function _12876(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("leftBtnClick"));
      }
      
      protected function _12874(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("rightBtnClick"));
      }
      
      public function _13040(param1:Date) : String
      {
         var _loc2_:* = null;
         if(_1528.language == _1530.zh_CN)
         {
            _loc2_ = String(param1.getFullYear()) + "年" + String(param1.getMonth() + 1) + "月" + String(param1.getDate()) + "日";
         }
         else
         {
            _loc2_ = param1.toLocaleDateString();
            _loc2_ = _loc2_.slice(_loc2_.search(" "));
         }
         return _loc2_;
      }
   }
}

