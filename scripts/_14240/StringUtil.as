package _14240
{
   public class StringUtil
   {
      public function StringUtil()
      {
         super();
      }
      
      public static function trim(param1:String, param2:String = " ") : String
      {
         return StringUtil.ltrim(StringUtil.rtrim(param1,param2),param2);
      }
      
      public static function ltrim(param1:String, param2:String = " ") : String
      {
         var _loc3_:Number = param1.length;
         var _loc4_:Number = 0;
         while(_loc4_ < _loc3_)
         {
            if(param1.charAt(_loc4_) != param2)
            {
               return param1.substring(_loc4_);
            }
            _loc4_++;
         }
         return "";
      }
      
      public static function rtrim(param1:String, param2:String = " ") : String
      {
         var _loc3_:Number = param1.length;
         var _loc4_:Number = _loc3_;
         while(_loc4_ > 0)
         {
            if(param1.charAt(_loc4_ - 1) != param2)
            {
               return param1.substring(0,_loc4_);
            }
            _loc4_--;
         }
         return "";
      }
      
      public static function remove(param1:String, param2:String) : String
      {
         return StringUtil.replace(param1,param2,"");
      }
      
      public static function replace(param1:String, param2:String, param3:String) : String
      {
         var _loc9_:Number = NaN;
         var _loc4_:String = new String();
         var _loc5_:Boolean = false;
         var _loc6_:Number = param1.length;
         var _loc7_:Number = param2.length;
         var _loc8_:Number = 0;
         for(; _loc8_ < _loc6_; _loc8_++)
         {
            if(param1.charAt(_loc8_) == param2.charAt(0))
            {
               _loc5_ = true;
               _loc9_ = 0;
               while(_loc9_ < _loc7_)
               {
                  if(param1.charAt(_loc8_ + _loc9_) != param2.charAt(_loc9_))
                  {
                     _loc5_ = false;
                     break;
                  }
                  _loc9_++;
               }
               if(_loc5_)
               {
                  _loc4_ += param3;
                  _loc8_ += _loc7_ - 1;
                  continue;
               }
            }
            _loc4_ += param1.charAt(_loc8_);
         }
         return _loc4_;
      }
      
      public static function _15499(param1:String, param2:String) : String
      {
         var _loc3_:int = param1.length;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = "";
         while(_loc5_ = param1.indexOf(param2,_loc4_) + 1, _loc5_ != 0)
         {
            _loc6_ += param1.substring(_loc4_,_loc5_);
            _loc4_ = _loc5_;
            while(param1.charAt(_loc4_) == param2 && _loc4_ < _loc3_)
            {
               _loc4_++;
            }
         }
         return _loc6_ + param1.substring(_loc4_,_loc3_);
      }
   }
}

