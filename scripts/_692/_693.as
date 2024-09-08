package _692
{
   import _724._725;
   import _724._729;
   import flash.utils.Dictionary;
   
   public class _693 extends _691
   {
      public function _693(param1:_725)
      {
         super(param1);
         this._4188();
      }
      
      private function _5835(param1:_725) : _691
      {
         var _loc2_:_691 = null;
         if(param1 is _729)
         {
            _loc2_ = new _693(param1);
            _loc2_.parent = this;
         }
         else
         {
            _loc2_ = new _691(param1);
            _loc2_.parent = this;
         }
         return _loc2_;
      }
      
      private function get _5836() : _729
      {
         return _5831 as _729;
      }
      
      override public function _4188() : Boolean
      {
         var _loc2_:_725 = null;
         var _loc3_:Boolean = false;
         var _loc1_:Dictionary = new Dictionary();
         var _loc4_:int = 0;
         var _loc5_:int = int(_5822.length);
         while(_loc4_ < _loc5_)
         {
            if(_5822[_loc4_] is _691)
            {
               _loc3_ = (_5822[_loc4_] as _691)._4188();
               _loc1_[_5822[_loc4_]._4204] = 1;
            }
            _loc4_++;
         }
         if(Boolean(this._5836) && Boolean(this._5836._5833))
         {
            _loc4_ = 0;
            _loc5_ = int(this._5836._5833.length);
            while(_loc4_ < _loc5_)
            {
               _loc2_ = this._5836._5833[_loc4_];
               if(_loc2_ && !_loc2_.missing && _loc1_[_loc2_] == null)
               {
                  _5822.push(this._5835(_loc2_));
                  _loc1_[_loc2_] = 1;
                  _loc3_ = true;
               }
               _loc4_++;
            }
         }
         _loc4_ = 0;
         _loc5_ = int(_5822.length);
         while(_loc4_ < _loc5_)
         {
            if(Boolean(_5822[_loc4_]) && Boolean(_5822[_loc4_]._4204) && Boolean(_5822[_loc4_]._4204.missing))
            {
               if(this._5837(_5822[_loc4_] as _691))
               {
                  _loc1_[_5822[_loc4_]._4204] = null;
                  delete _loc1_[_5822[_loc4_]._4204];
                  _5822.splice(_loc4_,1);
                  _loc4_--;
                  _loc5_--;
                  _loc3_ = true;
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function _5832(param1:_725) : _691
      {
         var _loc2_:_691 = null;
         var _loc5_:_691 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(children.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = children[_loc3_] as _691;
            if(_loc2_ is _693)
            {
               _loc5_ = (_loc2_ as _693)._5832(param1);
               if(_loc5_ != null)
               {
                  return _loc5_;
               }
            }
            else if(_loc2_._4204 == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function _5834() : void
      {
         var _loc1_:_691 = null;
         var _loc2_:int = 0;
         var _loc3_:int = int(children.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_ = children[_loc2_] as _691;
            if(_loc1_ is _693)
            {
               (_loc1_ as _693)._5834();
            }
            else
            {
               _loc1_.count = 0;
            }
            _loc2_++;
         }
      }
      
      private function _5837(param1:_691) : Boolean
      {
         return true;
      }
   }
}

