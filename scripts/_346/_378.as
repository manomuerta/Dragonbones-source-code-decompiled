package _346
{
   import _1404._1407;
   import _625.SettingWindowController;
   import _93._92;
   
   public class _378 extends _92
   {
      public function _378()
      {
         super();
      }
      
      override public function execute() : void
      {
         (_1407.getInstance(SettingWindowController) as SettingWindowController).onOpen();
      }
   }
}

