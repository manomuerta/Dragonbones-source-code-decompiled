package _279
{
   import _51._79;
   import _54._53;
   import _54._57;
   import _54._67;
   import _644._646;
   
   public class _281 extends _282
   {
      public function _281()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
      }
      
      override public function execute() : void
      {
         var _loc3_:_57 = null;
         var _loc4_:int = 0;
         super.execute();
         this._3097();
         var _loc1_:int = int(_2071.parent.parent.children.indexOf(_2071.parent));
         var _loc2_:Vector.<_57> = new Vector.<_57>();
         for each(_loc3_ in _2071.parent.parent.children)
         {
            _loc4_ = int(_loc3_.parent.children.indexOf(_loc3_));
            if(_loc4_ > _loc1_)
            {
               _loc2_.push(_loc3_);
            }
         }
         _2223.newAfterTracks = _loc2_;
         _2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3096();
         _2894();
      }
      
      protected function _3097() : void
      {
         var _loc1_:_57 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_67 = null;
         var _loc5_:int = 0;
         var _loc6_:_67 = null;
         var _loc7_:_57 = null;
         var _loc8_:_53 = null;
         var _loc9_:int = 0;
         var _loc10_:_57 = null;
         var _loc11_:_79 = null;
         var _loc12_:_646 = null;
         var _loc13_:_67 = null;
         var _loc14_:int = 0;
         var _loc15_:Object = null;
         var _loc16_:_283 = null;
         var _loc17_:int = 0;
         var _loc18_:Object = null;
         var _loc19_:_284 = null;
         for each(_loc1_ in this._3101)
         {
            if(_loc1_.children.length >= 1)
            {
               _loc2_ = int(_loc1_.children.length);
               _loc3_ = _loc2_;
               _loc4_ = _loc1_.children[0];
               _loc5_ = 0;
               while(_loc5_ < _loc2_)
               {
                  _loc3_--;
                  if(_loc3_ < 0)
                  {
                     break;
                  }
                  _loc6_ = _loc1_.children[_loc5_];
                  if(_loc6_ == _loc4_)
                  {
                     _loc7_ = _2071._2069;
                     _loc8_ = _loc4_._1992;
                     _loc9_ = _loc7_.index;
                     _loc9_ = _loc9_ + 1;
                     _loc10_ = new _57(_loc7_.parent);
                     _loc11_ = _loc4_._1837;
                     _loc12_ = _3058._3098(_loc4_);
                     _loc13_ = _loc8_._2048(_2071,_loc11_,false);
                     _loc14_ = 0;
                     (_loc15_ = {})._2071 = _loc4_;
                     _loc15_._2056 = _2071;
                     _loc15_._3088 = null;
                     _loc15_._3090 = _loc4_.parent;
                     _loc15_._3091 = _loc4_.parent.parent;
                     _loc15_._3085 = _loc8_;
                     _loc15_._3102 = _loc10_;
                     _loc15_._3103 = _loc10_.parent;
                     _loc15_._3100 = _loc9_;
                     _loc15_._3087 = _loc12_;
                     _loc15_._3080 = _loc14_;
                     _loc16_ = new _283();
                     _loc16_._1572(_loc15_);
                     _loc16_.execute();
                     _loc5_--;
                  }
                  else
                  {
                     _loc8_ = _loc6_._1992;
                     _loc17_ = int(_loc4_.parent.children.indexOf(_loc4_));
                     _loc12_ = _3058._3098(_loc6_);
                     _loc17_ += 1;
                     (_loc18_ = {})._2071 = _loc6_;
                     _loc18_._2056 = _loc4_;
                     _loc18_._3088 = _3088;
                     _loc18_._3090 = _loc6_.parent;
                     _loc18_._3091 = _loc6_.parent.parent;
                     _loc18_._3085 = _loc8_;
                     _loc18_._3102 = _loc4_.parent;
                     _loc18_._3103 = _loc4_.parent.parent;
                     _loc18_._3099 = _loc17_;
                     _loc18_._3087 = _loc12_;
                     _loc18_._3080 = 0;
                     _loc19_ = new _284();
                     _loc19_._1572(_loc18_);
                     _loc19_.execute();
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      protected function _3096() : void
      {
         var _loc1_:_57 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_67 = null;
         var _loc5_:int = 0;
         var _loc6_:_67 = null;
         var _loc7_:_57 = null;
         var _loc8_:_53 = null;
         var _loc9_:int = 0;
         var _loc10_:_57 = null;
         var _loc11_:_79 = null;
         var _loc12_:_646 = null;
         var _loc13_:_67 = null;
         var _loc14_:int = 0;
         var _loc15_:Object = null;
         var _loc16_:_283 = null;
         var _loc17_:int = 0;
         var _loc18_:Object = null;
         var _loc19_:_284 = null;
         for each(_loc1_ in _2223.newAfterTracks)
         {
            if(_loc1_.children.length >= 1)
            {
               _loc2_ = int(_loc1_.children.length);
               _loc3_ = _loc2_;
               _loc4_ = _loc1_.children[0];
               _loc5_ = 0;
               while(_loc5_ < _loc2_)
               {
                  _loc3_--;
                  if(_loc3_ < 0)
                  {
                     break;
                  }
                  _loc6_ = _loc1_.children[_loc5_];
                  if(_loc6_ == _loc4_)
                  {
                     _loc7_ = _2071._2069;
                     _loc8_ = _loc4_._1992;
                     _loc9_ = _loc7_.index;
                     _loc9_ = _loc9_ + 1;
                     _loc10_ = new _57(_loc7_.parent);
                     _loc11_ = _loc4_._1837;
                     _loc12_ = _3058._3098(_loc4_);
                     _loc13_ = _loc8_._2048(_2071,_loc11_,false);
                     _loc14_ = 0;
                     (_loc15_ = {})._2071 = _loc4_;
                     _loc15_._2056 = _2071;
                     _loc15_._3088 = null;
                     _loc15_._3090 = _loc4_.parent;
                     _loc15_._3091 = _loc4_.parent.parent;
                     _loc15_._3085 = _loc8_;
                     _loc15_._3102 = _loc10_;
                     _loc15_._3103 = _loc10_.parent;
                     _loc15_._3100 = _loc9_;
                     _loc15_._3087 = _loc12_;
                     _loc15_._3080 = _loc14_;
                     _loc16_ = new _283();
                     _loc16_._1572(_loc15_);
                     _loc16_.execute();
                     _loc5_--;
                  }
                  else
                  {
                     _loc8_ = _loc6_._1992;
                     _loc17_ = int(_loc4_.parent.children.indexOf(_loc4_));
                     _loc12_ = _3058._3098(_loc6_);
                     _loc17_ += 1;
                     (_loc18_ = {})._2071 = _loc6_;
                     _loc18_._2056 = _loc4_;
                     _loc18_._3088 = _3088;
                     _loc18_._3090 = _loc6_.parent;
                     _loc18_._3091 = _loc6_.parent.parent;
                     _loc18_._3085 = _loc8_;
                     _loc18_._3102 = _loc4_.parent;
                     _loc18_._3103 = _loc4_.parent.parent;
                     _loc18_._3099 = _loc17_;
                     _loc18_._3087 = _loc12_;
                     _loc18_._3080 = 0;
                     _loc19_ = new _284();
                     _loc19_._1572(_loc18_);
                     _loc19_.execute();
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      public function get _3101() : Vector.<_57>
      {
         return _2223._3101;
      }
   }
}

