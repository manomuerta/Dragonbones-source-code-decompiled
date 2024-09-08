package _1439
{
   import _1045.Group;
   import _1045._1084;
   import _1045._1105;
   import egret.core._1110;
   
   public class _1268 extends _1084
   {
      private var _2610:Class;
      
      private var _2608:Class;
      
      private var _2611:Class;
      
      private var _2609:Class;
      
      private var group:Group;
      
      private var ui1:_1105;
      
      private var ui2:_1105;
      
      public function _1268()
      {
         this._2610 = _1268__2610;
         this._2608 = _1268__2608;
         this._2611 = _1268__2611;
         this._2609 = _1268__2609;
         super();
         states = ["up","over","down","disabled","upAndSelected","overAndSelected","downAndSelected","disabledAndSelected"];
         this._2080 = "up";
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.group = new Group();
         this.group.percentHeight = 100;
         this.group.width = 15;
         this.addElement(this.group);
         this.ui1 = new _1105();
         this.ui1.source = new _1110(this._2610,this._2608);
         this.ui1.horizontalCenter = 0;
         this.ui1.verticalCenter = 0;
         this.group.addElement(this.ui1);
         this.ui2 = new _1105();
         this.ui2.source = new _1110(this._2611,this._2609);
         this.ui2.horizontalCenter = 0;
         this.ui2.verticalCenter = 0;
         this.group.addElement(this.ui2);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "disabledStates" || _2080 == "disabled")
         {
            this.group.alpha = 0.5;
         }
         else
         {
            this.group.alpha = 1;
         }
         if(_2080 == "up" || _2080 == "over" || _2080 == "down" || _2080 == "disabled")
         {
            this.ui1.visible = true;
            this.ui2.visible = false;
         }
         else
         {
            this.ui1.visible = false;
            this.ui2.visible = true;
         }
      }
   }
}

