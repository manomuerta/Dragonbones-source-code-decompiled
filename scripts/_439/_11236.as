package _439
{
   import _1404._1407;
   import _40._44;
   import _555._570;
   import _93._92;
   
   public class _11236 extends _92
   {
      public function _11236()
      {
         super();
         this._2219 = true;
         this._2215 = true;
      }
      
      override protected function _2211() : *
      {
         return this._2223;
      }
      
      override public function revert() : void
      {
         var _loc1_:_44 = this._1634[0];
         var _loc2_:int = int(this._1634[1]);
         var _loc3_:* = this._1634[3];
         if(_loc1_)
         {
            switch(_loc2_)
            {
               case 0:
                  if(_loc3_ == null)
                  {
                     _loc1_.event.ints.length = 0;
                  }
                  else
                  {
                     _loc1_.event.ints[0] = _loc3_;
                  }
                  break;
               case 1:
                  if(_loc3_ == null)
                  {
                     _loc1_.event.floats.length = 0;
                  }
                  else
                  {
                     _loc1_.event.floats[0] = _loc3_;
                  }
                  break;
               case 2:
                  if(_loc3_ == null)
                  {
                     _loc1_.event.strings.length = 0;
                  }
                  else
                  {
                     _loc1_.event.strings[0] = _loc3_;
                  }
                  break;
               case 3:
                  _loc1_.event.bone = _loc3_;
            }
         }
         this._11314();
      }
      
      override public function execute() : void
      {
         var _loc4_:Number = NaN;
         var _loc1_:_44 = this._2223[0];
         var _loc2_:int = int(this._2223[1]);
         var _loc3_:* = this._2223[2];
         if(Boolean(_loc1_) && Boolean(_loc1_.event))
         {
            switch(_loc2_)
            {
               case 0:
                  this._1634[3] = _loc1_.event.ints[0];
                  if(_loc3_)
                  {
                     _loc1_.event.ints[0] = int(_loc3_);
                  }
                  else
                  {
                     _loc1_.event.ints.length = 0;
                  }
                  break;
               case 1:
                  this._1634[3] = _loc1_.event.floats[0];
                  if(_loc3_)
                  {
                     _loc4_ = Number(_loc3_);
                     _loc1_.event.floats[0] = isNaN(_loc4_) ? 0 : _loc4_;
                  }
                  else
                  {
                     _loc1_.event.floats.length = 0;
                  }
                  break;
               case 2:
                  this._1634[3] = _loc1_.event.strings[0];
                  if(_loc3_)
                  {
                     _loc1_.event.strings[0] = _loc3_;
                  }
                  else
                  {
                     _loc1_.event.strings.length = 0;
                  }
                  break;
               case 3:
                  this._1634[3] = _loc1_.event.bone;
                  _loc1_.event.bone = _loc3_;
            }
         }
         this._11314();
      }
      
      private function _11314() : void
      {
         var _loc1_:_570 = _1407.getInstance(_570) as _570;
         _loc1_._3396();
      }
   }
}

