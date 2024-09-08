package _11226
{
   import _11220._11219;
   import _11250._11249;
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _579._580;
   import _586._11247;
   import _658._661;
   import _93._92;
   
   public class _11229 extends _92
   {
      public function _11229()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         this._11301(this._11303);
      }
      
      override public function revert() : void
      {
         this._11301(this._11302);
         if(_2223.first)
         {
            this._11296._11306();
         }
      }
      
      private function _11301(param1:Vector.<_661>) : void
      {
         this._11278.vertices.length = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this._11278.vertices.push(param1[_loc2_]);
            _loc2_++;
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
         this._3176._11298();
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
      
      private function get _3167() : _661
      {
         return _2223._3167 as _661;
      }
      
      private function get _11296() : _11247
      {
         return _1407.getInstance(_11247) as _11247;
      }
      
      private function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
   }
}

