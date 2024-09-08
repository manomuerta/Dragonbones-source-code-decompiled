package _1477
{
   import _1045.Button;
   import _1045._1084;
   
   public class _1270 extends _1084
   {
      public var track:Button;
      
      public var _2557:Button;
      
      public var _8471:Button;
      
      public var _8472:Button;
      
      public function _1270()
      {
         super();
         this.states = ["normal","disabled","inactive"];
         this.width = 13;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.track = new Button();
         this.track.top = this.track.bottom = 13;
         this.track.minHeight = 15;
         this.track.percentWidth = 100;
         this.track._2576 = false;
         this.track.tabEnabled = false;
         this.track.skinName = _1272;
         this.addElement(this.track);
         this._2557 = new Button();
         this._2557.minHeight = 15;
         this._2557.horizontalCenter = 0;
         this._2557.percentWidth = 100;
         this._2557._2576 = false;
         this._2557.tabEnabled = false;
         this._2557.skinName = _1479;
         this.addElement(this._2557);
         this._8471 = new Button();
         this._8471.width = this._8471.height = 13;
         this._8471._2576 = false;
         this._8471.tabEnabled = false;
         this._8471.skinName = _1256;
         this.addElement(this._8471);
         this._8472 = new Button();
         this._8472.bottom = 0;
         this._8472.width = this._8472.height = 13;
         this._8472._2576 = false;
         this._8472.tabEnabled = false;
         this._8472.skinName = _1253;
         this.addElement(this._8472);
      }
      
      override protected function _2519() : void
      {
         super._2519();
      }
   }
}

