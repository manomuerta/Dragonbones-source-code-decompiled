package _834
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import _1045._1085;
   import _1045._1105;
   import _1075._1078;
   import _1177.UIEvent;
   import _1185._1196;
   import egret.utils._99;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.text.TextFormatAlign;
   
   public class _12902 extends _1084
   {
      public var labelDisplay:Label;
      
      public var _2448:_1105;
      
      public var _8146:_1105;
      
      public var _8147:_1105;
      
      public var _8145:_1105;
      
      public var _8144:_1105;
      
      public var _14751:Label;
      
      public var _14752:Group;
      
      private var _2530:_1082;
      
      public function _12902()
      {
         super();
         states = ["up","over","down","disabled","limited_up","limited_over","limited_down","limited_disabled"];
      }
      
      override public function set _6081(param1:_1085) : void
      {
         if(param1 == _6081)
         {
            return;
         }
         if(_6081)
         {
            _6081.removeEventListener(UIEvent.DATA_CHANGE,this._6699);
         }
         super._6081 = param1;
         if(_6081)
         {
            _6081.addEventListener(UIEvent.DATA_CHANGE,this._6699);
         }
      }
      
      protected function _6699(param1:Event) : void
      {
         var _loc2_:_1078 = _6081 as _1078;
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.type == "separator")
         {
            this.minHeight = 5;
         }
         else
         {
            this.minHeight = 21;
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2530 = new _1082();
         this._2530.left = this._2530.right = this._2530.top = this._2530.bottom = 0;
         this.addElement(this._2530);
         this.labelDisplay = new Label();
         this.labelDisplay.verticalAlign = _1196.MIDDLE;
         this.labelDisplay.textAlign = TextFormatAlign.LEFT;
         this.labelDisplay._6080 = 1;
         this.labelDisplay.left = 25;
         this.labelDisplay.right = 15;
         this.labelDisplay.top = 0;
         this.labelDisplay.bottom = 0;
         this.addElement(this.labelDisplay);
         this._2448 = new _1105();
         this._2448.verticalCenter = 0;
         this._2448.left = 5;
         this.addElement(this._2448);
         this._8147 = new _1105();
         this._8147.left = 6;
         this._8147.verticalCenter = 0;
         this._8147.width = 5;
         this._8147.height = 5;
         this.addElement(this._8147);
         this._9064();
         this._8146 = new _1105();
         this._8146.width = 7;
         this._8146.height = 7;
         this._8146.left = 8;
         this._8146.verticalCenter = 0;
         this.addElement(this._8146);
         this._9065();
         this._8145 = new _1105();
         this._8145.horizontalCenter = 0;
         this._8145.verticalCenter = 0;
         this._8145.percentWidth = 90;
         this._8145.height = 1;
         this.addElement(this._8145);
         _99(this._9063);
         this._8144 = new _1105();
         this._8144.right = 9;
         this._8144.verticalCenter = 0;
         this._8144.width = 6;
         this._8144.height = 10;
         this.addElement(this._8144);
         this._9066();
      }
      
      private function _9064() : void
      {
         this._8147.graphics.clear();
         this._8147.graphics.beginFill(16711422,0.7);
         this._8147.graphics.drawEllipse(0,0,this._8147.width,this._8147.height);
         this._8147.graphics.endFill();
      }
      
      private function _9065() : void
      {
         var _loc1_:Vector.<int> = new <int>[1,2,2,2,2,2,2];
         var _loc2_:Vector.<Number> = new <Number>[0,2,3,4.4,7,0,7,3,3,7,0,4.6,0,2];
         this._8146.graphics.clear();
         this._8146.graphics.beginFill(16711422);
         this._8146.graphics.drawPath(_loc1_,_loc2_);
         this._8146.graphics.endFill();
      }
      
      private function _9063() : void
      {
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.clear();
         _loc1_.graphics.beginFill(4408134);
         _loc1_.graphics.drawRect(0,0,1,1);
         _loc1_.graphics.endFill();
         this._8145.source = _loc1_;
      }
      
      private function _9066() : void
      {
         var _loc1_:Graphics = this._8144.graphics;
         _loc1_.clear();
         _loc1_.beginFill(16711422,0.5);
         _loc1_.moveTo(0,0);
         _loc1_.lineTo(this._8144.width,this._8144.height / 2);
         _loc1_.lineTo(0,this._8144.height);
         _loc1_.lineTo(0,0);
         _loc1_.endFill();
      }
      
      override protected function _2519() : void
      {
         super._2519();
         this.labelDisplay.textColor = 16711422;
         this._2530._2529 = 1;
         this._2448.alpha = 1;
         switch(this._2080)
         {
            case "up":
               this._2530._2529 = 0;
               break;
            case "down":
            case "over":
               this._2530.fillColor = 3762325;
               break;
            case "disabled":
               this._2530._2529 = 0;
               this.labelDisplay.textColor = 6580589;
               this._2448.alpha = 0.4;
               break;
            case "limited_up":
               this._2530._2529 = 0;
               this.labelDisplay.textColor = 6580589;
               this._2448.alpha = 0.4;
               break;
            case "limited_over":
            case "limited_down":
               this._2530.fillColor = 3762325;
               this.labelDisplay.textColor = 6580589;
               this._2448.alpha = 0.4;
               break;
            case "limited_disabled":
               this._2530._2529 = 0;
               this.labelDisplay.textColor = 6580589;
               this._2448.alpha = 0.4;
         }
      }
   }
}

