package _11852
{
   public class _11866
   {
      protected static var _12053:Array = [0,0,1,1];
      
      protected var _12056:Function;
      
      protected var _params:Array;
      
      protected var _12051:Number;
      
      protected var _12052:Number;
      
      protected var _12057:Number;
      
      public var _type:int;
      
      public var _12055:int;
      
      public var _12054:Boolean;
      
      public function _11866(param1:Function = null, param2:Array = null, param3:Number = 0, param4:Number = 0)
      {
         super();
         this._12056 = param1;
         this._params = !!param2 ? _12053.concat(param2) : _12053;
         this._type = param3;
         this._12055 = param4;
      }
      
      public function _12050(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         if(this._12056 != null)
         {
            this._params[0] = param1;
            return this._12056.apply(null,this._params);
         }
         _loc2_ = this._type == 1 ? 1 - param1 : (this._type == 2 ? param1 : (param1 < 0.5 ? param1 * 2 : (1 - param1) * 2));
         if(this._12055 == 1)
         {
            _loc2_ *= _loc2_;
         }
         else if(this._12055 == 2)
         {
            _loc2_ *= _loc2_ * _loc2_;
         }
         else if(this._12055 == 3)
         {
            _loc2_ *= _loc2_ * _loc2_ * _loc2_;
         }
         else if(this._12055 == 4)
         {
            _loc2_ *= _loc2_ * _loc2_ * _loc2_ * _loc2_;
         }
         return this._type == 1 ? 1 - _loc2_ : (this._type == 2 ? _loc2_ : (param1 < 0.5 ? _loc2_ / 2 : 1 - _loc2_ / 2));
      }
   }
}

