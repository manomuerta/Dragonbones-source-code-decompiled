package _1477
{
   import _1045._1082;
   import _1045._1084;
   
   public class _1479 extends _1084
   {
      private var ui:_1082;
      
      public function _1479()
      {
         super();
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.ui = new _1082();
         this.ui.percentHeight = this.ui.percentWidth = 100;
         this.ui.fillColor = 5532791;
         this.addElement(this.ui);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "up" || _2080 == "disabled")
         {
            this.ui.fillColor = 5532791;
         }
         else if(_2080 == "over")
         {
            this.ui.fillColor = 7380664;
         }
         else if(_2080 == "down")
         {
            this.ui.fillColor = 5532791;
         }
      }
   }
}

