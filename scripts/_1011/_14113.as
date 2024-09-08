package _1011
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045.ProgressBar;
   import _127._14045;
   import _127._171;
   import _97._125;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   
   public class _14113 extends _171
   {
      private var _5555:Button;
      
      private var progress:ProgressBar;
      
      private var _14868:Label;
      
      private var _14866:Label;
      
      private var _6194:Label;
      
      private var _14869:Label;
      
      public var _14459:Function = null;
      
      public function _14113()
      {
         super();
         this.title = tr("Export.gifAlert.title");
         this.width = NaN;
         this.resizable = false;
         if(SystemInfo.isMacOS)
         {
            this.minHeight = 215;
         }
         this.minWidth = 410;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc2_:Group = null;
         var _loc3_:Group = null;
         super._2438();
         _loc1_ = _125._2413(3);
         _loc1_.percentWidth = 100;
         _loc1_.left = 35;
         _loc1_.top = 25;
         _loc1_.bottom = 10;
         _loc2_ = _125._2414(3);
         _loc2_.percentWidth = 100;
         _loc3_ = new Group();
         this.progress = new ProgressBar();
         this.progress.skinName = _14045;
         this.progress.width = 300;
         this.progress.value = 0;
         this.progress._8233 = 100;
         this._14868 = new Label();
         this._14868.text = "0%";
         _loc2_.addElement(this.progress);
         _loc2_.addElement(this._14868);
         _loc3_.addElement(_loc2_);
         _loc1_.addElement(_loc3_);
         this._14866 = new Label();
         this._14866.text = "1/1";
         _loc1_.addElement(this._14866);
         this._6194 = new Label();
         _loc1_.addElement(this._6194);
         this._14869 = new Label();
         _loc1_.addElement(this._14869);
         var _loc4_:Group;
         (_loc4_ = new Group()).percentWidth = 100;
         this._5555 = new Button();
         this._5555.width = 80;
         this._5555.height = 23;
         this._5555.top = 20;
         this._5555.right = 10;
         this._5555.label = tr("Import.psdexport.cancel");
         _loc4_.addElement(this._5555);
         _loc1_.addElement(_loc4_);
         addElement(_loc1_);
         this._5555.addEventListener(MouseEvent.CLICK,this._14867);
      }
      
      public function refresh(param1:int, param2:String, param3:String, param4:String) : void
      {
         this.progress.value = param1;
         this._14868.text = String(param1) + "%";
         this._14866.text = param2;
         this._6194.text = tr("Export.gifAlert.label1",param3);
         this._14869.text = param4;
      }
      
      override public function open(param1:Boolean = true) : void
      {
         super.open(true);
      }
      
      private function _14867(param1:MouseEvent) : void
      {
         if(this._14459 != null)
         {
            this._14459.call(null);
         }
         this.close();
      }
   }
}

