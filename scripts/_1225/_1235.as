package _1225
{
   import _1045.Button;
   import _1278._1277;
   
   public class _1235 extends _1277
   {
      public var _8471:Button;
      
      public var _8472:Button;
      
      public var _2557:Button;
      
      public var track:Button;
      
      public function _1235()
      {
         super();
         this.minWidth = 50;
         this.minHeight = 15;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.track = new Button();
         this.track.left = 16;
         this.track.right = 16;
         this.track.width = 54;
         this.track.skinName = _1237;
         addElement(this.track);
         this._8471 = new Button();
         this._8471.left = 0;
         this._8471.skinName = _1254;
         addElement(this._8471);
         this._8472 = new Button();
         this._8472.right = 0;
         this._8472.skinName = _1255;
         addElement(this._8472);
         this._2557 = new Button();
         this._2557.minWidth = 15;
         this._2557.skinName = _1236;
         addElement(this._2557);
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
      }
   }
}

