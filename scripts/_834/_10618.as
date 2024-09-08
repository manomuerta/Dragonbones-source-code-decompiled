package _834
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1084;
   import _1045._1105;
   import _1177.UIEvent;
   import _1185._1189;
   import flash.events.Event;
   
   public class _10618 extends _1084
   {
      public var labelDisplay:Label;
      
      public var _2448:_1105;
      
      public function _10618()
      {
         super();
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         super._2438();
         _loc1_ = new Group();
         _loc1_.mouseEnabled = false;
         var _loc2_:_1189 = new _1189();
         _loc2_.verticalAlign = "middle";
         _loc2_.gap = 10;
         _loc1_.layout = _loc2_;
         this.addElement(_loc1_);
         this._2448 = new _1105();
         this._2448.includeInLayout = this._2448.visible = false;
         this._2448.addEventListener(UIEvent.CONTENT_CHANGED,this._6242);
         this._2448.mouseEnabled = this._2448.mouseChildren = false;
         _loc1_.addElement(this._2448);
         this.labelDisplay = new Label();
         this.labelDisplay.size = 13;
         this.labelDisplay.alpha = 0.7;
         this.labelDisplay.percentWidth = 100;
         this.labelDisplay.width = 100;
         this.labelDisplay.height = 45;
         _loc1_.addElement(this.labelDisplay);
      }
      
      protected function _6242(param1:Event) : void
      {
         if(this._2448.source)
         {
            this._2448.visible = this._2448.includeInLayout = true;
         }
         else
         {
            this._2448.visible = this._2448.includeInLayout = false;
         }
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(this._2080 == "down" || this._2080 == "over")
         {
            this.labelDisplay.textColor = 5941489;
         }
         else
         {
            this.labelDisplay.textColor = 16777215;
         }
      }
   }
}

