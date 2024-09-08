package _11910
{
   import _11845._11949;
   
   public class _11920 extends _11944
   {
      public static const API:Number = 2;
      
      protected var _12336:Array;
      
      protected var _12307:Boolean;
      
      protected var _info:Array;
      
      public function _11920()
      {
         this._info = [];
         super("endArray");
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         if(!(param1 is Array) || !(param2 is Array))
         {
            return false;
         }
         this._init(param1 as Array,param2);
         return true;
      }
      
      public function _init(param1:Array, param2:Array) : void
      {
         this._12336 = param1;
         var _loc3_:int = int(param2.length);
         var _loc4_:int = 0;
         while(--_loc3_ > -1)
         {
            if(param1[_loc3_] != param2[_loc3_] && param1[_loc3_] != null)
            {
               var _loc5_:*;
               this._info[_loc5_ = _loc4_++] = new ArrayTweenInfo(_loc3_,this._12336[_loc3_],param2[_loc3_] - this._12336[_loc3_]);
            }
         }
      }
      
      override public function _12299(param1:Object, param2:Boolean = true) : void
      {
         if("endArray" in param1)
         {
            this._12307 = param2;
         }
      }
      
      override public function setRatio(param1:Number) : void
      {
         var _loc3_:ArrayTweenInfo = null;
         var _loc4_:Number = NaN;
         var _loc2_:int = int(this._info.length);
         if(this._12307)
         {
            while(--_loc2_ > -1)
            {
               _loc3_ = this._info[_loc2_];
               this._12336[_loc3_.i] = (_loc4_ = _loc3_.c * param1 + _loc3_.s) > 0 ? _loc4_ + 0.5 >> 0 : _loc4_ - 0.5 >> 0;
            }
         }
         else
         {
            while(--_loc2_ > -1)
            {
               _loc3_ = this._info[_loc2_];
               this._12336[_loc3_.i] = _loc3_.c * param1 + _loc3_.s;
            }
         }
      }
   }
}

class ArrayTweenInfo
{
   public var i:uint;
   
   public var s:Number;
   
   public var c:Number;
   
   public function ArrayTweenInfo(param1:uint, param2:Number, param3:Number)
   {
      super();
      this.i = param1;
      this.s = param2;
      this.c = param3;
   }
}

