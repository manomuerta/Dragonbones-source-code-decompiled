package _11226
{
   import _11220._11219;
   import _11250._11249;
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _555._576;
   import _586._11247;
   import _658._661;
   import _81._86;
   import _93._92;
   import flash.geom.Point;
   
   public class _11227 extends _92
   {
      public function _11227()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._11278.vertices.length);
         while(_loc1_ < _loc2_)
         {
            this._11278.vertices[_loc1_].x = this._11303[_loc1_].x;
            this._11278.vertices[_loc1_].y = this._11303[_loc1_].y;
            _loc1_++;
         }
         this._11299.localTransform.rotation = 0;
         this._11299.localTransform.scaleX = 1;
         this._11299.localTransform.scaleY = 1;
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._11278.vertices.length);
         while(_loc1_ < _loc2_)
         {
            this._11278.vertices[_loc1_].x = this._11302[_loc1_].x;
            this._11278.vertices[_loc1_].y = this._11302[_loc1_].y;
            _loc1_++;
         }
         this._11299.localTransform.rotation = this._2976.rotation;
         this._11299.localTransform.scaleX = this._2976.scaleX;
         this._11299.localTransform.scaleY = this._2976.scaleY;
         this._2894();
      }
      
      private function _2894() : void
      {
         if(this._1837)
         {
            _2212._2907(this._1837);
         }
         if(this.boundingBoxModel)
         {
            this.boundingBoxModel._2466();
         }
         this._3009.refresh();
      }
      
      private function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      private function get _11303() : Vector.<Point>
      {
         return _2223._11303 as Vector.<Point>;
      }
      
      private function get _11302() : Vector.<Point>
      {
         return _2223._11302 as Vector.<Point>;
      }
      
      private function get _11299() : _70
      {
         return _2223._11299 as _70;
      }
      
      private function get _11278() : _11219
      {
         return _2223._11278 as _11219;
      }
      
      private function get boundingBoxModel() : _11249
      {
         return _2223.boundingBoxModel as _11249;
      }
      
      private function get _2976() : _86
      {
         return _2223._2976 as _86;
      }
      
      private function get _3167() : _661
      {
         return _2223._3167 as _661;
      }
      
      private function get _11296() : _11247
      {
         return _1407.getInstance(_11247) as _11247;
      }
      
      private function get _3009() : _576
      {
         return _1407.getInstance(_576) as _576;
      }
   }
}

