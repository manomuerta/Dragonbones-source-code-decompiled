package _14231
{
   import _14176._14175;
   import _14176._14177;
   import _14176._14178;
   import _14176._14179;
   import _14176._14180;
   import _14176._14181;
   import _14176._14182;
   import _14176._14183;
   import _14176._14184;
   import _14176._14185;
   import _14176._14186;
   import _14240._14244;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _14232
   {
      public function _14232()
      {
         super();
      }
      
      public static function _15387(param1:String) : Vector.<_14186>
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Vector.<String> = null;
         var _loc6_:int = 0;
         var _loc2_:Vector.<_14186> = new Vector.<_14186>();
         for each(_loc3_ in param1.match(/[A-DF-Za-df-z][^A-Za-df-z]*/g))
         {
            _loc4_ = _loc3_.charAt(0);
            _loc5_ = _14232._15273(_loc3_.substr(1));
            if(_loc4_ == "Z" || _loc4_ == "z")
            {
               _loc2_.push(new _14177());
            }
            else
            {
               _loc6_ = 0;
               while(_loc6_ < _loc5_.length)
               {
                  if(_loc4_ == "M" && _loc6_ > 0)
                  {
                     _loc4_ = "L";
                  }
                  if(_loc4_ == "m" && _loc6_ > 0)
                  {
                     _loc4_ = "l";
                  }
                  switch(_loc4_)
                  {
                     case "M":
                     case "m":
                        _loc2_.push(new _14185(_loc4_ == "M",Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++])));
                        break;
                     case "L":
                     case "l":
                        _loc2_.push(new _14182(_loc4_ == "L",Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++])));
                        break;
                     case "H":
                     case "h":
                        _loc2_.push(new _14183(_loc4_ == "H",Number(_loc5_[_loc6_++])));
                        break;
                     case "V":
                     case "v":
                        _loc2_.push(new _14184(_loc4_ == "V",Number(_loc5_[_loc6_++])));
                        break;
                     case "Q":
                     case "q":
                        _loc2_.push(new _14180(_loc4_ == "Q",Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++])));
                        break;
                     case "T":
                     case "t":
                        _loc2_.push(new _14181(_loc4_ == "T",Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++])));
                        break;
                     case "C":
                     case "c":
                        _loc2_.push(new _14178(_loc4_ == "C",Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++])));
                        break;
                     case "S":
                     case "s":
                        _loc2_.push(new _14179(_loc4_ == "S",Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++])));
                        break;
                     case "A":
                     case "a":
                        _loc2_.push(new _14175(_loc4_ == "A",Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++]),_loc5_[_loc6_++] != "0",_loc5_[_loc6_++] != "0",Number(_loc5_[_loc6_++]),Number(_loc5_[_loc6_++])));
                        break;
                     default:
                        _loc6_ = int(_loc5_.length);
                        break;
                  }
               }
            }
         }
         return _loc2_;
      }
      
      public static function _15273(param1:String) : Vector.<String>
      {
         var _loc4_:String = null;
         var _loc2_:Vector.<String> = new Vector.<String>();
         var _loc3_:Array = param1.match(/(?:\+|-)?\d+(?:\.\d+)?(?:e(?:\+|-)?\d+)?/g);
         for each(_loc4_ in _loc3_)
         {
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      public static function _15220(param1:String) : Matrix
      {
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:Vector.<String> = null;
         var _loc8_:Matrix = null;
         var _loc9_:Matrix = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         if(param1.length == 0)
         {
            return new Matrix();
         }
         var _loc2_:Array = param1.match(/(\w+?\s*\([^)]*\))/g);
         var _loc3_:Matrix = new Matrix();
         if(_loc2_ is Array)
         {
            _loc4_ = int(_loc2_.length - 1);
            for(; _loc4_ >= 0; _loc4_--)
            {
               _loc5_ = /(\w+?)\s*\(([^)]*)\)/.exec(_loc2_[_loc4_]);
               if(!(_loc5_ is Array))
               {
                  continue;
               }
               _loc6_ = _loc5_[1].toLowerCase();
               _loc7_ = _15273(_loc5_[2]);
               if(_loc6_ == "matrix")
               {
                  return new Matrix(Number(_loc7_[0]),Number(_loc7_[1]),Number(_loc7_[2]),Number(_loc7_[3]),Number(_loc7_[4]),Number(_loc7_[5]));
               }
               switch(_loc6_)
               {
                  case "translate":
                     _loc3_.translate(Number(_loc7_[0]),_loc7_.length > 1 ? Number(_loc7_[1]) : Number(_loc7_[0]));
                     break;
                  case "scale":
                     _loc3_.scale(Number(_loc7_[0]),_loc7_.length > 1 ? Number(_loc7_[1]) : Number(_loc7_[0]));
                     break;
                  case "rotate":
                     if(_loc7_.length > 1)
                     {
                        _loc10_ = _loc7_.length > 1 ? Number(_loc7_[1]) : 0;
                        _loc11_ = _loc7_.length > 2 ? Number(_loc7_[2]) : 0;
                        _loc3_.translate(-_loc10_,-_loc11_);
                        _loc3_.rotate(_14244._15487(Number(_loc7_[0])));
                        _loc3_.translate(_loc10_,_loc11_);
                     }
                     else
                     {
                        _loc3_.rotate(_14244._15487(Number(_loc7_[0])));
                     }
                     break;
                  case "skewx":
                     (_loc8_ = new Matrix()).c = Math.tan(_14244._15487(Number(_loc7_[0])));
                     _loc3_.concat(_loc8_);
                     break;
                  case "skewy":
                     (_loc9_ = new Matrix()).b = Math.tan(_14244._15487(Number(_loc7_[0])));
                     _loc3_.concat(_loc9_);
                     break;
               }
            }
         }
         return _loc3_;
      }
      
      public static function _15466(param1:String) : Rectangle
      {
         if(param1 == null || param1 == "")
         {
            return null;
         }
         var _loc2_:Object = param1.split(/\s/);
         return new Rectangle(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
      }
      
      public static function _15209(param1:String) : Object
      {
         var _loc2_:Array = /(?:(defer)\s+)?(\w*)(?:\s+(meet|slice))?/gi.exec(param1.toLowerCase());
         return {
            "defer":_loc2_[1] != undefined,
            "align":_loc2_[2] || "xmidymid",
            "meetOrSlice":_loc2_[3] || "meet"
         };
      }
   }
}

