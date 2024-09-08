package _13545
{
   import _13503._13502;
   import _13505._13504;
   import _13505._13507;
   import _13505._13508;
   import _13505._14035;
   import _51._52;
   import _51._77;
   import _51._79;
   import _703._702;
   import _703._705;
   
   public class _13544 extends _13548
   {
      public var _1992:_13502;
      
      private var _13926:Array;
      
      public function _13544(param1:_13502)
      {
         super(param1);
         this._1992 = param1;
         this._13926 = [];
      }
      
      public static function _3996(param1:_702, param2:_13502) : _13544
      {
         var _loc3_:_13544 = _705._13784(param2);
         _loc3_.parent = param1;
         return _loc3_;
      }
      
      override public function _13839() : void
      {
         var _loc1_:Array = null;
         clearFrames();
         if(_1945 is _13502)
         {
            _loc1_ = this._13926;
            _13927(_loc1_);
         }
         frames.source = _13928;
         frames.refresh();
      }
      
      public function _13785() : void
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
         var _loc19_:_77 = null;
         var _loc20_:_14035 = null;
         var _loc21_:_13548 = null;
         var _loc22_:_13548 = null;
         var _loc23_:_13548 = null;
         this.children.length = 0;
         this._13926.length = 0;
         _loc1_ = 0;
         _loc2_ = int(this._1992._1746.length);
         while(_loc1_ < _loc2_)
         {
            _loc7_ = _13504(this._1992._1746[_loc1_])._1823;
            _loc9_ = this._1992._1746[_loc1_] as _13504;
            (_loc11_ = _705._13820(_loc9_)).parent = this;
            _loc11_.children.length = 0;
            (_loc12_ = _705._13820(_loc9_._13581)).parent = _loc11_;
            _loc11_.children.push(_loc12_);
            (_loc13_ = _705._13820(_loc9_._13586)).parent = _loc11_;
            _loc11_.children.push(_loc13_);
            (_loc14_ = _705._13820(_loc9_._13598)).parent = _loc11_;
            _loc11_.children.push(_loc14_);
            this._13926.push(_loc9_._13581);
            this._13926.push(_loc9_._13586);
            this._13926.push(_loc9_._13598);
            _loc3_ = 0;
            _loc4_ = int(this._1992._1745.length);
            while(_loc3_ < _loc4_)
            {
               if(_13508(this._1992._1745[_loc3_])._1824.parentBoneData == _loc7_)
               {
                  _loc8_ = _13508(this._1992._1745[_loc3_])._1824;
                  _loc10_ = this._1992._1745[_loc3_];
                  (_loc15_ = _705._13820(_loc10_)).parent = _loc11_;
                  _loc15_.children.length = 0;
                  (_loc16_ = _705._13820(_loc10_._13599)).parent = _loc15_;
                  _loc15_.children.push(_loc16_);
                  (_loc17_ = _705._13820(_loc10_._13572)).parent = _loc15_;
                  _loc15_.children.push(_loc17_);
                  _loc11_.children.push(_loc15_);
                  this._13926.push(_loc10_._13599);
                  this._13926.push(_loc10_._13572);
                  _loc5_ = 0;
                  _loc6_ = int(this._1992._1753.length);
                  while(_loc5_ < _loc6_)
                  {
                     if(_13507(this._1992._1753[_loc5_])._1826._1760 == _loc8_)
                     {
                        (_loc18_ = _705._13820(this._1992._1753[_loc5_])).parent = _loc11_;
                        this._13926.push(this._1992._1753[_loc5_]);
                        _loc11_.children.push(_loc18_);
                     }
                     _loc5_++;
                  }
               }
               _loc3_++;
            }
            _5822.push(_loc11_);
            _loc1_++;
         }
         if(this._1992._14271)
         {
            _loc1_ = 0;
            _loc2_ = int(this._1992._14271.length);
            while(_loc1_ < _loc2_)
            {
               _loc20_ = this._1992._14271[_loc1_];
               _loc19_ = _loc20_._2942;
               this._13926.push(_loc20_);
               _loc21_ = _705._13820(_loc20_);
               _5822.push(_loc21_);
               _loc1_++;
            }
         }
         if(this._1992._13597)
         {
            (_loc22_ = _705._13820(this._1992._13597)).parent = this;
            _5822.push(_loc22_);
            this._13926.push(this._1992._13597);
         }
         if(this._1992._10657)
         {
            (_loc23_ = _705._13820(this._1992._10657)).parent = this;
            _5822.push(_loc23_);
            this._13926.push(this._1992._10657);
         }
         this._13839();
      }
      
      public function get _4642() : int
      {
         return this._1992.duration;
      }
      
      public function _11633(param1:Vector.<_52>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:_52 = null;
         var _loc10_:_79 = null;
         var _loc11_:_13504 = null;
         var _loc12_:_13508 = null;
         var _loc13_:_13548 = null;
         var _loc14_:_13548 = null;
         var _loc15_:_13548 = null;
         var _loc16_:_13548 = null;
         var _loc17_:_13548 = null;
         var _loc18_:_13548 = null;
         var _loc19_:_13548 = null;
         var _loc20_:_13548 = null;
         var _loc21_:_77 = null;
         var _loc22_:_14035 = null;
         var _loc23_:_13548 = null;
         var _loc24_:Boolean = false;
         var _loc25_:_13548 = null;
         var _loc26_:_13548 = null;
         var _loc2_:Boolean = param1 == null || param1.length == 0;
         this.children.length = 0;
         this._13926.length = 0;
         _loc3_ = 0;
         _loc4_ = int(this._1992._1746.length);
         while(_loc3_ < _loc4_)
         {
            _loc9_ = _13504(this._1992._1746[_loc3_])._1823;
            if(_loc2_ || param1.indexOf(_loc9_) != -1)
            {
               _loc11_ = this._1992._1746[_loc3_] as _13504;
               (_loc13_ = _705._13820(_loc11_)).parent = this;
               _loc13_.children.length = 0;
               if(_loc11_._13581._1816.length > 0)
               {
                  (_loc14_ = _705._13820(_loc11_._13581)).parent = _loc13_;
                  _loc13_.children.push(_loc14_);
               }
               if(_loc11_._13586._1816.length > 0)
               {
                  (_loc15_ = _705._13820(_loc11_._13586)).parent = _loc13_;
                  _loc13_.children.push(_loc15_);
               }
               if(_loc11_._13598._1816.length > 0)
               {
                  (_loc16_ = _705._13820(_loc11_._13598)).parent = _loc13_;
                  _loc13_.children.push(_loc16_);
               }
               this._13926.push(_loc11_._13581);
               this._13926.push(_loc11_._13586);
               this._13926.push(_loc11_._13598);
               _loc5_ = 0;
               _loc6_ = int(this._1992._1745.length);
               while(_loc5_ < _loc6_)
               {
                  if(_13508(this._1992._1745[_loc5_])._1824.parentBoneData == _loc9_)
                  {
                     _loc10_ = _13508(this._1992._1745[_loc5_])._1824;
                     _loc12_ = this._1992._1745[_loc5_];
                     (_loc17_ = _705._13820(_loc12_)).parent = _loc13_;
                     _loc17_.children.length = 0;
                     if(_loc12_._13599._1816.length > 0)
                     {
                        (_loc18_ = _705._13820(_loc12_._13599)).parent = _loc17_;
                        _loc17_.children.push(_loc18_);
                     }
                     if(_loc12_._13572._1816.length > 0)
                     {
                        (_loc19_ = _705._13820(_loc12_._13572)).parent = _loc17_;
                        _loc17_.children.push(_loc19_);
                     }
                     if(_loc17_.children.length > 0)
                     {
                        _loc13_.children.push(_loc17_);
                     }
                     this._13926.push(_loc12_._13599);
                     this._13926.push(_loc12_._13572);
                     _loc7_ = 0;
                     _loc8_ = int(this._1992._1753.length);
                     while(_loc7_ < _loc8_)
                     {
                        if(_13507(this._1992._1753[_loc7_])._1826._1760 == _loc10_)
                        {
                           if(_13507(this._1992._1753[_loc7_])._1816.length > 0)
                           {
                              (_loc20_ = _705._13820(this._1992._1753[_loc7_])).parent = _loc13_;
                              _loc13_.children.push(_loc20_);
                              this._13926.push(this._1992._1753[_loc7_]);
                           }
                        }
                        _loc7_++;
                     }
                  }
                  _loc5_++;
               }
               if(_loc13_.children.length > 0)
               {
                  _5822.push(_loc13_);
               }
            }
            _loc3_++;
         }
         if(this._1992._14271)
         {
            _loc3_ = 0;
            _loc4_ = int(this._1992._14271.length);
            while(_loc3_ < _loc4_)
            {
               _loc22_ = this._1992._14271[_loc3_];
               _loc21_ = _loc22_._2942;
               if(_loc22_ && _loc21_ && _loc22_._1816.length > 0)
               {
                  if(_loc2_)
                  {
                     _loc23_ = _705._13820(_loc22_);
                     _5822.push(_loc23_);
                     this._13926.push(_loc22_);
                  }
                  else
                  {
                     _loc24_ = false;
                     _loc5_ = 0;
                     _loc6_ = int(param1.length);
                     while(_loc5_ < _loc6_)
                     {
                        if(_loc21_._14305(param1[_loc5_]))
                        {
                           _loc24_ = true;
                           break;
                        }
                        _loc5_++;
                     }
                     if(_loc24_)
                     {
                        _loc23_ = _705._13820(_loc22_);
                        _5822.push(_loc23_);
                        this._13926.push(_loc22_);
                     }
                  }
               }
               _loc3_++;
            }
         }
         if(Boolean(this._1992._13597) && (this._1992._13597._1816.length > 0 || _loc2_))
         {
            (_loc25_ = _705._13820(this._1992._13597)).parent = this;
            _5822.push(_loc25_);
            this._13926.push(this._1992._13597);
         }
         if(Boolean(this._1992._10657) && (this._1992._10657._1816.length > 0 || _loc2_))
         {
            (_loc26_ = _705._13820(this._1992._10657)).parent = this;
            _5822.push(_loc26_);
            this._13926.push(this._1992._10657);
         }
         this._13839();
      }
      
      public function _13819(param1:Array) : _52
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_52 = null;
         _loc2_ = 0;
         _loc3_ = int(_5822.length);
         while(_loc2_ < _loc3_)
         {
            if((_5822[_loc2_] as _13548)._1945 is _13504)
            {
               _loc4_ = ((_5822[_loc2_] as _13548)._1945 as _13504)._1823;
               if(param1.indexOf(_loc4_) == -1)
               {
                  return _loc4_;
               }
            }
            _loc2_++;
         }
         return null;
      }
   }
}

