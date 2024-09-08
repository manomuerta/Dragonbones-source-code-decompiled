package _14115
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _1185._1188;
   import _1185._1197;
   import _127._14044;
   import _1374.IconButton;
   import _1529._1528;
   import _1529._1530;
   import _721._765;
   import _97._125;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   
   public class _14114 extends _14117
   {
      private var _14912:Class;
      
      private var _14913:Class;
      
      private var _14903:Label;
      
      private var _7090:IconButton;
      
      private var _7089:IconButton;
      
      private var _7082:Group;
      
      private var _14911:_14044;
      
      private var group2:Group;
      
      private var group3:Group;
      
      private var group4:Group;
      
      private var group5:Group;
      
      private var label2:Label;
      
      private var _14914:Label;
      
      private var label3:Label;
      
      private var _14915:Label;
      
      private var _14917:_1105;
      
      private var label4:Label;
      
      private var _14901:Label;
      
      private var label5:Label;
      
      private var _7083:Label;
      
      private var _14916:_1105;
      
      private var _14906:Label;
      
      private var _14910:_1105;
      
      private var _7086:int = 0;
      
      private var _7081:int;
      
      private var _7077:Vector.<BitmapData>;
      
      private var _14900:BitmapData;
      
      private var _14902:BitmapData;
      
      private var _14904:Array;
      
      private var _3639:_765;
      
      public function _14114()
      {
         this._14912 = _14114__14912;
         this._14913 = _14114__14913;
         this._14903 = new Label();
         this._7090 = new IconButton();
         this._7089 = new IconButton();
         this._7082 = _125._2414(3);
         this._14911 = new _14044();
         this.label2 = new Label();
         this._14914 = new Label();
         this.label3 = new Label();
         this._14915 = new Label();
         this._14917 = new _1105();
         this.label4 = new Label();
         this._14901 = new Label();
         this.label5 = new Label();
         this._7083 = new Label();
         this._14916 = new _1105();
         this._14906 = new Label();
         this._14910 = new _1105();
         super();
         this._14900 = new this._14912().bitmapData;
         this._14902 = new this._14913().bitmapData;
         this._14904 = [tr("Export.heuristic.BestShortSideFit"),tr("Export.heuristic.BestLongSideFit"),tr("Export.heuristic.BestAreaFit"),tr("Export.heuristic.BottomLeftRule"),tr("Export.heuristic.ContactPointRule")];
      }
      
      override protected function _2438() : void
      {
         var _loc3_:Group = null;
         var _loc4_:Group = null;
         var _loc5_:Group = null;
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
         this._14911.bottom = 20;
         this._14911.horizontalCenter = 0;
         var _loc2_:_1197 = new _1197();
         _loc2_._2401 = _1188.LEFT;
         if(_1528.language == _1530.zh_CN)
         {
            _loc2_.gap = 3;
         }
         else
         {
            _loc2_.gap = 0;
         }
         _6333 = new Group();
         _6333.percentWidth = 100;
         _6333.layout = _loc2_;
         group1 = _125._2414(3);
         label1.text = tr("Export.output.size");
         label1.textAlign = TextFormatAlign.RIGHT;
         label1.width = _14765;
         group1.addElement(label1);
         group1.addElement(_14899);
         this.group2 = _125._2414(3);
         this.label2.text = tr("Export.heuristic.label");
         this.label2.textAlign = TextFormatAlign.RIGHT;
         this.label2.width = _14765;
         this.group2.addElement(this.label2);
         this.group2.addElement(this._14914);
         this.group3 = _125._2414(3);
         this.label3.text = tr("Export.texture.area") + mark;
         this.label3.textAlign = TextFormatAlign.RIGHT;
         this.label3.width = _14765;
         this._14915.text = tr("Export.texture.stipWhiteSpace");
         this._14917.source = this._14900;
         this.group3.addElement(this.label3);
         this.group3.addElement(this._14915);
         this.group3.addElement(this._14917);
         this.group4 = _125._2414(3);
         this.label4.text = tr("Export.texture.areaFill") + mark;
         this.label4.textAlign = TextFormatAlign.RIGHT;
         this.label4.width = _14765;
         this.group4.addElement(this.label4);
         this.group4.addElement(this._14901);
         this.label5.text = tr("Export.texture.page") + mark;
         this.label5.textAlign = TextFormatAlign.RIGHT;
         this.label5.width = _14765;
         this._7083.text = tr("Export.texture.pow2");
         this._14916.source = this._14900;
         this._14906.text = tr("Export.texture.square");
         this._14910.source = this._14902;
         if(_1528.language == _1530.ru_RF)
         {
            this.group5 = _125._2403(3);
            _loc3_ = _125._2414(0);
            _loc3_.addElement(this._7083);
            _loc3_.addElement(this._14916);
            _loc4_ = _125._2414(0);
            _loc4_.addElement(this._14906);
            _loc4_.addElement(this._14910);
            _loc5_ = _125._2413(0);
            _loc5_.addElement(_loc3_);
            _loc5_.addElement(_loc4_);
            this.group5.addElement(this.label5);
            this.group5.addElement(_loc5_);
            _6333.bottom = 50;
         }
         else
         {
            this.group5 = _125._2414(3);
            this.group5.addElement(this.label5);
            this.group5.addElement(this._7083);
            this.group5.addElement(this._14916);
            this.group5.addElement(this._14906);
            this.group5.addElement(this._14910);
            _6333.bottom = 64;
         }
         _2513.bottom = 165;
         _7374._14339(image);
         _14905.addElement(_7374);
         _14905.addElement(this._14911);
         _6333.addElement(group1);
         _6333.addElement(this.group2);
         _6333.addElement(this.group3);
         _6333.addElement(this.group4);
         _6333.addElement(this.group5);
         this.addElement(_14905);
         this.addElement(_2513);
         this.addElement(_6333);
         this._7089.addEventListener(MouseEvent.CLICK,this._7072);
         this._7090.addEventListener(MouseEvent.CLICK,this._7071);
         this._14911.addEventListener(Event.CHANGE,this._14897);
         this._7082.visible = false;
         this._14911.visible = false;
      }
      
      public function _2894(param1:_765, param2:Vector.<BitmapData>) : void
      {
         this._3639 = param1;
         if(this._3639)
         {
            this._14914.text = this._14904[this._3639.heuristic];
            this._14917.source = this._3639._5420 ? this._14900 : this._14902;
            this._14901.text = tr("Export.preview.areaFill",this._3639.gapX,this._3639.gapY);
            this._14916.source = this._3639._2832 ? this._14900 : this._14902;
            this._14910.source = this._3639._5416 ? this._14900 : this._14902;
         }
         this._5421 = param2;
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
      
      private function _14897(param1:Event) : void
      {
         this._7086 = this._14911._14317;
         this._7087(this._7086);
      }
      
      private function _7087(param1:int) : void
      {
         if(this._7081 <= 0 || param1 < 0)
         {
            this._14911.visible = false;
            this._7082.visible = false;
            return;
         }
         if(this._7081 > 1)
         {
            this._14911.visible = true;
            this._7082.visible = true;
            this._14903.text = tr("Export.setting.page",param1 + 1,this._7081);
            this._7090.enabled = param1 > 0;
            this._7089.enabled = param1 < this._7081 - 1;
            this._14911._14367(param1);
         }
         else
         {
            this._14911.visible = false;
            this._7082.visible = false;
         }
         this._7066(this._7077[param1]);
      }
      
      private function set _5421(param1:Vector.<BitmapData>) : void
      {
         if(param1 == null || param1.length == 0)
         {
            this._7082.visible = false;
            this._14911.visible = false;
            image.source = null;
            return;
         }
         this._7081 = param1.length;
         this._7086 = 0;
         this._7077 = param1;
         this._14911._14368(this._7081);
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

