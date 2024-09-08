package _11910
{
   import _11845._11949;
   import _11846._11847;
   
   public class _11944
   {
      public static const version:String = "12.1.5";
      
      public static const API:Number = 2;
      
      public var _12315:String;
      
      public var _12295:Array;
      
      public var _priority:int = 0;
      
      protected var _12334:_11847;
      
      public function _11944(param1:String = "", param2:int = 0)
      {
         super();
         this._12295 = param1.split(",");
         this._12315 = this._12295[0];
         this._priority = param2 || 0;
      }
      
      private static function _12367(param1:String, param2:_11949) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:_11847 = null;
         var _loc6_:_11847 = null;
         var _loc7_:_11847 = null;
         var _loc8_:_11847 = null;
         var _loc3_:_11847 = param2._12334;
         if(param1 == "_onInitAllProps")
         {
            while(_loc3_)
            {
               _loc8_ = _loc3_._next;
               _loc5_ = _loc6_;
               while(Boolean(_loc5_) && _loc5_._12040 > _loc3_._12040)
               {
                  _loc5_ = _loc5_._next;
               }
               if(_loc3_._12036 = !!_loc5_ ? _loc5_._12036 : _loc7_)
               {
                  _loc3_._12036._next = _loc3_;
               }
               else
               {
                  _loc6_ = _loc3_;
               }
               if(_loc3_._next = _loc5_)
               {
                  _loc5_._12036 = _loc3_;
               }
               else
               {
                  _loc7_ = _loc3_;
               }
               _loc3_ = _loc8_;
            }
            _loc3_ = param2._12334 = _loc6_;
         }
         while(_loc3_)
         {
            if(_loc3_.pg)
            {
               if(param1 in _loc3_.t)
               {
                  if(_loc3_.t[param1]())
                  {
                     _loc4_ = true;
                  }
               }
            }
            _loc3_ = _loc3_._next;
         }
         return _loc4_;
      }
      
      public static function activate(param1:Array) : Boolean
      {
         _11949._12366 = _11944._12367;
         var _loc2_:int = int(param1.length);
         while(--_loc2_ > -1)
         {
            if(param1[_loc2_].API == _11944.API)
            {
               _11949._12047[new (param1[_loc2_] as Class)()._12315] = param1[_loc2_];
            }
         }
         return true;
      }
      
      public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         return false;
      }
      
      protected function _12285(param1:Object, param2:String, param3:Number, param4:*, param5:String = null, param6:Boolean = false) : _11847
      {
         var _loc7_:Number = param4 == null ? 0 : (typeof param4 === "number" || param4.charAt(1) !== "=" ? Number(param4) - param3 : int(param4.charAt(0) + "1") * Number(param4.substr(2)));
         if(_loc7_ !== 0)
         {
            this._12334 = new _11847(param1,param2,param3,_loc7_,param5 || param2,false,this._12334);
            this._12334.r = param6;
            return this._12334;
         }
         return null;
      }
      
      public function setRatio(param1:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:_11847 = this._12334;
         while(_loc2_)
         {
            _loc3_ = _loc2_.c * param1 + _loc2_.s;
            if(_loc2_.r)
            {
               _loc3_ = _loc3_ + (_loc3_ > 0 ? 0.5 : -0.5) | 0;
            }
            if(_loc2_.f)
            {
               _loc2_.t[_loc2_.p](_loc3_);
            }
            else
            {
               _loc2_.t[_loc2_.p] = _loc3_;
            }
            _loc2_ = _loc2_._next;
         }
      }
      
      public function _12299(param1:Object, param2:Boolean = true) : void
      {
         var _loc3_:_11847 = this._12334;
         while(_loc3_)
         {
            if(this._12315 in param1 || _loc3_.n != null && _loc3_.n.split(this._12315 + "_").join("") in param1)
            {
               _loc3_.r = param2;
            }
            _loc3_ = _loc3_._next;
         }
      }
      
      public function _12037(param1:Object) : Boolean
      {
         var _loc3_:int = 0;
         if(this._12315 in param1)
         {
            this._12295 = [];
         }
         else
         {
            _loc3_ = int(this._12295.length);
            while(--_loc3_ > -1)
            {
               if(this._12295[_loc3_] in param1)
               {
                  this._12295.splice(_loc3_,1);
               }
            }
         }
         var _loc2_:_11847 = this._12334;
         while(_loc2_)
         {
            if(_loc2_.n in param1)
            {
               if(_loc2_._next)
               {
                  _loc2_._next._12036 = _loc2_._12036;
               }
               if(_loc2_._12036)
               {
                  _loc2_._12036._next = _loc2_._next;
                  _loc2_._12036 = null;
               }
               else if(this._12334 == _loc2_)
               {
                  this._12334 = _loc2_._next;
               }
            }
            _loc2_ = _loc2_._next;
         }
         return false;
      }
   }
}

