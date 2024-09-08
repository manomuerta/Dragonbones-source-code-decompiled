package _834
{
   import _1045._1084;
   import _1045._1105;
   import egret.core._1110;
   
   public class _12900 extends _1084
   {
      private var _12733:Class;
      
      private var _12732:Class;
      
      private var _12734:Class;
      
      private var _12731:Class;
      
      protected var _12730:Object;
      
      protected var _12729:Object;
      
      private var back:_1105;
      
      private var icon:_1105;
      
      public function _12900()
      {
         this._12733 = _12900__12733;
         this._12732 = _12900__12732;
         this._12734 = _12900__12734;
         this._12731 = _12900__12731;
         super();
         this.states = ["up","over","down","disabled"];
         this.minWidth = 33;
         this.minHeight = 24;
         this._12730 = new _1110(this._12733,this._12732);
         this._12729 = new _1110(this._12734,this._12731);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.icon = new _1105();
         this.icon.source = this._12730;
         this.icon.verticalCenter = 0;
         this.icon.horizontalCenter = 0;
         this.addElement(this.icon);
      }
      
      override protected function _2519() : void
      {
         this.icon.alpha = 1;
         switch(_2080)
         {
            case "up":
               this.icon.source = this._12730;
               break;
            case "over":
               this.icon.source = this._12729;
               break;
            case "down":
               this.icon.source = this._12730;
               break;
            case "disabled":
               this.icon.source = this._12730;
               this.icon.alpha = 0.3;
         }
      }
   }
}

