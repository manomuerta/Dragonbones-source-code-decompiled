package _1008
{
   import _1038._1037;
   import _1045.Group;
   import _1045.HSlider;
   import _1045.Label;
   import _1045._1105;
   import _1177.IndexChangeEvent;
   import _1177.UIEvent;
   import _1185._1188;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._147;
   import _127._148;
   import _127._151;
   import _127._156;
   import _127._162;
   import _1374.IconTabBarButton;
   import _1374.TextInput;
   import _1374._1391;
   import _1439._1458;
   import _636.AnimationEvent;
   import _636.DBPanelEvent;
   import _636.TransformEvent;
   import _708._707;
   import _81._88;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   
   public class TransformPanel extends _156
   {
      private static var _7037:String = "/assets/button/globalCoordinate.png";
      
      private static var _7029:String = "/assets/button/parentCoordinate.png";
      
      private static var _7031:String = "/assets/button/localCoordinate.png";
      
      private static var _7034:String = "/assets/panelIcon/scaleX.png";
      
      private static var _7033:String = "/assets/panelIcon/scaleY.png";
      
      private static var _6147:String = "/assets/panelIcon/rotation.png";
      
      private static var _7039:String = "/assets/panelIcon/width.png";
      
      private static var _7038:String = "/assets/panelIcon/height.png";
      
      private static var _6653:String = "/assets/panelIcon/x.png";
      
      private static var _6654:String = "/assets/panelIcon/y.png";
      
      private static var _10484:String = "/assets/panelIcon/alpha.png";
      
      private const _14765:int = 30;
      
      public var _4781:_162;
      
      public var _4780:_162;
      
      public var _4792:_162;
      
      public var _4791:_162;
      
      public var _4790:_162;
      
      public var _4771:_148;
      
      private var minValue:Number = 1;
      
      private var _2590:Number = 1;
      
      public var _4794:_162;
      
      public var _4789:_162;
      
      private var _6642:Label;
      
      public var _10474:_162;
      
      public var _10473:HSlider;
      
      private var _6656:_1105;
      
      private var _6655:_1105;
      
      private var _7040:_1105;
      
      private var _7041:_1105;
      
      private var _7042:_1105;
      
      private var _7044:_1105;
      
      private var _7043:_1105;
      
      private var _10486:_1105;
      
      public var _4796:Group;
      
      public var _6158:Group;
      
      private var _4761:Object;
      
      public var _4905:_1391;
      
      private var _6685:_1037;
      
      private var _7035:Object;
      
      private var _7036:Label;
      
      private var _7032:Boolean = true;
      
      private var _10532:_162;
      
      private var _2584:Number;
      
      private var _6646:Number;
      
      private var _6511:Number = 0.5;
      
      public function TransformPanel()
      {
         this._6642 = new Label();
         this._10474 = new _162();
         this._10473 = new HSlider();
         this._6656 = new _1105(_6653);
         this._6655 = new _1105(_6654);
         this._7040 = new _1105(_6147);
         this._7041 = new _1105(_7034);
         this._7042 = new _1105(_7033);
         this._7044 = new _1105(_7039);
         this._7043 = new _1105(_7038);
         this._10486 = new _1105(_10484);
         this._6685 = new _1037();
         this._7035 = {};
         super();
         this.title = tr("Transform.title");
         this.icon = "/assets/panel/transform.png";
         this._7035[_707.GLOBAL.toString()] = {
            "icon":_7037,
            "toolTip":tr("TransformPanel.WorldBtn_tooltip"),
            "data":_707.GLOBAL,
            "enabled":true
         };
         this._7035[_707.PARENT.toString()] = {
            "icon":_7029,
            "toolTip":tr("TransformPanel.ParentBtn_tooltip"),
            "data":_707.PARENT,
            "enabled":true
         };
         this._7035[_707.LOCAL.toString()] = {
            "icon":_7031,
            "toolTip":tr("TransformPanel.LocalBtn_tooltip"),
            "data":_707.LOCAL,
            "enabled":true
         };
         this._6685.source = [this._7035[_707.GLOBAL],this._7035[_707.PARENT],this._7035[_707.LOCAL]];
      }
      
      override protected function _2438() : void
      {
         addEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
         super._2438();
         this._4905 = new _1391();
         this._4905.dataProvider = this._6685;
         this._4905.selectedIndex = 0;
         this._4905.skinName = _1458;
         this._4905.itemRenderer = IconTabBarButton;
         this._4905.addEventListener(IndexChangeEvent.CHANGE,this._6408);
         var _loc1_:int = 50;
         var _loc2_:Group = new Group();
         _loc2_.left = 10;
         _loc2_.top = 2;
         _loc2_.right = 10;
         _loc2_.percentWidth = 100;
         _loc2_.layout = new _1197();
         addElement(_loc2_);
         var _loc3_:Group = this._6535();
         var _loc4_:Group = this._6535();
         _loc3_.addElement(this._6656);
         _loc4_.addElement(this._6655);
         var _loc5_:Group = this._2414();
         var _loc6_:Label;
         (_loc6_ = new Label()).width = _loc1_;
         _loc6_.text = tr("Transform.translate");
         this._4781 = new _162();
         this._4781.percentWidth = 100;
         this._4781.txt.percentWidth = 100;
         this._4781.enabled = true;
         this._4781._2573 = true;
         this._4781.txt.text = "";
         this._4780 = new _162();
         this._4780.percentWidth = 100;
         this._4780.txt.percentWidth = 100;
         this._4780._2573 = true;
         this._4780.txt.text = "";
         _loc5_.addElement(_loc3_);
         _loc5_.addElement(this._4781);
         _loc5_.addElement(_loc4_);
         _loc5_.addElement(this._4780);
         _loc2_.addElement(_loc5_);
         var _loc7_:Group = this._2414();
         var _loc8_:Group = this._2414();
         var _loc9_:Group = this._2414();
         var _loc10_:Group = this._6535();
         this._7040.right = 4;
         _loc10_.addElement(this._7040);
         this._4790 = new _162();
         this._4790.percentWidth = 100;
         this._4790.txt.percentWidth = 100;
         this._4790.txt.text = "";
         this._7036 = new Label();
         this._7036.text = tr("Transform.degree");
         _loc8_.addElement(_loc10_);
         _loc8_.addElement(this._4790);
         this._4771 = new _148();
         _1189(_loc9_.layout)._2419 = 10;
         _loc9_.addElement(this._4771);
         _loc7_.addElement(_loc8_);
         _loc7_.addElement(_loc9_);
         _loc2_.addElement(_loc7_);
         var _loc11_:Group = this._2414();
         var _loc12_:Group = this._6535();
         var _loc13_:Group = this._6535();
         this._7041.right = 4;
         this._7042.right = 4;
         _loc12_.addElement(this._7041);
         _loc13_.addElement(this._7042);
         this._4792 = new _162();
         this._4792._2579 = 0.1;
         this._4792.txt.percentWidth = 100;
         this._4792.percentWidth = 100;
         this._4792.txt.text = "";
         this._4791 = new _162();
         this._4791._2579 = 0.1;
         this._4791.txt.percentWidth = 100;
         this._4791.percentWidth = 100;
         this._4791.txt.text = "";
         _loc11_.addElement(_loc12_);
         _loc11_.addElement(this._4792);
         _loc11_.addElement(_loc13_);
         _loc11_.addElement(this._4791);
         _loc2_.addElement(_loc11_);
         this._4796 = this._2414();
         var _loc14_:Group = this._6535();
         var _loc15_:Group = this._6535();
         this._4794 = new _162();
         this._4794.percentWidth = 100;
         this._4794.txt.percentWidth = 100;
         this._4794.txt.text = "";
         this._4789 = new _162();
         this._4789.percentWidth = 100;
         this._4789.txt.percentWidth = 100;
         this._4789.txt.text = "";
         _loc14_.addElement(this._7044);
         _loc15_.addElement(this._7043);
         this._4796.addElement(_loc14_);
         this._4796.addElement(this._4794);
         this._4796.addElement(_loc15_);
         this._4796.addElement(this._4789);
         _loc2_.addElement(this._4796);
         this._4796.visible = false;
         this._6158 = this._2414();
         _1189(this._6158.layout)._2419 = 14;
         this._10473.skinName = _151;
         this._10473.maximum = 100;
         this._10473.minimum = 0;
         this._10473.value = 100;
         this._10474.txt.text = "";
         this._10474.txt.width = 50;
         this._10474.maxValue = 100;
         this._10474.minValue = 0;
         this._4791._2579 = 1;
         this._6642.text = "%";
         var _loc16_:Group = this._2414();
         var _loc17_:Group = this._2414();
         this._6158.addElement(this._10486);
         this._6158.addElement(this._10473);
         this._6158.addElement(this._10474);
         this._6158.addElement(this._6642);
         _loc2_.addElement(this._6158);
         this._6158.visible = false;
         this._3990();
      }
      
      private function onComplete(param1:UIEvent) : void
      {
         this._4771.addEventListener(_147._2545,this.radius);
         this._10474.addEventListener(FocusEvent.FOCUS_OUT,this._6637);
         this._10474.addEventListener(Event.CHANGE,this._6639);
         this._10473.addEventListener(Event.CHANGE,this._6636);
         this._10473.addEventListener(UIEvent.CHANGE_END,this._6633);
         this._10473.addEventListener(UIEvent.CHANGE_START,this._6632);
         removeEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
         if(this._4761 != null)
         {
            this.enabled = true;
            this.model = this._4761;
         }
         else
         {
            this.model = null;
            this.enabled = false;
         }
      }
      
      private function radius(param1:_147) : void
      {
         this.setValue(Math.floor((param1._2544 * this._2590 + this.minValue) * 100) / 100);
      }
      
      private function setValue(param1:Number) : void
      {
         this._4771.rotation = (param1 - this.minValue) / this._2590;
         this._4790.txt.text = Number(Math.floor(param1 * 100) / 100).toString();
         this._2584 = param1;
         this._4771.dispatchEvent(new _147(_147._2543));
      }
      
      private function _6408(param1:IndexChangeEvent) : void
      {
         dispatchEvent(new DBPanelEvent(DBPanelEvent.COORDINATE_CHANGED,param1));
      }
      
      public function set model(param1:Object) : void
      {
         this._4761 = param1;
         if(!initialized)
         {
            return;
         }
         if(this._4761)
         {
            this._4781.txt.text = this._4761.x;
            this._4780.txt.text = this._4761.y;
            this._4792.txt.text = this._4761.scaleX;
            this._4791.txt.text = this._4761.scaleY;
            this._4790.txt.text = this._4761.rotation;
            this._4771.rotation = this._4761.rotation == "" ? 0 : Number(this._4761.rotation);
            this._7036.visible = true;
         }
         else
         {
            this._4781.txt.text = "";
            this._4780.txt.text = "";
            this._4792.txt.text = "";
            this._4791.txt.text = "";
            this._4790.txt.text = "";
            this._4794.txt.text = "";
            this._4789.txt.text = "";
            this._10474.txt.text = "";
            this._7036.visible = false;
         }
      }
      
      private function _6535() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = this._14765;
         var _loc2_:_1189 = new _1189();
         _loc2_._2401 = _1188.RIGHT;
         _loc1_.layout = _loc2_;
         return _loc1_;
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
      
      public function _4795(param1:Number) : void
      {
         if(this._4761)
         {
            this._4794.txt.text = param1.toFixed(2);
         }
      }
      
      public function _4788(param1:Number) : void
      {
         if(this._4761)
         {
            this._4789.txt.text = param1.toFixed(2);
         }
      }
      
      private function _4787(param1:TextInput) : Number
      {
         var _loc2_:Number = Number(param1.text);
         if(isNaN(_loc2_))
         {
            _loc2_ = 0;
         }
         return _loc2_;
      }
      
      public function get rotate() : Number
      {
         return this._4787(this._4790.txt) * _88.ANGLE_TO_RADIAN;
      }
      
      public function get translateX() : Number
      {
         return this._4787(this._4781.txt);
      }
      
      public function get translateY() : Number
      {
         return this._4787(this._4780.txt);
      }
      
      public function get _4786() : Number
      {
         return this._4787(this._4794.txt);
      }
      
      public function get _4785() : Number
      {
         return this._4787(this._4789.txt);
      }
      
      public function get _4784() : Number
      {
         var _loc1_:Number = this._4787(this._4792.txt);
         if(_loc1_ > 100)
         {
            _loc1_ = 100;
         }
         else if(_loc1_ < -100)
         {
            _loc1_ = -100;
         }
         if(_loc1_ == 0)
         {
            _loc1_ = 0.01;
         }
         return _loc1_;
      }
      
      public function get _4783() : Number
      {
         var _loc1_:Number = this._4787(this._4791.txt);
         if(_loc1_ > 100)
         {
            _loc1_ = 100;
         }
         else if(_loc1_ < -100)
         {
            _loc1_ = -100;
         }
         if(_loc1_ == 0)
         {
            _loc1_ = 0.01;
         }
         return _loc1_;
      }
      
      private function _6639(param1:Event) : void
      {
         var _loc2_:int = int(this._10474.txt.text);
         if(_loc2_ > 100)
         {
            _loc2_ = 100;
            this._10474.txt.text = _loc2_.toString();
         }
         else if(_loc2_ < 0)
         {
            _loc2_ = 0;
            this._10474.txt.text = _loc2_.toString();
         }
         if(_loc2_ != this._10473.value)
         {
            this._10473.value = _loc2_;
         }
      }
      
      private function _6633(param1:Event) : void
      {
         this._6637(null);
      }
      
      private function _6632(param1:Event) : void
      {
         this._6646 = int(this._10473.value) / 100;
      }
      
      private function _6636(param1:Event) : void
      {
         var _loc2_:int = this._10473.value;
         this._10474.txt.text = _loc2_.toString();
         dispatchEvent(new AnimationEvent(AnimationEvent.CHANGE_SLOT_COMIC_ALPHA,{
            "to":_loc2_ / 100,
            "from":this._6646
         }));
      }
      
      private function _6637(param1:FocusEvent) : void
      {
         var _loc2_:Number = Number(this._10474.txt.text);
         if(_loc2_ > 100)
         {
            _loc2_ = 100;
         }
         else if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         _loc2_ /= 100;
         var _loc3_:Number = this._6646;
         if(_loc3_ != _loc2_)
         {
            dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_SLOT_COMIC_ALPHA,{
               "from":_loc3_,
               "to":_loc2_
            }));
         }
      }
      
      public function get _4768() : _707
      {
         return this._4905._2484.data;
      }
      
      public function set _4768(param1:_707) : void
      {
         this._4905._2484 = this._7035[param1.toString()];
      }
      
      public function set _4774(param1:Boolean) : void
      {
         if(this._7032 == param1)
         {
            return;
         }
         this._7032 = param1;
         this._4781.enabled = this._7032;
         this._4780.enabled = this._7032;
         this._4792.enabled = this._7032;
         this._4791.enabled = this._7032;
         this._4790.enabled = this._7032;
         this._4771.enabled = this._7032;
         this._4794.enabled = this._7032;
         this._4789.enabled = this._7032;
         this._10474.enabled = this._7032;
         this._10473.enabled = this._7032;
         if(param1)
         {
            this._6656.alpha = 1;
            this._6655.alpha = 1;
            this._7040.alpha = 1;
            this._7041.alpha = 1;
            this._7042.alpha = 1;
            this._7044.alpha = 1;
            this._7043.alpha = 1;
            this._10486.alpha = 1;
            this._6642.alpha = 1;
         }
         else
         {
            this._6656.alpha = this._6511;
            this._6655.alpha = this._6511;
            this._7040.alpha = this._6511;
            this._7041.alpha = this._6511;
            this._7042.alpha = this._6511;
            this._7044.alpha = this._6511;
            this._7043.alpha = this._6511;
            this._10486.alpha = this._6511;
            this._6642.alpha = this._6511;
         }
      }
      
      private function _3990() : void
      {
         this._4790.txt.addEventListener(FocusEvent.FOCUS_OUT,this._4775);
         this._4781.txt.addEventListener(FocusEvent.FOCUS_OUT,this._4772);
         this._4780.txt.addEventListener(FocusEvent.FOCUS_OUT,this._4773);
         this._4792.txt.addEventListener(FocusEvent.FOCUS_OUT,this._4777);
         this._4791.txt.addEventListener(FocusEvent.FOCUS_OUT,this._4776);
         this._4794.txt.addEventListener(FocusEvent.FOCUS_OUT,this._4779);
         this._4789.txt.addEventListener(FocusEvent.FOCUS_OUT,this._4778);
         this._4790._2599 = this._4775;
         this._4781._2599 = this._4772;
         this._4780._2599 = this._4773;
         this._4792._2599 = this._4777;
         this._4791._2599 = this._4776;
         this._4794._2599 = this._4779;
         this._4789._2599 = this._4778;
         this._4771.addEventListener(_147._2543,this._4769);
         this._4771.addEventListener(_147._2542,this._4766);
         this._4771.addEventListener(MouseEvent.MOUSE_DOWN,this._10857,false,100);
      }
      
      private function _10857(param1:MouseEvent) : void
      {
         dispatchEvent(new TransformEvent(TransformEvent.ROTATION_COMPLETE));
      }
      
      private function _4766(param1:_147) : void
      {
         dispatchEvent(new TransformEvent(TransformEvent.ROTATION_COMPLETE));
      }
      
      private function _4769(param1:_147) : void
      {
         dispatchEvent(new TransformEvent(TransformEvent.ROTATION_CHANGE,{
            "value":this.rotate,
            "merge":true
         }));
      }
      
      private function _4779(param1:FocusEvent) : void
      {
         var _loc2_:Boolean = false;
         if(this._4794.txt.text != "")
         {
            if(this._10532 == this._4794)
            {
               _loc2_ = true;
            }
            else
            {
               this._10532 = this._4794;
               _loc2_ = false;
            }
            dispatchEvent(new TransformEvent(TransformEvent.WIDTH_CHANGE,{
               "value":this._4786,
               "merge":_loc2_
            }));
         }
      }
      
      private function _4778(param1:FocusEvent) : void
      {
         var _loc2_:Boolean = false;
         if(this._4789.txt.text != "")
         {
            if(this._10532 == this._4789)
            {
               _loc2_ = true;
            }
            else
            {
               this._10532 = this._4789;
               _loc2_ = false;
            }
            dispatchEvent(new TransformEvent(TransformEvent.HEIGHT_CHANGE,{
               "value":this._4785,
               "merge":_loc2_
            }));
         }
      }
      
      private function _4777(param1:FocusEvent) : void
      {
         var _loc2_:Boolean = false;
         if(this._4792.txt.text != "")
         {
            if(this._10532 == this._4792)
            {
               _loc2_ = true;
            }
            else
            {
               this._10532 = this._4792;
               _loc2_ = false;
            }
         }
         dispatchEvent(new TransformEvent(TransformEvent.SCALE_X_CHANGE,{
            "value":this._4784,
            "merge":_loc2_
         }));
      }
      
      private function _4776(param1:FocusEvent) : void
      {
         var _loc2_:Boolean = false;
         if(this._4791.txt.text != "")
         {
            if(this._10532 == this._4791)
            {
               _loc2_ = true;
            }
            else
            {
               this._10532 = this._4791;
               _loc2_ = false;
            }
         }
         dispatchEvent(new TransformEvent(TransformEvent.SCALE_Y_CHANGE,{
            "value":this._4783,
            "merge":_loc2_
         }));
      }
      
      private function _4772(param1:FocusEvent) : void
      {
         var _loc2_:Boolean = false;
         if(this._4781.txt.text != "")
         {
            if(this._10532 == this._4781)
            {
               _loc2_ = true;
            }
            else
            {
               this._10532 = this._4781;
               _loc2_ = false;
            }
         }
         dispatchEvent(new TransformEvent(TransformEvent.X_CHANGE,{
            "value":this.translateX,
            "merge":_loc2_
         }));
      }
      
      private function _4773(param1:FocusEvent) : void
      {
         var _loc2_:Boolean = false;
         if(this._4780.txt.text != "")
         {
            if(this._10532 == this._4780)
            {
               _loc2_ = true;
            }
            else
            {
               this._10532 = this._4780;
               _loc2_ = false;
            }
         }
         dispatchEvent(new TransformEvent(TransformEvent.Y_CHANGE,{
            "value":this.translateY,
            "merge":_loc2_
         }));
      }
      
      private function _4775(param1:FocusEvent) : void
      {
         var _loc2_:Boolean = false;
         if(this._4790.txt.text != "")
         {
            if(this._10532 == this._4790)
            {
               _loc2_ = true;
            }
            else
            {
               this._10532 = this._4790;
               _loc2_ = false;
            }
         }
         dispatchEvent(new TransformEvent(TransformEvent.ROTATION_CHANGE,{
            "value":this.rotate,
            "merge":_loc2_
         }));
      }
   }
}

