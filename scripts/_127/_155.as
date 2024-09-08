package _127
{
   import _1045.Button;
   import _1045.Group;
   import _1045._1082;
   import _1045._1107;
   import _1185._1189;
   import _1374._1391;
   import _1439._1262;
   import _1439._1480;
   
   public class _155 extends _1480
   {
      public function _155()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc2_:Group = null;
         var _loc1_:_1082 = new _1082();
         _loc1_._2564 = 1;
         _loc1_._2562 = 1;
         _loc1_._2563 = 1777701;
         _loc1_._2529 = 0;
         _loc1_.percentHeight = _loc1_.percentWidth = 100;
         this.addElement(_loc1_);
         _2530 = new _1082();
         _2530.left = _2530.right = 1;
         _2530.top = 25;
         _2530.bottom = 1;
         _2530.fillColor = 2304562;
         _2530._2564 = 1;
         _2530._2563 = 2699835;
         _2530._2562 = 2;
         this.addElement(_2530);
         _loc2_ = new Group();
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
         _2567 = new Group();
         _2567.percentHeight = _2567.percentWidth = 100;
         _loc2_.addElement(_2567);
         _2515 = new _1391();
         _2515.left = 0;
         _2515.percentHeight = 100;
         _2515.skinName = _1262;
         _2515.itemRenderer = _138;
         _2515._2514 = _157;
         _loc2_.addElement(_2515);
         _2527 = new Group();
         _2527.right = 4;
         _2527.verticalCenter = 0;
         var _loc4_:_1189;
         (_loc4_ = new _1189()).gap = 0;
         _2527.layout = _loc4_;
         _loc2_.addElement(_2527);
         _2516 = new Button();
         _2516.visible = false;
         _2516.includeInLayout = false;
         _2565 = new _1107();
         _2565.clipAndEnableScrolling = true;
         _2565.left = 3;
         _2565.bottom = 3;
         _2565.right = 3;
         _2565.top = 27;
         this.addElement(_2565);
      }
   }
}

