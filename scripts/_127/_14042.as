package _127
{
   import _1045.Button;
   import _1045._1082;
   import _1045._1084;
   
   public class _14042 extends _1084
   {
      public var _2557:Button;
      
      public var track:Button;
      
      private var _2558:_1082;
      
      public function _14042()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2557 = new Button();
         this._2557.skinName = ThumbSkin;
         this._2557.y = 1;
         this.track = new Button();
         this.track.skinName = TrackSkin;
         this.track.y = 3;
         this.track.width = 80;
         addElement(this.track);
         addElement(this._2557);
      }
   }
}

import _1045._1084;
import _1045._1105;

class TrackSkin extends _1084
{
   public var _2448:_1105;
   
   public function TrackSkin()
   {
      super();
      this.minHeight = this.minWidth = 6;
   }
   
   override protected function _2438() : void
   {
      super._2438();
      this._2448 = new _1105();
      this._2448.graphics.beginFill(3687762);
      this._2448.graphics.drawRoundRect(0,0,80,5,3,3);
      this._2448.graphics.endFill();
      this.addElement(this._2448);
   }
}

import _1045._1084;
import _1045._1105;

class ThumbSkin extends _1084
{
   public var _2448:_1105;
   
   public function ThumbSkin()
   {
      super();
      this.minHeight = this.minWidth = 8;
   }
   
   override protected function _2438() : void
   {
      super._2438();
      this._2448 = new _1105();
      this._2448.graphics.beginFill(16777215);
      this._2448.graphics.drawCircle(5,5,5);
      this._2448.graphics.endFill();
      this.addElement(this._2448);
   }
}

