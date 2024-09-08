package _813
{
   import _1038._1039;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _127._156;
   import _127._162;
   import _790._795;
   import _834._10435;
   import egret.utils.tr;
   
   public class ComicOrderPanel extends _156
   {
      public var _3600:_162;
      
      public var _6179:Label;
      
      public var content:Group;
      
      public var comicTree:_795;
      
      public var _3581:DropDownList;
      
      public var _6180:Label;
      
      public function ComicOrderPanel()
      {
         this._3600 = new _162();
         this._6179 = new Label();
         this.content = new Group();
         this.comicTree = new _795();
         this._3581 = new DropDownList();
         this._6180 = new Label();
         super();
         this.title = tr("ComicOrderPanel.title");
         this.minWidth = 270;
         addElement(this.comicTree);
         addElement(this.content);
         this.content.addElement(this._6180);
         this.content.addElement(this._3581);
         this.content.addElement(this._6179);
         this.content.addElement(this._3600);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.comicTree.x = 0;
         this.comicTree.y = 0;
         this.content.height = 90;
         this._6180.x = 20;
         this._6180.text = tr("ComicOrderPanel.play");
         this._3581.x = 20;
         this._3581._5987 = "title";
         this._3581.skinName = _10435;
         this._6179.text = tr("ComicOrderPanel.delay");
         this._3600.txt.text = "";
         this._3600._2579 = 0.1;
      }
      
      public function _6178(param1:_1039) : void
      {
         if(Boolean(param1) && Boolean(this._3581))
         {
            this._3581.dataProvider = param1;
            if(param1.length)
            {
               this._3581.selectedIndex = 0;
            }
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this.comicTree.width = this.width;
         this.comicTree.height = this.height - 95;
         this._6180.y = this.comicTree.height + 15;
         this._3581.width = this.width - this._6180.x - 20;
         this._3581.y = this._6180.y + 30;
         this._6179.x = this._3581.width + this._3581.x + 20;
         this._6179.y = this._6180.y;
         this._6179.visible = false;
         this._6179.includeInLayout = false;
         this._3600.x = this._6179.x;
         this._3600.y = this._3581.y;
         this._3600.width = this.width * 0.3;
         this._3600.txt.width = this._3600.width;
         this._3600.visible = false;
         this._3600.includeInLayout = false;
         this.content.graphics.clear();
         this.content.graphics.lineStyle(1,3622226);
         this.content.graphics.drawRect(0,this.comicTree.height + 2,this.width,0.5);
         this.content.graphics.endFill();
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._3600)
         {
            this._3600.visible = false;
         }
         if(param2 == this._6179)
         {
            this._6179.visible = false;
         }
      }
   }
}

