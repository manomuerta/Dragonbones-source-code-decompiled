package _11846
{
   public final class _11847
   {
      public var t:Object;
      
      public var p:String;
      
      public var s:Number;
      
      public var c:Number;
      
      public var f:Boolean;
      
      public var _12040:int;
      
      public var pg:Boolean;
      
      public var n:String;
      
      public var r:Boolean;
      
      public var _next:_11847;
      
      public var _12036:_11847;
      
      public function _11847(param1:Object, param2:String, param3:Number, param4:Number, param5:String, param6:Boolean, param7:_11847 = null, param8:int = 0)
      {
         super();
         this.t = param1;
         this.p = param2;
         this.s = param3;
         this.c = param4;
         this.n = param5;
         this.f = param1[param2] is Function;
         this.pg = param6;
         if(param7)
         {
            param7._12036 = this;
            this._next = param7;
         }
         this._12040 = param8;
      }
   }
}

