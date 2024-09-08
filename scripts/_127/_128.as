package _127
{
   import _1045.CheckBox;
   import _1045.Label;
   import flash.events.MouseEvent;
   
   public class _128 extends CheckBox
   {
      public function _128()
      {
         super();
      }
      
      override protected function _2456(param1:MouseEvent) : void
      {
         super._2456(param1);
         switch(param1.type)
         {
            case MouseEvent.ROLL_OVER:
               Label(labelDisplay).textColor = 5941489;
               break;
            case MouseEvent.ROLL_OUT:
               Label(labelDisplay).textColor = 16777215;
         }
      }
   }
}

