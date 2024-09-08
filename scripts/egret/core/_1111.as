package egret.core
{
   public class _1111
   {
      private var _8654:Object;
      
      private var _8653:Object;
      
      private var _8656:Array;
      
      public function _1111()
      {
         this._8654 = {};
         this._8653 = {};
         this._8656 = [];
         super();
      }
      
      public function get formats() : Array
      {
         return this._8656;
      }
      
      public function addData(param1:Object, param2:String) : void
      {
         this._8656.push(param2);
         this._8654[param2] = param1;
      }
      
      public function _8655(param1:Function, param2:String) : void
      {
         this._8656.push(param2);
         this._8653[param2] = param1;
      }
      
      public function _4508(param1:String) : Object
      {
         var _loc2_:Object = this._8654[param1];
         if(_loc2_)
         {
            return _loc2_;
         }
         if(this._8653[param1])
         {
            return this._8653[param1]();
         }
         return null;
      }
      
      public function hasFormat(param1:String) : Boolean
      {
         var _loc2_:int = int(this._8656.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._8656[_loc3_] == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
   }
}

