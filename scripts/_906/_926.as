package _906
{
   import _1038._1037;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.HSlider;
   import _1045.Label;
   import _1045._1105;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._151;
   import _13505._13508;
   import _1374.ColorPicker;
   import _1374.TextInput;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._79;
   import _636.AnimationEvent;
   import _658._661;
   import _668._672;
   import _73._74;
   import _978._13564;
   import egret.utils.tr;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   
   public class _926 extends Group
   {
      private static var _6653:String = "/assets/panelIcon/x.png";
      
      private static var _6654:String = "/assets/panelIcon/y.png";
      
      public var _4444:TextInput;
      
      public var _6195:Label;
      
      public var _6137:DropDownList;
      
      public var _10593:DropDownList;
      
      public var _6588:ColorPicker;
      
      public var _6587:TextInput;
      
      public var _6652:HSlider;
      
      public var _13981:_13564;
      
      public var _13980:_13564;
      
      public var _13978:_13564;
      
      public var _13979:_13564;
      
      private var _10592:_1037;
      
      private var _4761:_672;
      
      private var _6586:uint;
      
      private var _6580:_1037;
      
      private var _5477:Label;
      
      private var _6647:Label;
      
      private var _10591:Label;
      
      private var _6634:Label;
      
      private var _6649:Boolean;
      
      private var _6646:Number;
      
      private var _6642:Label;
      
      private var _6566:Boolean;
      
      private var _6648:TextInput;
      
      private var _6650:TextInput;
      
      private var _6645:Label;
      
      private var _6644:Group;
      
      private var _6638:_925;
      
      private var _6560:Boolean;
      
      private var _11474:Group;
      
      private var _13977:int;
      
      public function _926()
      {
         this.blendModeNormal = tr("Property.slot.blendMode.normal");
         this.blendModeAdd = tr("Property.slot.blendMode.add");
         this.blendModeErase = tr("Property.slot.blendMode.erase");
         this.DISPLAY_NONE = {};
         this._4444 = new TextInput();
         this._6195 = new Label();
         this._6137 = new DropDownList();
         this._10593 = new DropDownList();
         this._6588 = new ColorPicker();
         this._6587 = new TextInput();
         this._6652 = new HSlider();
         this._13981 = new _13564();
         this._13980 = new _13564();
         this._13978 = new _13564();
         this._13979 = new _13564();
         this._10592 = new _1037();
         this._6580 = new _1037();
         this._5477 = new Label();
         this._6647 = new Label();
         this._10591 = new Label();
         this._6634 = new Label();
         this._6642 = new Label();
         this._6648 = new TextInput();
         this._6650 = new TextInput();
         this._6645 = new Label();
         this._6644 = this._2414();
         this._6638 = new _925();
         this._11474 = this._2414();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.layout = new _1197();
         this.percentWidth = 100;
         this.percentHeight = 100;
         var _loc1_:int = PropertyPanel._14765;
         var _loc2_:Group = this._2414();
         var _loc3_:Label = new Label();
         _loc3_.text = tr("Property.name");
         _loc3_.width = _loc1_;
         this._4444.percentWidth = 100;
         _loc2_.addElement(_loc3_);
         _loc2_.addElement(this._4444);
         addElement(_loc2_);
         var _loc4_:Group = this._2414();
         var _loc5_:Label;
         (_loc5_ = new Label()).text = tr("Property.type");
         _loc5_.width = _loc1_;
         this._6195.percentWidth = 100;
         this._6195.text = tr("Property.slot.type");
         _loc4_.addElement(_loc5_);
         _loc4_.addElement(this._6195);
         addElement(_loc4_);
         var _loc6_:Group = this._2414();
         this._6634.text = tr("Property.slot.displayIndex");
         this._6634.width = _loc1_;
         _loc6_.addElement(this._6634);
         this._6137.percentWidth = 100;
         this._6137._6146 = this._6134;
         this._6137.addEventListener(Event.CHANGE,this._6133);
         this._6137._3854 = false;
         _loc6_.addElement(this._6137);
         _loc6_.addElement(this._13978);
         var _loc7_:Group = this._2414();
         this._6647.text = tr("Property.slot.color");
         this._6647.width = _loc1_;
         _loc7_.addElement(this._6647);
         this._10591.text = tr("Property.slot.blendMode");
         this._10591.width = _loc1_;
         this._11474.addElement(this._10591);
         this._10593.percentWidth = 100;
         this._10593.addEventListener(Event.CHANGE,this._10590);
         this._10593._3854 = false;
         this._10592.source = [this.blendModeNormal,this.blendModeAdd,this.blendModeErase];
         this._10593.selectedIndex = 0;
         this._10593.dataProvider = this._10592;
         this._11474.addElement(this._10593);
         var _loc8_:Group = this._2414();
         this._6652.skinName = _151;
         this._6652.maximum = 100;
         this._6652.minimum = 0;
         this._6652.value = 100;
         this._5477.text = tr("Property.slot.alpha");
         this._5477.width = _loc1_;
         _loc8_.addElement(this._5477);
         _loc8_.addElement(this._6652);
         this._6587.restrict = "0-9";
         this._6587.width = 30;
         this._6587.setStyle("textAlign","right");
         this._6642.text = "%";
         _loc8_.addElement(this._6587);
         _loc8_.addElement(this._6642);
         this._6588._6193 = true;
         this._6588.defaultColor = 16777215;
         this._6588.toolTip = tr("Property.slot.color.tooltip");
         _loc7_.addElement(this._6588);
         _loc7_.addElement(this._13981);
         _loc8_.addElement(this._13980);
         addElement(_loc7_);
         addElement(this._11474);
         addElement(_loc8_);
         addElement(_loc6_);
         this._6645.text = tr("Property.slot.pivot");
         var _loc9_:_1105 = new _1105(_6653);
         var _loc10_:_1105 = new _1105(_6654);
         this._6648.maxChars = 8;
         this._6648.percentWidth = 100;
         this._6648.enabled = true;
         this._6650.maxChars = 8;
         this._6650.percentWidth = 100;
         this._6644.addElement(_loc9_);
         this._6644.addElement(this._6648);
         this._6644.addElement(_loc10_);
         this._6644.addElement(this._6650);
         this._6588.addEventListener(MouseEvent.CLICK,this._6641);
         this._6588.addEventListener(Event.CHANGE,this._4052);
         this._6588.addEventListener(UIEvent.CONFIRM,this._4052);
         this._6588.addEventListener(Event.CANCEL,this._4052);
         this._6588.addEventListener(Event.CLEAR,this._4052);
         this._6587.addEventListener(FocusEvent.FOCUS_OUT,this._6637);
         this._6587.addEventListener(Event.CHANGE,this._6639);
         this._6652.addEventListener(Event.CHANGE,this._6636);
         this._6652.addEventListener(UIEvent.CHANGE_END,this._6633);
         this._6652.addEventListener(UIEvent.CHANGE_START,this._6632);
         this._6648.addEventListener(FocusEvent.FOCUS_OUT,this._6640);
         this._6650.addEventListener(FocusEvent.FOCUS_OUT,this._6640);
         this._13980.addEventListener(MouseEvent.CLICK,this._13807);
         this._13981.addEventListener(MouseEvent.CLICK,this._13807);
         this._13978.addEventListener(MouseEvent.CLICK,this._13805);
         this._13979.addEventListener(MouseEvent.CLICK,this._13804);
         this._6638.percentWidth = 100;
         this._6638.percentHeight = 100;
         this.addElement(this._6638);
         this._13801(this._13977);
      }
      
      private function _13807(param1:MouseEvent) : void
      {
         dispatchEvent(new AnimationEvent(AnimationEvent.KEY_COLOR));
      }
      
      private function _13805(param1:MouseEvent) : void
      {
         dispatchEvent(new AnimationEvent(AnimationEvent.KEY_DISPLAY));
      }
      
      private function _13804(param1:MouseEvent) : void
      {
         dispatchEvent(new AnimationEvent(AnimationEvent.KEY_VISIBLE));
      }
      
      public function set _4425(param1:Boolean) : void
      {
         this._6560 = param1;
         this._6638._4406._4425 = this._6560;
      }
      
      private function _6640(param1:FocusEvent) : void
      {
         var _loc2_:Number = Number(this._6648.text);
         var _loc3_:Number = Number(this._6650.text);
         dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_SLOT_PIVOT,{
            "x":_loc2_,
            "y":_loc3_
         }));
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
      
      private function _2894() : void
      {
         this._6644.includeInLayout = this._6644.visible = this._6645.visible = !this._6649 && this._6137._2484 != this.DISPLAY_NONE && this._6566;
         this._6634.includeInLayout = this._6634.visible = !this._6649 && !this._6566;
         this._6137.includeInLayout = this._6137.visible = !this._6649 && !this._6566;
         this._13978.includeInLayout = this._13978.visible = !this._6649 && !this._6566;
         this._6588.includeInLayout = this._6588.visible = this._11473();
         this._6587.includeInLayout = this._6587.visible = this._11473();
         this._5477.includeInLayout = this._5477.visible = this._11473();
         this._6647.includeInLayout = this._6647.visible = this._11473();
         this._6652.includeInLayout = this._6652.visible = this._11473();
         this._6642.includeInLayout = this._6642.visible = this._11473();
         this._11474.includeInLayout = this._11474.visible = this._11473();
         this._13980.includeInLayout = this._13980.visible = this._11473() && !this._6566;
         this._13981.includeInLayout = this._13981.visible = this._11473() && !this._6566;
         this._13801(this._13977);
      }
      
      public function _13801(param1:int) : void
      {
         var _loc2_:_13508 = null;
         this._13977 = param1;
         if(this._13981 == null)
         {
            return;
         }
         if(this._6560 && this._13977 >= 0)
         {
            this._13981.state = _13564.STATE_DISABLE;
            this._13980.state = _13564.STATE_DISABLE;
            this._13978.state = _13564.STATE_DISABLE;
            this._13979.state = _13564.STATE_DISABLE;
         }
         else if(Boolean(this._4761) && Boolean(this._4761._1837))
         {
            _loc2_ = this._4761._1837._1903;
            if(_loc2_)
            {
               if(this._4761._1837._2147)
               {
                  if(this._4761._1837._13688)
                  {
                     this._13981.state = _13564.STATE_CACHE;
                  }
                  if(this._4761._1837._13689)
                  {
                     this._13980.state = _13564.STATE_CACHE;
                  }
               }
               else if(_loc2_._13599.getFrameByIndex(param1))
               {
                  this._13981.state = _13564.STATE_KEY;
                  this._13980.state = _13564.STATE_KEY;
               }
               else
               {
                  this._13981.state = _13564.STATE_NORMAL;
                  this._13980.state = _13564.STATE_NORMAL;
               }
               if(this._4761._1837._2145 != _79.UNDEFINE)
               {
                  this._13978.state = _13564.STATE_CACHE;
               }
               else if(_loc2_._13572.getFrameByIndex(param1))
               {
                  this._13978.state = _13564.STATE_KEY;
               }
               else
               {
                  this._13978.state = _13564.STATE_NORMAL;
               }
            }
         }
         if(Boolean(this._6638) && Boolean(this._6638._4406))
         {
            this._6638._4406._13801(this._13977);
         }
      }
      
      private function _6134(param1:Object) : String
      {
         var _loc2_:_70 = null;
         if(param1 is _69)
         {
            if(Boolean(this._4761) && Boolean(this._4761._1837))
            {
               _loc2_ = this._4761._1837._1765[param1];
               if(_loc2_)
               {
                  return _loc2_._13230;
               }
               return tr("Property.placeholder.empty");
            }
         }
         return tr("Property.display.empty");
      }
      
      public function get model() : _672
      {
         return this._4761;
      }
      
      public function set model(param1:_672) : void
      {
         this._4761 = param1;
         this.refresh();
      }
      
      public function get _2713() : Boolean
      {
         return this._6566;
      }
      
      public function set _2713(param1:Boolean) : void
      {
         if(this._6566 == param1)
         {
            return;
         }
         this._6566 = param1;
      }
      
      private function refresh() : void
      {
         var _loc1_:Array = null;
         if(this._4761._1837)
         {
            if(this._4761._1837.onlyBoundingBox)
            {
               this._6195.text = tr("Property.boundingBoxSlot.type");
            }
            else
            {
               this._6195.text = tr("Property.slot.type");
            }
            this._4444.text = this._4761._1837.name;
            if(this._4761._1837._2164)
            {
               this._6649 = false;
               _loc1_ = this._4761._1837._1715.filter(this._6635);
               _loc1_.unshift(this.DISPLAY_NONE);
               this._6580.source = _loc1_;
               this._6137.dataProvider = this._6580;
               if(this._4761._1837._1923 == null)
               {
                  this._6137._2484 = this.DISPLAY_NONE;
                  this._6638.visible = false;
                  this._6638.includeInLayout = false;
               }
               else
               {
                  this._6137._2484 = this._4761._1837._1923;
                  this._6638.visible = true;
                  this._6638.includeInLayout = true;
               }
               this._6588._4061 = this._4761._1837._1926._2184;
               this._6587.text = int(this._4761._1837._1926.alphaMultiplier * 100).toString();
               this._6652.value = int(this._4761._1837._1926.alphaMultiplier * 100);
               if(this._4761._1837.currentLocalTransform)
               {
                  this._5300();
                  this._6648.text = this._4761._1837.currentLocalTransform.x.toFixed(2);
                  this._6650.text = this._4761._1837.currentLocalTransform.y.toFixed(2);
               }
               else
               {
                  this._6651();
               }
               if(this._4761._1837.blendMode)
               {
                  switch(this._4761._1837.blendMode)
                  {
                     case BlendMode.NORMAL:
                        this._10593.selectedIndex = 0;
                        break;
                     case BlendMode.ADD:
                        this._10593.selectedIndex = 1;
                        break;
                     case BlendMode.ERASE:
                        this._10593.selectedIndex = 2;
                        break;
                     default:
                        this._10593.selectedIndex = 0;
                  }
               }
               else
               {
                  this._10593.selectedIndex = 0;
               }
            }
            else
            {
               this._6649 = true;
               this._6638.visible = false;
               this._6638.includeInLayout = false;
            }
            this._6638.model = this._4761;
            this._2894();
         }
      }
      
      private function _11473() : Boolean
      {
         return !this._6649 && this._6137._2484 != this.DISPLAY_NONE && !(this._4761._1837._2049 && this._4761._1837._2049.type == _74.BOUNDINGBOX);
      }
      
      private function _6651() : void
      {
         this._6644.visible = false;
         this._6645.visible = false;
      }
      
      private function _5300() : void
      {
         this._6644.visible = true;
         this._6645.visible = true;
      }
      
      private function _6635(param1:_69, param2:int, param3:Array) : Boolean
      {
         return this._4761._1837._1765[param1] != null;
      }
      
      private function _10590(param1:Event) : void
      {
         var _loc2_:Object = new Object();
         var _loc3_:_79 = this._4761._1837;
         _loc2_.item = _loc3_;
         switch(this._10593.selectedIndex)
         {
            case 0:
               _loc2_.blendMode = BlendMode.NORMAL;
               break;
            case 1:
               _loc2_.blendMode = BlendMode.ADD;
               break;
            case 2:
               _loc2_.blendMode = BlendMode.ERASE;
         }
         dispatchEvent(new AnimationEvent(AnimationEvent.CHANGE_SLOT_BLENDMODE,_loc2_));
      }
      
      private function _6133(param1:Event) : void
      {
         var _loc2_:_70 = null;
         if(this._6137._2484 != this.DISPLAY_NONE)
         {
            _loc2_ = this._4761._1837._1765[this._6137._2484];
         }
         dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_SLOT_DISPLAY_INDEX,_loc2_));
      }
      
      private function _4052(param1:Event) : void
      {
         var _loc2_:Number = this._6652.value / 100;
         if(param1.type == Event.CLEAR || param1.type == UIEvent.CONFIRM)
         {
            if(this._6588._4061 != this._6586)
            {
               dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_SLOT_COLOR,{
                  "from":this._6586,
                  "to":this._6588._4061,
                  "alpha":_loc2_
               }));
            }
         }
         else if(param1.type == Event.CHANGE || param1.type == Event.CANCEL)
         {
            dispatchEvent(new AnimationEvent(AnimationEvent.CHANGE_SLOT_COLOR,{
               "from":this._6586,
               "to":this._6588._4061,
               "alpha":_loc2_
            }));
         }
      }
      
      private function _6639(param1:Event) : void
      {
         var _loc2_:int = int(this._6587.text);
         if(_loc2_ > 100)
         {
            _loc2_ = 100;
            this._6587.text = _loc2_.toString();
         }
         else if(_loc2_ < 0)
         {
            _loc2_ = 0;
            this._6587.text = _loc2_.toString();
         }
         if(_loc2_ != this._6652.value)
         {
            this._6652.value = _loc2_;
         }
      }
      
      private function _6633(param1:Event) : void
      {
         this._6637(null);
      }
      
      private function _6632(param1:Event) : void
      {
         this._6646 = int(this._6652.value) / 100;
      }
      
      private function _6636(param1:Event) : void
      {
         var _loc2_:int = this._6652.value;
         this._6587.text = _loc2_.toString();
         dispatchEvent(new AnimationEvent(AnimationEvent.CHANGE_SLOT_ALPHA,{
            "color":this._6588._4061,
            "to":_loc2_ / 100,
            "from":this._6646
         }));
      }
      
      private function _6637(param1:FocusEvent) : void
      {
         var _loc2_:Number = Number(this._6587.text);
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
            dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_SLOT_ALPHA,{
               "from":_loc3_,
               "to":_loc2_
            }));
         }
      }
      
      private function _6641(param1:MouseEvent) : void
      {
         this._6586 = this._6588._4061;
      }
      
      public function _3834() : void
      {
         this._6638._4406._3834();
      }
      
      public function _4416(param1:Boolean) : void
      {
         this._6638._4406._4416(param1);
      }
      
      public function _4395(param1:_52) : void
      {
         if(Boolean(this._6638) && Boolean(this._6638._4406))
         {
            this._6638._4406._4395(param1);
         }
      }
      
      public function _4358(param1:_661) : void
      {
         if(Boolean(this._6638) && Boolean(this._6638._4406))
         {
            this._6638._4406._4358(param1);
         }
      }
      
      public function _11328() : Boolean
      {
         var _loc1_:DisplayObject = null;
         if(Boolean(this._6638) && Boolean(this._6638._4406))
         {
            _loc1_ = this._6638._4406._11451;
            if(stage && _loc1_ && _loc1_.stage && _loc1_.parent && _loc1_.visible)
            {
               return _loc1_.hitTestPoint(stage.mouseX,stage.mouseY);
            }
         }
         return false;
      }
      
      public function _11622() : Boolean
      {
         var _loc1_:DisplayObject = null;
         if(Boolean(this._6638) && Boolean(this._6638._4406))
         {
            _loc1_ = this._6638._4406._6564;
            if(stage && _loc1_ && _loc1_.stage && _loc1_.parent && _loc1_.visible)
            {
               return _loc1_.hitTestPoint(stage.mouseX,stage.mouseY);
            }
         }
         return false;
      }
   }
}

