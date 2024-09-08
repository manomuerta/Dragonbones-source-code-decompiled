package _226
{
   import _1404._1407;
   import _470._469;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._532;
   import _93._92;
   
   public class _11095 extends _92
   {
      private var _3108:Vector.<_92>;
      
      public function _11095()
      {
         this._3108 = new Vector.<_92>();
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_232 = null;
         super._1572(param1);
         var _loc2_:_233 = new _233();
         _loc2_._1572(_469._2897(this._1837,this._2890));
         _loc2_._2213();
         this._3108.push(_loc2_);
         _loc3_ = 0;
         _loc4_ = int(this._2978.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = new _232();
            _loc5_._1572(_469._2895(this._2978[_loc3_],this._2898,this._1837));
            _loc5_._2213();
            this._3108.push(_loc5_);
            _loc3_++;
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.execute();
         _loc1_ = 0;
         _loc2_ = int(this._3108.length);
         while(_loc1_ < _loc2_)
         {
            this._3108[_loc1_].execute();
            _loc1_++;
         }
         this._2226._2484 = null;
         this._2226._2484 = this._1837;
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         super.revert();
         _loc1_ = int(this._3108.length - 1);
         while(_loc1_ >= 0)
         {
            this._3108[_loc1_].revert();
            _loc1_--;
         }
      }
      
      protected function get _2978() : Vector.<_70>
      {
         return _2223._2978;
      }
      
      protected function get _2898() : String
      {
         return _2223._2898;
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837;
      }
      
      protected function get _2890() : _52
      {
         return _2223._2890;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

