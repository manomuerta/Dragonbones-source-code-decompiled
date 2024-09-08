package _978
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1105;
   import _97._100;
   import flash.text.TextFormatAlign;
   
   public class _13565 extends Group
   {
      public var line:_1082;
      
      public var label:Label;
      
      private var _6996:_1105;
      
      private var _6950:int;
      
      private var _6995:int;
      
      private var _8705:Boolean;
      
      public function _13565(param1:Boolean)
      {
         super();
         this.mouseChildren = false;
         this.mouseEnabled = false;
         this._8705 = param1;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.line = new _1082();
         this.line.fillColor = _100.TIMELINE_LOOP_COLOR;
         this.line.width = 1;
         this.line.height = 20;
         this.line.y = _992._14005;
         this.line.x = -1;
         this.label = new Label();
         this.label.width = 100;
         this.label.x = -49;
         this.label.y = -4;
         this.label.textAlign = TextFormatAlign.CENTER;
         this.label.textColor = _100.TIMELINE_LOOP_COLOR;
         this._6996 = new _1105();
         this._6996.y = _992._14005;
         this._6996.graphics.beginFill(_100.TIMELINE_LOOP_COLOR);
         if(this._8705)
         {
            this._6996.graphics.moveTo(5,0);
            this._6996.graphics.lineTo(0,0);
            this._6996.graphics.lineTo(0,5);
            this._6996.graphics.lineTo(5,0);
         }
         else
         {
            this._6996.graphics.moveTo(-5,0);
            this._6996.graphics.lineTo(0,0);
            this._6996.graphics.lineTo(0,5);
            this._6996.graphics.lineTo(-5,0);
         }
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
      }
      
      public function get _6905() : int
      {
         return this._6950;
      }
      
      public function set _6905(param1:int) : void
      {
         this._6950 = param1;
         this.line.height = this._6950;
      }
   }
}

