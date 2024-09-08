package _908
{
   import _1045.Group;
   import _1045.HSlider;
   import _1045.Label;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._128;
   import _127._140;
   import _127._151;
   import _127._162;
   import _13505._14035;
   import _1374.TextInput;
   import _1404._1407;
   import _470._469;
   import _51._52;
   import _51._77;
   import _521._532;
   import _555._570;
   import _636.AnimationEvent;
   import _636.IKEvent;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _783.TipNotification;
   import _906.PropertyPanel;
   import _978._13564;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   
   public class _907 extends _140
   {
      private var _6194:Label;
      
      public var _4444:TextInput;
      
      private var _6518:Label;
      
      private var _6524:Label;
      
      private var _6516:Label;
      
      private var _6519:Label;
      
      private var _6520:Label;
      
      private var _6523:_128;
      
      private var _6515:Label;
      
      public var _6507:_162;
      
      public var _6505:HSlider;
      
      private var _6503:Label;
      
      public var _14768:_13564;
      
      public var _14766:_13564;
      
      private var _1834:_77;
      
      private var _6517:Boolean = false;
      
      private var _13977:int;
      
      private var _6560:Boolean;
      
      private var _6511:Number = 0.5;
      
      private var _2594:uint = 8883859;
      
      private var _6510:Number;
      
      public function _907()
      {
         this._4444 = new TextInput();
         this._6507 = new _162();
         this._6505 = new HSlider();
         this._6503 = new Label();
         this._14768 = new _13564();
         this._14766 = new _13564();
         super();
      }
      
      public function set _4425(param1:Boolean) : void
      {
         this._6560 = param1;
      }
      
      public function get _6522() : Boolean
      {
         return this._6517;
      }
      
      public function set _6522(param1:Boolean) : void
      {
         this._6517 = param1;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         super._2438();
         this.layout = new _1197();
         percentWidth = 100;
         _loc1_ = this._2414();
         this._6194 = new Label();
         this._6194.width = PropertyPanel._14765;
         this._6194.text = tr("Property.ik.name");
         this._4444.percentWidth = 100;
         _loc1_.addElement(this._6194);
         _loc1_.addElement(this._4444);
         addElement(_loc1_);
         _loc1_ = this._2414();
         this._6518 = new Label();
         this._6518.width = PropertyPanel._14765;
         this._6518.text = tr("Property.ik.bones");
         this._6524 = new Label();
         this._6524.percentWidth = 100;
         _loc1_.addElement(this._6518);
         _loc1_.addElement(this._6524);
         addElement(_loc1_);
         _loc1_ = this._2414();
         this._6516 = new Label();
         this._6516.width = PropertyPanel._14765;
         this._6516.text = tr("Property.ik.target");
         this._6519 = new Label();
         this._6519.percentWidth = 100;
         _loc1_.addElement(this._6516);
         _loc1_.addElement(this._6519);
         addElement(_loc1_);
         _loc1_ = this._2414();
         this._6520 = new Label();
         this._6520.width = PropertyPanel._14765;
         this._6520.text = tr("Property.ik.bend");
         this._6523 = new _128();
         this._6523.label = tr("Property.ik.bendDirection");
         this._6523.percentWidth = 100;
         _loc1_.addElement(this._6520);
         _loc1_.addElement(this._6523);
         _loc1_.addElement(this._14768);
         addElement(_loc1_);
         _loc1_ = this._2414();
         this._6515 = new Label();
         this._6515.width = PropertyPanel._14765;
         this._6515.text = tr("Property.ik.weight");
         this._6507.txt.restrict = "0-9";
         this._6507.txt.width = 40;
         this._6507.txt.setStyle("textAlign","left");
         this._6507.maxValue = 100;
         this._6507.minValue = 0;
         this._6505.skinName = _151;
         this._6505.maximum = 100;
         this._6505.minimum = 0;
         this._6503 = new Label();
         this._6503.text = "%";
         _loc1_.addElement(this._6515);
         _loc1_.addElement(this._6505);
         _loc1_.addElement(this._6507);
         _loc1_.addElement(this._6503);
         _loc1_.addElement(this._14766);
         addElement(_loc1_);
         this._4444.addEventListener(FocusEvent.FOCUS_OUT,this._6508);
         this._6523.addEventListener(Event.CHANGE,this._6509);
         this._6507.txt.addEventListener(FocusEvent.FOCUS_OUT,this._6506);
         this._6507._2599 = this._6506;
         this._6505.addEventListener(Event.CHANGE,this._4039);
         this._6505.addEventListener(UIEvent.CHANGE_END,this._4030);
         this._6505.addEventListener(UIEvent.CHANGE_START,this._4026);
         this._6524.addEventListener(MouseEvent.ROLL_OVER,this._6512);
         this._6524.addEventListener(MouseEvent.ROLL_OUT,this._6514);
         this._6524.addEventListener(MouseEvent.CLICK,this._10538);
         this._6519.addEventListener(MouseEvent.ROLL_OVER,this._6512);
         this._6519.addEventListener(MouseEvent.ROLL_OUT,this._6514);
         this._6519.addEventListener(MouseEvent.CLICK,this._10538);
         this._14766.addEventListener(MouseEvent.CLICK,this._14767);
         this._14768.addEventListener(MouseEvent.CLICK,this._14769);
      }
      
      private function _14767(param1:MouseEvent) : void
      {
         dispatchEvent(new AnimationEvent(AnimationEvent.KEY_IK_WEIGHT,this._1834,true));
      }
      
      private function _14769(param1:MouseEvent) : void
      {
         dispatchEvent(new AnimationEvent(AnimationEvent.KEY_IK_BEND,this._1834,true));
      }
      
      private function _6508(param1:FocusEvent) : void
      {
         var _loc2_:String = this._4444.text;
         if(_loc2_ != this._1834.name)
         {
            if(this._1834.target.rootArmatureData._1959(_loc2_))
            {
               this._4444.text = this._1834.name;
               this._2853._1567(new TipNotification(TipNotification.TIP_BOTTOM,TipNotification.NAME_CONFICT));
            }
            else
            {
               this._2853._1567(new CommandNotification(CommandNotification.MODIFY_IKCONSTRAINT_NAME,_469._3493(this._1834,_loc2_)));
            }
         }
      }
      
      private function _6509(param1:Event) : void
      {
         var _loc2_:int = this._6523.selected ? 1 : -1;
         dispatchEvent(new IKEvent(IKEvent.BEND_CHANGE,{
            "_2942":this._1834,
            "_2990":_loc2_
         }));
      }
      
      override protected function _2520() : void
      {
         super._2520();
         this._1834 = data as _77;
         this.update();
      }
      
      override protected function removeItem() : void
      {
         this._2853._1567(new CommandNotification(CommandNotification.DELETE_IKCONSTRAINT,this._1834));
      }
      
      public function update() : void
      {
         var _loc2_:_52 = null;
         if(this._1834 == null)
         {
            return;
         }
         if(this._6522)
         {
            this.title = tr("Property.ik.foldtarget");
            if(this._6519 && this._6519.parent && Boolean(this._6519.parent.parent))
            {
               removeElement(this._6519.parent as Group);
            }
         }
         else
         {
            this.title = tr("Property.ik.fold");
         }
         this._4444.text = this._1834.name;
         var _loc1_:String = "";
         for each(_loc2_ in this._1834.bones)
         {
            _loc1_ += _loc2_.name + ",";
         }
         _loc1_ = _loc1_.substr(0,_loc1_.length - 1);
         this._6524.text = _loc1_;
         this._6519.text = this._1834.target.name;
         this._6523.selected = this._1834._14310 == 1 ? true : false;
         this._6507.value = int(this._1834._14311 * 100);
         this._6505.value = this._1834._14311 * 100;
         this._13801(this._13977);
      }
      
      public function _13801(param1:int) : void
      {
         var _loc2_:_14035 = null;
         this._13977 = param1;
         if(this._14768 == null)
         {
            return;
         }
         if(this._6560 && this._13977 >= 0)
         {
            this._14768.state = _13564.STATE_DISABLE;
            this._14766.state = _13564.STATE_DISABLE;
         }
         else if(this._1834)
         {
            _loc2_ = this._1834._1903;
            if(_loc2_)
            {
               if(this._1834._2134 != 0)
               {
                  this._14768.state = _13564.STATE_CACHE;
               }
               else if(this._1834._2133 >= 0)
               {
                  this._14766.state = _13564.STATE_CACHE;
               }
               else if(_loc2_.getFrameByIndex(param1))
               {
                  this._14768.state = _13564.STATE_KEY;
                  this._14766.state = _13564.STATE_KEY;
               }
               else
               {
                  this._14768.state = _13564.STATE_NORMAL;
                  this._14766.state = _13564.STATE_NORMAL;
               }
            }
         }
      }
      
      public function _6513(param1:Boolean) : void
      {
         if(param1)
         {
            this._6518.alpha = 1;
            this._6524.alpha = 1;
            this._6516.alpha = 1;
            this._6519.alpha = 1;
            this._6520.alpha = 1;
            this._6515.alpha = 1;
            this._6503.alpha = 1;
            this._6523.enabled = true;
            this._6507.txt.textColor = 16777215;
            this._6507.enabled = true;
            this._6505.enabled = true;
            removeBtn.enabled = true;
            this._14768.enabled = false;
            this._14766.enabled = false;
         }
         else
         {
            this._6518.alpha = this._6511;
            this._6524.alpha = this._6511;
            this._6516.alpha = this._6511;
            this._6519.alpha = this._6511;
            removeBtn.enabled = false;
            this._14768.enabled = true;
            this._14766.enabled = true;
         }
      }
      
      private function _6506(param1:FocusEvent) : void
      {
         var _loc4_:Object = null;
         var _loc2_:Number = Number(this._6507.txt.text);
         if(_loc2_ > 100)
         {
            _loc2_ = 100;
         }
         else if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         var _loc3_:Number = this._6510;
         if(_loc3_ != _loc2_)
         {
            this._6505.value = _loc2_;
            this._6507.txt.text = _loc2_.toString();
            this._6510 = _loc2_;
            (_loc4_ = new Object())._1897 = this._1834;
            _loc4_.weight = _loc2_ / 100;
            dispatchEvent(new IKEvent(IKEvent.WEIGHT_CHANGE_CONFIRM,_loc4_));
         }
         else
         {
            dispatchEvent(new IKEvent(IKEvent.WEIGHT_CHANGE_END));
         }
      }
      
      private function _6504() : void
      {
         var _loc3_:Object = null;
         var _loc1_:Number = Number(this._6507.txt.text);
         if(_loc1_ > 100)
         {
            _loc1_ = 100;
         }
         else if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         var _loc2_:Number = this._6510;
         if(_loc2_ != _loc1_)
         {
            this._6505.value = _loc1_;
            this._6510 = _loc1_;
            _loc3_ = new Object();
            _loc3_._1897 = this._1834;
            _loc3_.weight = _loc1_ / 100;
            dispatchEvent(new IKEvent(IKEvent.WEIGHT_CHANGE,_loc3_));
         }
      }
      
      private function _4039(param1:Event) : void
      {
         var _loc2_:int = 0;
         switch(param1.currentTarget)
         {
            case this._6505:
               _loc2_ = this._6505.value;
               this._6507.txt.text = _loc2_.toString();
               this._6504();
         }
      }
      
      private function _4030(param1:Event) : void
      {
         switch(param1.currentTarget)
         {
            case this._6505:
               this._6506(null);
         }
      }
      
      private function _4026(param1:Event) : void
      {
         switch(param1.currentTarget)
         {
            case this._6505:
               this._6510 = int(this._6505.value);
         }
      }
      
      private function _6512(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this._6519:
               this._6519.textColor = 5941489;
               this._2853._1567(new StageNotification(StageNotification.ROLLOVER_BONE,this._1834.target));
               break;
            case this._6524:
               this._6524.textColor = 5941489;
         }
      }
      
      private function _6514(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this._6519:
               this._6519.textColor = 16777215;
               this._2853._1567(new StageNotification(StageNotification.ROLLOUT_BONE,this._1834.target));
               break;
            case this._6524:
               this._6524.textColor = 16777215;
         }
      }
      
      private function _10538(param1:MouseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:_52 = null;
         switch(param1.currentTarget)
         {
            case this._6519:
               _532.instance._2889 = [this._1834.target];
               break;
            case this._6524:
               _loc2_ = [];
               for each(_loc3_ in this._1834.bones)
               {
                  _loc2_.push(_loc3_);
               }
               _532.instance._2889 = _loc2_;
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
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
   }
}

