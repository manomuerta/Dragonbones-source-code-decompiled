package _73
{
   public class DBEnumBase
   {
      public static var _1665:Object = {};
      
      protected var _value:String;
      
      public function DBEnumBase(param1:String)
      {
         super();
         this._value = param1;
         _1665[param1] = this;
      }
      
      public function toString() : String
      {
         return this._value;
      }
   }
}

