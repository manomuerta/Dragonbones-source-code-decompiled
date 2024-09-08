package _813
{
   import _1045.Group;
   import _1045.Label;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._162;
   import _1374.ColorPicker;
   import _721._763;
   import _97._117;
   import egret.utils.tr;
   
   public class _815 extends Group
   {
      private var _4444:Label;
      
      private var _6195:Label;
      
      public var _4025:_162;
      
      public var _4024:_162;
      
      public var _4066:ColorPicker;
      
      private var _6189:Label;
      
      private var _6187:Label;
      
      private var _6188:Label;
      
      private var _6161:Group;
      
      private var _6191:Group;
      
      private var _6192:Group;
      
      private var _4761:_763;
      
      public function _815()
      {
         this._4444 = new Label();
         this._6195 = new Label();
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
         super._2438();
         _loc1_ = 48;
         this._6161 = new Group();
         var _loc2_:_1197 = new _1197();
         _loc2_.gap = 8;
         this._6161.layout = _loc2_;
         this._6161.percentWidth = 100;
         this._6161.left = 10;
         this._6161.top = 10;
         this._6161.right = 10;
         this._6161.bottom = 10;
         this.addElement(this._6161);
         this._6191 = this._2414();
         this._6191.height = 22;
         this._6191.percentWidth = 100;
         var _loc3_:Label = new Label();
         _loc3_.width = _loc1_;
         _loc3_.text = tr("Property.armature.name");
         this._4444.text = tr("ComicStageProperty.stage");
         this._6191.addElement(_loc3_);
         this._6191.addElement(this._4444);
         this._6192 = this._2414();
         this._6192.percentWidth = 100;
         var _loc4_:Label;
         (_loc4_ = new Label()).width = _loc1_;
         _loc4_.text = tr("Property.type");
         this._6195.text = tr("ComicStageProperty.type");
         this._6192.addElement(_loc4_);
         this._6192.addElement(this._6195);
         var _loc5_:Group = this._2414();
         this._6189.text = tr("Property.canvas.size");
         this._6189.width = _loc1_;
         this._4025.txt.maxChars = 8;
         this._4025.txt.percentWidth = 100;
         this._4025.percentWidth = 100;
         this._4025.minValue = 1;
         this._4025.maxValue = 2048;
         this._4025.enabled = true;
         this._4025.width = 70;
         _loc5_.addElement(this._6189);
         _loc5_.addElement(this._4025);
         this._6187.text = " X";
         this._6187.width = 20;
         this._4024.txt.maxChars = 8;
         this._4024.txt.percentWidth = 100;
         this._4024.percentWidth = 100;
         this._4024.minValue = 1;
         this._4024.maxValue = 2048;
         this._4024.enabled = true;
         this._4024.width = 70;
         _loc5_.addElement(this._6187);
         _loc5_.addElement(this._4024);
         var _loc6_:Group = this._2414();
         this._6188.text = tr("Property.canvas.bg");
         this._4066._6193 = true;
         this._4066.defaultColor = 16777215;
         this._4066.toolTip = tr("");
         _loc6_.addElement(this._6188);
         _loc6_.addElement(this._4066);
         this._6161.addElement(this._6191);
         this._6161.addElement(this._6192);
         this._6161.addElement(_loc5_);
         this._6161.addElement(_loc6_);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._2894();
      }
      
      private function _2894() : void
      {
         var _loc1_:String = null;
         if(this._4761)
         {
            this._4025.txt.text = String(this._4761.width);
            this._4024.txt.text = String(this._4761.height);
            this._4066._4061 = this._4761.bgColor;
            _loc1_ = this._4761.bgColor.toString(16);
            while(_loc1_.length < 6)
            {
               _loc1_ = "0" + _loc1_;
            }
            _117._2375 = _loc1_;
         }
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
      
      public function set model(param1:_763) : void
      {
         this._4761 = param1;
         this._2894();
      }
   }
}

