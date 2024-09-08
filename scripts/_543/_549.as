package _543
{
   import _28._29;
   import _541._540;
   import _710._713;
   import _783.MenuNotification;
   import _874._873;
   
   public class _549 extends _544
   {
      public function _549(param1:_873, param2:_540)
      {
         super(param1,param2);
      }
      
      override public function _3935(param1:_29) : void
      {
         switch(param1.id)
         {
            case _713.EXPAND_ALL:
            case _713.COLLAPSE_ALL:
            case _713.SHOW_ALL:
            case _713.RENAME:
               _1567(new MenuNotification(param1.userData,null,"scenePanel"));
         }
      }
   }
}

