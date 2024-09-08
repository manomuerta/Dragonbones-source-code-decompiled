package _1404
{
   import _1409._1410;
   import flash.events.Event;
   
   public class _1420 extends _1410
   {
      public function _1420()
      {
         super();
      }
      
      override public function set height(param1:Number) : void
      {
         var _loc2_:* = height != param1;
         super.height = param1 + leading;
         if(_loc2_)
         {
            dispatchEvent(new Event("heightChanged"));
         }
      }
      
      override public function set width(param1:Number) : void
      {
         var _loc2_:* = super.width != param1;
         super.width = param1;
         if(_loc2_)
         {
            dispatchEvent(new Event("widthChanged"));
         }
      }
      
      override public function replaceText(param1:int, param2:int, param3:String, param4:Boolean = true, param5:Boolean = true) : Boolean
      {
         var _loc6_:Boolean = super.replaceText(param1,param2,param3,param4,param5);
         dispatchEvent(new Event("textChanged"));
         return _loc6_;
      }
      
      override public function set text(param1:String) : void
      {
         if(!param1)
         {
            param1 = "";
         }
         var _loc2_:* = super.text != param1;
         super.text = param1;
         if(_loc2_)
         {
            dispatchEvent(new Event("textChanged"));
         }
      }
   }
}

