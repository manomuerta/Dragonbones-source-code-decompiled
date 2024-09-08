package _1477
{
   import _1045.Button;
   import _1045._1084;
   
   public class _1235 extends _1084
   {
      public var track:Button;
      
      public var _2557:Button;
      
      public var _8471:Button;
      
      public var _8472:Button;
      
      public function _1235()
      {
         super();
         this.states = ["normal","disabled","inactive"];
         this.height = 13;
         this.minWidth = 26;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.track = new Button();
         this.track.left = this.track.right = 13;
         this.track.minWidth = 15;
         this.track.percentHeight = 100;
         this.track._2576 = false;
         this.track.tabEnabled = false;
         this.track.skinName = _1237;
         this.addElement(this.track);
         this._2557 = new Button();
         this._2557.minWidth = 15;
         this._2557.verticalCenter = 0;
         this._2557.percentHeight = 100;
         this._2557._2576 = false;
         this._2557.tabEnabled = false;
         this._2557.skinName = _1479;
         this.addElement(this._2557);
         this._8471 = new Button();
         this._8471.width = this._8471.height = 13;
         this._8471.left = 0;
         this._8471._2576 = false;
         this._8471.tabEnabled = false;
         this._8471.skinName = _1254;
         this.addElement(this._8471);
         this._8472 = new Button();
         this._8472.right = 0;
         this._8472.width = this._8472.height = 13;
         this._8472._2576 = false;
         this._8472.tabEnabled = false;
         this._8472.skinName = _1255;
         this.addElement(this._8472);
      }
      
      override protected function _2519() : void
      {
         super._2519();
      }
   }
}

