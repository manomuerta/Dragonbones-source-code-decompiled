package _965
{
   import _1045._1082;
   import _1045._1084;
   import _97._100;
   
   public class _975 extends _1084
   {
      public var _2448:_1082;
      
      public function _975()
      {
         super();
         this.states = ["up","over","down","disabled"];
         this.minHeight = this.minWidth = 12;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2448 = new _1082();
         this._2448.fillColor = _100.TIMELINE_SLIDER_COLOR;
         this._2448.height = 14;
         this._2448.percentWidth = 100;
         this.addElement(this._2448);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         switch(_2080)
         {
            case "over":
            case "down":
               this._2448.fillColor = _100.TIMELINE_SLIDER_OVER_COLOR;
               break;
            default:
               this._2448.fillColor = _100.TIMELINE_SLIDER_COLOR;
         }
      }
   }
}

