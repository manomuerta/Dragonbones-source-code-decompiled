package _309
{
   import _1404._1407;
   import _521._532;
   import _93._92;
   
   public class _308 extends _92
   {
      private var _3048:Array;
      
      public function _308()
      {
         this._3048 = [];
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc3_:Object = null;
         var _loc4_:_310 = null;
         super._1572(param1);
         var _loc2_:Array = _2223 as Array;
         var _loc5_:int = 0;
         var _loc6_:int = int(_loc2_.length);
         while(_loc5_ < _loc6_)
         {
            _loc3_ = _loc2_[_loc5_];
            _loc4_ = new _310();
            _loc4_._1572(_loc3_);
            this._3048.push(_loc4_);
            _loc5_++;
         }
      }
      
      override protected function _2211() : *
      {
         return this._2226._2889;
      }
      
      override public function execute() : void
      {
         var _loc2_:_92 = null;
         super.execute();
         var _loc1_:Array = [];
         for each(_loc2_ in this._3048)
         {
            _loc2_.execute();
            _loc1_.push(_loc2_._1642._1837);
         }
         this._2226._2889 = _loc1_;
      }
      
      override public function revert() : void
      {
         var _loc1_:_92 = null;
         super.revert();
         this._3048.reverse();
         for each(_loc1_ in this._3048)
         {
            _loc1_.revert();
         }
         this._3048.reverse();
         this._2226._2889 = _2208;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

