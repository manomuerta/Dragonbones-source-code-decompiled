package _14240
{
   import _14188._14187;
   import flash.geom.Matrix;
   
   public class _14246
   {
      private static var _15505:Object = {
         "quot":"\"",
         "amp":"&",
         "apos":"\'",
         "lt":"<",
         "gt":">",
         "nbsp":" "
      };
      
      protected static const presentationStyles:Array = ["display","visibility","opacity","fill","fill-opacity","fill-rule","stroke","stroke-opacity","stroke-width","stroke-linecap","stroke-linejoin","stroke-dasharray","stroke-dashoffset","stroke-dashalign","font-size","font-family","font-weight","text-anchor","dominant-baseline","direction","filter","marker","marker-start","marker-mid","marker-end"];
      
      public static const WIDTH:String = "width";
      
      public static const HEIGHT:String = "height";
      
      public static const WIDTH_HEIGHT:String = "width_height";
      
      public function _14246()
      {
         super();
      }
      
      public static function _15337(param1:String) : String
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         while(true)
         {
            _loc2_ = /<!ENTITY\s+(\w*)\s+"((?:.|\s)*?)"\s*>/.exec(param1);
            if(_loc2_ == null)
            {
               break;
            }
            _loc3_ = _loc2_[0];
            _loc4_ = _loc2_[1];
            _loc5_ = _loc2_[2];
            param1 = param1.replace(_loc3_,"");
            param1 = param1.replace(new RegExp("&" + _loc4_ + ";","g"),_loc5_);
         }
         return param1;
      }
      
      public static function _15504(param1:String) : String
      {
         var _loc2_:String = null;
         for(_loc2_ in _15505)
         {
            param1 = param1.replace(new RegExp("\\&" + _loc2_ + ";","g"),_15505[_loc2_]);
         }
         return param1;
      }
      
      public static function _15503(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         for each(_loc2_ in param1.match(/&#x[A-Fa-f0-9]+;/g))
         {
            _loc4_ = /&#x([A-Fa-f0-9]+);/.exec(_loc2_)[1];
            param1 = param1.replace(new RegExp("\\&#x" + _loc4_ + ";","g"),String.fromCharCode(int("0x" + _loc4_)));
         }
         for each(_loc3_ in param1.match(/&#[0-9]+;/g))
         {
            _loc5_ = /&#([0-9]+);/.exec(_loc3_)[1];
            param1 = param1.replace(new RegExp("\\&#" + _loc5_ + ";","g"),String.fromCharCode(int(_loc5_)));
         }
         return param1;
      }
      
      public static function _15458(param1:String) : String
      {
         param1 = _15504(param1);
         param1 = param1.replace(/(?:[ ]+(\n|\r)+[ ]*)|(?:[ ]*(\n|\r)+[ ]+)/g," ");
         return param1.replace(/\n|\r|\t/g,"");
      }
      
      public static function _15453(param1:XML, param2:_14187 = null) : _14187
      {
         var _loc3_:String = null;
         if(param2 == null)
         {
            param2 = new _14187();
         }
         for each(_loc3_ in presentationStyles)
         {
            if("@" + _loc3_ in param1)
            {
               param2.setProperty(_loc3_,param1["@" + _loc3_]);
            }
         }
         return param2;
      }
      
      public static function _15267(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Matrix
      {
         var _loc6_:Number = param3 * 2;
         var _loc7_:Matrix = new Matrix();
         _loc7_.createGradientBox(_loc6_,_loc6_,0,0,0);
         var _loc8_:Number = Math.atan2(param5 - param2,param4 - param1);
         _loc7_.translate(-param1,-param2);
         _loc7_.rotate(-_loc8_);
         _loc7_.translate(param1,param2);
         _loc7_.translate(param1 - param3,param2 - param3);
         return _loc7_;
      }
      
      public static function _15266(param1:Number, param2:Number, param3:Number, param4:Number) : Matrix
      {
         var _loc5_:Number = param3 - param1;
         var _loc6_:Number = param4 - param2;
         var _loc7_:Number = Math.atan2(_loc6_,_loc5_);
         var _loc8_:Number = Math.sqrt(Math.pow(_loc5_,2) + Math.pow(_loc6_,2));
         var _loc9_:Matrix = new Matrix();
         _loc9_.createGradientBox(1,1,0,0,0);
         _loc9_.rotate(_loc7_);
         _loc9_.scale(_loc8_,_loc8_);
         _loc9_.translate(param1,param2);
         return _loc9_;
      }
      
      public static function _15251(param1:String) : String
      {
         var _loc2_:Array = /url\s*\(#(.*?)\)/.exec(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_[1];
      }
      
      public static function _15257(param1:String, param2:Number, param3:Number, param4:Number) : Number
      {
         switch(param1)
         {
            case "xx-small":
               param1 = "6.94pt";
               break;
            case "x-small":
               param1 = "8.33pt";
               break;
            case "small":
               param1 = "10pt";
               break;
            case "medium":
               param1 = "12pt";
               break;
            case "large":
               param1 = "14.4pt";
               break;
            case "x-large":
               param1 = "17.28pt";
               break;
            case "xx-large":
               param1 = "20.736pt";
         }
         return _15258(param1,param2,param3,param4,WIDTH);
      }
      
      public static function _15258(param1:String, param2:Number, param3:Number, param4:Number, param5:String) : Number
      {
         var _loc6_:Number = NaN;
         if(param1.indexOf("pt") != -1)
         {
            _loc6_ = Number(StringUtil.remove(param1,"pt"));
            return _loc6_ * 1.25;
         }
         if(param1.indexOf("pc") != -1)
         {
            _loc6_ = Number(StringUtil.remove(param1,"pc"));
            return _loc6_ * 15;
         }
         if(param1.indexOf("mm") != -1)
         {
            _loc6_ = Number(StringUtil.remove(param1,"mm"));
            return _loc6_ * 3.543307;
         }
         if(param1.indexOf("cm") != -1)
         {
            _loc6_ = Number(StringUtil.remove(param1,"cm"));
            return _loc6_ * 35.43307;
         }
         if(param1.indexOf("in") != -1)
         {
            _loc6_ = Number(StringUtil.remove(param1,"in"));
            return _loc6_ * 90;
         }
         if(param1.indexOf("px") != -1)
         {
            return Number(StringUtil.remove(param1,"px"));
         }
         if(param1.indexOf("em") != -1)
         {
            _loc6_ = Number(StringUtil.remove(param1,"em"));
            return _loc6_ * param2;
         }
         if(param1.indexOf("%") != -1)
         {
            _loc6_ = Number(StringUtil.remove(param1,"%"));
            switch(param5)
            {
               case WIDTH:
                  return _loc6_ / 100 * param3;
               case HEIGHT:
                  return _loc6_ / 100 * param4;
               default:
                  return _loc6_ / 100 * Math.sqrt(Math.pow(param3,2) + Math.pow(param4,2)) / Math.sqrt(2);
            }
         }
         else
         {
            return Number(param1);
         }
      }
   }
}

