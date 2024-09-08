package _978
{
   import _1045.Group;
   import _1045.Label;
   import _97._100;
   import flash.text.TextFormatAlign;
   
   public class _13566 extends Group
   {
      public var label:Label;
      
      private var _6950:int;
      
      private var _6995:int;
      
      public var startFrame:int = -1;
      
      public function _13566()
      {
         super();
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.label = new Label();
         this.label.width = 100;
         this.label.x = -49;
         this.label.y = 16;
         this.label.textAlign = TextFormatAlign.CENTER;
         this.label.textColor = _100.TIMELINE_OFFSET_COLOR;
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
         this.label.text = String(this._6995 - this.startFrame);
      }
      
      public function get _6905() : int
      {
         return this._6950;
      }
      
      public function set _6905(param1:int) : void
      {
         this._6950 = param1;
      }
   }
}

