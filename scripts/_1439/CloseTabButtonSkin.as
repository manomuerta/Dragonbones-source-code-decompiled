package _1439
{
   import _1045.Button;
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import egret.utils.tr;
   
   public class CloseTabButtonSkin extends _1084
   {
      private var _2530:_1082;
      
      private var line:_1082;
      
      private var focusRect:_1082;
      
      public var labelDisplay:Label;
      
      public var closeButton:Button;
      
      public function CloseTabButtonSkin()
      {
         super();
         this.minHeight = 25;
         states = ["up","over","down","disabled","upAndSelected","overAndSelected","focus","downAndSelected","disabledAndSelected"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2530 = new _1082();
         this._2530._2563 = 1777701;
         this._2530._2564 = 1;
         this._2530.fillColor = 2238510;
         this._2530.top = 0;
         this._2530.left = 0;
         this._2530.right = 0;
         this._2530.bottom = 0;
         this.addElement(this._2530);
         this.line = new _1082();
         this.line.fillColor = 2699835;
         this.line.bottom = 0;
         this.line.height = 1;
         this.line.left = 1;
         this.line.right = 0;
         this.addElement(this.line);
         this.focusRect = new _1082();
         this.focusRect.mouseEnabled = false;
         this.focusRect.visible = false;
         this.focusRect.top = 1;
         this.focusRect.left = 1;
         this.focusRect.bottom = 0;
         this.focusRect.right = 0;
         this.focusRect.fillColor = 3622226;
         this.addElement(this.focusRect);
         this.labelDisplay = new Label();
         this.labelDisplay.verticalCenter = 0;
         this.labelDisplay.left = 10;
         this.labelDisplay.right = 26;
         this.labelDisplay._6080 = 1;
         this.labelDisplay.textColor = 16711422;
         this.addElement(this.labelDisplay);
         this.closeButton = new Button();
         this.closeButton.verticalCenter = 0;
         this.closeButton.toolTip = tr("CloseTabButtonSkin.CloseButton.ToolTip");
         this.closeButton.right = 4;
         this.closeButton.skinName = _1445;
         this.addElement(this.closeButton);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         this.closeButton.visible = false;
         this._2530.fillColor = 2238510;
         if(_2080 == "upAndSelected" || _2080 == "overAndSelected" || _2080 == "focus" || _2080 == "downAndSelected" || _2080 == "disabledAndSelected" || _2080 == "down")
         {
            this.closeButton.visible = true;
            this._2530.fillColor = 2699835;
            this.labelDisplay.textColor = 16711422;
            if(_2080 == "down")
            {
               this._2530.fillColor = 1185307;
               this.line.visible = false;
            }
            else
            {
               this.line.visible = true;
            }
         }
         else
         {
            this.line.visible = false;
            if(_2080 == "over")
            {
               this.closeButton.visible = true;
               this.labelDisplay.textColor = 16711422;
            }
            else
            {
               this.labelDisplay.textColor = 6580589;
            }
         }
         if(_2080 == "focus")
         {
            this.focusRect.visible = true;
         }
         else
         {
            this.focusRect.visible = false;
         }
      }
   }
}

