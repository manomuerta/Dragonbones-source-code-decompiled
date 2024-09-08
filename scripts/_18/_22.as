package _18
{
   import _35.HashObject;
   import _73.DBEnumBase;
   import flash.utils.describeType;
   
   public class _22
   {
      public function _22()
      {
         super();
      }
      
      public static function _1625(param1:Array) : Array
      {
         return [];
      }
      
      public static function _1626(param1:Array) : Array
      {
         var _loc3_:IAction = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc2_.push(_1660(_loc3_));
         }
         return _loc2_;
      }
      
      private static function _1659(param1:Object) : IAction
      {
         var _loc2_:IAction = new (_17._1618(param1.type))();
         _loc2_._1642 = _1662(param1._1642[1],param1._1642[0]);
         _loc2_._1634 = _1662(param1._1634[1],param1._1634[0]);
         return _loc2_;
      }
      
      private static function _1660(param1:IAction) : Object
      {
         var _loc2_:Object = {};
         _loc2_.type = _17._1620(param1);
         _loc2_._1642 = _1661(param1._1642);
         _loc2_._1634 = _1661(param1._1634);
         return _loc2_;
      }
      
      private static function _1662(param1:*, param2:String) : *
      {
         var _loc3_:Array = null;
         var _loc4_:* = undefined;
         var _loc5_:Class = null;
         var _loc6_:* = undefined;
         var _loc7_:XML = null;
         var _loc8_:XMLList = null;
         var _loc9_:String = null;
         if(param2 == "")
         {
            return null;
         }
         if(param2 == "Number" || param2 == "String")
         {
            return _17._1619(param2)(param1);
         }
         if(param2 == "Array")
         {
            _loc3_ = [];
            for each(_loc4_ in param1)
            {
               _loc3_.push(_1662(_loc4_[1],_loc4_[0]));
            }
            return _loc3_;
         }
         if(param2 == "HashObject")
         {
            return HashObject._1663(param1);
         }
         if(param2 == "DBEnumBase")
         {
            return DBEnumBase._1665[param1];
         }
         _loc5_ = _17._1619(param2);
         _loc6_ = new _loc5_();
         _loc7_ = describeType(_loc6_);
         _loc8_ = _loc7_.variable;
         for(_loc9_ in param1)
         {
            _loc6_[_loc9_] = _1662(param1[_loc9_][1],param1[_loc9_][0]);
         }
         return _loc6_;
      }
      
      private static function _1661(param1:*) : *
      {
         var _loc4_:Array = null;
         var _loc5_:* = undefined;
         var _loc6_:Object = null;
         var _loc7_:XML = null;
         var _loc8_:XMLList = null;
         var _loc9_:XML = null;
         var _loc10_:String = null;
         var _loc2_:Array = [];
         var _loc3_:String = _17._1621(param1);
         _loc2_[0] = _loc3_;
         if(param1 is Number || param1 is String)
         {
            _loc2_[1] = param1;
         }
         else if(param1 is Array)
         {
            _loc4_ = [];
            for each(_loc5_ in param1)
            {
               _loc4_.push(_1661(_loc5_));
            }
            _loc2_[1] = _loc4_;
         }
         else if(param1 is HashObject)
         {
            _loc2_[1] = (param1 as HashObject).id;
         }
         else if(param1 is DBEnumBase)
         {
            _loc2_[1] = (param1 as DBEnumBase).toString();
         }
         else
         {
            _loc6_ = {};
            _loc7_ = describeType(param1);
            _loc8_ = _loc7_.variable;
            for each(_loc9_ in _loc7_.variable)
            {
               _loc10_ = _loc9_.@name;
               _loc6_[_loc10_] = _1661(param1[_loc10_]);
            }
            _loc2_[1] = _loc6_;
         }
         return _loc2_;
      }
   }
}

