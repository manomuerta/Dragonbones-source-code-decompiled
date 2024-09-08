package _965
{
   import _1045.Button;
   import _1045._1082;
   import _1045._1084;
   
   public class _970 extends _1084
   {
      public var _2557:Button;
      
      public var track:Button;
      
      private var _2558:_1082;
      
      public function _970()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2558 = new _1082();
         this._2558.fillColor = 2238766;
         this._2558.width = 70;
         this._2558.height = 10;
         this._2557 = new Button();
         this._2557.skinName = _968;
         this._2557.x = 5;
         this._2557.y = 1;
         this.track = new Button();
         this.track.skinName = _972;
         this.track.x = 5;
         this.track.y = 3;
         this.track.width = 60;
         addElement(this._2558);
         addElement(this.track);
         addElement(this._2557);
      }
   }
}

