package _1045
{
   import _1088._1099;
   import egret.core._1131;
   import egret.core.ns_egret;
   import flash.events.Event;
   
   use namespace ns_egret;
   
   public class TextInput extends _1099
   {
      public function TextInput()
      {
         super();
      }
      
      public function get _6245() : Number
      {
         return ns_egret::_8515();
      }
      
      public function set _6245(param1:Number) : void
      {
         ns_egret::_8516(param1);
      }
      
      override public function set text(param1:String) : void
      {
         super.text = param1;
         dispatchEvent(new Event("textChanged"));
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == _2577)
         {
            _2577.multiline = false;
            if(_2577 is _1131)
            {
               (_2577 as _1131).clipAndEnableScrolling = false;
            }
         }
      }
   }
}

