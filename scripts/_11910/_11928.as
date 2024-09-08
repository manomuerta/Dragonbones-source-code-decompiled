package _11910
{
   import _11845._11949;
   
   public class _11928 extends _11944
   {
      public static const API:Number = 2;
      
      protected var _12340:Array;
      
      public function _11928()
      {
         super("hexColors");
         _12295 = [];
         this._12340 = [];
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         var _loc4_:String = null;
         for(_loc4_ in param2)
         {
            this._12338(param1,_loc4_,uint(param2[_loc4_]));
         }
         return true;
      }
      
      public function _12338(param1:Object, param2:String, param3:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc4_:* = typeof param1[param2] == "function";
         var _loc5_:uint;
         if((_loc5_ = !_loc4_ ? uint(param1[param2]) : uint(param1[Boolean(param2.indexOf("set")) || !("get" + param2.substr(3) in param1) ? param2 : "get" + param2.substr(3)]())) != param3)
         {
            _loc6_ = uint(_loc5_ >> 16);
            _loc7_ = uint(_loc5_ >> 8 & 0xFF);
            _loc8_ = uint(_loc5_ & 0xFF);
            this._12340[this._12340.length] = new ColorProp(param1,param2,_loc4_,_loc6_,(param3 >> 16) - _loc6_,_loc7_,(param3 >> 8 & 0xFF) - _loc7_,_loc8_,(param3 & 0xFF) - _loc8_);
            _12295[_12295.length] = param2;
         }
      }
      
      override public function _12037(param1:Object) : Boolean
      {
         var _loc2_:int = int(this._12340.length);
         while(_loc2_--)
         {
            if(param1[this._12340[_loc2_].p] != null)
            {
               this._12340.splice(_loc2_,1);
            }
         }
         return super._12037(param1);
      }
      
      override public function setRatio(param1:Number) : void
      {
         var _loc3_:ColorProp = null;
         var _loc4_:Number = NaN;
         var _loc2_:int = int(this._12340.length);
         while(--_loc2_ > -1)
         {
            _loc3_ = this._12340[_loc2_];
            _loc4_ = _loc3_.rs + param1 * _loc3_.rc << 16 | _loc3_.gs + param1 * _loc3_.gc << 8 | _loc3_.bs + param1 * _loc3_.bc;
            if(_loc3_.f)
            {
               _loc3_.t[_loc3_.p](_loc4_);
            }
            else
            {
               _loc3_.t[_loc3_.p] = _loc4_;
            }
         }
      }
   }
}

class ColorProp
{
   public var t:Object;
   
   public var p:String;
   
   public var f:Boolean;
   
   public var rs:int;
   
   public var rc:int;
   
   public var gs:int;
   
   public var gc:int;
   
   public var bs:int;
   
   public var bc:int;
   
   public function ColorProp(param1:Object, param2:String, param3:Boolean, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int)
   {
      super();
      this.t = param1;
      this.p = param2;
      this.f = param3;
      this.rs = param4;
      this.rc = param5;
      this.gs = param6;
      this.gc = param7;
      this.bs = param8;
      this.bc = param9;
   }
}

