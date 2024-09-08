package _906
{
   import _1045.Group;
   import _1045.Label;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._128;
   import _127._162;
   import _1374.ColorPicker;
   import _1374.IconButton;
   import _1374.TextInput;
   import _51._52;
   import _51._77;
   import _521._532;
   import _636.BoneEvent;
   import _639._642;
   import _668._672;
   import _908._907;
   import _97._100;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _909 extends Group
   {
      private var _6546:Label;
      
      private var _6550:Label;
      
      private var _6547:Group;
      
      private var _6548:Label;
      
      public var _4443:TextInput;
      
      public var _6543:Label;
      
      private var _6544:Label;
      
      public var _4441:_162;
      
      private var _6542:Label;
      
      public var _4383:_128;
      
      public var _4378:_128;
      
      private var _6549:Group;
      
      private var _6532:Label;
      
      public var _4442:IconButton;
      
      public var _4447:IconButton;
      
      private var _6643:Group;
      
      private var _6537:Array;
      
      private var _6540:Array;
      
      private var _4761:_672;
      
      private var _6511:Number = 0.5;
      
      private var _2594:uint = 8883859;
      
      private var _6545:Boolean = true;
      
      private var _13977:int;
      
      private var boneColor:Label;
      
      public var _7303:ColorPicker;
      
      private var _7305:uint;
      
      private var _14770:Object;
      
      private var _14771:uint;
      
      public function _909()
      {
         this._6546 = new Label();
         this._6550 = new Label();
         this._6547 = this._2414();
         this._6548 = new Label();
         this._4443 = new TextInput();
         this._6543 = new Label();
         this._6544 = new Label();
         this._4441 = new _162();
         this._6542 = new Label();
         this._4383 = new _128();
         this._4378 = new _128();
         this._6532 = new Label();
         this._4442 = new IconButton();
         this._4447 = new IconButton();
         this._6537 = [];
         this._6540 = [];
         this._7303 = new ColorPicker();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.layout = new _1197();
         percentWidth = 100;
         this._6548.width = PropertyPanel._14765;
         this._6548.text = tr("Property.bone.name");
         this._4443.percentWidth = 100;
         this._6543.percentWidth = 100;
         this._6543.height = 20;
         this._6543._6541 = true;
         this._6547.addElement(this._6548);
         this._6547.addElement(this._4443);
         addElement(this._6547);
         var _loc1_:Group = this._2414();
         this._6546.width = PropertyPanel._14765;
         this._6546.text = tr("Property.type");
         this._6550.text = tr("Property.bone");
         _loc1_.addElement(this._6546);
         _loc1_.addElement(this._6550);
         addElement(_loc1_);
         _loc1_ = this._2414();
         this._6544.width = PropertyPanel._14765;
         this._6544.text = tr("Property.bone.length");
         this._4441.txt.restrict = "0-9.";
         this._4441.txt.maxChars = 4;
         this._4441.percentWidth = 100;
         this._4441.txt.percentWidth = 100;
         this._4441.maxValue = _52.MAX_LENGTH;
         this._4441.minValue = 0;
         _loc1_.addElement(this._6544);
         _loc1_.addElement(this._4441);
         addElement(_loc1_);
         _loc1_ = this._2414();
         this._6542.width = PropertyPanel._14765;
         this._6542.text = tr("Property.bone.inherit");
         this._4383.label = tr("Property.bone.inheritScale");
         this._4378.label = tr("Property.bone.inheritRotation");
         _loc1_.addElement(this._6542);
         _loc1_.addElement(this._4383);
         _loc1_.addElement(this._4378);
         addElement(_loc1_);
         this._6549 = this._2414();
         this._6532.width = PropertyPanel._14765;
         this._6532.text = tr("Property.bone.ikConstraint");
         this._4442.icon = "/assets/button/ikce.png";
         this._4442.toolTip = tr("Property.ik.endPick");
         this._4447.icon = "/assets/button/ikcf.png";
         this._4447.toolTip = tr("Property.ik.pick");
         this._6549.addElement(this._6532);
         this._6549.addElement(this._4442);
         this._6549.addElement(this._4447);
         addElement(this._6549);
         this._6643 = this._2414();
         this.boneColor = new Label();
         this.boneColor.width = PropertyPanel._14765;
         this.boneColor.text = tr("Setting.BOColor");
         this._6643.addElement(this.boneColor);
         this._7303._6193 = true;
         this._7303.defaultColor = 16777215;
         this._7303.addEventListener(MouseEvent.CLICK,this._6641);
         this._7303.addEventListener(Event.CHANGE,this._4052);
         this._7303.addEventListener(UIEvent.CONFIRM,this._4052);
         this._7303.addEventListener(Event.CANCEL,this._4052);
         this._7303.addEventListener(Event.CLEAR,this._4052);
         this._6643.addElement(this._7303);
         var _loc2_:String = "assets/button/eraser.png";
         var _loc3_:IconButton = new IconButton();
         _loc3_.icon = _loc2_;
         _loc3_.toolTip = tr("Property.bone.resetcolor");
         _loc3_.addEventListener(MouseEvent.CLICK,this._10578);
         this._6643.addElement(_loc3_);
         addElement(this._6643);
         initialized = true;
         this.enabled = this.enabled;
         if(this._4761)
         {
            this.model = this._4761;
         }
      }
      
      private function _6641(param1:MouseEvent) : void
      {
         var _loc2_:_52 = null;
         var _loc3_:int = 0;
         _532.instance._2889 = [];
         this._14770 = {};
         if(this.model._4445)
         {
            _loc3_ = 0;
            while(_loc3_ < this.model._4445.length)
            {
               _loc2_ = this.model._4445[_loc3_];
               this._14770[_loc2_.name] = _loc2_._14270;
               _loc3_++;
            }
         }
         this._7305 = this._7303._4061;
      }
      
      private function _10578(param1:MouseEvent) : void
      {
         var _loc2_:Object = null;
         if(this.model._4445)
         {
            this._7303._4061 = _642.getInstance().boneColor;
            _loc2_ = {
               "bones":this.model._4445,
               "defaultColor":_100._14268,
               "_14418":this._7303
            };
            this.dispatchEvent(new BoneEvent(BoneEvent.RESET_BONESYMBOL_COLOR,_loc2_,true));
         }
      }
      
      private function _4052(param1:Event) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:_52 = null;
         var _loc7_:Object = null;
         var _loc2_:Number = 1;
         if(param1.type == UIEvent.CONFIRM)
         {
            this._7305 = this._7303._4061;
            if(this.model._4445)
            {
               _loc3_ = {
                  "_4445":this.model._4445,
                  "newColor":this._7305,
                  "_2956":this._14770,
                  "_14418":this._7303,
                  "_14417":this._14771
               };
               this.dispatchEvent(new BoneEvent(BoneEvent.CONFIRM_CHANGE_BONESYMBOL_COLOR,_loc3_,true));
               _532.instance._2889 = this.model._4445;
            }
         }
         else if(param1.type == Event.CLEAR)
         {
            _532.instance._2889 = this.model._4445;
            _loc4_ = {
               "bones":this.model._4445,
               "defaultColor":_100._14268
            };
            this.dispatchEvent(new BoneEvent(BoneEvent.RESET_BONESYMBOL_COLOR,_loc4_,true));
         }
         else if(param1.type == Event.CHANGE)
         {
            this._7305 = this._7303._4061;
            if(this.model._4445)
            {
               _loc5_ = {
                  "bones":this.model._4445,
                  "newColor":this._7305
               };
               this.dispatchEvent(new BoneEvent(BoneEvent.CHANGE_BONESYMBOL_COLOR,_loc5_,true));
            }
         }
         else if(param1.type == Event.CANCEL)
         {
            _532.instance._2889 = this.model._4445;
            this._7305 = this._7303._4061;
            if(this.model._4445)
            {
               _loc7_ = {
                  "bones":this.model._4445,
                  "preColors":this._14770
               };
               this.dispatchEvent(new BoneEvent(BoneEvent.CANCEL_CHANGE_BONESYMBOL_COLOR,_loc7_,true));
            }
         }
      }
      
      private function _6535() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 60;
         var _loc2_:_1189 = new _1189();
         _loc2_.verticalAlign = _1196.MIDDLE;
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
      
      public function get model() : _672
      {
         return this._4761;
      }
      
      public function set model(param1:_672) : void
      {
         var _loc2_:_52 = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_77 = null;
         var _loc8_:_77 = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:_77 = null;
         var _loc12_:_52 = null;
         this._4761 = param1;
         this._6527(true);
         this._6526(true);
         this._6539(false,tr("Property.ik.noInherit"),tr("Property.ik.noInherit"));
         if(initialized)
         {
            if(this._4761._4445)
            {
               _loc3_ = [];
               _loc4_ = [];
               if(this._4761._4445.length > 2)
               {
                  if(this._4443.parent)
                  {
                     this._6547.removeElement(this._4443);
                  }
                  if(this._6543.parent)
                  {
                     this._6547.removeElement(this._6543);
                  }
                  this._6547.addElement(this._6543);
                  this._6543.text = "";
                  for each(_loc2_ in this._4761._4445)
                  {
                     this._6543.text += _loc2_.name + ",";
                  }
                  this._6543.alpha = this._6511;
                  this._6548.alpha = this._6511;
                  this._4441.txt.text = this._6538(this._4761._4445);
                  this._4383.selected = (this._4761._4445[0] as _52).inheritScale;
                  this._4378.selected = (this._4761._4445[0] as _52).inheritRotation;
                  _loc5_ = 0;
                  _loc6_ = int(this._4761._4445.length);
                  while(_loc5_ < _loc6_)
                  {
                     if((this._4761._4445[_loc5_] as _52)._1980)
                     {
                        this._6526(false);
                        this._6527(false);
                     }
                     _loc5_++;
                  }
                  this._6539(false,tr("Property.ik.moreBones"),tr("Property.ik.moreBones"));
                  this._6528([]);
                  this._6531([]);
               }
               else if(this._4761._4445.length == 2)
               {
                  _loc3_.length = 0;
                  _loc4_.length = 0;
                  if(this._4443.parent)
                  {
                     this._6547.removeElement(this._4443);
                  }
                  if(this._6543.parent)
                  {
                     this._6547.removeElement(this._6543);
                  }
                  this._6547.addElement(this._6543);
                  this._6543.text = "";
                  _loc7_ = this._4761._4445[0].rootArmatureData._1966(this._4761._4445[0]);
                  _loc8_ = this._4761._4445[1].rootArmatureData._1966(this._4761._4445[1]);
                  this._6543.text = this._4761._4445[0].name + "," + this._4761._4445[1].name;
                  this._6543.alpha = this._6511;
                  this._6548.alpha = this._6511;
                  if(Boolean(_loc7_) && Boolean(_loc8_) && _loc7_ == _loc8_)
                  {
                     _loc3_.push(_loc7_);
                  }
                  this._4441.txt.text = this._6538(this._4761._4445);
                  this._4383.selected = (this._4761._4445[0] as _52).inheritScale;
                  this._4378.selected = (this._4761._4445[0] as _52).inheritRotation;
                  _loc9_ = 0;
                  _loc10_ = int(this._4761._4445.length);
                  while(_loc9_ < _loc10_)
                  {
                     if((this._4761._4445[_loc9_] as _52)._1980)
                     {
                        this._6526(false);
                        this._6527(false);
                     }
                     _loc9_++;
                  }
                  if(!this._4761._4445[0]._1980 && !this._4761._4445[1]._1980)
                  {
                     if(this._4378.selected && this._4383.selected && (this._4761._4445[0] as _52).inheritRotation == (this._4761._4445[1] as _52).inheritRotation && (this._4761._4445[0] as _52).inheritScale == (this._4761._4445[1] as _52).inheritScale)
                     {
                        this._6539(true);
                     }
                  }
                  this._6528(_loc3_);
                  this._6531([]);
               }
               else
               {
                  _loc3_.length = 0;
                  _loc4_.length = 0;
                  if(this._4443.parent)
                  {
                     this._6547.removeElement(this._4443);
                  }
                  if(this._6543.parent)
                  {
                     this._6547.removeElement(this._6543);
                  }
                  this._6547.addElement(this._4443);
                  _loc2_ = this._4761._4445[0];
                  this._4443.text = _loc2_.name;
                  this._4443.enabled = true;
                  this._6548.alpha = 1;
                  this._4441.txt.text = _loc2_.length.toString();
                  this._4383.selected = _loc2_.inheritScale;
                  this._4378.selected = _loc2_.inheritRotation;
                  if(!_loc2_._1980 && this._4378.selected && this._4383.selected)
                  {
                     this._6539(true);
                  }
                  _loc11_ = _loc2_.rootArmatureData._1966(_loc2_);
                  _loc4_ = _loc2_.rootArmatureData._1981(_loc2_);
                  this._6528([_loc11_]);
                  this._6531(_loc4_);
               }
               this._6534(true);
               if(this.model._4445.length > 0)
               {
                  _loc12_ = this.model._4445[0];
                  this._14771 = _loc12_._14270 == _100._14268 ? _642.getInstance().boneColor : _loc12_._14270;
                  this._7303._4061 = this._14771;
               }
            }
         }
      }
      
      private function _6536(param1:Boolean) : void
      {
         if(param1)
         {
            this._6546.alpha = 1;
            this._6550.textColor = 16777215;
         }
         else
         {
            this._6546.alpha = this._6511;
            this._6550.textColor = this._2594;
         }
         this._6550.enabled = param1;
      }
      
      private function _6530(param1:Boolean) : void
      {
         if(this._6545 && param1)
         {
            this._6544.alpha = 1;
            this._4441.txt.textColor = 16777215;
            this._4441.enabled = true;
         }
         else
         {
            this._6544.alpha = this._6511;
            this._4441.txt.textColor = this._2594;
            this._4441.enabled = false;
         }
      }
      
      private function _6533(param1:Boolean) : void
      {
         if(param1)
         {
            this._6548.alpha = 1;
            this._4443.textColor = 16777215;
         }
         else
         {
            this._6548.alpha = this._6511;
            this._4443.textColor = this._2594;
         }
         this._4443.enabled = param1;
      }
      
      private function _6527(param1:Boolean) : void
      {
         if(this._6545 && param1)
         {
            this._4383.enabled = true;
         }
         else
         {
            this._4383.enabled = false;
         }
      }
      
      private function _6526(param1:Boolean) : void
      {
         if(this._6545 && param1)
         {
            this._4378.enabled = true;
         }
         else
         {
            this._4378.enabled = false;
         }
      }
      
      private function _6529(param1:Boolean) : void
      {
         if(this._6545 && param1)
         {
            this._6542.alpha = 1;
            this._4383.enabled = true;
            this._4378.enabled = true;
         }
         else
         {
            this._6542.alpha = this._6511;
            this._4383.enabled = false;
            this._4378.enabled = false;
         }
      }
      
      private function _6539(param1:Boolean, param2:String = "", param3:String = "") : void
      {
         if(this._6545 && param1)
         {
            if(Boolean(this._6549) && !this._6549.parent)
            {
               addElement(this._6549);
            }
         }
         else if(Boolean(this._6549) && Boolean(this._6549.parent))
         {
            Group(this._6549.parent).removeElement(this._6549);
         }
         if(this._6545 && param1)
         {
            this._6532.alpha = 1;
            this._4442.enabled = true;
            this._4447.enabled = true;
         }
         else
         {
            this._6532.alpha = this._6511;
            this._4442.enabled = false;
            this._4447.enabled = false;
         }
         if(param2 == "")
         {
            this._4442.toolTip = tr("Property.ik.endPick");
         }
         else
         {
            this._4442.toolTip = param2;
         }
         if(param3 == "")
         {
            this._4447.toolTip = tr("Property.ik.pick");
         }
         else
         {
            this._4447.toolTip = param3;
         }
      }
      
      private function _6534(param1:Boolean) : void
      {
         var _loc2_:_907 = null;
         var _loc3_:_907 = null;
         for each(_loc2_ in this._6537)
         {
            _loc2_._6513(this._6545 && param1);
            _loc2_._4425 = this._6545;
         }
         for each(_loc3_ in this._6540)
         {
            _loc3_._6513(this._6545 && param1);
         }
      }
      
      public function _14432() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_907 = null;
         _loc1_ = 0;
         _loc2_ = int(this._6537.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._6537[_loc1_];
            if(_loc3_)
            {
               _loc3_.update();
            }
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(this._6540.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._6540[_loc1_];
            if(_loc3_)
            {
               _loc3_.update();
            }
            _loc1_++;
         }
      }
      
      public function _13801(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_907 = null;
         this._13977 = param1;
         _loc2_ = 0;
         _loc3_ = int(this._6537.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._6537[_loc2_];
            if(_loc4_)
            {
               _loc4_._13801(param1);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         _loc3_ = int(this._6540.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._6540[_loc2_];
            if(_loc4_)
            {
               _loc4_._13801(param1);
            }
            _loc2_++;
         }
      }
      
      private function _6538(param1:Array) : String
      {
         var _loc3_:_52 = null;
         var _loc2_:Number = Number(this._4761._4445[0].length);
         for each(_loc3_ in param1)
         {
            if(_loc3_.length != _loc2_)
            {
               return "";
            }
         }
         return "" + _loc2_;
      }
      
      private function _6528(param1:Array) : void
      {
         var _loc2_:_77 = null;
         var _loc3_:_907 = null;
         var _loc4_:_907 = null;
         if(this._6537.length)
         {
            for each(_loc3_ in this._6537)
            {
               if(Boolean(_loc3_) && Boolean(_loc3_.parent))
               {
                  this.removeElement(_loc3_);
               }
            }
         }
         this._6537.length = 0;
         for each(_loc2_ in param1)
         {
            if(_loc2_)
            {
               (_loc4_ = new _907())._4425 = this._6545;
               _loc4_._6522 = false;
               _loc4_.data = _loc2_;
               _loc4_._13801(this._13977);
               addElement(_loc4_);
               this._6537.push(_loc4_);
               this._6526(false);
               this._6527(false);
            }
         }
      }
      
      private function _6531(param1:Array) : void
      {
         var _loc2_:_77 = null;
         var _loc3_:_907 = null;
         var _loc4_:_907 = null;
         if(this._6540.length)
         {
            for each(_loc3_ in this._6540)
            {
               if(Boolean(_loc3_) && Boolean(_loc3_.parent))
               {
                  this.removeElement(_loc3_);
               }
            }
         }
         this._6540.length = 0;
         for each(_loc2_ in param1)
         {
            if(_loc2_)
            {
               (_loc4_ = new _907())._6522 = true;
               _loc4_.data = _loc2_;
               addElement(_loc4_);
               this._6540.push(_loc4_);
            }
         }
      }
      
      public function _4418(param1:Boolean) : void
      {
         this._6545 = param1;
         if(initialized)
         {
            this._6530(param1);
            this._6539(param1);
            this._6536(param1);
            this._6529(param1);
            this._6534(param1);
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         if(initialized)
         {
            if(param1)
            {
               this._4443.textColor = 16777215;
               this._4443.text = this._4443.text;
               this._4441.txt.textColor = 16777215;
               this._4441.txt.text = this._4441.txt.text;
               this._6550.alpha = 1;
               this._6544.alpha = 1;
               this._6548.alpha = 1;
               this._6542.alpha = 1;
               this._6532.alpha = 1;
               this._6546.alpha = 1;
               this._4383.enabled = true;
               this._4378.enabled = true;
               this._4442.enabled = true;
               this._4447.enabled = true;
            }
            else
            {
               this._4443.textColor = this._2594;
               this._4443.text = this._4443.text;
               this._4441.txt.textColor = this._2594;
               this._4441.txt.text = this._4441.txt.text;
               this._6546.alpha = this._6511;
               this._6550.alpha = this._6511;
               this._6544.alpha = this._6511;
               this._6548.alpha = this._6511;
               this._6542.alpha = this._6511;
               this._6532.alpha = this._6511;
               this._4383.enabled = false;
               this._4378.enabled = false;
               this._4442.enabled = false;
               this._4447.enabled = false;
            }
         }
      }
   }
}

