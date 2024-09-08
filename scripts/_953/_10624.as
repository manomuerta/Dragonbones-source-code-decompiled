package _953
{
   import _1045.Group;
   import _1045._1082;
   import _1045._1105;
   import _127._147;
   import _127._148;
   import _127._162;
   import _1374.TextInput;
   import _24._26;
   import _51._52;
   import _586._599;
   import _636.TransformEvent;
   import _639.HotkeysModel;
   import _81._85;
   import _81._88;
   import _822._10616;
   import _822._829;
   import _834._836;
   import _834._838;
   import _97._125;
   import _97._14036;
   import _978._13564;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _10624 extends Group
   {
      public static const MAX_POSITION:Number = 999999;
      
      public static const MAX_SCALE:Number = 999;
      
      public static const MAX_ROTATION:Number = 180;
      
      public static const MAX_SIZE:Number = 999999;
      
      private static var _10810:String = "/assets/button/scale";
      
      private static var _6147:String = "/assets/button/rotate";
      
      private static var _10864:String = "/assets/button/size";
      
      private static var _10860:String = "/assets/button/translate";
      
      private static var _13987:String = "/assets/button/linkLock";
      
      public static const STROKE_COLOR:uint = 1777701;
      
      public static const FILL_COLOR:uint = 2238766;
      
      public static const ALPHA:Number = 1;
      
      public var _4781:_10616;
      
      public var _4780:_10616;
      
      public var _4792:_10616;
      
      public var _4791:_10616;
      
      public var _4790:_10616;
      
      public var _4771:_148;
      
      private var _2558:_1082;
      
      private var minValue:Number = 1;
      
      private var _2590:Number = 1;
      
      public var _4794:_10616;
      
      public var _4789:_10616;
      
      public var _10862:_829;
      
      public var _10865:_829;
      
      public var _10866:_829;
      
      public var _10868:_829;
      
      public var _13990:_829;
      
      public var _13986:_13564;
      
      public var _13988:_13564;
      
      public var _13989:_13564;
      
      public var _10867:_1105;
      
      private var _7032:Boolean = true;
      
      private var _4761:Object;
      
      private var _10532:_162;
      
      private var _10760:int;
      
      private var _13876:Boolean;
      
      private var _13991:Boolean;
      
      private var _14842:Number;
      
      public function _10624()
      {
         this._10867 = new _1105(_10864);
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc7_:Group = null;
         super._2438();
         _loc1_ = 6;
         _loc2_ = 3;
         _loc3_ = 55;
         var _loc4_:int = 24;
         this._2558 = new _1082();
         this._2558.radius = 6;
         this._2558._2563 = STROKE_COLOR;
         this._2558._2562 = 1;
         this._2558._2564 = 1;
         this._2558.fillColor = FILL_COLOR;
         this._2558.alpha = ALPHA;
         this._2558.width = _loc1_ * 2 + _loc2_ * 5 + _loc3_ * 4 + _loc4_ * 4 + 10 + 15;
         this._2558.height = 53;
         addElement(this._2558);
         var _loc5_:Group;
         (_loc5_ = _125._13692(10)).left = _loc1_;
         _loc5_.top = 2;
         _loc5_.percentWidth = 100;
         addElement(_loc5_);
         var _loc6_:Group = _125._13692(3);
         _loc7_ = _125._13692(3);
         var _loc8_:Group = _125._13692(3);
         var _loc9_:Group = _125._13692(3);
         var _loc10_:Group = _125._2413(1);
         var _loc11_:Group = _125._2413(1);
         _loc10_.width = 167;
         _loc11_.width = 179;
         _loc10_.addElement(_loc6_);
         _loc10_.addElement(_loc7_);
         _loc11_.addElement(_loc8_);
         _loc11_.addElement(_loc9_);
         _loc5_.addElement(_loc10_);
         _loc5_.addElement(_loc11_);
         var _loc12_:HotkeysModel = HotkeysModel.getInstance();
         this._13986 = new _13564();
         this._13988 = new _13564();
         this._13989 = new _13564();
         this._10862 = new _829();
         this._10862.toolTip = tr("Transform.translate.tooltip",_loc12_._11726(_26.TRANSLATE_TRANSFORM));
         this._10862.skinName = _838;
         this._10862.data = {"icon":_10860};
         this._4781 = new _10616();
         this._4780 = new _10616();
         this._4781.maximum = MAX_POSITION;
         this._4781.minimum = -MAX_POSITION;
         this._4781._8236 = 0.01;
         this._4780.maximum = MAX_POSITION;
         this._4780.minimum = -MAX_POSITION;
         this._4780._8236 = 0.01;
         this._4781.width = _loc3_;
         this._4780.width = _loc3_;
         _loc6_.addElement(this._10862);
         _loc6_.addElement(this._4781);
         _loc6_.addElement(this._4780);
         _loc6_.addElement(this._13986);
         this._10865 = new _829();
         this._10865.toolTip = tr("Transform.rotate.tooltip",_loc12_._11726(_26.ROTATE_TRANSFORM));
         this._10865.skinName = _838;
         this._10865.data = {"icon":_6147};
         this._4790 = new _10616();
         this._4790.maximum = MAX_ROTATION;
         this._4790.minimum = -MAX_ROTATION;
         this._4790._8236 = 0.01;
         this._4771 = new _148();
         this._4790.width = 113;
         _loc7_.addElement(this._10865);
         _loc7_.addElement(this._4790);
         _loc7_.addElement(this._13988);
         this._10866 = new _829();
         this._10866.toolTip = tr("Transform.scale.tooltip",_loc12_._11726(_26.SCALE_TRANSFORM));
         this._10866.skinName = _838;
         this._10866.data = {"icon":_10810};
         this._10868 = new _829();
         this._10868.toolTip = tr("Transform.size.tooltip",_loc12_._11726(_26.SCALE_TRANSFORM));
         this._10868.skinName = _838;
         this._10868.data = {"icon":_10864};
         this._4792 = new _10616();
         this._4791 = new _10616();
         this._4792.maximum = MAX_SCALE;
         this._4792.minimum = -MAX_SCALE;
         this._4792._8047 = 0.05;
         this._4792._8236 = 0.01;
         this._4791.maximum = MAX_SCALE;
         this._4791.minimum = -MAX_SCALE;
         this._4791._8236 = 0.01;
         this._4791._8047 = 0.05;
         this._4792.width = _loc3_;
         this._4791.width = _loc3_;
         _loc8_.addElement(this._10866);
         _loc8_.addElement(this._4792);
         var _loc13_:Group;
         (_loc13_ = new Group()).width = 8;
         _loc8_.addElement(_loc13_);
         _loc8_.addElement(this._4791);
         _loc8_.addElement(this._13989);
         this._4794 = new _10616();
         this._4789 = new _10616();
         this._4794.maximum = MAX_SIZE;
         this._4794.minimum = -MAX_SIZE;
         this._4794._8236 = 0.01;
         this._4789.maximum = MAX_SIZE;
         this._4789.minimum = -MAX_SIZE;
         this._4789._8236 = 0.01;
         this._4794.width = _loc3_;
         this._4789.width = _loc3_;
         _loc9_.addElement(this._10868);
         _loc9_.addElement(this._4794);
         var _loc14_:Group;
         (_loc14_ = new Group()).width = 8;
         _loc9_.addElement(_loc14_);
         _loc9_.addElement(this._4789);
         this._13990 = new _829();
         this._13990.skinName = _836;
         this._13990.data = {"icon":_13987};
         this._13990.x = 259;
         this._13990.y = 14;
         addElement(this._13990);
         this._4781.value = NaN;
         this._4780.value = NaN;
         this._4792.value = NaN;
         this._4791.value = NaN;
         this._4790.value = NaN;
         this._4794.value = NaN;
         this._4789.value = NaN;
         this._4774 = false;
         this._3990();
         this._13882 = this._13991;
      }
      
      private function _10857(param1:MouseEvent) : void
      {
         dispatchEvent(new TransformEvent(TransformEvent.ROTATION_COMPLETE));
      }
      
      private function _10859(param1:_147) : void
      {
         this._10858(Math.floor((param1._2544 * this._2590 + this.minValue) * 100) / 100);
      }
      
      private function _10858(param1:Number) : void
      {
         this._4771.rotation = (param1 - this.minValue) / this._2590;
         this._4790.value = Number(Math.floor(param1 * 100) / 100);
         this._4771.dispatchEvent(new _147(_147._2543));
      }
      
      public function set _13882(param1:Boolean) : void
      {
         this._13991 = param1;
         this._13986.visible = this._13988.visible = this._13989.visible = !this._13991;
      }
      
      public function set _13879(param1:Boolean) : void
      {
         if(param1)
         {
            this._13986.state = _13564.STATE_DISABLE;
            this._13988.state = _13564.STATE_DISABLE;
            this._13989.state = _13564.STATE_DISABLE;
         }
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
            this._4781.value = Number(this._4761.x);
            this._4780.value = Number(this._4761.y);
            this._4792.value = Number(this._4761.scaleX);
            this._4791.value = Number(this._4761.scaleY);
            this._4790.value = _85._11115(Number(this._4761.rotation));
            this._4771.rotation = this._4761.rotation == "" ? 0 : Number(this._4761.rotation);
            this._4789.value = Number(this._4761.height);
            this._4794.value = Number(this._4761.width);
            if(this._4761.x == _10616.MULT_NUM)
            {
               this._4781._13395 = _10616.MULT_NUM;
            }
            if(this._4761.y == _10616.MULT_NUM)
            {
               this._4780._13395 = _10616.MULT_NUM;
            }
            if(this._4761.scaleX == _10616.MULT_NUM)
            {
               this._4792._13395 = _10616.MULT_NUM;
            }
            if(this._4761.scaleY == _10616.MULT_NUM)
            {
               this._4791._13395 = _10616.MULT_NUM;
            }
            if(this._4761.rotation == _10616.MULT_NUM)
            {
               this._4790._13395 = _10616.MULT_NUM;
               this._4771.rotation = 0;
            }
            if(this._4761.height == _10616.MULT_NUM)
            {
               this._4789._13395 = _10616.MULT_NUM;
            }
            if(this._4761.width == _10616.MULT_NUM)
            {
               this._4794._13395 = _10616.MULT_NUM;
            }
            if(this._4761.noTxt)
            {
               this._4781.value = NaN;
               this._4780.value = NaN;
               this._4792.value = NaN;
               this._4791.value = NaN;
               this._4790.value = NaN;
               this._4794.value = NaN;
               this._4789.value = NaN;
               _14036.clear();
            }
            else if(Boolean(this._4761.height) && Boolean(this._4761.width))
            {
               _14036.register([this._4781,this._4780,this._4792,this._4791,this._4790,this._4794,this._4789]);
            }
            else
            {
               _14036.register([this._4781,this._4780,this._4792,this._4791,this._4790]);
            }
         }
         else
         {
            this._4781.value = NaN;
            this._4780.value = NaN;
            this._4792.value = NaN;
            this._4791.value = NaN;
            this._4790.value = NaN;
            this._4794.value = NaN;
            this._4789.value = NaN;
            _14036.clear();
         }
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
         return this._4790.value * _88.ANGLE_TO_RADIAN;
      }
      
      public function get translateX() : Number
      {
         return this._4781.value;
      }
      
      public function get translateY() : Number
      {
         return this._4780.value;
      }
      
      public function get _4786() : Number
      {
         return this._4794.value;
      }
      
      public function get _4785() : Number
      {
         return this._4789.value;
      }
      
      public function get _4784() : Number
      {
         var _loc1_:Number = this._4792.value;
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
         var _loc1_:Number = this._4791.value;
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
      
      public function set _10761(param1:int) : void
      {
         this._10760 = param1;
         switch(this._10760)
         {
            case _599.TRANSFORM_FREE:
               this._10862.selected = false;
               this._10865.selected = false;
               this._10866.selected = false;
               this._10868.selected = false;
               break;
            case _599.TRANSFORM_TRANSLATE:
               this._10862.selected = true;
               this._10865.selected = false;
               this._10866.selected = false;
               this._10868.selected = false;
               break;
            case _599.TRANSFORM_ROTATE:
               this._10862.selected = false;
               this._10865.selected = true;
               this._10866.selected = false;
               this._10868.selected = false;
               break;
            case _599.TRANSFORM_SCALE:
               this._10862.selected = false;
               this._10865.selected = false;
               this._10866.selected = true;
               this._10868.selected = true;
         }
      }
      
      public function get _13877() : Boolean
      {
         return this._13876;
      }
      
      public function set _13877(param1:Boolean) : void
      {
         this._13876 = param1;
         this._13990.selected = this._13876;
      }
      
      private function _3990() : void
      {
         this._4790.addEventListener(Event.CHANGE,this._4775);
         this._4781.addEventListener(Event.CHANGE,this._4772);
         this._4780.addEventListener(Event.CHANGE,this._4773);
         this._4792.addEventListener(Event.CHANGE,this._4777);
         this._4791.addEventListener(Event.CHANGE,this._4776);
         this._4794.addEventListener(Event.CHANGE,this._4779);
         this._4789.addEventListener(Event.CHANGE,this._4778);
         this._4792.addEventListener(MouseEvent.MOUSE_DOWN,this._14841,false,100);
         this._4791.addEventListener(MouseEvent.MOUSE_DOWN,this._14841,false,100);
         this._4794.addEventListener(MouseEvent.MOUSE_DOWN,this._14841,false,100);
         this._4789.addEventListener(MouseEvent.MOUSE_DOWN,this._14841,false,100);
         this._4771.addEventListener(_147._2545,this._10859);
         this._4771.addEventListener(MouseEvent.MOUSE_DOWN,this._10857,false,100);
         this._4771.addEventListener(_147._2543,this._4769);
         this._4771.addEventListener(_147._2542,this._4766);
         this._10865.addEventListener(Event.CHANGE,this._10861);
         this._10866.addEventListener(Event.CHANGE,this._10861);
         this._10868.addEventListener(Event.CHANGE,this._10861);
         this._10862.addEventListener(Event.CHANGE,this._10861);
         this._13990.addEventListener(Event.CHANGE,this._13985);
         this.addEventListener(MouseEvent.CLICK,this._10863);
         this._13986.addEventListener(MouseEvent.CLICK,this._13878);
         this._13988.addEventListener(MouseEvent.CLICK,this._13880);
         this._13989.addEventListener(MouseEvent.CLICK,this._13881);
      }
      
      private function _14841(param1:MouseEvent) : void
      {
         if(this._4761)
         {
            if(this._4761.scaleY == 0)
            {
               this._14842 = 0;
            }
            else
            {
               this._14842 = this._4761.scaleX / this._4761.scaleY;
            }
         }
      }
      
      private function _13878(param1:MouseEvent) : void
      {
         dispatchEvent(new TransformEvent(TransformEvent.KEY_TRANSLATE));
      }
      
      private function _13880(param1:MouseEvent) : void
      {
         dispatchEvent(new TransformEvent(TransformEvent.KEY_ROTATE));
      }
      
      private function _13881(param1:MouseEvent) : void
      {
         dispatchEvent(new TransformEvent(TransformEvent.KEY_SCALE));
      }
      
      private function _10863(param1:MouseEvent) : void
      {
         if(param1.target is _1082)
         {
            this._10862.selected = false;
            this._10865.selected = false;
            this._10866.selected = false;
            dispatchEvent(new TransformEvent(TransformEvent.TRANSFORM_MODEL_CHANGE,_599.TRANSFORM_FREE));
         }
      }
      
      private function _10861(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(param1.target == this._10865 && this._10865.selected)
         {
            this._10866.selected = false;
            this._10868.selected = false;
            this._10862.selected = false;
         }
         else if(param1.target == this._10866)
         {
            this._10865.selected = false;
            this._10862.selected = false;
            this._10868.selected = false;
         }
         else if(param1.target == this._10868)
         {
            this._10865.selected = false;
            this._10862.selected = false;
            this._10866.selected = false;
         }
         else if(param1.target == this._10862)
         {
            this._10865.selected = false;
            this._10866.selected = false;
            this._10868.selected = false;
         }
         if(this._10862.selected)
         {
            _loc2_ = _599.TRANSFORM_TRANSLATE;
         }
         else if(this._10865.selected)
         {
            _loc2_ = _599.TRANSFORM_ROTATE;
         }
         else if(this._10866.selected || this._10868.selected)
         {
            _loc2_ = _599.TRANSFORM_SCALE;
         }
         else
         {
            _loc2_ = _599.TRANSFORM_FREE;
         }
         dispatchEvent(new TransformEvent(TransformEvent.TRANSFORM_MODEL_CHANGE,_loc2_));
      }
      
      private function _13985(param1:Event) : void
      {
         if(this._13990)
         {
            this._13876 = this._13990.selected;
            dispatchEvent(new TransformEvent(TransformEvent.LOCK_WIDTH_HEIGHT_CHANGE,this._13876));
         }
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
      
      private function _4779(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(!isNaN(this._4794.value))
         {
            _loc2_ = this._4794.isDragging;
            dispatchEvent(new TransformEvent(TransformEvent.WIDTH_CHANGE,{
               "value":this._4786,
               "merge":_loc2_,
               "scaleRate":this._14842
            }));
         }
      }
      
      private function _4778(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(!isNaN(this._4789.value))
         {
            _loc2_ = this._4789.isDragging;
            dispatchEvent(new TransformEvent(TransformEvent.HEIGHT_CHANGE,{
               "value":this._4785,
               "merge":_loc2_,
               "scaleRate":this._14842
            }));
         }
      }
      
      private function _4777(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(!isNaN(this._4792.value))
         {
            _loc2_ = this._4792.isDragging;
         }
         dispatchEvent(new TransformEvent(TransformEvent.SCALE_X_CHANGE,{
            "value":this._4784,
            "merge":_loc2_,
            "scaleRate":this._14842
         }));
      }
      
      private function _4776(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(!isNaN(this._4791.value))
         {
            _loc2_ = this._4791.isDragging;
         }
         dispatchEvent(new TransformEvent(TransformEvent.SCALE_Y_CHANGE,{
            "value":this._4783,
            "merge":_loc2_,
            "scaleRate":this._14842
         }));
      }
      
      private function _4772(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(!isNaN(this._4781.value))
         {
            _loc2_ = this._4781.isDragging;
         }
         dispatchEvent(new TransformEvent(TransformEvent.X_CHANGE,{
            "value":this.translateX,
            "merge":_loc2_
         }));
      }
      
      private function _4773(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(!isNaN(this._4780.value))
         {
            _loc2_ = this._4780.isDragging;
         }
         dispatchEvent(new TransformEvent(TransformEvent.Y_CHANGE,{
            "value":this.translateY,
            "merge":_loc2_
         }));
      }
      
      private function _4775(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(!isNaN(this._4790.value))
         {
            _loc2_ = this._4790.isDragging;
         }
         dispatchEvent(new TransformEvent(TransformEvent.ROTATION_CHANGE,{
            "value":this.rotate,
            "merge":_loc2_
         }));
      }
      
      public function _13875(param1:int = -1) : void
      {
         var _loc3_:_52 = null;
         var _loc2_:Vector.<_52> = !!this._4761 ? this._4761.bones : null;
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc3_ = _loc2_[0];
            if(_loc3_._1903)
            {
               if(_loc3_._13657)
               {
                  this._13986.state = _13564.STATE_CACHE;
               }
               else if(_loc3_._1903._13581.getFrameByIndex(param1) != null)
               {
                  this._13986.state = _13564.STATE_KEY;
               }
               else
               {
                  this._13986.state = _13564.STATE_NORMAL;
               }
               if(_loc3_._13658)
               {
                  this._13988.state = _13564.STATE_CACHE;
               }
               else if(_loc3_._1903._13586.getFrameByIndex(param1) != null)
               {
                  this._13988.state = _13564.STATE_KEY;
               }
               else
               {
                  this._13988.state = _13564.STATE_NORMAL;
               }
               if(_loc3_._13659)
               {
                  this._13989.state = _13564.STATE_CACHE;
               }
               else if(_loc3_._1903._13598.getFrameByIndex(param1) != null)
               {
                  this._13989.state = _13564.STATE_KEY;
               }
               else
               {
                  this._13989.state = _13564.STATE_NORMAL;
               }
               return;
            }
         }
         this._13986.state = _13564.STATE_DISABLE;
         this._13988.state = _13564.STATE_DISABLE;
         this._13989.state = _13564.STATE_DISABLE;
      }
   }
}

