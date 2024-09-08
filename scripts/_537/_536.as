package _537
{
   import _40.BoneFrameVO;
   import _40._39;
   import _40._45;
   import _40._47;
   import _40._48;
   import _51._50;
   import _51._79;
   import _676._690;
   import _703._705;
   
   public class _536 extends _538
   {
      public function _536()
      {
         super();
      }
      
      override protected function _3890(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:BoneFrameVO = null;
         var _loc5_:_47 = null;
         _3894.length = 0;
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _3894.push(param1[_loc2_]);
            if(param1[_loc2_] is BoneFrameVO)
            {
               _loc4_ = param1[_loc2_];
               _loc5_ = this._3883(_loc4_);
               if(_loc5_)
               {
                  _3894.push(_loc5_);
               }
            }
            _loc2_++;
         }
         this._3893();
      }
      
      private function _3883(param1:BoneFrameVO) : _47
      {
         var _loc6_:_47 = null;
         if(_3896 == null || _3896._1992 == null || param1 == null || param1._1823 == null || param1._1823._1882 == null)
         {
            return null;
         }
         var _loc2_:_39 = _3896._1992;
         var _loc3_:_50 = _loc2_.rootArmatureData;
         var _loc4_:_79 = param1._1823._1882;
         var _loc5_:_48 = _loc2_._1875(_loc4_);
         if(_loc5_)
         {
            _loc6_ = _loc5_.getFrameByIndex(param1.startPos) as _47;
         }
         return _loc6_;
      }
      
      override protected function _3888(param1:Array, param2:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc6_:BoneFrameVO = null;
         var _loc9_:_47 = null;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc7_:int = 0;
         var _loc8_:int = int(_3894.length);
         while(_loc7_ < _loc8_)
         {
            _loc5_ = int(param1.indexOf(_3894[_loc7_]));
            if(_loc5_ == -1)
            {
               _loc4_.push(_3894[_loc7_]);
            }
            else
            {
               _loc3_.push(param1.splice(_loc5_,1)[0]);
            }
            _loc7_++;
         }
         _loc8_ = int(param1.length);
         _loc7_ = 0;
         while(_loc7_ < _loc8_)
         {
            _loc4_.push(param1[_loc7_]);
            _loc7_++;
         }
         if(!param2)
         {
            _loc8_ = int(_loc3_.length);
            _loc7_ = 0;
            while(_loc7_ < _loc8_)
            {
               _loc4_.push(_loc3_[_loc7_]);
               _loc7_++;
            }
         }
         _3894.length = 0;
         _loc7_ = 0;
         _loc8_ = int(_loc4_.length);
         while(_loc7_ < _loc8_)
         {
            if(_loc4_[_loc7_] is BoneFrameVO)
            {
               _3894.push(_loc4_[_loc7_]);
               _loc6_ = _loc4_[_loc7_];
               _loc9_ = this._3883(_loc6_);
               if(_loc9_)
               {
                  _3894.push(_loc9_);
               }
            }
            _loc7_++;
         }
      }
      
      override public function _3893() : void
      {
         var _loc1_:_45 = null;
         var _loc2_:_690 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(_3887.length);
         while(_loc3_ < _loc4_)
         {
            _3887[_loc3_].selected = false;
            _loc3_++;
         }
         _3887.length = 0;
         _loc3_ = 0;
         _loc4_ = int(_3894.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = _3894[_loc3_] as _45;
            _loc2_ = _705._3137[_loc1_];
            if(_loc2_)
            {
               _loc2_.selected = true;
               _3887.push(_loc2_);
            }
            _loc3_++;
         }
      }
      
      override public function _3895(param1:int) : void
      {
         _3445 = param1;
         var _loc2_:Array = _3896._3882(param1);
         this._3890(_loc2_);
      }
      
      override public function _3891(param1:int, param2:Boolean = true) : void
      {
         if(_3445 != -1 && _3445 > param1)
         {
            _3445 = param1;
         }
         var _loc3_:Array = _3896._3882(param1);
         this._3888(_loc3_,param2);
      }
      
      override public function _3900(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean) : Boolean
      {
         return false;
      }
      
      public function _3885() : BoneFrameVO
      {
         if(_3894.length == 2)
         {
            if(_3894[0] is BoneFrameVO)
            {
               return _3894[0] as BoneFrameVO;
            }
            return _3894[1] as BoneFrameVO;
         }
         return null;
      }
   }
}

