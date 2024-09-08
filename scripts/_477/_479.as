package _477
{
   import _176._175;
   import _51._50;
   import _51._70;
   import _51._71;
   import _51._79;
   import _609._621;
   import _721._720;
   
   public class _479 extends _494
   {
      public function _479()
      {
         super();
      }
      
      override public function run() : void
      {
         _175._2656(_3238.dragonBonesVO,_3238.targetType == _720.TARGET_ALL ? null : _3238._10711,this._3612);
      }
      
      private function _3612(param1:Array) : void
      {
         this._11577(param1);
         _3613._3609.images = param1;
         _3613._3609._3608.images = param1;
         _3613._3609.type = _621.TYPE_DRAGONBONES;
         _3613._3609._3610 = false;
         _3613._3609._3611 = false;
         complete();
      }
      
      private function _11577(param1:Array) : void
      {
         var _loc2_:_50 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_79 = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:_70 = null;
         var _loc11_:Object = null;
         var _loc12_:_71 = _3238.dragonBonesVO;
         var _loc13_:Object = {};
         if(Boolean(_loc12_) && Boolean(_loc12_._2126))
         {
            _loc3_ = 0;
            _loc4_ = int(_loc12_._2126.length);
            while(_loc3_ < _loc4_)
            {
               _loc2_ = _loc12_._2126[_loc3_];
               if(Boolean(_loc2_) && Boolean(_loc2_._1780))
               {
                  _loc5_ = 0;
                  _loc6_ = int(_loc2_._1780.length);
                  while(_loc5_ < _loc6_)
                  {
                     _loc7_ = _loc2_._1780[_loc5_] as _79;
                     if((_loc7_) && _loc7_._1715 && Boolean(_loc7_._1765))
                     {
                        _loc8_ = 0;
                        _loc9_ = int(_loc7_._1715.length);
                        while(_loc8_ < _loc9_)
                        {
                           _loc10_ = _loc7_._1765[_loc7_._1715[_loc8_]];
                           if(_loc10_._2165)
                           {
                              _loc13_[_loc10_.name] = 1;
                           }
                           _loc8_++;
                        }
                     }
                     _loc5_++;
                  }
               }
               _loc3_++;
            }
         }
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            _loc11_ = param1[_loc3_];
            if(_loc13_[_loc11_.name])
            {
               _loc11_._2165 = true;
            }
            _loc3_++;
         }
      }
   }
}

