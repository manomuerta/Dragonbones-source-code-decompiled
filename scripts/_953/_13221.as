package _953
{
   import _1038._1037;
   import _1045.Group;
   import _1045.TabBar;
   import _1045._1082;
   import _1045._1105;
   import _1374.IconButton;
   import _636.TransformEvent;
   import _822._10616;
   import _935._13217;
   import _935._13220;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _13221 extends Group
   {
      public static const ABSLOLUTE:String = "absloute";
      
      public static const RELATIVE:String = "relative";
      
      private static var _10860:String = "/assets/button/translate.png";
      
      private static var _13451:String = "/assets/button/applyAll.png";
      
      private static var _13462:String = "/assets/button/flipX.png";
      
      private static var _13461:String = "/assets/button/flipY.png";
      
      public static const STROKE_COLOR:uint = 1777701;
      
      public static const FILL_COLOR:uint = 2238766;
      
      public static const ALPHA:Number = 1;
      
      public static const MAX_POSITION:Number = 999999;
      
      public var _4781:_10616;
      
      public var _4780:_10616;
      
      public var _13340:TabBar;
      
      public var _13341:_13217;
      
      public var _6648:_10616;
      
      public var _6650:_10616;
      
      public var _13338:IconButton;
      
      public var _13463:IconButton;
      
      public var _13464:IconButton;
      
      private var _2558:_1082;
      
      public var _13457:_1105;
      
      private var _13460:_1037;
      
      private var _13454:Group;
      
      private var _13458:Group;
      
      public function _13221()
      {
         this._13457 = new _1105(_10860);
         this._13460 = new _1037();
         super();
         this._13460.source = [{
            "label":tr("Sheet.abs"),
            "data":ABSLOLUTE
         },{
            "label":tr("Sheet.relative"),
            "data":RELATIVE
         }];
      }
      
      override protected function _2438() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_1082 = null;
         super._2438();
         _loc1_ = 37;
         _loc2_ = 56;
         _loc3_ = 62;
         _loc4_ = 20;
         (_loc5_ = new _1082()).radius = 5;
         _loc5_._2563 = STROKE_COLOR;
         _loc5_._2562 = 1;
         _loc5_._2564 = 1;
         _loc5_.fillColor = FILL_COLOR;
         _loc5_.alpha = ALPHA;
         _loc5_.width = _loc3_;
         _loc5_.height = _loc1_;
         addElement(_loc5_);
         this._13463 = new IconButton();
         this._13463.icon = _13462;
         this._13463.toolTip = tr("Sheet.flipx.tip");
         this._13464 = new IconButton();
         this._13464.icon = _13461;
         this._13464.toolTip = tr("Sheet.flipy.tip");
         var _loc6_:Group;
         (_loc6_ = _125._2414(2)).left = 6;
         _loc6_.top = 6;
         _loc6_.addElement(this._13463);
         _loc6_.addElement(this._13464);
         addElement(_loc6_);
         this._2558 = new _1082();
         this._2558.radius = 5;
         this._2558._2563 = STROKE_COLOR;
         this._2558._2562 = 1;
         this._2558._2564 = 1;
         this._2558.fillColor = FILL_COLOR;
         this._2558.alpha = ALPHA;
         this._2558.width = _loc2_ * 2 + 150;
         this._2558.height = _loc1_;
         this._2558.x = _loc3_ + _loc4_;
         addElement(this._2558);
         var _loc7_:Group;
         (_loc7_ = new Group()).x = this._2558.x + this._2558.width + _loc3_ + _loc4_;
         addElement(_loc7_);
         var _loc8_:Group;
         (_loc8_ = _125._2414(2)).left = 6 + _loc3_ + _loc4_;
         _loc8_.top = 6;
         _loc8_.percentWidth = 100;
         addElement(_loc8_);
         this._13340 = new TabBar();
         this._13340.width = 68;
         this._13340.skinName = _13220;
         this._13340.dataProvider = this._13460;
         this._13340.selectedIndex = 0;
         _loc8_.addElement(this._13340);
         this._13454 = _125._2414(2);
         this._4781 = new _10616();
         this._4780 = new _10616();
         this._4781.maximum = MAX_POSITION;
         this._4781.minimum = -MAX_POSITION;
         this._4781._8236 = 0.01;
         this._4781.width = _loc2_;
         this._4780.maximum = MAX_POSITION;
         this._4780.minimum = -MAX_POSITION;
         this._4780._8236 = 0.01;
         this._4780.width = _loc2_;
         var _loc9_:Group;
         (_loc9_ = new Group()).width = 7;
         var _loc10_:Group;
         (_loc10_ = new Group()).width = 7;
         this._13454.addElement(_loc9_);
         this._13454.addElement(this._13457);
         this._13454.addElement(_loc10_);
         this._13454.addElement(this._4781);
         this._13454.addElement(this._4780);
         _loc8_.addElement(this._13454);
         this._13458 = _125._2414(2);
         this._13341 = new _13217();
         this._6648 = new _10616();
         this._6648.maximum = MAX_POSITION;
         this._6648.minimum = -MAX_POSITION;
         this._6648._8236 = 0.01;
         this._6648._8047 = 0.01;
         this._6648.width = _loc2_;
         this._6650 = new _10616();
         this._6650.maximum = MAX_POSITION;
         this._6650.minimum = -MAX_POSITION;
         this._6650._8236 = 0.01;
         this._6650._8047 = 0.01;
         this._6650.width = _loc2_;
         var _loc11_:Group;
         (_loc11_ = new Group()).width = 4;
         var _loc12_:Group;
         (_loc12_ = new Group()).width = 4;
         this._13458.addElement(_loc11_);
         this._13458.addElement(this._13341);
         this._13458.addElement(_loc12_);
         this._13458.addElement(this._6648);
         this._13458.addElement(this._6650);
         _loc8_.addElement(this._13458);
         this._13338 = new IconButton();
         this._13338.icon = _13451;
         this._13338.toolTip = tr("Sheet.apply.all");
         var _loc13_:Group;
         (_loc13_ = new Group()).width = 2;
         _loc8_.addElement(_loc13_);
         _loc8_.addElement(this._13338);
         this._13340.addEventListener(Event.CHANGE,this._13459);
         this._13459(null);
         this._5476();
      }
      
      public function get translateX() : Number
      {
         return this._4781.value;
      }
      
      public function get translateY() : Number
      {
         return this._4780.value;
      }
      
      public function get _2166() : Number
      {
         return this._6648.value;
      }
      
      public function get _2167() : Number
      {
         return this._6650.value;
      }
      
      private function _5476() : void
      {
         this._4781.addEventListener(Event.CHANGE,this._4772);
         this._4780.addEventListener(Event.CHANGE,this._4773);
         this._6648.addEventListener(Event.CHANGE,this._13452);
         this._6650.addEventListener(Event.CHANGE,this._13453);
         this._13341.addEventListener(Event.CHANGE,this._13450);
         this._13463.addEventListener(MouseEvent.CLICK,this._13456);
         this._13464.addEventListener(MouseEvent.CLICK,this._13455);
      }
      
      private function _13455(param1:Event) : void
      {
         dispatchEvent(new TransformEvent(TransformEvent.FLIPY_CHANGE));
      }
      
      private function _13456(param1:Event) : void
      {
         dispatchEvent(new TransformEvent(TransformEvent.FLIPX_CHANGE));
      }
      
      private function _13450(param1:Event) : void
      {
         dispatchEvent(new TransformEvent(TransformEvent.PIVOT_CHANGE,this._13341.value));
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
      
      private function _13452(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(!isNaN(this._6648.value))
         {
            _loc2_ = this._6648.isDragging;
         }
         dispatchEvent(new TransformEvent(TransformEvent.PIVOT_X_CHANGE,{
            "value":this._2166,
            "merge":_loc2_
         }));
      }
      
      private function _13453(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(!isNaN(this._6650.value))
         {
            _loc2_ = this._6650.isDragging;
         }
         dispatchEvent(new TransformEvent(TransformEvent.PIVOT_Y_CHANGE,{
            "value":this._2167,
            "merge":_loc2_
         }));
      }
      
      private function _13459(param1:Event) : void
      {
         if(this._13340.selectedIndex == 1)
         {
            this._13454.visible = false;
            this._13454.includeInLayout = false;
            this._13458.visible = true;
            this._13458.includeInLayout = true;
         }
         else if(this._13340.selectedIndex == 0)
         {
            this._13454.visible = true;
            this._13454.includeInLayout = true;
            this._13458.visible = false;
            this._13458.includeInLayout = false;
         }
      }
      
      public function _13335() : void
      {
         var _loc1_:Number = this._2166;
         var _loc2_:Number = this._2167;
         if(this._2166 == 0.5 && this._2167 == 0.5)
         {
            this._13341.value = _13217.LEFT_TOP;
         }
         else if(this._2166 == 0.5 && this._2167 == 0)
         {
            this._13341.value = _13217.LEFT_MIDDLE;
         }
         else if(this._2166 == 0.5 && this._2167 == -0.5)
         {
            this._13341.value = _13217.LEFT_BOTTOM;
         }
         else if(this._2166 == 0 && this._2167 == 0.5)
         {
            this._13341.value = _13217.MIDDLE_TOP;
         }
         else if(this._2166 == 0 && this._2167 == 0)
         {
            this._13341.value = _13217.MIDDLE_MIDDLE;
         }
         else if(this._2166 == 0 && this._2167 == -0.5)
         {
            this._13341.value = _13217.MIDDLE_BOTTOM;
         }
         else if(this._2166 == -0.5 && this._2167 == 0.5)
         {
            this._13341.value = _13217.RIGHT_TOP;
         }
         else if(this._2166 == -0.5 && this._2167 == 0)
         {
            this._13341.value = _13217.RIGHT_MIDDLE;
         }
         else if(this._2166 == -0.5 && this._2167 == -0.5)
         {
            this._13341.value = _13217.RIGHT_BOTTOM;
         }
         else
         {
            this._13341.value = null;
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         this._4781.enabled = param1;
         this._4780.enabled = param1;
         this._13340.enabled = param1;
         this._13341.enabled = param1;
         this._6648.enabled = param1;
         this._6650.enabled = param1;
         this._13338.enabled = param1;
         this._13463.enabled = param1;
         this._13464.enabled = param1;
      }
   }
}

