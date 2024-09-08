package _1021
{
   import _1045.Button;
   import _1045.Group;
   import _1045.HSlider;
   import _1045.Label;
   import _1185._1189;
   import _127._128;
   import _127._14041;
   import _127._14042;
   import _127._159;
   import _127._171;
   import _14255._14258;
   import _14255._14259;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   
   public class _14119 extends _171
   {
      private const _14765:int = 150;
      
      private const _13166:int = 80;
      
      public var tip0:Label;
      
      public var _14925:_128;
      
      public var tip1:Label;
      
      public var _14928:_128;
      
      public var tip2:Label;
      
      public var _14927:_128;
      
      public var tip3:Label;
      
      public var _14930:_14041;
      
      public var tip4:Label;
      
      public var _14931:HSlider;
      
      public var _7113:_159;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      public var _14550:Function = null;
      
      public var _14459:Function = null;
      
      public function _14119()
      {
         this.tip0 = new Label();
         this._14925 = new _128();
         this.tip1 = new Label();
         this._14928 = new _128();
         this.tip2 = new Label();
         this._14927 = new _128();
         this.tip3 = new Label();
         this._14930 = new _14041(70,70);
         this.tip4 = new Label();
         this._14931 = new HSlider();
         this._7113 = new _159();
         super();
         this.title = tr("Import.psdexport.title");
         this.width = NaN;
         resizable = false;
         this.minWidth = 335;
         this.minHeight = 318;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc3_:Group = null;
         super._2438();
         _loc1_ = _125._2414();
         _loc1_.height = 23;
         this._14925.left = 110;
         this.tip0.width = this._14765;
         this.tip0.textAlign = TextFormatAlign.RIGHT;
         this.tip0.text = tr("Import.psdexport.createSkeleton");
         _loc1_.addElement(this.tip0);
         _loc1_.addElement(this._14925);
         var _loc2_:Group = _125._2414();
         _loc2_.height = 23;
         this._14928.left = 110;
         this.tip1.width = this._14765;
         this.tip1.textAlign = TextFormatAlign.RIGHT;
         this.tip1.text = tr("Import.psdexport.onlyUpdateTexture");
         _loc2_.addElement(this.tip1);
         _loc2_.addElement(this._14928);
         _loc3_ = _125._2414();
         _loc3_.height = 23;
         this._14927.left = 110;
         this.tip2.width = this._14765;
         this.tip2.textAlign = TextFormatAlign.RIGHT;
         this.tip2.text = tr("Import.psdexport.ignoreHiddenLayers");
         _loc3_.addElement(this.tip2);
         _loc3_.addElement(this._14927);
         var _loc4_:Group = _125._2414();
         this._14930.top = 0;
         this._14930.left = 110;
         this.tip3.top = 0;
         this.tip3.width = this._14765;
         this.tip3.height = 69;
         this.tip3.textAlign = TextFormatAlign.RIGHT;
         this.tip3.text = tr("Import.psdexport.originPoint");
         _loc4_.addElement(this.tip3);
         _loc4_.addElement(this._14930);
         var _loc5_:Group;
         (_loc5_ = _125._2414()).height = 23;
         this._14931.skinName = _14042;
         this._14931.maximum = 100;
         this._14931.minimum = 10;
         this._14931.value = 100;
         this._14931.left = 110;
         this.tip4.width = this._14765;
         this.tip4.textAlign = TextFormatAlign.RIGHT;
         this.tip4.text = tr("Import.psdexport.scale");
         this._7113.width = 45;
         this._7113.height = 23;
         _loc5_.addElement(this.tip4);
         _loc5_.addElement(this._14931);
         _loc5_.addElement(this._7113);
         var _loc6_:Group;
         (_loc6_ = _125._2413(5)).top = 15;
         _loc6_.percentWidth = 100;
         _loc6_.addElement(_loc1_);
         _loc6_.addElement(_loc2_);
         _loc6_.addElement(_loc3_);
         _loc6_.addElement(_loc4_);
         _loc6_.addElement(_loc5_);
         var _loc7_:_1189;
         (_loc7_ = new _1189()).gap = 30;
         _loc7_._2420 = 20;
         _loc7_._2401 = "center";
         _2632.layout = _loc7_;
         _2512.addElement(_loc6_);
         _2512.percentWidth = 100;
         this._5554 = new Button();
         this._5554.width = this._13166;
         this._5554.height = 23;
         this._5554.label = tr("Import.psdexport.export");
         _2632.addElement(this._5554);
         this._5555 = new Button();
         this._5555.width = this._13166;
         this._5555.height = 23;
         this._5555.label = tr("Import.psdexport.cancel");
         _2632.addElement(this._5555);
         _2512.addElement(_2632);
         this._14931.addEventListener(Event.CHANGE,this._14929);
         this._5554.addEventListener(MouseEvent.CLICK,this._14926);
         this._5555.addEventListener(MouseEvent.CLICK,this._14867);
         this.init();
      }
      
      override public function open(param1:Boolean = true) : void
      {
         super.open(true);
         this.reset();
      }
      
      public function init() : void
      {
         this._14925.selected = _14259.isCreateSkeleton;
         this._14928.selected = _14259.onlyUpdateTexture;
         this._14927.selected = _14259.ignoreHiddenLayers;
         this._14930._14354(_14258.Center);
         this._14931.value = 100;
         this._7113.text = "100%";
      }
      
      public function reset() : void
      {
         _14259.isCreateSkeleton = false;
         _14259.onlyUpdateTexture = false;
         _14259.ignoreHiddenLayers = true;
         _14259.originType = _14258.Center;
         _14259.scale = 1;
         this.init();
      }
      
      public function set _14539(param1:Boolean) : void
      {
         _14259.isCreateSkeleton = param1;
         this._14925.selected = param1;
         this._14925.enabled = !param1;
      }
      
      private function _14929(param1:Event) : void
      {
         this._7113.text = this._14931.value + "%";
      }
      
      private function _14926(param1:MouseEvent) : void
      {
         _14259.isCreateSkeleton = this._14925.selected;
         _14259.onlyUpdateTexture = this._14928.selected;
         _14259.ignoreHiddenLayers = this._14927.selected;
         _14259.originType = this._14930.origin;
         _14259.scale = this._14931.value / 100;
         if(this._14550 != null)
         {
            this._14550.call(null);
         }
         this.close();
      }
      
      private function _14867(param1:MouseEvent) : void
      {
         if(this._14459 != null)
         {
            this._14459.call(null);
         }
         this.reset();
         this.close();
      }
   }
}

