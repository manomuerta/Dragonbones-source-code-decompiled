package _11226
{
   import _11220._11219;
   import _11250._11249;
   import _1404._1407;
   import _18.IAction;
   import _51._70;
   import _51._79;
   import _586._11247;
   import _658._661;
   import _93._92;
   import flash.geom.Point;
   
   public class _11228 extends _92
   {
      private var _11300:_11230;
      
      public function _11228()
      {
         super();
         _2215 = true;
         _2219 = true;
         _2224 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         this._11300 = new _11230();
         this._11300._1572(_2223);
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_11228 = param1 as _11228;
         if(_loc2_)
         {
            _2223.deltaX += _loc2_.deltaX;
            _2223.deltaY += _loc2_.deltaY;
            _2223._11305.x += _loc2_._11305.x;
            _2223._11305.y += _loc2_._11305.y;
            _2223._11304.x += _loc2_._11304.x;
            _2223._11304.y += _loc2_._11304.y;
            return true;
         }
         return false;
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.vertices.length);
         while(_loc1_ < _loc2_)
         {
            this.vertices[_loc1_].x += this.deltaX;
            this.vertices[_loc1_].y += this.deltaY;
            _loc1_++;
         }
         this._11300.execute();
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this._11300.revert();
         _loc1_ = 0;
         _loc2_ = int(this.vertices.length);
         while(_loc1_ < _loc2_)
         {
            this.vertices[_loc1_].x -= this.deltaX;
            this.vertices[_loc1_].y -= this.deltaY;
            _loc1_++;
         }
         if(this.boundingBoxModel)
         {
            if(this.boundingBoxModel._3823)
            {
               this.boundingBoxModel._3823.length = 0;
            }
         }
         this._2894();
      }
      
      private function _2894() : void
      {
         this.vertex.update();
         if(this._1837)
         {
            _2212._2907(this._1837);
         }
         this._11296._3139();
      }
      
      private function get _11299() : _70
      {
         return _2223._11299 as _70;
      }
      
      private function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      private function get boundingBoxModel() : _11249
      {
         return _2223.boundingBoxModel;
      }
      
      private function get _11278() : _11219
      {
         return this._11299._11278;
      }
      
      private function get vertex() : _661
      {
         return _2223.vertex as _661;
      }
      
      private function get vertices() : Vector.<_661>
      {
         return _2223.vertices as Vector.<_661>;
      }
      
      protected function get deltaX() : Number
      {
         return _2223.deltaX as Number;
      }
      
      protected function get deltaY() : Number
      {
         return _2223.deltaY as Number;
      }
      
      protected function get _11305() : Point
      {
         return _2223._11305 as Point;
      }
      
      protected function get _11304() : Point
      {
         return _2223._11304 as Point;
      }
      
      private function get _11296() : _11247
      {
         return _1407.getInstance(_11247) as _11247;
      }
   }
}

