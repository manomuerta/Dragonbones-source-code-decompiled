package _1439
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Scroller;
   import _1045._1046;
   import _1045._1079;
   import _1045._1082;
   import _1045._1083;
   import _1045._1105;
   import _1088.ItemRenderer;
   import _1185._1188;
   import _1185._1197;
   import _1278._1277;
   import _1374.TextInput;
   import egret.core._1138;
   import flash.events.FocusEvent;
   import flash.geom.Rectangle;
   
   public class _1230 extends _1277
   {
      private var _10022:Class;
      
      public var _2490:_1046;
      
      public var _8412:Group;
      
      public var popUp:_1079;
      
      public var _2491:Scroller;
      
      public var textInput:TextInput;
      
      public var _8410:Button;
      
      public var border:_1082;
      
      private var _9058:_1105;
      
      public function _1230()
      {
         this._10022 = _1230__10022;
         super();
         this.states = ["normal","open","disabled"];
      }
      
      override protected function _2438() : void
      {
         var _loc2_:_1083 = null;
         super._2438();
         this._2490 = new _1046();
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 0;
         _loc1_._2401 = _1188.CONTENT_JUSTIFY;
         this._2490.layout = _loc1_;
         this._2491 = new Scroller();
         this._2491.left = this._2491.right = this._2491.top = this._2491.bottom = 1;
         this._2491._6243 = 1;
         this._2491.viewport = this._2490;
         _loc2_ = new _1083();
         _loc2_.mouseEnabled = false;
         _loc2_.mouseChildren = false;
         _loc2_._8279 = _loc2_._8279 = _loc2_._8280 = _loc2_._8281 = _loc2_._8278 = 3;
         _loc2_.blurX = 20;
         _loc2_.blurY = 20;
         _loc2_.alpha = 0.45;
         _loc2_.distance = 7;
         _loc2_.angle = 90;
         _loc2_.color = 0;
         _loc2_.left = 0;
         _loc2_.top = 0;
         _loc2_.right = 0;
         _loc2_.bottom = 0;
         this._8412 = new Group();
         this._8412.addElement(_loc2_);
         this._9058 = new _1105();
         this._9058.left = this._9058.right = this._9058.top = this._9058.bottom = 0;
         this._9058.source = this._10022;
         this._9058.scale9Grid = new Rectangle(2,2,1,1);
         this._8412.addElement(this._9058);
         this._8412.addElement(this._2491);
         this.popUp = new _1079();
         this.popUp.left = 0;
         this.popUp.right = 0;
         this.popUp.top = 0;
         this.popUp.bottom = 0;
         this.popUp._8219 = _1138.BELOW;
         this.popUp._8202 = true;
         this.popUp.popUp = this._8412;
         addElement(this.popUp);
         if(_6081)
         {
            _6081._8346();
         }
         this._2490.maxHeight = 400;
         this._2490.itemRenderer = ItemRenderer;
         this.textInput = new TextInput();
         this.textInput.skinName = _1264;
         this.textInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
         this.textInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
         this.textInput.left = 0;
         this.textInput.right = 22;
         this.textInput.top = 0;
         this.textInput.bottom = 0;
         addElement(this.textInput);
         this._8410 = new Button();
         this._8410.right = 1;
         this._8410.top = 1;
         this._8410.bottom = 1;
         this._8410.width = 22;
         this._8410.skinName = _1229;
         addElement(this._8410);
         this.border = new _1082();
         this.border._2564 = 1;
         this.border._2529 = 0;
         this.border._2563 = 1646115;
         this.border.mouseEnabled = false;
         this.border.left = this.border.top = 0;
         this.border.bottom = this.border.right = 0;
         this.addElement(this.border);
         var _loc3_:_1082 = new _1082();
         _loc3_.fillColor = 2831678;
         _loc3_.mouseEnabled = false;
         _loc3_.right = 23;
         _loc3_.width = 1;
         _loc3_.verticalCenter = 0;
         _loc3_.percentHeight = 70;
         this.addElement(_loc3_);
      }
      
      protected function onFocusOut(param1:FocusEvent) : void
      {
         this.border._2563 = 1646115;
      }
      
      protected function onFocusIn(param1:FocusEvent) : void
      {
         this.border._2563 = 6652315;
      }
      
      override protected function _2519() : void
      {
         super._2519();
         switch(_2080)
         {
            case "open":
               this.popUp._8222 = true;
               break;
            case "normal":
               if(this.popUp)
               {
                  this.popUp._8222 = false;
               }
               break;
            case "disabled":
         }
      }
   }
}

