package _12444
{
   import _226._232;
   import _51._50;
   import _93._92;
   
   public class _14055 extends _92
   {
      private var _14401:_232;
      
      private var _14394:Vector.<_14056>;
      
      public function _14055()
      {
         super();
         _2215 = true;
         _2219 = true;
         this._14394 = new Vector.<_14056>();
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_14056 = null;
         super._1572(param1);
         this._14401 = new _232();
         this._14401._1572(this._14400);
         this._14401._2213();
         var _loc2_:Vector.<Object> = _2223.pasteFFDTimeLineData;
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(_loc2_.length);
            while(_loc3_ < _loc4_)
            {
               _loc5_ = new _14056();
               _loc5_._1572(_loc2_[_loc3_]);
               this._14394.push(_loc5_);
               _loc3_++;
            }
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.execute();
         this._14401.execute();
         if(Boolean(this._14394) && this._14394.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._14394.length);
            while(_loc1_ < _loc2_)
            {
               this._14394[_loc1_].execute();
               _loc1_++;
            }
         }
      }
      
      override public function revert() : void
      {
         super.revert();
         this._14401.revert();
      }
      
      public function get _14400() : Object
      {
         return _2223._14400;
      }
      
      private function get flag() : uint
      {
         return _2223.flag;
      }
      
      private function get _1886() : _50
      {
         return _2223._1886 as _50;
      }
   }
}

