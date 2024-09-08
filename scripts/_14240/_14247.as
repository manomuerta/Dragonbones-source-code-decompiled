package _14240
{
   import flash.geom.Rectangle;
   
   public class _14247
   {
      public function _14247()
      {
         super();
      }
      
      public static function _15226(param1:Rectangle, param2:Rectangle, param3:String, param4:String) : Object
      {
         var _loc5_:Number = param1.x;
         var _loc6_:Number = param1.y;
         var _loc7_:Number = 1;
         var _loc8_:Number = 1;
         if(param3 == "none")
         {
            _loc7_ = param1.width / param2.width;
            _loc8_ = param1.height / param2.height;
         }
         else if(param4 == "meet")
         {
            _loc7_ = _loc8_ = Math.min(param1.width / param2.width,param1.height / param2.height);
         }
         else if(param4 == "slice")
         {
            _loc7_ = _loc8_ = Math.max(param1.width / param2.width,param1.height / param2.height);
         }
         var _loc9_:String = param3.substr(0,4).toLowerCase();
         var _loc10_:String = param3.substr(4,4).toLowerCase();
         switch(_loc9_)
         {
            case "xmid":
               _loc5_ += param1.width / 2 - param2.width * _loc7_ / 2;
               break;
            case "xmax":
               _loc5_ += param1.width - param2.width * _loc7_;
         }
         switch(_loc10_)
         {
            case "ymid":
               _loc6_ += param1.height / 2 - param2.height * _loc8_ / 2;
               break;
            case "ymax":
               _loc6_ += param1.height - param2.height * _loc8_;
         }
         return {
            "contentScaleX":_loc7_,
            "contentScaleY":_loc8_,
            "contentX":_loc5_,
            "contentY":_loc6_
         };
      }
   }
}

