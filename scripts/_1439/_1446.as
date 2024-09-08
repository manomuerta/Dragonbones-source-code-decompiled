package _1439
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045.Scroller;
   import _1045._1046;
   import _1045._1079;
   import _1045._1083;
   import _1045._1084;
   import _1045._1105;
   import _1185._1188;
   import _1185._1197;
   import _1374.IconButton;
   import egret.core._1110;
   import egret.core._1138;
   import flash.geom.Rectangle;
   
   public class _1446 extends _1084
   {
      private var _10022:Class;
      
      private var arrow:Class;
      
      private var _10031:Class;
      
      public var _2490:_1046;
      
      public var _8412:Group;
      
      public var _8410:Button;
      
      public var popUp:_1079;
      
      public var _2491:Scroller;
      
      public var labelDisplay:Label;
      
      private var _9058:_1105;
      
      public function _1446()
      {
         this._10022 = _1446__10022;
         this.arrow = _1446_arrow;
         this._10031 = _1446__10031;
         super();
         this.minHeight = 15;
         this.states = ["normal","open","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2490 = new _1046();
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 0;
         _loc1_._2401 = _1188.CONTENT_JUSTIFY;
         this._2490.maxHeight = 400;
         this._2490.layout = _loc1_;
         if(_6081)
         {
            _6081._8346();
         }
         this._2491 = new Scroller();
         this._2491.left = this._2491.right = this._2491.top = this._2491.bottom = 1;
         this._2491._6243 = 1;
         this._2491.viewport = this._2490;
         var _loc2_:_1083 = new _1083();
         _loc2_._8279 = _loc2_._8279 = _loc2_._8280 = _loc2_._8281 = _loc2_._8278 = 10;
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
         this.popUp.bottom = 0;
         this.popUp.width = 150;
         this.popUp._8219 = _1138.BELOW;
         this.popUp._8202 = true;
         this.popUp.popUp = this._8412;
         addElement(this.popUp);
         this._8410 = new IconButton();
         this._8410.skinName = _1454;
         this._8410.height = 23;
         this._8410.left = 0;
         this._8410.right = 0;
         this._8410.top = 2;
         this._8410.bottom = 2;
         this._8410.tabEnabled = false;
         addElement(this._8410);
         var _loc3_:_1105 = new _1105();
         _loc3_.mouseChildren = false;
         _loc3_.mouseEnabled = false;
         _loc3_.x = 3;
         _loc3_.verticalCenter = 0;
         _loc3_.source = new _1110(this.arrow,this._10031);
         addElement(_loc3_);
         this.labelDisplay = new Label();
         this.labelDisplay.verticalAlign = "middle";
         this.labelDisplay.textAlign = "center";
         this.labelDisplay._6080 = 1;
         this.labelDisplay.mouseEnabled = false;
         this.labelDisplay.mouseChildren = false;
         this.labelDisplay.left = 12;
         this.labelDisplay.right = 1;
         this.labelDisplay.top = 1;
         this.labelDisplay.bottom = 1;
         addElement(this.labelDisplay);
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
               this.popUp._8222 = false;
               break;
            case "disabled":
         }
      }
   }
}

