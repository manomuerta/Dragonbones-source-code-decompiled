package _844
{
   import _97._100;
   import egret.core._1140;
   import flash.filters.DropShadowFilter;
   
   public class _845 extends _1140
   {
      protected static var _6271:DropShadowFilter = new DropShadowFilter(0,0,3355443,0.8,4,4,2);
      
      public var _6272:Boolean = false;
      
      private var _color:uint = 0;
      
      private var _6206:Boolean = false;
      
      public function _845()
      {
         super();
         filters = [_6271];
      }
      
      public function set color(param1:uint) : void
      {
         if(this._color == param1)
         {
            return;
         }
         this._color = param1;
         invalidateDisplayList();
      }
      
      public function set _6207(param1:Boolean) : void
      {
         if(this._6206 == param1)
         {
            return;
         }
         this._6206 = param1;
         invalidateDisplayList();
      }
      
      protected function get _6270() : uint
      {
         return this._6206 ? _100._2256 : this._color;
      }
   }
}

