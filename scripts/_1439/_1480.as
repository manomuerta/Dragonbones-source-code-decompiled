package _1439
{
   import _1045.Button;
   import _1045.Group;
   import _1045._1082;
   import _1045._1084;
   import _1045._1107;
   import _1185._1189;
   import _1374._1391;
   import _1376._1378;
   import egret.utils._99;
   import egret.utils.tr;
   
   public class _1480 extends _1084
   {
      public var _2567:Group;
      
      public var _2515:_1391;
      
      public var _2527:Group;
      
      public var _2565:_1107;
      
      public var _2516:Button;
      
      public var _2530:_1082;
      
      public function _1480()
      {
         super();
         this.states = ["normal","disabled","focus"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:_1082 = new _1082();
         _loc1_._2564 = 1;
         _loc1_._2562 = 1;
         _loc1_._2563 = 1777701;
         _loc1_._2529 = 0;
         _loc1_.percentHeight = _loc1_.percentWidth = 100;
         this.addElement(_loc1_);
         this._2530 = new _1082();
         this._2530.left = this._2530.right = 1;
         this._2530.top = 25;
         this._2530.bottom = 1;
         this._2530.fillColor = 2304562;
         this._2530._2564 = 1;
         this._2530._2563 = 2699835;
         this._2530._2562 = 2;
         this.addElement(this._2530);
         var _loc2_:Group = new Group();
         _loc2_.percentWidth = 100;
         _loc2_.height = 25;
         this.addElement(_loc2_);
         var _loc3_:_1082 = new _1082();
         _loc3_.left = 0;
         _loc3_.right = 0;
         _loc3_.percentHeight = 100;
         _loc3_._2564 = 1;
         _loc3_._2563 = 1777701;
         _loc3_.fillColor = 2238510;
         _loc2_.addElement(_loc3_);
         this._2567 = new Group();
         this._2567.percentHeight = this._2567.percentWidth = 100;
         _loc2_.addElement(this._2567);
         this._2515 = new _1391();
         this._2515.left = 0;
         this._2515.percentHeight = 100;
         this._2515.skinName = _1262;
         this._2515.itemRenderer = _1378;
         this._2515._2514 = _1457;
         _loc2_.addElement(this._2515);
         this._2527 = new Group();
         this._2527.right = 25;
         this._2527.verticalCenter = 0;
         var _loc4_:_1189;
         (_loc4_ = new _1189()).gap = 0;
         this._2527.layout = _loc4_;
         _loc2_.addElement(this._2527);
         this._2516 = new Button();
         this._2516.toolTip = tr("TabGroup.MenuButton");
         this._2516.right = 4;
         this._2516.verticalCenter = 0;
         this._2516.skinName = _1474;
         _loc2_.addElement(this._2516);
         this._2565 = new _1107();
         this._2565.clipAndEnableScrolling = true;
         this._2565.left = 3;
         this._2565.bottom = 3;
         this._2565.right = 3;
         this._2565.top = 27;
         this.addElement(this._2565);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         _99(function():void
         {
            var _loc1_:_1378 = null;
            if(_2515.selectedIndex >= 0)
            {
               _loc1_ = _2515._2490.getElementAt(_2515.selectedIndex) as _1378;
            }
            if(_2080 == "focus")
            {
               _2530._2563 = 3622226;
               if(_loc1_)
               {
                  _loc1_._9587 = true;
               }
            }
            else
            {
               _2530._2563 = 2699835;
               if(_loc1_)
               {
                  _loc1_._9587 = false;
               }
            }
         });
      }
   }
}

