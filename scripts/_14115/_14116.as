package _14115
{
   import _1045.Group;
   import _1045.Label;
   import _1185._1188;
   import _1185._1197;
   import _1374.IconButton;
   import _97._125;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   
   public class _14116 extends _14117
   {
      private var _14903:Label;
      
      private var _7090:IconButton;
      
      private var _7089:IconButton;
      
      private var _7082:Group;
      
      private var _7086:int = 0;
      
      private var _7081:int;
      
      private var _7077:Vector.<BitmapData>;
      
      public function _14116()
      {
         this._14903 = new Label();
         this._7090 = new IconButton();
         this._7089 = new IconButton();
         this._7082 = _125._2414(3);
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         _2513.percentWidth = 100;
         this._14903.text = tr("Export.setting.page",1,1);
         this._7089.icon = "/assets/button/texture_next.png";
         this._7090.icon = "/assets/button/texture_prev.png";
         this._7082.left = 0;
         this._7082.addElement(this._7090);
         this._7082.addElement(this._14903);
         this._7082.addElement(this._7089);
         _2513.addElement(this._7082);
         _14898.text = tr("Export.setting.percent");
         _14898.textAlign = TextFormatAlign.RIGHT;
         _14898.width = _14765;
         _14898.width = 70;
         _14908.icon = "/assets/button/zoom_in.png";
         _14907.icon = "/assets/button/zoom_out.png";
         var _loc1_:Group = _125._2414(3);
         _loc1_.right = 0;
         _loc1_.addElement(_14898);
         _loc1_.addElement(_6155);
         _loc1_.addElement(_14908);
         _loc1_.addElement(_14907);
         _2513.addElement(_loc1_);
         var _loc2_:_1197 = new _1197();
         _loc2_._2401 = _1188.LEFT;
         _loc2_.gap = 3;
         _6333 = new Group();
         _6333.percentWidth = 100;
         _6333.layout = _loc2_;
         group1 = _125._2414(3);
         label1.text = tr("Export.output.size");
         label1.textAlign = TextFormatAlign.RIGHT;
         label1.width = _14765;
         group1.addElement(label1);
         group1.addElement(_14899);
         _6333.bottom = 64;
         _2513.bottom = 135;
         _7374._14339(image);
         _14905.addElement(_7374);
         _6333.addElement(group1);
         this.addElement(_14905);
         this.addElement(_2513);
         this.addElement(_6333);
         this._7089.addEventListener(MouseEvent.CLICK,this._7072);
         this._7090.addEventListener(MouseEvent.CLICK,this._7071);
         this._7082.visible = false;
      }
      
      public function _2894(param1:Vector.<BitmapData>) : void
      {
         this._5421 = param1;
      }
      
      private function _7071(param1:MouseEvent) : void
      {
         --this._7086;
         this._7087(this._7086);
      }
      
      private function _7072(param1:MouseEvent) : void
      {
         ++this._7086;
         this._7087(this._7086);
      }
      
      private function _7087(param1:int) : void
      {
         if(this._7081 <= 0 || param1 < 0)
         {
            this._7082.visible = false;
            return;
         }
         if(this._7081 > 1)
         {
            this._7082.visible = true;
            this._14903.text = tr("Export.setting.page",param1 + 1,this._7081);
            this._7090.enabled = param1 > 0;
            this._7089.enabled = param1 < this._7081 - 1;
         }
         else
         {
            this._7082.visible = false;
         }
         this._7066(this._7077[param1]);
      }
      
      private function set _5421(param1:Vector.<BitmapData>) : void
      {
         if(param1 == null || param1.length == 0)
         {
            this._7082.visible = false;
            image.source = null;
            return;
         }
         this._7081 = param1.length;
         this._7086 = 0;
         this._7077 = param1;
         this._7087(this._7086);
      }
      
      private function _7066(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Number = param1.width;
         var _loc3_:Number = param1.height;
         if(!image.source)
         {
            _14909 = true;
         }
         image.source = param1;
         _7360 = _loc3_;
         _7367 = _loc2_;
         _14899.text = _loc2_ + " x " + _loc3_;
         _7348();
         if(_6155)
         {
            _6155.text = String(scale) + "%";
         }
      }
   }
}

