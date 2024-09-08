package _906
{
   import _1045.Group;
   import _1045.Label;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._162;
   import _1374.ColorPicker;
   import _470._469;
   import _636.AnimationEvent;
   import _668._672;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   
   public class _910 extends Group
   {
      public var _4025:_162;
      
      public var _4024:_162;
      
      public var _4066:ColorPicker;
      
      private var _6189:Label;
      
      private var _6187:Label;
      
      private var _6188:Label;
      
      private var _4761:_672;
      
      public function _910()
      {
         this._4025 = new _162();
         this._4024 = new _162();
         this._4066 = new ColorPicker();
         this._6189 = new Label();
         this._6187 = new Label();
         this._6188 = new Label();
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Group = null;
         super._2438();
         _loc1_ = 48;
         this.layout = new _1197();
         this.percentWidth = 100;
         _loc2_ = this._2414();
         this._6189.text = tr("Property.canvas.size");
         this._6189.width = _loc1_;
         this._4025.txt.maxChars = 8;
         this._4025.txt.percentWidth = 100;
         this._4025.percentWidth = 100;
         this._4025.minValue = 1;
         this._4025.maxValue = 2048;
         this._4025.enabled = true;
         _loc2_.addElement(this._6189);
         _loc2_.addElement(this._4025);
         addElement(_loc2_);
         this._6187.text = " X";
         this._6187.width = _loc1_;
         this._4024.txt.maxChars = 8;
         this._4024.txt.percentWidth = 100;
         this._4024.percentWidth = 100;
         this._4024.minValue = 1;
         this._4024.maxValue = 2048;
         this._4024.enabled = true;
         _loc2_.addElement(this._6187);
         _loc2_.addElement(this._4024);
         addElement(_loc2_);
         _loc2_ = this._2414();
         this._6188.text = tr("Property.canvas.bg");
         this._4066._6193 = true;
         this._4066.defaultColor = 16777215;
         this._4066.toolTip = tr("");
         _loc2_.addElement(this._6188);
         _loc2_.addElement(this._4066);
         addElement(_loc2_);
         this._4025.addEventListener(FocusEvent.FOCUS_OUT,this._4045);
         this._4024.addEventListener(FocusEvent.FOCUS_OUT,this._4045);
         this._4066.addEventListener(UIEvent.CONFIRM,this._4045);
      }
      
      private function _2414() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         var _loc2_:_1189 = new _1189();
         _loc2_.verticalAlign = _1196.MIDDLE;
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
      
      private function _4045(param1:Event) : void
      {
         if(this._4066._4061 != this._4761._2000.bgColor || this._4025.txt.text != String(this._4761._2000.width) || this._4024.txt.text != String(this._4761._2000.height))
         {
            dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_CANVAS,_469._3494(this._4761._2000,int(this._4025.txt.text),int(this._4024.txt.text),this._4066._4061),true));
         }
      }
      
      public function set model(param1:_672) : void
      {
         this._4761 = param1;
         if(this._4761._2000)
         {
            this._4066._4061 = this._4761._2000.bgColor;
            this._4025.txt.text = String(this._4761._2000.width);
            this._4024.txt.text = String(this._4761._2000.height);
         }
      }
   }
}

