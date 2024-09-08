package _1021
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1185._1189;
   import _127._14043;
   import _127._171;
   import _97._125;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   
   public class _14120 extends _171
   {
      public var _14934:_14043;
      
      public var _14933:Label;
      
      public var _14936:Label;
      
      public var _14932:Button;
      
      private var _14935:Boolean = false;
      
      public var _14326:Array;
      
      public var _14459:Function = null;
      
      public function _14120(param1:Boolean = false)
      {
         this._14934 = new _14043(30,5);
         this._14933 = new Label();
         this._14936 = new Label();
         super();
         this._14935 = param1;
         this.title = tr("Import.psdexport.title");
         resizable = false;
         this.minWidth = 300;
         this.minHeight = 170;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc2_:Group = null;
         super._2438();
         _loc1_ = _125._2397();
         _loc1_.percentWidth = 100;
         _loc1_.height = 80;
         _loc1_.addElement(this._14934);
         _loc2_ = _125._2397();
         _loc2_.percentWidth = 100;
         _loc2_.height = 23;
         this._14936.textAlign = TextFormatAlign.CENTER;
         _loc2_.addElement(this._14936);
         var _loc3_:Group = _125._2397();
         _loc3_.percentWidth = 100;
         _loc3_.height = 23;
         this._14933.textAlign = TextFormatAlign.CENTER;
         this._14933.text = tr("Import.psdexport.sizeTip");
         _loc3_.addElement(this._14933);
         var _loc4_:_1189;
         (_loc4_ = new _1189()).gap = 30;
         _loc4_._2401 = "center";
         _2632.layout = _loc4_;
         this._14932 = new Button();
         this._14932.width = 80;
         this._14932.height = 23;
         this._14932.label = tr("Import.psdexport.cancel");
         _2632.addElement(this._14932);
         var _loc5_:Group;
         (_loc5_ = _125._2413(0)).percentWidth = 100;
         _loc5_.addElement(_loc1_);
         _loc5_.addElement(_loc2_);
         if(this._14935)
         {
            _loc5_.addElement(_loc3_);
         }
         _2512.addElement(_loc5_);
         _2512.addElement(_2632);
         this._14932.addEventListener(MouseEvent.CLICK,this._14867);
      }
      
      private function _14867(param1:MouseEvent) : void
      {
         if(this._14459 != null)
         {
            this._14459.apply(null,this._14326);
         }
         this.close();
      }
      
      public function set msg(param1:String) : void
      {
         this._14934.start();
         this._14936.text = param1;
      }
      
      override public function close() : void
      {
         this._14934.stop();
         super.close();
      }
   }
}

