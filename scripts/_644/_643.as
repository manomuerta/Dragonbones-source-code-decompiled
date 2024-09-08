package _644
{
   import _1038._1037;
   import _51._50;
   import _51._52;
   import _51._79;
   import _54._53;
   import _54._56;
   import _54._57;
   import _54._67;
   import flash.utils.Dictionary;
   
   public class _643
   {
      private var _3251:_50;
      
      private var _2060:_53;
      
      private var _5653:Vector.<_645>;
      
      private var _5655:Dictionary;
      
      private var _5649:_1037;
      
      private var _2072:int = 30;
      
      public function _643(param1:_50)
      {
         super();
         this._3251 = param1;
         this._1992 = param1._1763;
         this._5649 = new _1037(this._3251._1780);
      }
      
      public function set _1992(param1:_53) : void
      {
         if(this._2060 != param1)
         {
            this._2060 = param1;
            this._5650();
         }
      }
      
      public function get _1992() : _53
      {
         return this._2060;
      }
      
      public function get _5654() : Vector.<_645>
      {
         return this._5653;
      }
      
      public function get _5046() : _1037
      {
         return this._5649;
      }
      
      public function get fps() : int
      {
         return this._2072;
      }
      
      public function _3051() : void
      {
         this._5649.source = this._3251._1780;
      }
      
      public function _5049(param1:Vector.<_79>) : Vector.<_645>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Vector.<_645> = new Vector.<_645>();
         _loc3_ = 0;
         _loc4_ = int(this._5653.length);
         while(_loc3_ < _loc4_)
         {
            if(param1.indexOf(this._5653[_loc3_]._1837) != -1)
            {
               _loc2_.push(this._5653[_loc3_]);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function _5650() : void
      {
         var _loc1_:_56 = null;
         var _loc2_:_57 = null;
         var _loc3_:_67 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(this._2060)
         {
            this._5653 = new Vector.<_645>();
            this._5655 = new Dictionary();
            _loc4_ = 0;
            _loc5_ = int(this._2060._2062.length);
            while(_loc4_ < _loc5_)
            {
               _loc1_ = this._2060._2062[_loc4_];
               _loc6_ = 0;
               _loc7_ = int(_loc1_.tracks.length);
               while(_loc6_ < _loc7_)
               {
                  _loc2_ = _loc1_.tracks[_loc6_];
                  _loc8_ = 0;
                  _loc9_ = int(_loc2_.tweens.length);
                  while(_loc8_ < _loc9_)
                  {
                     _loc3_ = _loc2_.tweens[_loc8_];
                     this._5652(_loc2_,_loc3_);
                     _loc8_++;
                  }
                  _loc6_++;
               }
               _loc4_++;
            }
         }
      }
      
      private function _5652(param1:_57, param2:_67) : void
      {
         var _loc3_:_645 = this._3116(param2._1836,param2._1837);
         _loc3_._5652(param1,param2);
      }
      
      public function _3116(param1:_52, param2:_79) : _645
      {
         var _loc3_:_645 = null;
         _loc3_ = this._5655[param1] as _645;
         if(_loc3_ == null)
         {
            _loc3_ = new _645(this,param2,param1);
            this._5655[param1] = _loc3_;
            this._5653.push(_loc3_);
         }
         return _loc3_;
      }
      
      public function _3089() : Vector.<_645>
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Vector.<_645> = new Vector.<_645>();
         _loc2_ = 0;
         _loc3_ = int(this._5654.length);
         while(_loc2_ < _loc3_)
         {
            if(this._5651(this._5654[_loc2_]))
            {
               _loc1_.push(this._5654[_loc2_]);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function _5651(param1:_645) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_646 = null;
         var _loc7_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc8_:Vector.<_646> = param1.tracks;
         _loc2_ = 0;
         _loc3_ = int(_loc8_.length - 1);
         while(_loc2_ < _loc3_)
         {
            _loc5_ = _loc3_ - _loc2_;
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               _loc9_ = _loc8_[_loc4_].track._2070.index;
               _loc10_ = _loc8_[_loc4_ + 1].track._2070.index;
               if(_loc9_ == _loc10_)
               {
                  _loc11_ = _loc8_[_loc4_].track.index;
                  _loc12_ = _loc8_[_loc4_ + 1].track.index;
               }
               if(_loc9_ > _loc10_ || _loc9_ == _loc10_ && _loc11_ > _loc12_)
               {
                  _loc7_ = true;
                  _loc6_ = _loc8_[_loc4_];
                  _loc8_[_loc4_] = _loc8_[_loc4_ + 1];
                  _loc8_[_loc4_ + 1] = _loc6_;
               }
               _loc4_++;
            }
            _loc2_++;
         }
         return _loc7_;
      }
   }
}

