package _1374
{
   import _1045.ToggleButton;
   
   public class _1375 extends ToggleButton
   {
      public var _8542:Boolean = true;
      
      public function _1375()
      {
         super();
         mouseChildren = false;
         buttonMode = true;
         useHandCursor = true;
      }
      
      override protected function _8239() : void
      {
         if(!this._8542)
         {
            return;
         }
         super._8239();
      }
   }
}

