package _14159
{
   public class _14158
   {
      public static const PARSER_ERROR:String = "parserError";
      
      private static var _15147:Function = null;
      
      private static var _15146:Array = [];
      
      private static var _15150:Function = null;
      
      private static var _15149:Array = [];
      
      public function _14158()
      {
         super();
      }
      
      public static function _14644(param1:Function, ... rest) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < _15146.length)
         {
            if(_15146[_loc3_].fun == param1)
            {
               return;
            }
            _loc3_++;
         }
         var _loc4_:Object;
         (_loc4_ = new Object()).fun = param1;
         _loc4_.args = rest;
         _15146.push(_loc4_);
      }
      
      public static function _14642(param1:Function) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < _15146.length)
         {
            if(_15146[_loc2_].fun == param1)
            {
               _15146.splice(_loc2_,1);
            }
            _loc2_++;
         }
      }
      
      public static function _14741() : void
      {
         var _loc2_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < _15146.length)
         {
            _loc2_ = _15146[_loc1_];
            if(_loc2_.fun != null)
            {
               if(_loc2_.args.length > 0)
               {
                  _loc2_.fun.apply(null,_loc2_.args);
               }
               else
               {
                  _loc2_.fun.apply(null);
               }
            }
            _loc1_++;
         }
      }
      
      public static function _14646(param1:Function) : void
      {
         if(_15149.indexOf(param1) != -1)
         {
            return;
         }
         _15149.push(param1);
      }
      
      public static function _14643(param1:Function) : void
      {
         var _loc2_:int = int(_15149.indexOf(param1));
         if(_loc2_ != -1)
         {
            _15149.splice(_loc2_,1);
         }
      }
      
      public static function _15148(param1:*) : void
      {
         if(_15149.length == 0)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < _15149.length)
         {
            _15150 = _15149[_loc2_];
            if(_15150 != null)
            {
               _15150.call(null,param1);
            }
            _loc2_++;
         }
      }
   }
}

