package _226
{
   import _18.IAction;
   import _708._718;
   import _708._719;
   import _81._86;
   import _81._91;
   import _93._92;
   
   public class _265 extends _92
   {
      private var _3004:_86;
      
      private var _3003:_86;
      
      public function _265()
      {
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         if(Boolean(_2214) && Boolean(_2214._1844))
         {
            _2223._2969 = _2223._2969 == -1 ? _2214._1844._2969 : Boolean(_2223._2969);
            _2223._2968 = _2223._2968 == -1 ? _2214._1844._2968 : Boolean(_2223._2968);
         }
      }
      
      override protected function _2211() : *
      {
         var _loc1_:Object = {
            "_1897":_2223._1897,
            "_2974":this._2974,
            "_2953":[]
         };
         var _loc2_:int = 0;
         var _loc3_:int = int(this._2993.length);
         while(_loc2_ < _loc3_)
         {
            (_loc1_._2953 as Array).push(this._2993[_loc2_],this._2971[this._2993[_loc2_]]);
            _loc2_ += 2;
         }
         return _loc1_;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:_265 = param1 as _265;
         if(!_loc2_ || _loc2_._1897 != this._1897 || _loc2_._2971 != this._2971)
         {
            return false;
         }
         var _loc4_:int = int(this._2993.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(_loc2_._2993[_loc3_] != this._2993[_loc3_])
            {
               return false;
            }
            _loc3_ += 2;
         }
         _loc3_ = 1;
         while(_loc3_ < _loc4_)
         {
            this._2993[_loc3_] = _loc2_._2993[_loc3_];
            _loc3_ += 2;
         }
         return true;
      }
      
      override public function clearCache() : void
      {
         this._3004 = null;
      }
      
      protected function _1947(param1:Array) : _86
      {
         var _loc4_:_718 = null;
         var _loc5_:* = undefined;
         var _loc2_:_86 = this._2971.clone();
         if(!_loc2_)
         {
            _loc2_ = new _86();
         }
         var _loc3_:int = int(param1.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = param1[_loc6_];
            _loc5_ = param1[_loc6_ + 1];
            _loc2_[_loc4_.toString()] = _loc5_;
            _loc6_ += 2;
         }
         return _loc2_;
      }
      
      protected function get _2977() : _86
      {
         this._3004 = !!this._3004 ? this._3004 : this._1947(this._2993);
         return this._3004;
      }
      
      protected function get _2976() : _86
      {
         this._3003 = !!this._3003 ? this._3003 : this._1947(this._3000);
         return this._3003;
      }
      
      public function get _2971() : _86
      {
         return null;
      }
      
      public function get _1897() : _91
      {
         return _2223._1897;
      }
      
      public function get _2974() : _719
      {
         return _2223._2974 as _719;
      }
      
      public function get _2993() : Array
      {
         return _2223._2953;
      }
      
      protected function get _3000() : Array
      {
         return _2208._2953;
      }
   }
}

