package _14123
{
   import _1045.Group;
   import _1045.HSlider;
   import _1045.Label;
   import _1185._1197;
   import _127._151;
   import _127._162;
   import _1374.ColorPicker;
   import _97._125;
   import egret.utils.tr;
   
   public class _14128 extends _14126
   {
      private var bgColor:Label;
      
      public var _7309:ColorPicker;
      
      private var bgSize:Label;
      
      public var _7313:_162;
      
      public var _7307:HSlider;
      
      private var _7304:Label;
      
      private var boneColor:Label;
      
      public var _7303:ColorPicker;
      
      private var boneSize:Label;
      
      public var _7306:_162;
      
      public var _7302:HSlider;
      
      private var _7301:Label;
      
      public var _7316:Number = 100;
      
      public var _7315:Number = 5;
      
      public var _7312:Number = 40;
      
      public var _7311:Number = 2;
      
      public function _14128()
      {
         this.bgColor = new Label();
         this._7309 = new ColorPicker();
         this.bgSize = new Label();
         this._7313 = new _162();
         this._7307 = new HSlider();
         this._7304 = new Label();
         this.boneColor = new Label();
         this._7303 = new ColorPicker();
         this.boneSize = new Label();
         this._7306 = new _162();
         this._7302 = new HSlider();
         this._7301 = new Label();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.bgColor.text = tr("Setting.BGColor");
         this.bgColor.alpha = _7319;
         this._7309._6193 = true;
         this._7309.defaultColor = 16777215;
         this._7309.x = 110;
         this.boneColor.text = tr("Setting.BoColor.tooltip");
         this.boneColor.alpha = _7319;
         this._7303._6193 = true;
         this._7303.defaultColor = 16777215;
         this._7303.x = 110;
         var _loc1_:Group = _125._2404();
         _loc1_.percentWidth = 100;
         var _loc2_:Group = new Group();
         _loc2_.percentWidth = 50;
         _loc2_.addElement(this.bgColor);
         _loc2_.addElement(this._7309);
         var _loc3_:Group = new Group();
         _loc3_.percentWidth = 50;
         _loc3_.addElement(this.boneColor);
         _loc3_.addElement(this._7303);
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(_loc3_);
         this.bgSize.text = tr("Setting.BGSize");
         this.bgSize.alpha = _7319;
         this._7313.txt.restrict = "0-9";
         this._7313.txt.width = 40;
         this._7313.txt.setStyle("textAlign","left");
         this._7313.maxValue = this._7316;
         this._7313.minValue = this._7315;
         this._7304.text = "px";
         this._7304.alpha = _7319;
         this._7307.skinName = _151;
         this._7307.maximum = this._7316;
         this._7307.minimum = this._7315;
         this._7307.value = 100;
         this._7307.x = 100;
         this._7307.y = 4;
         this._7313.x = 175;
         this._7313.y = -2;
         this._7304.x = 220;
         this._7304.y = 0;
         this.boneSize.text = tr("Setting.BOSize");
         this.boneSize.alpha = _7319;
         this._7306.txt.restrict = "0-9";
         this._7306.txt.width = 40;
         this._7306.txt.setStyle("textAlign","left");
         this._7306.maxValue = this._7312;
         this._7306.minValue = this._7311;
         this._7301.text = "px";
         this._7301.alpha = _7319;
         this._7302.skinName = _151;
         this._7302.maximum = this._7312;
         this._7302.minimum = this._7311;
         this._7302.value = 100;
         this._7302.x = 100;
         this._7302.y = 4;
         this._7306.x = 175;
         this._7306.y = -2;
         this._7301.x = 220;
         this._7301.y = 0;
         var _loc4_:Group;
         (_loc4_ = _125._2404()).percentWidth = 100;
         var _loc5_:Group;
         (_loc5_ = new Group()).percentWidth = 50;
         _loc5_.addElement(this.bgSize);
         _loc5_.addElement(this._7307);
         _loc5_.addElement(this._7313);
         _loc5_.addElement(this._7304);
         var _loc6_:Group;
         (_loc6_ = new Group()).percentWidth = 50;
         _loc6_.addElement(this.boneSize);
         _loc6_.addElement(this._7302);
         _loc6_.addElement(this._7306);
         _loc6_.addElement(this._7301);
         _loc4_.addElement(_loc5_);
         _loc4_.addElement(_loc6_);
         _1197(_loc1_.layout)._2419 = 15;
         _1197(_loc4_.layout)._2419 = 15;
         _2512.addElement(_12890(tr("Setting.Color")));
         _2512.addElement(_loc1_);
         _2512.addElement(_14328());
         _2512.addElement(_12890(tr("Setting.Size")));
         _2512.addElement(_loc4_);
      }
   }
}

