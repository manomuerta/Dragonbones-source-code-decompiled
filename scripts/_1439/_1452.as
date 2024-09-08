package _1439
{
   import _1045.Button;
   import _1045._1084;
   
   public class _1452 extends _1084
   {
      public var _2557:Button;
      
      public var track:Button;
      
      public function _1452()
      {
         super();
         states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2557 = new Button();
         this._2557.horizontalCenter = 0;
         this._2557.height = 1;
         this._2557.tabEnabled = false;
         this._2557.skinName = _1453;
         this.addElement(this._2557);
         this.track = new Button();
         this.track.width = 20;
         this.track.horizontalCenter = 0;
         this.track.top = 0;
         this.track.bottom = 0;
         this.track.height = 256;
         this.track.tabEnabled = false;
         this.track.alpha = 1;
         this.track.skinName = _1275;
         this.addElement(this.track);
      }
   }
}

