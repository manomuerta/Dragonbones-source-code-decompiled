package _226
{
   import _51._79;
   import _93._92;
   
   public class _10549 extends _92
   {
      private var _10561:_270;
      
      private var _10562:Array;
      
      public function _10549()
      {
         this._10562 = [];
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_10548 = null;
         super._1572(param1);
         this._10561 = new _270();
         this._10561._1572(this._10560);
         this._10561._2213();
         for each(_loc2_ in this._1830)
         {
            _loc3_ = new _10548();
            _loc3_._1572({"_1837":_loc2_});
            _loc3_._2213();
            this._10562.push(_loc3_);
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         this._10561.execute();
         var _loc1_:int = 0;
         while(_loc1_ < this._10562.length)
         {
            this._10562[_loc1_].execute();
            _loc1_++;
         }
      }
      
      override public function revert() : void
      {
         super.revert();
         var _loc1_:int = 0;
         while(_loc1_ < this._10562.length)
         {
            this._10562[_loc1_].revert();
            _loc1_++;
         }
         this._10561.revert();
      }
      
      protected function get _1830() : Array
      {
         return _2223._10559;
      }
      
      protected function get _10560() : Object
      {
         return _2223._10560;
      }
      
      protected function get _10559() : Object
      {
         return _2223._10559;
      }
   }
}

