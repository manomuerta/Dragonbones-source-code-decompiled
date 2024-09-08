package _14106
{
   import _1045.Group;
   import _1045.Label;
   import _1185._1196;
   import egret.core._1116;
   import egret.core._1130;
   import egret.core._1138;
   import egret.core._1140;
   import egret.core._1141;
   import egret.core.ns_egret;
   import egret.managers._1211;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextFormatAlign;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   use namespace ns_egret;
   
   public class _14108 extends _1140
   {
      private static var _8994:_1140;
      
      private static var _14824:Group;
      
      private static var _2633:Label;
      
      private static var _14825:int;
      
      private static var inited:Boolean = false;
      
      public function _14108()
      {
         super();
      }
      
      public static function _14812(param1:String, param2:_1140) : void
      {
         _14813();
         _14825 = setTimeout(show,300,param1,param2);
      }
      
      public static function _14813() : void
      {
         clearTimeout(_14825);
         hide();
      }
      
      public static function show(param1:String, param2:_1140) : void
      {
         hide();
         _8994 = param2;
         _9000(param1,_8994.x,_8994.y);
         _14824.visible = true;
         _7914();
      }
      
      public static function hide() : void
      {
         if(Boolean(_14824) && Boolean(_14824.parent))
         {
            _14824.visible = false;
            _8988.removeElement(_14824);
         }
      }
      
      private static function get _8988() : _1116
      {
         var _loc1_:_1211 = null;
         if(_8994 is _1130)
         {
            _loc1_ = _1130(_8994)._1558;
         }
         if(!_loc1_)
         {
            _loc1_ = _1141.ns_egret::_8713[0];
         }
         return _loc1_._8988;
      }
      
      private static function _9000(param1:String, param2:Number, param3:Number) : void
      {
         if(!inited)
         {
            _14824 = new Group();
            _2633 = new Label();
            _2633.padding = 5;
            _2633.size = 12;
            _2633.textAlign = TextFormatAlign.LEFT;
            _2633.verticalAlign = _1196.MIDDLE;
            _14824.addElement(_2633);
            _8988.addElement(_14824);
            inited = true;
         }
         _2633.text = param1;
         _14824._2449();
         _14824.graphics.clear();
         _14824.graphics.beginFill(1843496,0.7);
         _14824.graphics.drawRoundRect(0,0,_2633.width,_2633.height,5,5);
         _14824.graphics.endFill();
         if(!_14824.parent)
         {
            _8988.addElement(_14824);
         }
      }
      
      private static function _7914() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:DisplayObjectContainer = _14824.parent;
         var _loc4_:Number = _14824.layoutBoundsWidth;
         var _loc5_:Number = _14824.layoutBoundsHeight;
         var _loc6_:Rectangle = DisplayObject(_8994).getRect(_loc3_);
         var _loc7_:Number = _loc6_.left + (_loc6_.width - _loc4_) * 0.5;
         var _loc8_:Number = _loc6_.top + (_loc6_.height - _loc5_) * 0.5;
         switch(_8994._8679)
         {
            case _1138.BELOW:
               _loc1_ = _loc7_;
               _loc2_ = _loc6_.bottom;
               break;
            case _1138.ABOVE:
               _loc1_ = _loc7_;
               _loc2_ = _loc6_.top - _loc5_;
               break;
            case _1138.LEFT:
               _loc1_ = _loc6_.left - _loc4_;
               _loc2_ = _loc8_;
               break;
            case _1138.RIGHT:
               _loc1_ = _loc6_.right;
               _loc2_ = _loc8_;
               break;
            case _1138.CENTER:
               _loc1_ = _loc7_;
               _loc2_ = _loc8_;
               break;
            case _1138.TOP_LEFT:
               _loc1_ = _loc6_.left;
               _loc2_ = _loc6_.top;
               break;
            default:
               _loc1_ = _loc3_.mouseX + 10;
               _loc2_ = _loc3_.mouseY + 20;
         }
         var _loc9_:Point = _8994._8690;
         if(_loc9_)
         {
            _loc1_ += _loc9_.x;
            _loc2_ = _loc9_.y;
         }
         var _loc10_:Number = _loc3_.width;
         var _loc11_:Number = _loc3_.height;
         if(_loc1_ + _loc4_ > _loc10_)
         {
            _loc1_ = _loc10_ - _loc4_;
         }
         if(_loc2_ + _loc5_ > _loc11_)
         {
            _loc2_ = _loc11_ - _loc5_;
         }
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         _14824.x = _loc1_;
         _14824.y = _loc2_;
      }
   }
}

