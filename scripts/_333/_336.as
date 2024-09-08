package _333
{
   import _1404._1407;
   import _18.IAction;
   import _51._79;
   import _555._570;
   import _586._594;
   import _93._92;
   
   public class _336 extends _92
   {
      private var _3108:Vector.<_335>;
      
      public function _336()
      {
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_336 = param1 as _336;
         if(_loc2_)
         {
            if(this.cmds.length == _loc2_.cmds.length)
            {
               this.cmds = _loc2_.cmds;
               return true;
            }
         }
         return false;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_335 = null;
         super._1572(param1);
         this._3108 = new Vector.<_335>();
         _loc2_ = 0;
         _loc3_ = int(_2223.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new _335();
            _loc4_._1572(_2223[_loc2_]);
            this._3108.push(_loc4_);
            _loc2_++;
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_335 = null;
         super.execute();
         _loc1_ = 0;
         _loc2_ = int(this._3108.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._3108[_loc1_];
            _loc3_._3204(_loc3_._1642._2991);
            _loc1_++;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_335 = null;
         super.revert();
         _loc1_ = 0;
         _loc2_ = int(this._3108.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._3108[_loc1_];
            _loc3_._3204(_loc3_._1642._2992);
            _loc1_++;
         }
         this._2894();
      }
      
      public function _2894() : void
      {
         if(this._1837)
         {
            _2212._2907(this._1837);
         }
         this._3008._3207();
         this._2853.refresh();
      }
      
      private function get _1837() : _79
      {
         if(_2223.length > 0)
         {
            return _2223[0]._1837 as _79;
         }
         return null;
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      private function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
      
      public function get cmds() : Vector.<_335>
      {
         return this._3108;
      }
      
      public function set cmds(param1:Vector.<_335>) : void
      {
         this._3108 = param1;
      }
   }
}

