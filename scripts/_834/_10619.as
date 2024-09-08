package _834
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import flash.text.TextFormatAlign;
   
   public class _10619 extends _1084
   {
      public var _2530:_1082;
      
      public var _2528:_1082;
      
      public var focusRect:_1082;
      
      public var labelDisplay:Label;
      
      public function _10619()
      {
         super();
         this.minHeight = 25;
         states = ["up","over","down","disabled","upAndSelected","overAndSelected","downAndSelected","disabledAndSelected","focus"];
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
         this._2528 = new _1082();
         this._2528.fillColor = 3622226;
         this._2528.bottom = 0;
         this._2528.height = 1;
         this._2528.left = 1;
         this._2528.right = 1;
         this.addElement(this._2528);
         this.focusRect = new _1082();
         this.focusRect.mouseEnabled = false;
         this.focusRect.visible = false;
         this.focusRect.top = 1;
         this.focusRect.left = 1;
         this.focusRect.bottom = 0;
         this.focusRect.right = 0;
         this.focusRect.fillColor = 3622226;
         this.addElement(this.focusRect);
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.clipAndEnableScrolling = true;
         this.addElement(_loc1_);
         this.labelDisplay = new Label();
         this.labelDisplay.left = 5;
         this.labelDisplay.right = 5;
         this.labelDisplay._6080 = 1;
         this.labelDisplay.textColor = 16711422;
         this.labelDisplay.verticalCenter = 0;
         this.labelDisplay.textAlign = TextFormatAlign.CENTER;
         _loc1_.addElement(this.labelDisplay);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         this.labelDisplay.alpha = 1;
         if(_2080 == "over")
         {
            this._2530.fillColor = 2699835;
         }
         else
         {
            if(_2080 == "disabled")
            {
               this.labelDisplay.alpha = 0.5;
            }
            this._2530.fillColor = 2238510;
         }
         if(_2080 == "upAndSelected" || _2080 == "overAndSelected" || _2080 == "focus" || _2080 == "downAndSelected" || _2080 == "disabledAndSelected" || _2080 == "down")
         {
            if(_2080 == "focus" || _2080 == "down")
            {
               this._2530.fillColor = 3622226;
            }
            else
            {
               this._2530.fillColor = 2699835;
            }
            this.labelDisplay.textColor = 16711422;
            if(_2080 == "down")
            {
               this._2528.visible = false;
            }
            else
            {
               this._2528.visible = true;
            }
         }
         else
         {
            this._2528.visible = false;
            if(_2080 == "over")
            {
               this.labelDisplay.textColor = 16711422;
            }
            else
            {
               this.labelDisplay.textColor = 6580589;
            }
         }
         if(_2080 == "focus")
         {
            this._2530.fillColor = 3622226;
            this.focusRect.visible = true;
            this._2528.fillColor = 3622226;
         }
         else
         {
            this._2528.fillColor = 2699835;
            this.focusRect.visible = false;
         }
      }
   }
}

