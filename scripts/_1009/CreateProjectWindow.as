package _1009
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1105;
   import _127._171;
   import _636.WindowEvent;
   import _97._125;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   
   public class CreateProjectWindow extends _171
   {
      public static const DRAGONBONES_PROJECT_ICON:String = "/assets/menu/dragon.png";
      
      public static const COMIC_PROJECT_ICON:String = "/assets/menu/comic.png";
      
      private var _7045:Group;
      
      private var _7047:Group;
      
      public function CreateProjectWindow()
      {
         super();
         this.title = tr("CreateProjectWindow.Title");
      }
      
      override protected function _2438() : void
      {
         var _loc2_:_1082 = null;
         super._2438();
         var _loc1_:Group = _125._2395(10);
         _loc1_.percentWidth = 100;
         _2512.addElement(_loc1_);
         _2512.percentWidth = 100;
         this._7045 = this._3318(DRAGONBONES_PROJECT_ICON,tr("CreateProjectWindow.dragonbones.title"),tr("CreateProjectWindow.dragonbones.desc"));
         this._7047 = this._3318(COMIC_PROJECT_ICON,tr("CreateProjectWindow.comic.title"),tr("CreateProjectWindow.comic.desc"));
         _loc1_.addElement(this._7045);
         _loc2_ = new _1082();
         _loc2_._2529 = 0.3;
         _loc2_.width = 350;
         _loc2_.height = 1;
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(new Label());
         _loc1_.addElement(this._7047);
         _loc1_.left = 100;
         this._7045.addEventListener(MouseEvent.CLICK,this._7046);
         this._7047.addEventListener(MouseEvent.CLICK,this._7048);
         closeButton.visible = true;
      }
      
      override public function close() : void
      {
         this._7045.removeEventListener(MouseEvent.CLICK,this._7046);
         this._7047.removeEventListener(MouseEvent.CLICK,this._7048);
         super.close();
      }
      
      private function _7048(param1:MouseEvent) : void
      {
         dispatchEvent(new WindowEvent(WindowEvent.COMIC_PROJECT));
      }
      
      private function _7046(param1:MouseEvent) : void
      {
         dispatchEvent(new WindowEvent(WindowEvent.DRAGONBONES_PROJECT));
      }
      
      private function _3318(param1:String, param2:String, param3:String) : Group
      {
         var group:Group;
         var icon:_1105;
         var _11439:Label;
         var txtDesc:Label;
         var w:int = 0;
         var h:int = 0;
         var g:Group = null;
         var txtGroup:Group = null;
         var over:_1105 = null;
         var onOver:Function = null;
         var onOut:Function = null;
         var _7049:String = param1;
         var title:String = param2;
         var desc:String = param3;
         onOver = function(param1:MouseEvent):void
         {
            over.graphics.clear();
            over.graphics.lineStyle(1,16777215,0);
            over.graphics.beginFill(3425870,1);
            over.graphics.drawRect(0,0,w,h);
            over.graphics.endFill();
         };
         onOut = function(param1:MouseEvent):void
         {
            over.graphics.lineStyle(0,16777215,0);
            over.graphics.clear();
            over.graphics.beginFill(16711680,0);
            over.graphics.drawRect(0,0,w,h);
            over.graphics.endFill();
         };
         w = 400;
         h = 100;
         g = new Group();
         g.width = w + 10;
         g.height = h + 10;
         group = _125._2414();
         group.x = 20;
         group.y = 10;
         icon = new _1105(_7049);
         txtGroup = _125._2413();
         _11439 = new Label();
         _11439.size = 18;
         _11439.text = title;
         txtDesc = new Label();
         txtDesc.textColor = 10066329;
         txtDesc.text = desc;
         txtDesc.width = w - 120;
         txtDesc.mouseChildren = txtDesc.mouseEnabled = false;
         txtGroup.addElement(_11439);
         txtGroup.addElement(txtDesc);
         group.addElement(icon);
         group.addElement(txtGroup);
         over = new _1105();
         over.mouseChildren = true;
         over.mouseEnabled = true;
         over.graphics.clear();
         over.graphics.beginFill(16711680,0);
         over.graphics.drawRect(0,0,w,h);
         over.graphics.endFill();
         over.addEventListener(MouseEvent.ROLL_OVER,onOver,false,0,false);
         over.addEventListener(MouseEvent.ROLL_OUT,onOut,false,0,false);
         g.addElement(over);
         g.addElement(group);
         group.mouseChildren = group.mouseEnabled = false;
         return g;
      }
   }
}

