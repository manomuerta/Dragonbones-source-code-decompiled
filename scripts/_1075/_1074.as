package _1075
{
   import _1038._1039;
   import _1038._1042;
   import _1038._1043;
   
   public class _1074 implements _1077
   {
      private var _5856:String = "children";
      
      public function _1074()
      {
         super();
      }
      
      public function getChildren(param1:Object) : _1039
      {
         var _loc2_:_1042 = null;
         if(param1 is XML)
         {
            return new _1043(XML(param1));
         }
         if(param1.hasOwnProperty(this._5856))
         {
            _loc2_ = new _1042(this._5856);
            _loc2_.source = param1;
            return _loc2_;
         }
         return null;
      }
      
      public function _4521(param1:Object) : Boolean
      {
         if(!param1)
         {
            return false;
         }
         if(param1 is XML)
         {
            return XML(param1).children().length() > 0;
         }
         if(param1 is Object)
         {
            if(param1.hasOwnProperty(this._5856))
            {
               return param1[this._5856].length > 0;
            }
         }
         return false;
      }
      
      public function getType(param1:Object) : String
      {
         if(param1 is XML)
         {
            return String(param1.@type);
         }
         if(param1 is Object)
         {
            try
            {
               return String(param1.type);
            }
            catch(e:Error)
            {
            }
         }
         return "";
      }
      
      public function _8127(param1:Object) : Boolean
      {
         var _loc2_:* = undefined;
         if(param1 is XML)
         {
            _loc2_ = param1.@enabled;
            if(_loc2_[0] == false)
            {
               return false;
            }
         }
         else if(param1 is Object)
         {
            try
            {
               return "false" != String(param1.enabled);
            }
            catch(e:Error)
            {
            }
         }
         return true;
      }
      
      public function _8140(param1:Object, param2:Boolean) : void
      {
         if(param1 is XML)
         {
            param1.@enabled = param2;
         }
         else if(param1 is Object)
         {
            try
            {
               param1.enabled = param2;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      public function _8126(param1:Object) : Boolean
      {
         var _loc2_:* = undefined;
         if(param1 is XML)
         {
            _loc2_ = param1.@_1705;
            if(_loc2_[0] == true)
            {
               return true;
            }
         }
         else if(param1 is Object)
         {
            try
            {
               return Boolean(param1._1705);
            }
            catch(e:Error)
            {
            }
         }
         return false;
      }
      
      public function _8123(param1:Object, param2:Boolean) : void
      {
         if(param1 is XML)
         {
            param1.@_1705 = param2;
         }
         else if(param1 is Object)
         {
            try
            {
               param1._1705 = param2;
            }
            catch(e:Error)
            {
            }
         }
      }
      
      public function _8119(param1:Object) : String
      {
         if(param1 is XML)
         {
            return param1.@groupName;
         }
         if(param1 is Object)
         {
            try
            {
               return param1.groupName;
            }
            catch(e:Error)
            {
            }
         }
         return "";
      }
      
      public function _14264(param1:Object) : String
      {
         if(param1 is XML)
         {
            return param1.@shortcutKey;
         }
         if(param1 is Object)
         {
            try
            {
               return param1.shortcutKey;
            }
            catch(error:Error)
            {
            }
         }
         return "";
      }
   }
}

