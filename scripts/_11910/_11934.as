package _11910
{
   import _11845._11949;
   import _11846._11847;
   
   public class _11934 extends _11944
   {
      public static const API:Number = 2;
      
      protected var _12318:_11949;
      
      public function _11934()
      {
         super("roundProps",-1);
         _12295.length = 0;
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         this._12318 = param3;
         return true;
      }
      
      public function _onInitAllProps() : Boolean
      {
         var _loc5_:String = null;
         var _loc6_:_11847 = null;
         var _loc7_:_11847 = null;
         var _loc1_:Array = this._12318.vars.roundProps is Array ? this._12318.vars.roundProps : this._12318.vars.roundProps.split(",");
         var _loc2_:int = int(_loc1_.length);
         var _loc3_:Object = {};
         var _loc4_:_11847 = this._12318._12345.roundProps;
         while(--_loc2_ > -1)
         {
            _loc3_[_loc1_[_loc2_]] = 1;
         }
         _loc2_ = int(_loc1_.length);
         while(--_loc2_ > -1)
         {
            _loc5_ = _loc1_[_loc2_];
            _loc6_ = this._12318._12334;
            while(_loc6_)
            {
               _loc7_ = _loc6_._next;
               if(_loc6_.pg)
               {
                  _loc6_.t._12299(_loc3_,true);
               }
               else if(_loc6_.n == _loc5_)
               {
                  this._12346(_loc6_.t,_loc5_,_loc6_.s,_loc6_.c);
                  if(_loc7_)
                  {
                     _loc7_._12036 = _loc6_._12036;
                  }
                  if(_loc6_._12036)
                  {
                     _loc6_._12036._next = _loc7_;
                  }
                  else if(this._12318._12334 == _loc6_)
                  {
                     this._12318._12334 = _loc7_;
                  }
                  _loc6_._next = _loc6_._12036 = null;
                  this._12318._12345[_loc5_] = _loc4_;
               }
               _loc6_ = _loc7_;
            }
         }
         return false;
      }
      
      public function _12346(param1:Object, param2:String, param3:Number, param4:Number) : void
      {
         _12285(param1,param2,param3,param3 + param4,param2,true);
         _12295[_12295.length] = param2;
      }
   }
}

