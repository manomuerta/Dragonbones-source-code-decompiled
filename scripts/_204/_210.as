package _204
{
   public function _210(param1:*, param2:String = "root") : XML
   {
      var _loc3_:XML = <xml/>;
      _objectToXML(_loc3_,param2,param1);
      return _loc3_.children()[0];
   }
}

function _objectToXML(param1:XML, param2:String, param3:*):void
{
   var _loc4_:* = undefined;
   var _loc5_:XML = null;
   switch(param3)
   {
      case true:
      case false:
      case null:
      case undefined:
         param1[param2] = param3;
         break;
      default:
         if(param3 is Number || param3 is String)
         {
            param1[param2] = param3;
         }
         else if(param3 is Array)
         {
            for each(_loc4_ in param3)
            {
               switch(_loc4_)
               {
                  case true:
                  case false:
                  case null:
                  case undefined:
                     param1.appendChild(<{param2}>{_loc4_}</{param2}>);
                     break;
                  default:
                     if(_loc4_ is Number || _loc4_ is String)
                     {
                        param1.appendChild(<{param2}>{_loc4_}</{param2}>);
                     }
                     else if(_loc4_ is Array)
                     {
                        _loc5_ = new XML("<" + param2 + "/>");
                        param1.appendChild(_loc5_);
                        _objectToXML(_loc5_,param2,_loc4_);
                     }
                     else
                     {
                        _objectToXML(param1,param2,_loc4_);
                     }
                     break;
               }
            }
         }
         else
         {
            _loc5_ = new XML("<" + param2 + "/>");
            param1.appendChild(_loc5_);
            for(param2 in param3)
            {
               _objectToXML(_loc5_,param2,param3[param2]);
            }
         }
   }
}
