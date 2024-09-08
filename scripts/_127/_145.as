package _127
{
   import _1045.Group;
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   
   public class _145 extends _1084
   {
      public var _2448:_1105;
      
      private var background:_1082;
      
      private var group:Group;
      
      public function _145()
      {
         super();
         states = ["up","over","down","disabled","upAndSelected","overAndSelected","downAndSelected","disabledAndSelected"];
         this._2080 = "up";
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.background = new _1082();
         this.background.percentWidth = 100;
         this.background.percentHeight = 100;
         this.background.alpha = 0;
         this.addElement(this.background);
         this._2448 = new _1105();
         this._2448.verticalCenter = 0;
         this._2448.horizontalCenter = 0;
         this.addElement(this._2448);
      }
      
      override protected function _2519() : void
      {
         if(_2080 == "disabled")
         {
            this._2448.alpha = 0.5;
         }
         else
         {
            this._2448.alpha = 1;
         }
      }
   }
}

