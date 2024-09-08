package _978
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1105;
   import _636.TimelineEvent;
   import _97._100;
   import flash.text.TextFormatAlign;
   
   public class _992 extends Group
   {
      public static var _14005:int = 14;
      
      public var line:_1082;
      
      public var label:Label;
      
      private var _6996:_1105;
      
      private var _6950:int;
      
      private var _6995:int;
      
      public function _992()
      {
         super();
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.line = new _1082();
         this.line.fillColor = _100.TIMELINE_POINTER_COLOR;
         this.line.width = 2;
         this.line.height = 20;
         this.line.y = _14005;
         this.line.x = -1;
         this.label = new Label();
         this.label.width = 100;
         this.label.x = -49;
         this.label.y = -4;
         this.label.textAlign = TextFormatAlign.CENTER;
         this.label.textColor = _100.TIMELINE_POINTER_COLOR;
         this._6996 = new _1105();
         this._6996.y = _14005;
         this._6996.graphics.beginFill(_100.TIMELINE_POINTER_COLOR);
         this._6996.graphics.moveTo(-5,0);
         this._6996.graphics.lineTo(5,0);
         this._6996.graphics.lineTo(0,5);
         this._6996.graphics.lineTo(-5,0);
         addElement(this._6996);
         addElement(this.line);
         addElement(this.label);
         this.curFrame = 0;
      }
      
      public function get curFrame() : int
      {
         return this._6995;
      }
      
      public function set curFrame(param1:int) : void
      {
         this._6995 = param1;
         this.label.text = String(this._6995);
         dispatchEvent(new TimelineEvent(TimelineEvent.FRAME_CHANGE));
      }
      
      public function get _6905() : int
      {
         return this._6950;
      }
      
      public function set _6905(param1:int) : void
      {
         if(param1 > 0)
         {
            this._6950 = param1;
            this.line.height = this._6950;
         }
      }
   }
}

