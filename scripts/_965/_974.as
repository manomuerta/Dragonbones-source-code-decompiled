package _965
{
   import _1045.Button;
   import _1045._1084;
   
   public class _974 extends _1084
   {
      public var _2557:Button;
      
      public var track:Button;
      
      public function _974()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2557 = new Button();
         this._2557.skinName = _975;
         this.track = new Button();
         this.track.skinName = _976;
         addElement(this.track);
         addElement(this._2557);
      }
   }
}

