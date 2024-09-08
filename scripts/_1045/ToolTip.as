package _1045
{
   import egret.core._1140;
   import egret.core._1142;
   import egret.core._999;
   import egret.core.ns_egret;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   use namespace ns_egret;
   
   public class ToolTip extends _1140 implements _999
   {
      public static var maxWidth:Number = 300;
      
      private var _8577:Object;
      
      private var _8575:Boolean;
      
      private var _7027:_1142;
      
      public function ToolTip()
      {
         super();
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function get _7913() : Object
      {
         return this._8577;
      }
      
      public function set _7913(param1:Object) : void
      {
         this._8577 = param1;
         this._8575 = true;
         _2466();
         invalidateSize();
         invalidateDisplayList();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._8031();
         this._7022(-1);
         this.filters = [new DropShadowFilter(1,45,0,0.7,2,2,1,1)];
      }
      
      override protected function _2476() : void
      {
         var _loc1_:TextFormat = null;
         super._2476();
         if(this._8575)
         {
            _loc1_ = this._7027.getTextFormat();
            _loc1_.leftMargin = 0;
            _loc1_.rightMargin = 0;
            this._7027.defaultTextFormat = _loc1_;
            this._7027.text = this._8577 as String;
            this._8575 = false;
         }
      }
      
      override protected function _7028() : void
      {
         super._7028();
         var _loc1_:Number = 10;
         var _loc2_:Number = 10;
         this._7027.wordWrap = false;
         if(this._7027.textWidth + _loc1_ > ToolTip.maxWidth)
         {
            this._7027.width = ToolTip.maxWidth - _loc1_;
            this._7027.wordWrap = true;
         }
         measuredWidth = this._7027.width + _loc1_;
         measuredHeight = this._7027.height + _loc2_;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         var _loc3_:Number = 10;
         var _loc4_:Number = 10;
         this._7027.x = 5;
         this._7027.y = 5;
         this._7027.width = param1 - _loc3_;
         this._7027.height = param2 - _loc4_;
         this._8031();
      }
      
      private function _7022(param1:int) : void
      {
         var _loc2_:TextFormat = null;
         if(!this._7027)
         {
            this._7027 = new _1142();
            this._7027.autoSize = TextFieldAutoSize.LEFT;
            this._7027.mouseEnabled = false;
            this._7027.multiline = true;
            this._7027.selectable = false;
            this._7027.wordWrap = false;
            _loc2_ = this._7027.getTextFormat();
            _loc2_.font = "SimSun";
            _loc2_.color = 16777215;
            _loc2_.leading = 2;
            this._7027.defaultTextFormat = _loc2_;
            if(param1 == -1)
            {
               ns_egret::_1607(this._7027);
            }
            else
            {
               ns_egret::addToDisplayListAt(this._7027,param1);
            }
         }
      }
      
      private function _8576() : void
      {
         if(this._7027)
         {
            ns_egret::removeFromDisplayList(this._7027);
            this._7027 = null;
         }
      }
      
      private function _8031() : void
      {
         graphics.clear();
         graphics.beginFill(0,0.7);
         var _loc1_:Number = isNaN(width) ? 0 : width;
         var _loc2_:Number = isNaN(height) ? 0 : height;
         graphics.drawRoundRect(0,0,_loc1_,_loc2_,5,5);
         graphics.endFill();
      }
   }
}

