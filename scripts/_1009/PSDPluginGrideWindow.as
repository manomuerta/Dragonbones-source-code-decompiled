package _1009
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _1177.UIEvent;
   import _1185._1188;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._171;
   import _1374.IconButton;
   import _1529._1528;
   import _1529._1530;
   import _521.DBAnimateManager;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   
   public class PSDPluginGrideWindow extends _171
   {
      private const WIDTH:int = 700;
      
      private const HEIGHT:int = 580;
      
      private var bg:Group;
      
      private var _10523:Group;
      
      private var page1:Group;
      
      private var page2:Group;
      
      private var page3:Group;
      
      private var _10525:IconButton;
      
      private var _10524:IconButton;
      
      private var btn1:Group;
      
      private var btn2:Group;
      
      private var btn3:Group;
      
      private var _2513:Group;
      
      private var order:int = 0;
      
      private var _10522:Number = 0;
      
      public function PSDPluginGrideWindow()
      {
         this.page1 = new Group();
         this.page2 = new Group();
         this.page3 = new Group();
         this.btn1 = new Group();
         this.btn2 = new Group();
         this.btn3 = new Group();
         this._2513 = this._2414();
         super();
         this.width = this.minWidth = this.WIDTH;
         this.height = this.minHeight = this.HEIGHT;
         title = tr("PSDGuide.Title");
      }
      
      override protected function _2438() : void
      {
         addEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
         super._2438();
         closeButton.visible = true;
         this._10525 = new IconButton();
         this._10524 = new IconButton();
         this._10525.icon = "/assets/psdGride/left.png";
         this._10524.icon = "/assets/psdGride/right.png";
         this.bg = new Group();
         this._10523 = new Group();
         this._10523.graphics.clear();
         this._10523.graphics.beginFill(1843496,1);
         this._10523.graphics.drawRect(0,-30,550,430);
         this._10523.graphics.endFill();
         this._10523.width = 550;
         this._10523.height = 380;
         this._10519();
         this._10520();
         this._10518();
         this.page1.width = this.page2.width = this.page3.width = 600;
         this.bg.addElement(this.page1);
         this.bg.addElement(this.page2);
         this.bg.addElement(this.page3);
         this.page2.x = 600;
         this.page3.x = 1200;
         this.bg.mask = this._10523;
         this.btn1.graphics.clear();
         this.btn1.graphics.beginFill(1975081,1);
         this.btn1.graphics.drawCircle(3,3,5);
         this.btn1.graphics.endFill();
         this.btn2.graphics.clear();
         this.btn2.graphics.beginFill(1975081,1);
         this.btn2.graphics.drawCircle(3,3,5);
         this.btn2.graphics.endFill();
         this.btn3.graphics.clear();
         this.btn3.graphics.beginFill(1975081,1);
         this.btn3.graphics.drawCircle(3,3,5);
         this.btn3.graphics.endFill();
         this.btn3.width = this.btn2.width = this.btn1.width = 20;
         this._2513.addElement(this.btn1);
         this._2513.addElement(this.btn2);
         this._2513.addElement(this.btn3);
         this.addElement(this.bg);
         this.addElement(this._10523);
         this.addElement(this._10525);
         this.addElement(this._10524);
         this.addElement(this._2513);
      }
      
      private function onComplete(param1:UIEvent) : void
      {
         removeEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
         this.invalidateDisplayList();
         this._10525.addEventListener(MouseEvent.CLICK,this._10516);
         this._10524.addEventListener(MouseEvent.CLICK,this._10516);
         this._2513.addEventListener(MouseEvent.CLICK,this._10516);
      }
      
      private function _10516(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this._10525:
               --this.order;
               if(this.order < 0)
               {
                  this.order = 0;
               }
               break;
            case this._10524:
               ++this.order;
               if(this.order > 2)
               {
                  this.order = 2;
               }
               break;
            case this._2513:
               if(param1.target == this.btn1)
               {
                  this.order = 0;
               }
               else if(param1.target == this.btn2)
               {
                  this.order = 1;
               }
               else if(param1.target == this.btn3)
               {
                  this.order = 2;
               }
         }
         this.invalidateDisplayList();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._10525.x = 30;
         this._10524.x = param1 - 70;
         this._10525.y = param2 / 2 - 120;
         this._10524.y = param2 / 2 - 120;
         this._10523.x = (param1 - this._10523.width) / 2;
         this._10523.y = (param2 - this._10523.height) / 2;
         this._2513.x = (param1 - 60) / 2;
         this._2513.y = param2 - 90;
         this.bg.y = (param2 - this.bg.height) / 2;
         this._10522 = param1;
         this._10517();
         this._10521();
      }
      
      private function _10519() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 90;
         var _loc4_:int = 60;
         var _loc5_:int = 22;
         var _loc6_:_1105 = new _1105();
         var _loc7_:_1105 = new _1105();
         var _loc8_:_1105 = new _1105();
         var _loc9_:_1105 = new _1105();
         var _loc10_:_1105 = new _1105();
         var _loc11_:_1105 = new _1105();
         var _loc12_:_1105 = new _1105();
         var _loc13_:Label = new Label();
         var _loc14_:Label = new Label();
         var _loc15_:Label = new Label();
         var _loc16_:Label = new Label();
         var _loc17_:_1105 = new _1105();
         var _loc18_:Label = new Label();
         var _loc19_:Label = new Label();
         var _loc20_:Label = new Label();
         _loc6_.source = "assets/psdGride/folder.png";
         _loc6_.x = _loc1_;
         _loc6_.y = _loc2_;
         _loc7_.source = "assets/psdGride/arrow.png";
         _loc7_.x = _loc1_ + _loc3_;
         _loc7_.y = _loc5_;
         _loc8_.source = "assets/psdGride/folder.png";
         _loc8_.x = _loc1_ + _loc3_ + _loc4_;
         _loc8_.y = _loc2_;
         _loc9_.source = "assets/psdGride/arrow.png";
         _loc9_.x = _loc1_ + _loc3_ * 2 + _loc4_;
         _loc9_.y = _loc5_;
         _loc10_.source = "assets/psdGride/folder.png";
         _loc10_.x = _loc1_ + _loc3_ * 2 + _loc4_ * 2;
         _loc10_.y = _loc2_;
         _loc11_.source = "assets/psdGride/arrow.png";
         _loc11_.x = _loc1_ + _loc3_ * 3 + _loc4_ * 2;
         _loc11_.y = _loc5_;
         _loc12_.source = "assets/psdGride/file.png";
         _loc12_.x = _loc1_ + _loc3_ * 3 + _loc4_ * 3;
         _loc12_.y = _loc2_ - 5;
         _loc7_.alpha = _loc9_.alpha = _loc11_.alpha = 0.5;
         _loc13_.text = "DragonBonesPro";
         _loc14_.text = "others";
         _loc15_.text = "PhotoshopPlugin";
         _loc16_.text = "install.JSX";
         var _loc21_:int = 0;
         _loc13_.size = _loc14_.size = _loc15_.size = _loc16_.size = 14;
         _loc13_.x = _loc21_ - 15;
         _loc14_.x = _loc21_ + 160;
         _loc15_.x = _loc21_ + 280;
         _loc16_.x = _loc21_ + 420 + 17;
         _loc13_.y = _loc14_.y = _loc15_.y = _loc16_.y = 90;
         _loc17_.source = "assets/psdGride/num1.png";
         _loc17_.x = _loc1_ + _loc3_ + _loc4_ + 40;
         _loc18_.text = tr("PSDGuide.lable1");
         _loc19_.text = tr("PSDGuide.lable2");
         _loc20_.text = tr("PSDGuide.lable3");
         var _loc22_:Group = new Group();
         _loc22_.addElement(_loc6_);
         _loc22_.addElement(_loc7_);
         _loc22_.addElement(_loc8_);
         _loc22_.addElement(_loc9_);
         _loc22_.addElement(_loc10_);
         _loc22_.addElement(_loc11_);
         _loc22_.addElement(_loc12_);
         _loc22_.addElement(_loc13_);
         _loc22_.addElement(_loc14_);
         _loc22_.addElement(_loc15_);
         _loc22_.addElement(_loc16_);
         _loc22_.height = 180;
         var _loc23_:Group;
         (_loc23_ = this._2413()).percentWidth = 100;
         var _loc24_:Group;
         (_loc24_ = new Group()).height = 50;
         _loc23_.addElement(_loc24_);
         _loc23_.addElement(_loc22_);
         var _loc25_:Group;
         (_loc25_ = new Group()).height = 15;
         _loc23_.addElement(_loc25_);
         _loc23_.addElement(_loc17_);
         var _loc26_:Group;
         (_loc26_ = new Group()).height = 15;
         _loc23_.addElement(_loc26_);
         var _loc27_:Group;
         (_loc27_ = this._2413()).percentWidth = 100;
         _loc27_.addElement(_loc18_);
         _loc27_.addElement(_loc19_);
         _loc27_.addElement(_loc20_);
         var _loc28_:Group;
         (_loc28_ = new Group()).height = 45;
         _loc27_.addElement(_loc28_);
         _loc23_.addElement(_loc27_);
         this.page1.addElement(_loc23_);
      }
      
      private function _10520() : void
      {
         var _loc1_:_1105 = new _1105();
         var _loc2_:_1105 = new _1105();
         var _loc3_:Label = new Label();
         var _loc4_:Label = new Label();
         var _loc5_:Label = new Label();
         if(_1528.language == _1530.zh_CN)
         {
            _loc1_.source = "assets/psdGride/browse.png";
         }
         else
         {
            _loc1_.source = "assets/psdGride/browseEN.png";
         }
         _loc2_.source = "assets/psdGride/num2.png";
         _loc3_.text = tr("PSDGuide.lable21");
         _loc4_.text = tr("PSDGuide.lable22");
         _loc5_.text = tr("PSDGuide.lable23");
         var _loc6_:Group;
         (_loc6_ = new Group()).height = 15;
         var _loc7_:Group;
         (_loc7_ = this._2413()).percentWidth = 100;
         _loc7_.addElement(_loc1_);
         _loc7_.addElement(_loc6_);
         _loc7_.addElement(_loc2_);
         var _loc8_:Group;
         (_loc8_ = this._2413()).percentWidth = 100;
         _loc8_.addElement(_loc3_);
         _loc8_.addElement(_loc4_);
         _loc8_.addElement(_loc5_);
         var _loc9_:Group;
         (_loc9_ = new Group()).height = 45;
         _loc8_.addElement(_loc9_);
         var _loc10_:Group;
         (_loc10_ = new Group()).height = 15;
         _loc7_.addElement(_loc10_);
         this.page2.addElement(_loc7_);
         _loc7_.addElement(_loc8_);
      }
      
      private function _10518() : void
      {
         var _loc1_:_1105 = new _1105();
         var _loc2_:_1105 = new _1105();
         var _loc3_:Label = new Label();
         var _loc4_:Label = new Label();
         var _loc5_:Label = new Label();
         if(_1528.language == _1530.zh_CN)
         {
            _loc1_.source = "assets/psdGride/exportDB.png";
         }
         else
         {
            _loc1_.source = "assets/psdGride/exportDBEN.png";
         }
         _loc2_.source = "assets/psdGride/num3.png";
         _loc3_.text = tr("PSDGuide.lable31");
         _loc4_.text = tr("PSDGuide.lable32");
         _loc5_.text = tr("PSDGuide.lable33");
         var _loc6_:Group;
         (_loc6_ = new Group()).height = 15;
         var _loc7_:Group;
         (_loc7_ = this._2413()).percentWidth = 100;
         _loc7_.addElement(_loc1_);
         _loc7_.addElement(_loc6_);
         _loc7_.addElement(_loc2_);
         var _loc8_:Group;
         (_loc8_ = this._2413()).percentWidth = 100;
         _loc8_.addElement(_loc3_);
         _loc8_.addElement(_loc4_);
         _loc8_.addElement(_loc5_);
         var _loc9_:Group;
         (_loc9_ = new Group()).height = 45;
         _loc8_.addElement(_loc9_);
         var _loc10_:Group;
         (_loc10_ = new Group()).height = 15;
         _loc7_.addElement(_loc10_);
         this.page3.addElement(_loc7_);
         _loc7_.addElement(_loc8_);
      }
      
      private function _10517() : void
      {
         DBAnimateManager.getInstance()._3385("PSDPluginGrideWindow.BG",150);
         DBAnimateManager.getInstance()._3381("x",this.bg.x,(this._10522 - this.page1.width) / 2 - 600 * this.order);
         DBAnimateManager.getInstance().play([this.bg]);
      }
      
      private function _10521() : void
      {
         switch(this.order)
         {
            case 0:
               this.btn1.graphics.clear();
               this.btn1.graphics.beginFill(4675431,1);
               this.btn1.graphics.drawCircle(3,3,5);
               this.btn1.graphics.endFill();
               this.btn2.graphics.clear();
               this.btn2.graphics.beginFill(1975081,1);
               this.btn2.graphics.drawCircle(3,3,5);
               this.btn2.graphics.endFill();
               this.btn3.graphics.clear();
               this.btn3.graphics.beginFill(1975081,1);
               this.btn3.graphics.drawCircle(3,3,5);
               this.btn3.graphics.endFill();
               break;
            case 1:
               this.btn1.graphics.clear();
               this.btn1.graphics.beginFill(1975081,1);
               this.btn1.graphics.drawCircle(3,3,5);
               this.btn1.graphics.endFill();
               this.btn2.graphics.clear();
               this.btn2.graphics.beginFill(4675431,1);
               this.btn2.graphics.drawCircle(3,3,5);
               this.btn2.graphics.endFill();
               this.btn3.graphics.clear();
               this.btn3.graphics.beginFill(1975081,1);
               this.btn3.graphics.drawCircle(3,3,5);
               this.btn3.graphics.endFill();
               break;
            case 2:
               this.btn1.graphics.clear();
               this.btn1.graphics.beginFill(1975081,1);
               this.btn1.graphics.drawCircle(3,3,5);
               this.btn1.graphics.endFill();
               this.btn2.graphics.clear();
               this.btn2.graphics.beginFill(1975081,1);
               this.btn2.graphics.drawCircle(3,3,5);
               this.btn2.graphics.endFill();
               this.btn3.graphics.clear();
               this.btn3.graphics.beginFill(4675431,1);
               this.btn3.graphics.drawCircle(3,3,5);
               this.btn3.graphics.endFill();
         }
      }
      
      private function _2413() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         var _loc2_:_1197 = new _1197();
         _loc2_._2401 = _1188.CENTER;
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
   }
}

