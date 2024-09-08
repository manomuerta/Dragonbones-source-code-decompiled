package _1088
{
   import _1045._1085;
   import egret.core._1119;
   import egret.core._1125;
   import flash.utils.getDefinitionByName;
   
   public class _1090 implements _1125
   {
      public function _1090()
      {
         super();
      }
      
      public function _8355(param1:Object, param2:_1085) : Object
      {
         var _loc3_:Object = null;
         if(!param1)
         {
            return null;
         }
         if(param1 is Class)
         {
            return new param1();
         }
         if(param1 is _1119)
         {
            return _1119(param1).getInstance();
         }
         if(param1 is String)
         {
            _loc3_ = getDefinitionByName(param1 as String);
            if(_loc3_)
            {
               return new _loc3_();
            }
            return null;
         }
         return param1;
      }
   }
}

