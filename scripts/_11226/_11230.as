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
   import _724._11251;
   import _93._92;
   import flash.geom.Point;
   
   public class _11230 extends _92
   {
      public function _11230()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         this.normalize(this._11305.x,this._11305.y,this._11304.x,this._11304.y);
      }
      
      override public function revert() : void
      {
         this.normalize(-this._11305.x,-this._11305.y,-this._11304.x,-this._11304.y);
      }
      
      private function normalize(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this._11278 && this._11278.vertices && Boolean(this._11299))
         {
            _loc5_ = 0;
            _loc6_ = int(this._11278.vertices.length);
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               this._11278.vertices[_loc5_].x -= param1;
               this._11278.vertices[_loc5_].y -= param2;
               _loc5_++;
            }
            this._11299.localTransform.x += param3;
            this._11299.localTransform.y += param4;
            if(this._11299._2104)
            {
               (this._11299._2104 as _11251)._3144();
            }
         }
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
      
      private function get _11303() : Vector.<_661>
      {
         return _2223._11303 as Vector.<_661>;
      }
      
      private function get _11302() : Vector.<_661>
      {
         return _2223._11302 as Vector.<_661>;
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
      
      private function get _11305() : Point
      {
         return _2223._11305 as Point;
      }
      
      private function get _11304() : Point
      {
         return _2223._11304 as Point;
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

