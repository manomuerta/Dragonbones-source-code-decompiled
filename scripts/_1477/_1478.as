package _1477
{
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   
   public class _1478 extends _1084
   {
      protected var _10058:Object;
      
      protected var _10057:Object;
      
      protected var _10029:Object;
      
      private var ui:_1105;
      
      private var back:_1082;
      
      public function _1478()
      {
         super();
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.back = new _1082();
         this.back.fillColor = 3095365;
         this.back.percentHeight = this.back.percentWidth = 100;
         this.addElement(this.back);
         this.ui = new _1105();
         this.ui.horizontalCenter = this.ui.verticalCenter = 0;
         this.addElement(this.ui);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "disabled")
         {
            this.ui.alpha = 0.5;
         }
         else
         {
            this.ui.alpha = 1;
         }
         if(_2080 == "up" || _2080 == "disabled")
         {
            this.ui.source = this._10058;
         }
         else if(_2080 == "over")
         {
            this.ui.source = this._10057;
         }
         else if(_2080 == "down")
         {
            this.ui.source = this._10029;
         }
      }
   }
}

