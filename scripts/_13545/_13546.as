package _13545
{
   import _13503._13502;
   import _13505._13504;
   import _13505._13508;
   import _51._52;
   import _51._79;
   import _703._702;
   import _703._705;
   
   public class _13546 extends _13544
   {
      public function _13546(param1:_13502)
      {
         super(param1);
      }
      
      public static function _3996(param1:_702, param2:_13502) : _13546
      {
         var _loc3_:_13546 = _705._13780(param2);
         _loc3_.parent = param1;
         return _loc3_;
      }
      
      override public function _13785() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_52 = null;
         var _loc8_:_79 = null;
         var _loc9_:_13504 = null;
         var _loc10_:_13508 = null;
         var _loc11_:_13548 = null;
         var _loc12_:_13548 = null;
         var _loc13_:_13548 = null;
         var _loc14_:_13548 = null;
         var _loc15_:_13548 = null;
         var _loc16_:_13548 = null;
         var _loc17_:_13548 = null;
         var _loc18_:_13548 = null;
         var _loc19_:_13548 = null;
         this.children.length = 0;
         _loc1_ = 0;
         _loc2_ = int(_1992._1746.length);
         while(_loc1_ < _loc2_)
         {
            _loc7_ = _13504(_1992._1746[_loc1_])._1823;
            if(_loc7_.parentBoneData != null)
            {
               _loc9_ = _1992._1746[_loc1_] as _13504;
               (_loc11_ = _705._13820(_loc9_))._2713 = true;
               _loc11_.parent = this;
               _loc11_.children.length = 0;
               (_loc12_ = _705._13820(_loc9_._13581)).parent = _loc11_;
               _loc11_.children.push(_loc12_);
               (_loc13_ = _705._13820(_loc9_._13586)).parent = _loc11_;
               _loc11_.children.push(_loc13_);
               (_loc14_ = _705._13820(_loc9_._13598)).parent = _loc11_;
               _loc11_.children.push(_loc14_);
               _loc3_ = 0;
               _loc4_ = int(_1992._1745.length);
               while(_loc3_ < _loc4_)
               {
                  if(_13508(_1992._1745[_loc3_])._1824.parentBoneData == _loc7_)
                  {
                     _loc8_ = _13508(_1992._1745[_loc3_])._1824;
                     _loc10_ = _1992._1745[_loc3_];
                     (_loc15_ = _705._13820(_loc10_)).parent = _loc11_;
                     _loc15_.children.length = 0;
                     (_loc16_ = _705._13820(_loc10_._13599)).parent = _loc15_;
                     _loc15_.children.push(_loc16_);
                     (_loc17_ = _705._13820(_loc10_._13572)).parent = _loc15_;
                     _loc15_.children.push(_loc17_);
                     (_loc18_ = _705._13820(_loc10_._13592)).parent = _loc15_;
                     _loc15_.children.push(_loc18_);
                     _loc11_.children.push(_loc15_);
                  }
                  _loc3_++;
               }
               _5822.push(_loc11_);
            }
            _loc1_++;
         }
         _5822.sort(this._5815);
         if(_1992._13597)
         {
            (_loc19_ = _705._13820(_1992._13597)).parent = this;
            _5822.push(_loc19_);
         }
      }
      
      private function _5815(param1:_13548, param2:_13548) : int
      {
         var _loc3_:_79 = (param1._1945 as _13504)._1823._1882;
         var _loc4_:_79 = (param2._1945 as _13504)._1823._1882;
         if(_loc3_.zOrder > _loc4_.zOrder)
         {
            return -1;
         }
         return 1;
      }
   }
}

