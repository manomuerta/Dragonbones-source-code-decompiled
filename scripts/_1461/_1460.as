package _1461
{
   import _1045._1084;
   import _1045._1105;
   import egret.core._1110;
   
   public class _1460 extends _1084
   {
      private var _10039:Class;
      
      private var _10036:Class;
      
      protected var _10035:Object;
      
      protected var _10040:Object;
      
      protected var _10038:Object;
      
      protected var _10037:Object;
      
      private var ui1:_1105;
      
      private var ui2:_1105;
      
      private var ui3:_1105;
      
      private var ui4:_1105;
      
      public function _1460()
      {
         this._10039 = _1460__10039;
         this._10036 = _1460__10036;
         this._10035 = new _1110(this._10039,this._10036);
         super();
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.width = 34;
         this.height = 26;
         this.ui1 = new _1105();
         this.ui1.source = this._10040;
         this.addElement(this.ui1);
         this.ui2 = new _1105();
         this.ui2.source = this._10038;
         this.addElement(this.ui2);
         this.ui3 = new _1105();
         this.ui3.source = this._10037;
         this.addElement(this.ui3);
         this.ui4 = new _1105();
         this.ui4.source = this._10035;
         this.addElement(this.ui4);
      }
      
      override protected function _2519() : void
      {
         switch(_2080)
         {
            case "up":
               this.ui1.visible = true;
               this.ui2.visible = false;
               this.ui3.visible = false;
               this.ui4.visible = false;
               break;
            case "over":
               this.ui1.visible = false;
               this.ui2.visible = true;
               this.ui3.visible = false;
               this.ui4.visible = false;
               break;
            case "down":
               this.ui1.visible = false;
               this.ui2.visible = false;
               this.ui3.visible = true;
               this.ui4.visible = false;
               break;
            case "disabled":
               this.ui1.visible = false;
               this.ui2.visible = false;
               this.ui3.visible = false;
               this.ui4.visible = true;
         }
      }
   }
}

