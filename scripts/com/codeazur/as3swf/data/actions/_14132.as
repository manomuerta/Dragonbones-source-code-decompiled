package com.codeazur.as3swf.data.actions
{
   public class _14132
   {
      protected var _actions:Vector.<IAction>;
      
      protected var _14984:Array;
      
      public var _14978:uint;
      
      public var _14983:String;
      
      public function _14132(param1:Vector.<IAction>, param2:Array, param3:uint)
      {
         var _loc5_:IAction = null;
         var _loc6_:_14133 = null;
         super();
         this._actions = param1;
         this._14984 = param2;
         this._14978 = param3;
         this._14983 = null;
         var _loc4_:uint = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = param1[_loc4_];
            if(_loc5_ is _14133)
            {
               _loc6_ = _loc5_ as _14133;
               if(_loc6_._14977 == -1)
               {
                  this._14983 = "L" + (param3 + 1);
                  break;
               }
            }
            _loc4_++;
         }
      }
      
      public function get actions() : Vector.<IAction>
      {
         return this._actions;
      }
      
      public function get _14985() : Array
      {
         return this._14984;
      }
   }
}

