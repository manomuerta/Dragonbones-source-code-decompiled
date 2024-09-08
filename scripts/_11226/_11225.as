package _11226
{
   import _11220._11219;
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _579._580;
   import _586._11247;
   import _658._661;
   import _93._92;
   
   public class _11225 extends _92
   {
      private var _11300:_11230;
      
      public function _11225()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         this._11300 = new _11230();
         this._11300._1572(_2223);
      }
      
      override public function execute() : void
      {
         this._11301(this._11303);
         this._11300.execute();
      }
      
      override public function revert() : void
      {
         this._11300.revert();
         this._11301(this._11302);
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
         this._11296._3173();
         this._3176._11298();
      }
      
      private function get _11299() : _70
      {
         return _2223._11299 as _70;
      }
      
      private function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      private function get _11278() : _11219
      {
         return this._11299._11278;
      }
      
      private function get _11303() : Vector.<_661>
      {
         return _2223._11303 as Vector.<_661>;
      }
      
      private function get _11302() : Vector.<_661>
      {
         return _2223._11302 as Vector.<_661>;
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

