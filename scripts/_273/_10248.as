package _273
{
   import _1404._1407;
   import _51._50;
   import _51._79;
   import _586._605;
   import _93._92;
   
   public class _10248 extends _92
   {
      public function _10248()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3020(this._3019);
      }
      
      override public function revert() : void
      {
         super.revert();
      }
      
      protected function _3020(param1:Array) : void
      {
         var _loc3_:_79 = null;
         var _loc5_:int = 0;
         var _loc2_:_50 = this._3021;
         var _loc4_:int = int(this._3022.length);
         while(_loc4_--)
         {
            _loc3_ = this._3022[_loc4_];
            _loc5_ = int(param1[_loc4_]);
            _loc2_._1974(_loc3_,param1[_loc4_]);
         }
         this._3059._3051();
      }
      
      protected function get _3022() : Array
      {
         return _2223._3022;
      }
      
      protected function get _3019() : Array
      {
         return _2223._3019;
      }
      
      protected function get _3018() : Array
      {
         return _2223._3018;
      }
      
      protected function get _3021() : _50
      {
         return (this._3022[0] as _79).parentBoneData.rootArmatureData;
      }
      
      private function get _3059() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
   }
}

