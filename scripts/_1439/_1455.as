package _1439
{
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   import _1185._1196;
   import flash.display.Shape;
   import flash.text.TextFormatAlign;
   
   public class _1455 extends _1084
   {
      public var _2448:_1105;
      
      public var labelDisplay:Label;
      
      private var rect:_1082;
      
      public function _1455()
      {
         super();
         states = ["up","over","down"];
         this.minHeight = 23;
         this.minWidth = 23;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:_1082 = null;
         super._2438();
         this.rect = new _1082();
         this.rect.left = 0;
         this.rect.right = 0;
         this.rect.top = 0;
         this.rect.bottom = 0;
         this.addElement(this.rect);
         _loc1_ = new _1082();
         _loc1_.fillColor = 1382686;
         _loc1_.height = 1;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         this.addElement(_loc1_);
         this._2448 = new _1105();
         this._2448.x = 3;
         this._2448.verticalCenter = 0;
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(16711680);
         _loc2_.graphics.drawRect(0,0,10,10);
         _loc2_.graphics.endFill();
         this._2448.source = _loc2_;
         this.addElement(this._2448);
         this.labelDisplay = new Label();
         this.labelDisplay.textAlign = TextFormatAlign.LEFT;
         this.labelDisplay.verticalAlign = _1196.MIDDLE;
         this.labelDisplay.left = 21;
         this.labelDisplay.top = 0;
         this.labelDisplay.bottom = 0;
         this.labelDisplay.right = 0;
         this.addElement(this.labelDisplay);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "up")
         {
            this.rect.fillColor = 1975081;
         }
         else if(_2080 == "over")
         {
            this.rect.fillColor = 3687762;
         }
         else if(_2080 == "down")
         {
            this.rect.fillColor = 3762325;
         }
      }
   }
}

