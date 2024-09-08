package com.codeazur.utils
{
   import flash.events.*;
   
   public class StringUtils
   {
      private static const Entities:Object = {
         "&nbsp;":" ",
         "&#160;":" ",
         "&lt;":"<",
         "&#60;":"<",
         "&gt;":">",
         "&#62;":">",
         "&amp;":"&",
         "&amp;":"&",
         "&quot;":"\"",
         "&#34;":"\"",
         "&apos;":"\'",
         "&#39;":"\'",
         "&cent;":"￠",
         "&#162;":"￠",
         "&pound;":"£",
         "&#163;":"£",
         "&yen;":"¥",
         "&#165;":"¥",
         "&euro;":"€",
         "&#8364;":"€",
         "&sect;":"§",
         "&#167;":"§",
         "&copy;":"©",
         "&#169;":"©",
         "&reg;":"®",
         "&#174;":"®",
         "&trade;":"™",
         "&#8482;":"™",
         "&times;":"×",
         "&#215;":"×",
         "&divide;":"÷",
         "&#247;":"÷"
      };
      
      private static var i:int = 0;
      
      private static const SIGN_UNDEF:int = 0;
      
      private static const SIGN_POS:int = -1;
      
      private static const SIGN_NEG:int = 1;
      
      public function StringUtils()
      {
         super();
      }
      
      public static function trim(param1:String) : String
      {
         return StringUtils.ltrim(StringUtils.rtrim(param1));
      }
      
      public static function ltrim(param1:String) : String
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = param1.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if(param1.charCodeAt(_loc3_) > 32)
               {
                  return param1.substring(_loc3_);
               }
               _loc3_++;
            }
         }
         return "";
      }
      
      public static function rtrim(param1:String) : String
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = param1.length;
            _loc3_ = _loc2_;
            while(_loc3_ > 0)
            {
               if(param1.charCodeAt(_loc3_ - 1) > 32)
               {
                  return param1.substring(0,_loc3_);
               }
               _loc3_--;
            }
         }
         return "";
      }
      
      public static function simpleEscape(param1:String) : String
      {
         param1 = param1.split("\n").join("\\n");
         param1 = param1.split("\r").join("\\r");
         param1 = param1.split("\t").join("\\t");
         param1 = param1.split("\f").join("\\f");
         return param1.split("\b").join("\\b");
      }
      
      public static function strictEscape(param1:String, param2:Boolean = true) : String
      {
         var _loc3_:Array = null;
         var _loc4_:uint = 0;
         if(param1 != null && param1.length > 0)
         {
            if(param2)
            {
               param1 = StringUtils.trim(param1);
            }
            param1 = encodeURIComponent(param1);
            _loc3_ = param1.split("");
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               switch(_loc3_[_loc4_])
               {
                  case "!":
                     _loc3_[_loc4_] = "%21";
                     break;
                  case "\'":
                     _loc3_[_loc4_] = "%27";
                     break;
                  case "(":
                     _loc3_[_loc4_] = "%28";
                     break;
                  case ")":
                     _loc3_[_loc4_] = "%29";
                     break;
                  case "*":
                     _loc3_[_loc4_] = "%2A";
                     break;
                  case "-":
                     _loc3_[_loc4_] = "%2D";
                     break;
                  case ".":
                     _loc3_[_loc4_] = "%2E";
                     break;
                  case "_":
                     _loc3_[_loc4_] = "%5F";
                     break;
                  case "~":
                     _loc3_[_loc4_] = "%7E";
                     break;
               }
               _loc4_++;
            }
            return _loc3_.join("");
         }
         return "";
      }
      
      public static function repeat(param1:uint, param2:String = " ") : String
      {
         return new Array(param1 + 1).join(param2);
      }
      
      public static function printf(param1:String, ... rest) : String
      {
         var _loc7_:String = null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:String = null;
         var _loc16_:* = undefined;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:Number = NaN;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:Boolean = false;
         var _loc24_:int = 0;
         var _loc25_:Boolean = false;
         var _loc26_:int = 0;
         var _loc27_:String = null;
         var _loc28_:Number = NaN;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:String = null;
         var _loc3_:String = "";
         var _loc4_:int = 0;
         var _loc5_:int = -1;
         var _loc6_:String = "diufFeEgGxXoscpn";
         i = 0;
         while(i < param1.length)
         {
            _loc7_ = param1.charAt(i);
            if(_loc7_ == "%")
            {
               if(++i < param1.length)
               {
                  _loc7_ = param1.charAt(i);
                  if(_loc7_ == "%")
                  {
                     _loc3_ += _loc7_;
                  }
                  else
                  {
                     _loc8_ = false;
                     _loc9_ = false;
                     _loc10_ = false;
                     _loc11_ = false;
                     _loc12_ = false;
                     _loc13_ = -1;
                     _loc14_ = -1;
                     _loc15_ = "";
                     _loc18_ = getIndex(param1);
                     if(_loc18_ < -1 || _loc18_ == 0)
                     {
                        break;
                     }
                     if(_loc18_ == -1)
                     {
                        if(_loc5_ == 1)
                        {
                           break;
                        }
                        if(_loc5_ == -1)
                        {
                           _loc5_ = 0;
                        }
                        _loc4_++;
                     }
                     else
                     {
                        if(_loc5_ == 0)
                        {
                           break;
                        }
                        if(_loc5_ == -1)
                        {
                           _loc5_ = 1;
                        }
                        _loc4_ = _loc18_;
                     }
                     while(_loc7_ = param1.charAt(i), _loc7_ == "+" || _loc7_ == "-" || _loc7_ == "#" || _loc7_ == " " || _loc7_ == "0")
                     {
                        switch(_loc7_)
                        {
                           case "+":
                              _loc8_ = true;
                              break;
                           case "-":
                              _loc9_ = true;
                              break;
                           case "#":
                              _loc10_ = true;
                              break;
                           case " ":
                              _loc11_ = true;
                              break;
                           case "0":
                              _loc12_ = true;
                        }
                        if(++i == param1.length)
                        {
                           break;
                        }
                        _loc7_ = param1.charAt(i);
                     }
                     if(i == param1.length)
                     {
                        break;
                     }
                     if(_loc7_ == "*")
                     {
                        _loc24_ = 0;
                        if(++i == param1.length)
                        {
                           break;
                        }
                        _loc18_ = getIndex(param1);
                        if(_loc18_ < -1 || _loc18_ == 0)
                        {
                           break;
                        }
                        if(_loc18_ == -1)
                        {
                           if(_loc5_ == 1)
                           {
                              break;
                           }
                           if(_loc5_ == -1)
                           {
                              _loc5_ = 0;
                           }
                           _loc24_ = _loc4_++;
                        }
                        else
                        {
                           if(_loc5_ == 0)
                           {
                              break;
                           }
                           if(_loc5_ == -1)
                           {
                              _loc5_ = 1;
                           }
                           _loc24_ = _loc18_;
                        }
                        _loc24_--;
                        if(!(rest.length > _loc24_ && _loc24_ >= 0))
                        {
                           break;
                        }
                        _loc13_ = parseInt(rest[_loc24_]);
                        if(isNaN(_loc13_))
                        {
                           _loc13_ = -1;
                           break;
                        }
                        _loc7_ = param1.charAt(i);
                     }
                     else
                     {
                        _loc25_ = false;
                        while(_loc7_ >= "0" && _loc7_ <= "9")
                        {
                           if(_loc13_ == -1)
                           {
                              _loc13_ = 0;
                           }
                           _loc13_ = _loc13_ * 10 + uint(_loc7_);
                           if(++i == param1.length)
                           {
                              break;
                           }
                           _loc7_ = param1.charAt(i);
                        }
                        if(_loc13_ != -1 && i == param1.length)
                        {
                           break;
                        }
                     }
                     if(_loc7_ == ".")
                     {
                        if(++i == param1.length)
                        {
                           break;
                        }
                        _loc7_ = param1.charAt(i);
                        if(_loc7_ == "*")
                        {
                           _loc26_ = 0;
                           if(++i == param1.length)
                           {
                              break;
                           }
                           _loc18_ = getIndex(param1);
                           if(_loc18_ < -1 || _loc18_ == 0)
                           {
                              break;
                           }
                           if(_loc18_ == -1)
                           {
                              if(_loc5_ == 1)
                              {
                                 break;
                              }
                              if(_loc5_ == -1)
                              {
                                 _loc5_ = 0;
                              }
                              _loc26_ = _loc4_++;
                           }
                           else
                           {
                              if(_loc5_ == 0)
                              {
                                 break;
                              }
                              if(_loc5_ == -1)
                              {
                                 _loc5_ = 1;
                              }
                              _loc26_ = _loc18_;
                           }
                           _loc26_--;
                           if(!(rest.length > _loc26_ && _loc26_ >= 0))
                           {
                              break;
                           }
                           _loc14_ = parseInt(rest[_loc26_]);
                           if(isNaN(_loc14_))
                           {
                              _loc14_ = -1;
                              break;
                           }
                           _loc7_ = param1.charAt(i);
                        }
                        else
                        {
                           while(_loc7_ >= "0" && _loc7_ <= "9")
                           {
                              if(_loc14_ == -1)
                              {
                                 _loc14_ = 0;
                              }
                              _loc14_ = _loc14_ * 10 + uint(_loc7_);
                              if(++i == param1.length)
                              {
                                 break;
                              }
                              _loc7_ = param1.charAt(i);
                           }
                           if(_loc14_ != -1 && i == param1.length)
                           {
                              break;
                           }
                        }
                     }
                     switch(_loc7_)
                     {
                        case "h":
                        case "l":
                           if(++i == param1.length)
                           {
                              break;
                           }
                           _loc27_ = param1.charAt(i);
                           if(_loc7_ == "h" && _loc27_ == "h" || _loc7_ == "l" && _loc27_ == "l")
                           {
                              if(++i == param1.length)
                              {
                                 break;
                              }
                              _loc7_ = param1.charAt(i);
                           }
                           else
                           {
                              _loc7_ = _loc27_;
                           }
                           break;
                        case "L":
                        case "z":
                        case "j":
                        case "t":
                           if(++i == param1.length)
                           {
                              break;
                           }
                           _loc7_ = param1.charAt(i);
                           break;
                     }
                     if(_loc6_.indexOf(_loc7_) < 0)
                     {
                        break;
                     }
                     _loc15_ = _loc7_;
                     if(!(rest.length >= _loc4_ && _loc4_ > 0))
                     {
                        break;
                     }
                     _loc16_ = rest[_loc4_ - 1];
                     _loc22_ = SIGN_UNDEF;
                     switch(_loc15_)
                     {
                        case "s":
                           _loc19_ = _loc16_.toString();
                           if(_loc14_ != -1)
                           {
                              _loc19_ = _loc19_.substr(0,_loc14_);
                           }
                           break;
                        case "c":
                           _loc19_ = _loc16_.toString().getAt(0);
                           break;
                        case "d":
                        case "i":
                           _loc21_ = typeof _loc16_ == "number" ? int(_loc16_) : int(parseInt(_loc16_));
                           _loc19_ = Math.abs(_loc21_).toString();
                           _loc22_ = _loc21_ < 0 ? SIGN_NEG : SIGN_POS;
                           break;
                        case "u":
                           _loc19_ = (typeof _loc16_ == "number" ? uint(_loc16_) : uint(parseInt(_loc16_))).toString();
                           break;
                        case "f":
                        case "F":
                        case "e":
                        case "E":
                        case "g":
                        case "G":
                           if(_loc14_ == -1)
                           {
                              _loc14_ = 6;
                           }
                           _loc28_ = Math.pow(10,_loc14_);
                           _loc20_ = typeof _loc16_ == "number" ? Number(_loc16_) : parseFloat(_loc16_);
                           _loc19_ = (Math.round(Math.abs(_loc20_) * _loc28_) / _loc28_).toString();
                           if(_loc14_ > 0)
                           {
                              _loc30_ = int(_loc19_.indexOf("."));
                              if(_loc30_ == -1)
                              {
                                 _loc19_ += ".";
                                 _loc29_ = _loc14_;
                              }
                              else
                              {
                                 _loc29_ = _loc14_ - (_loc19_.length - _loc30_ - 1);
                              }
                              _loc17_ = 0;
                              while(_loc17_ < _loc29_)
                              {
                                 _loc19_ += "0";
                                 _loc17_++;
                              }
                           }
                           _loc22_ = _loc20_ < 0 ? SIGN_NEG : SIGN_POS;
                           break;
                        case "x":
                        case "X":
                        case "p":
                           _loc19_ = (typeof _loc16_ == "number" ? uint(_loc16_) : parseInt(_loc16_)).toString(16);
                           if(_loc15_ == "X")
                           {
                              _loc19_ = _loc19_.toUpperCase();
                           }
                           break;
                        case "o":
                           _loc19_ = (typeof _loc16_ == "number" ? uint(_loc16_) : parseInt(_loc16_)).toString(8);
                     }
                     _loc23_ = _loc22_ == SIGN_NEG || _loc8_ || _loc11_;
                     if(_loc13_ > -1)
                     {
                        _loc31_ = _loc13_ - _loc19_.length;
                        if(_loc23_)
                        {
                           _loc31_--;
                        }
                        if(_loc31_ > 0)
                        {
                           _loc32_ = _loc12_ && !_loc9_ ? "0" : " ";
                           if(_loc9_)
                           {
                              _loc17_ = 0;
                              while(_loc17_ < _loc31_)
                              {
                                 _loc19_ += _loc32_;
                                 _loc17_++;
                              }
                           }
                           else
                           {
                              _loc17_ = 0;
                              while(_loc17_ < _loc31_)
                              {
                                 _loc19_ = _loc32_ + _loc19_;
                                 _loc17_++;
                              }
                           }
                        }
                     }
                     if(_loc23_)
                     {
                        if(_loc22_ == SIGN_POS)
                        {
                           _loc19_ = (_loc11_ ? " " : "0") + _loc19_;
                        }
                        else
                        {
                           _loc19_ = "-" + _loc19_;
                        }
                     }
                     _loc3_ += _loc19_;
                  }
               }
               else
               {
                  _loc3_ += _loc7_;
               }
            }
            else
            {
               _loc3_ += _loc7_;
            }
            ++i;
         }
         return _loc3_;
      }
      
      private static function getIndex(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:String = "";
         var _loc5_:int = i;
         while(_loc4_ = param1.charAt(i), _loc4_ >= "0" && _loc4_ <= "9")
         {
            _loc3_ = true;
            _loc2_ = _loc2_ * 10 + uint(_loc4_);
            if(++i == param1.length)
            {
               return -2;
            }
         }
         if(_loc3_)
         {
            if(_loc4_ != "$")
            {
               i = _loc5_;
               return -1;
            }
            if(++i == param1.length)
            {
               return -2;
            }
            return _loc2_;
         }
         return -1;
      }
      
      public static function _15144(param1:String, param2:Number) : String
      {
         if(param2 != 1)
         {
            if(param1.charAt(param1.length - 1) == "y")
            {
               param1 = param1.substr(0,param1.length - 1) + "ie";
            }
            param1 += "s";
         }
         return param1;
      }
      
      public static function _15079(param1:String) : String
      {
         var str:String = param1;
         ;
         return str.replace(/\&#?\w{2,6};/g,function(... rest):String
         {
            return Entities[rest[0]];
         });
      }
   }
}

