package _73
{
   public class _11221 extends DBEnumBase
   {
      protected namespace __internal;
      
      protected var _tag:int;
      
      public function _11221(param1:String, param2:int = -100)
      {
         super(param1);
         var _loc3_:Class = (this as Object).constructor;
         var _loc4_:Object = _loc3_._enums;
         if(param2 <= -100)
         {
            this._tag = int(_loc3_._count++);
         }
         else
         {
            this._tag = param2;
         }
         if(_loc4_[this._tag])
         {
            throw new Error();
         }
         _loc4_[this._tag] = this;
      }
      
      public function get tag() : int
      {
         return this._tag;
      }
      
      public function _11285(param1:int) : _11221
      {
         var _loc2_:Class = (this as Object).constructor;
         return _loc2_._enums[param1];
      }
   }
}

