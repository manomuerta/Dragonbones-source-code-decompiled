package egret.utils
{
   import flash.utils.getTimer;
   
   public class StringUtil
   {
      private static var htmlEntities:Array = [["&","&amp;"],["<","&lt;"],[">","&gt;"],["\"","&quot;"],["\'","&apos;"]];
      
      public function StringUtil()
      {
         super();
      }
      
      public static function trim(param1:String, param2:String = null) : String
      {
         return trimLeft(trimRight(param1,param2),param2);
      }
      
      public static function trimLeft(param1:String, param2:String = null) : String
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(!param1)
         {
            return "";
         }
         if(param2 === null)
         {
            _loc3_ = param1.charAt(0);
            while(param1.length > 0 && (_loc3_ == " " || _loc3_ == "\t" || _loc3_ == "\n" || _loc3_ == "\r" || _loc3_ == "\f"))
            {
               param1 = param1.substr(1);
               _loc3_ = param1.charAt(0);
            }
            return param1;
         }
         _loc4_ = param2.length;
         if(_loc4_ === 0 || param1.length === 0)
         {
            return param1;
         }
         _loc5_ = 0;
         _loc6_ = -1;
         while(_loc6_ = int(param1.indexOf(param2,_loc5_)), _loc6_ === _loc5_)
         {
            _loc5_ += _loc4_;
         }
         return param1.substring(_loc5_);
      }
      
      public static function trimRight(param1:String, param2:String = null) : String
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!param1)
         {
            return "";
         }
         if(param2 === null)
         {
            _loc3_ = param1.charAt(param1.length - 1);
            while(param1.length > 0 && (_loc3_ == " " || _loc3_ == "\t" || _loc3_ == "\n" || _loc3_ == "\r" || _loc3_ == "\f"))
            {
               param1 = param1.substr(0,param1.length - 1);
               _loc3_ = param1.charAt(param1.length - 1);
            }
            return param1;
         }
         _loc4_ = param2.length;
         _loc5_ = param1.length;
         if(_loc4_ === 0 || _loc5_ === 0)
         {
            return param1;
         }
         _loc6_ = _loc5_;
         _loc7_ = -1;
         while(_loc7_ = int(param1.lastIndexOf(param2,_loc6_ - 1)), !(_loc7_ === -1 || _loc7_ + _loc4_ !== _loc6_))
         {
            if(_loc7_ === 0)
            {
               return "";
            }
            _loc6_ = _loc7_;
         }
         return param1.substring(0,_loc6_);
      }
      
      public static function startWith(param1:String, param2:String) : Boolean
      {
         if(param1 === null || param2 === null)
         {
            return param1 === null && param2 === null;
         }
         if(param2.length > param1.length)
         {
            return false;
         }
         if(param1.indexOf(param2) == 0)
         {
            return true;
         }
         return false;
      }
      
      public static function endWith(param1:String, param2:String) : Boolean
      {
         if(param1 === null || param2 === null)
         {
            return param1 === null && param2 === null;
         }
         if(param2.length > param1.length)
         {
            return false;
         }
         if(param1.lastIndexOf(param2) == param1.length - param2.length)
         {
            return true;
         }
         return false;
      }
      
      public static function replaceStr(param1:String, param2:String, param3:String) : String
      {
         if(!param1)
         {
            return "";
         }
         var _loc4_:Array = param1.split(param2);
         return _loc4_.join(param3);
      }
      
      public static function toColorString(param1:uint) : String
      {
         var _loc2_:String = param1.toString(16).toUpperCase();
         var _loc3_:int = 6 - _loc2_.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = "0" + _loc2_;
            _loc4_++;
         }
         return "0x" + _loc2_;
      }
      
      public static function toSizeString(param1:Number, param2:int = -1) : String
      {
         var _loc3_:* = "";
         if(param2 == -1)
         {
            if(param1 > 1073741824)
            {
               _loc3_ += int(param1 / 1073741824).toString() + "GB";
               param1 %= 1073741824;
            }
            if(param1 > 1048576)
            {
               if(_loc3_)
               {
                  _loc3_ += ",";
               }
               _loc3_ += int(param1 / 1048576).toString() + "MB";
               param1 %= 1048576;
            }
            if(param1 > 1204)
            {
               if(_loc3_)
               {
                  _loc3_ += ",";
               }
               _loc3_ += int(param1 / 1204).toString() + "KB";
               param1 %= 1204;
            }
            if(param1 > 0)
            {
               if(_loc3_)
               {
                  _loc3_ += ",";
               }
               _loc3_ += param1.toString() + "B";
            }
         }
         else if(param1 > 1073741824)
         {
            _loc3_ = Number(param1 / 1073741824).toFixed(param2) + "GB";
         }
         else if(param1 > 1048576)
         {
            _loc3_ = Number(param1 / 1048576).toFixed(param2) + "MB";
         }
         else if(param1 > 1204)
         {
            _loc3_ = Number(param1 / 1204).toFixed(param2) + "KB";
         }
         else
         {
            _loc3_ = param1.toString() + "B";
         }
         return _loc3_;
      }
      
      public static function escapeHTMLEntity(param1:String, param2:Boolean = true) : String
      {
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         if(!param1)
         {
            return "";
         }
         var _loc3_:Array = htmlEntities;
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = _loc4_[0];
            if(!(param2 && _loc5_ == "\'"))
            {
               _loc6_ = _loc4_[1];
               param1 = param1.split(_loc5_).join(_loc6_);
            }
         }
         return param1;
      }
      
      public static function unescapeHTMLEntity(param1:String) : String
      {
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         if(!param1)
         {
            return "";
         }
         var _loc2_:Array = htmlEntities;
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = _loc3_[0];
            _loc5_ = _loc3_[1];
            param1 = param1.split(_loc5_).join(_loc4_);
         }
         return param1;
      }
      
      public static function checkInString(param1:String, param2:int) : Boolean
      {
         if(param2 < 0 || param2 >= param1.length)
         {
            return false;
         }
         var _loc3_:String = "";
         var _loc4_:int = param2 - 1;
         while(_loc4_ >= 0)
         {
            if(param1.charAt(_loc4_) == "\r" || param1.charAt(_loc4_) == "\n")
            {
               break;
            }
            _loc3_ = param1.charAt(_loc4_) + _loc3_;
            _loc4_--;
         }
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_.charAt(_loc4_) == "\"" && (_loc4_ == 0 || _loc3_.charAt(_loc4_ - 1) != "\\"))
            {
               if(!_loc5_ && !_loc6_)
               {
                  _loc5_ = true;
               }
               else if(_loc5_)
               {
                  _loc5_ = false;
               }
            }
            if(_loc3_.charAt(_loc4_) == "\'" && (_loc4_ == 0 || _loc3_.charAt(_loc4_ - 1) != "\\"))
            {
               if(!_loc5_ && !_loc6_)
               {
                  _loc6_ = true;
               }
               else if(_loc6_)
               {
                  _loc6_ = false;
               }
            }
            _loc4_++;
         }
         return _loc5_ && param1.charAt(_loc4_) != "\"" || _loc6_ && param1.charAt(_loc4_) != "\'";
      }
      
      public static function getPosByLine(param1:String, param2:int, param3:int) : int
      {
         var _loc9_:String = null;
         var _loc13_:Array = null;
         var _loc14_:String = null;
         var _loc15_:Array = null;
         var _loc16_:String = null;
         var _loc17_:int = 0;
         var _loc4_:Vector.<String> = new Vector.<String>();
         var _loc5_:Vector.<String> = new Vector.<String>();
         var _loc6_:int = 0;
         var _loc7_:Number = getTimer();
         var _loc8_:Array = param1.split("\r\n");
         for each(_loc9_ in _loc8_)
         {
            _loc13_ = _loc9_.split("\r");
            for each(_loc14_ in _loc13_)
            {
               _loc15_ = _loc14_.split("\n");
               for each(_loc16_ in _loc15_)
               {
                  _loc4_.push(_loc16_);
                  _loc5_.push("\n");
               }
               _loc5_[_loc5_.length - 1] = "\r";
            }
            _loc5_[_loc5_.length - 1] = "\r\n";
         }
         if(_loc5_.length > 0)
         {
            _loc5_[_loc5_.length - 1] = "";
         }
         var _loc10_:int = -1;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         while(_loc12_ < _loc4_.length)
         {
            if(param2 == _loc12_)
            {
               if(param3 == -1)
               {
                  _loc17_ = _loc11_;
                  while(_loc17_ < param1.length)
                  {
                     if(param1.charAt(_loc17_) != " " && param1.charAt(_loc17_) != "\t" && param1.charAt(_loc17_) != "\r" && param1.charAt(_loc17_) != "\n")
                     {
                        _loc10_ = _loc11_ = _loc17_;
                        break;
                     }
                     _loc17_++;
                  }
               }
               else
               {
                  _loc10_ = _loc11_ + param3;
               }
               break;
            }
            _loc11_ += _loc4_[_loc12_].length;
            if(_loc12_ < _loc5_.length)
            {
               _loc11_ += _loc5_[_loc12_].length;
            }
            _loc12_++;
         }
         return _loc10_;
      }
      
      public static function getLineByPos(param1:String, param2:int) : Object
      {
         var _loc8_:String = null;
         var _loc13_:Array = null;
         var _loc14_:String = null;
         var _loc15_:Array = null;
         var _loc16_:String = null;
         var _loc3_:Vector.<String> = new Vector.<String>();
         var _loc4_:Vector.<String> = new Vector.<String>();
         var _loc5_:int = 0;
         var _loc6_:Number = getTimer();
         var _loc7_:Array = param1.split("\r\n");
         for each(_loc8_ in _loc7_)
         {
            _loc13_ = _loc8_.split("\r");
            for each(_loc14_ in _loc13_)
            {
               _loc15_ = _loc14_.split("\n");
               for each(_loc16_ in _loc15_)
               {
                  _loc3_.push(_loc16_);
                  _loc4_.push("\n");
               }
               _loc4_[_loc4_.length - 1] = "\r";
            }
            _loc4_[_loc4_.length - 1] = "\r\n";
         }
         if(_loc4_.length > 0)
         {
            _loc4_[_loc4_.length - 1] = "";
         }
         var _loc9_:Object = {
            "line":-1,
            "column":-1
         };
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         while(_loc12_ < _loc3_.length)
         {
            _loc10_ += _loc3_[_loc12_].length;
            if(param2 <= _loc10_ && param2 >= _loc11_)
            {
               _loc9_["line"] = _loc12_;
               _loc9_["column"] = param2 - _loc11_;
               break;
            }
            if(_loc12_ < param1.length)
            {
               _loc10_ += _loc4_[_loc12_].length;
            }
            _loc11_ = _loc10_;
            _loc12_++;
         }
         return _loc9_;
      }
   }
}

