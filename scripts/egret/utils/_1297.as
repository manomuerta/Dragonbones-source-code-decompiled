package egret.utils
{
   import _1045._1085;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import flash.utils.getQualifiedClassName;
   
   public class _1297
   {
      private static var _9090:Dictionary = new Dictionary();
      
      private static var _8743:Vector.<String> = new <String>["Number","int","String","Boolean","uint","Object"];
      
      public function _1297()
      {
         super();
      }
      
      public static function _8350(param1:_1085) : Vector.<String>
      {
         var _loc4_:XML = null;
         var _loc6_:String = null;
         var _loc2_:String = getQualifiedClassName(param1);
         if(_9090[_loc2_])
         {
            return _9090[_loc2_];
         }
         var _loc3_:XML = describeType(param1);
         var _loc5_:Vector.<String> = new Vector.<String>();
         for each(_loc4_ in _loc3_.variable)
         {
            _loc6_ = _loc4_.@name.toString();
            if(_8743.indexOf(_loc4_.@type.toString()) == -1)
            {
               _loc5_.push(_loc6_);
            }
         }
         _9090[_loc2_] = _loc5_;
         return _loc5_;
      }
   }
}

