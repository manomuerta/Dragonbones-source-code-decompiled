package _127
{
   import _1045.Button;
   import _1045._1082;
   import _1045._1084;
   
   public class _151 extends _1084
   {
      public var _2557:Button;
      
      public var track:Button;
      
      private var _2558:_1082;
      
      public function _151()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2557 = new Button();
         this._2557.skinName = _152;
         this._2557.x = 5;
         this._2557.y = 1;
         this.track = new Button();
         this.track.skinName = _153;
         this.track.x = 5;
         this.track.y = 3;
         this.track.width = 60;
         addElement(this.track);
         addElement(this._2557);
      }
   }
}

