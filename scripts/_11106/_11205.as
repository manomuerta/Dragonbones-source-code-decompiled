package _11106
{
   import _11111._11110;
   import _1404._1407;
   import _521._525;
   import flash.system.Capabilities;
   
   public class _11205
   {
      private var _3527:_525;
      
      private var OS:String;
      
      public function _11205()
      {
         this._3527 = _1407.getInstance(_525);
         this.OS = Capabilities.manufacturer;
         super();
      }
      
      public function _11132(param1:String, param2:String) : void
      {
         var _loc3_:String = null;
         var _loc7_:int = 0;
         var _loc4_:String = this._3527._11598();
         if(param2 != "")
         {
            _loc7_ = int(param2.indexOf("\n"));
            if(_loc7_ > 0 && _loc7_ < param2.length - 1)
            {
               _loc3_ = param2.substring(0,_loc7_) + " @ " + param1;
            }
            else
            {
               _loc3_ = param2 + " @ " + param1;
            }
         }
         else
         {
            _loc3_ = param1;
         }
         var _loc5_:RegExp = /\n/g;
         param2 = param2.replace(_loc5_,"@");
         var _loc6_:String = param1 + " @ " + "CS:" + " @ " + param2 + " @ " + "HL:" + " @ " + _loc4_ + " @ " + this.OS;
         _11110.instance.trackEvent(_11109.Crash + "-" + _11110.instance.appVersion,_loc3_,_loc6_);
      }
   }
}

