package _1225
{
   import _1045.Button;
   import _1278._1277;
   
   public class _1270 extends _1277
   {
      public var _8471:Button;
      
      public var _8472:Button;
      
      public var _2557:Button;
      
      public var track:Button;
      
      public function _1270()
      {
         super();
         this.minWidth = 15;
         this.minHeight = 50;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.track = new Button();
         this.track.top = 16;
         this.track.bottom = 16;
         this.track.height = 54;
         this.track.skinName = _1272;
         addElement(this.track);
         this._8471 = new Button();
         this._8471.top = 0;
         this._8471.skinName = _1256;
         addElement(this._8471);
         this._8472 = new Button();
         this._8472.bottom = 0;
         this._8472.skinName = _1253;
         addElement(this._8472);
         this._2557 = new Button();
         this._2557.minHeight = 15;
         this._2557.skinName = _1271;
         addElement(this._2557);
      }
   }
}

