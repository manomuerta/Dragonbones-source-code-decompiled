package _906
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._128;
   import _127._162;
   import _1374.ColorPicker;
   import _636.DBPanelEvent;
   import _668._672;
   import _721._763;
   import _822._10616;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   
   public class _13210 extends Group
   {
      public const _14765:int = 48;
      
      public const SUB_LABEL_WIDTH:int = 24;
      
      public const INTPUT_WIDTH:int = 40;
      
      public var _4025:_162;
      
      public var _4024:_162;
      
      public var _4066:ColorPicker;
      
      private var _4761:_672;
      
      private var _13410:_128;
      
      private var _2440:Group;
      
      private var _13413:_10616;
      
      private var _13414:_10616;
      
      private var _4786:_10616;
      
      private var _4785:_10616;
      
      private var _13404:Button;
      
      private var _13407:_128;
      
      private var _13406:_128;
      
      public function _13210()
      {
         this._4025 = new _162();
         this._4024 = new _162();
         this._4066 = new ColorPicker();
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc3_:Label = null;
         var _loc16_:Group = null;
         super._2438();
         this.layout = new _1197();
         this.percentWidth = 100;
         this._13410 = new _128();
         this._13410.label = tr("Canvas.open");
         this._2440 = _125._2413();
         _loc1_ = _125._2413();
         var _loc2_:Group = _125._2414();
         _loc3_ = new Label();
         _loc3_.text = tr("Canvas.size");
         _loc3_.width = this._14765;
         var _loc4_:Label;
         (_loc4_ = new Label()).text = tr("Canvas.x");
         _loc4_.width = this.SUB_LABEL_WIDTH;
         this._13413 = new _10616();
         this._13413.maximum = 999999;
         this._13413.minimum = -999999;
         this._13413.width = this.INTPUT_WIDTH;
         this._13413._11442 = 0;
         var _loc5_:Label;
         (_loc5_ = new Label()).text = tr("Canvas.y");
         _loc5_.width = this.SUB_LABEL_WIDTH;
         this._13414 = new _10616();
         this._13414.maximum = 999999;
         this._13414.minimum = -999999;
         this._13414.width = this.INTPUT_WIDTH;
         this._13414._11442 = 0;
         _loc2_.addElement(_loc3_);
         _loc2_.addElement(_loc4_);
         _loc2_.addElement(this._13413);
         _loc2_.addElement(_loc5_);
         _loc2_.addElement(this._13414);
         var _loc6_:Group = _125._2414();
         var _loc7_:Group;
         (_loc7_ = new Group()).width = this._14765;
         var _loc8_:Label;
         (_loc8_ = new Label()).text = tr("Canvas.width");
         _loc8_.width = this.SUB_LABEL_WIDTH;
         this._4786 = new _10616();
         this._4786.maximum = 999999;
         this._4786.width = this.INTPUT_WIDTH;
         this._4786._11442 = 0;
         var _loc9_:Label;
         (_loc9_ = new Label()).text = tr("Canvas.height");
         _loc9_.width = this.SUB_LABEL_WIDTH;
         this._4785 = new _10616();
         this._4785.maximum = 999999;
         this._4785.width = this.INTPUT_WIDTH;
         this._4785._11442 = 0;
         _loc6_.addElement(_loc7_);
         _loc6_.addElement(_loc8_);
         _loc6_.addElement(this._4786);
         _loc6_.addElement(_loc9_);
         _loc6_.addElement(this._4785);
         var _loc10_:Group = _125._2414();
         var _loc11_:Group;
         (_loc11_ = new Group()).width = this._14765;
         this._13404 = new Button();
         this._13404.label = tr("Canvas.autoSize");
         _loc10_.addElement(_loc11_);
         _loc10_.addElement(this._13404);
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(_loc6_);
         _loc1_.addElement(_loc10_);
         var _loc12_:Group = _125._2414();
         var _loc13_:Label;
         (_loc13_ = new Label()).width = this._14765;
         _loc13_.text = tr("Canvas.color");
         this._13406 = new _128();
         this._13406.label = "";
         this._4066._6193 = true;
         this._4066.defaultColor = 16777215;
         _loc12_.addElement(_loc13_);
         _loc12_.addElement(this._13406);
         _loc12_.addElement(this._4066);
         var _loc14_:Group = _125._2414();
         var _loc15_:Group;
         (_loc15_ = new Group()).width = this._14765;
         this._13407 = new _128();
         this._13407.label = tr("Canvas.show");
         _loc14_.addElement(_loc15_);
         _loc14_.addElement(this._13407);
         this._2440.addElement(_loc1_);
         this._2440.addElement(_loc12_);
         this._2440.addElement(_loc14_);
         this._2440.left = 100;
         addElement(this._13410);
         _loc16_ = _125._2414();
         var _loc17_:Group;
         (_loc17_ = new Group()).width = 10;
         _loc16_.addElement(_loc17_);
         _loc16_.addElement(this._2440);
         addElement(_loc16_);
         this._13402();
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
      
      private function _13402() : void
      {
         this._13410.addEventListener(Event.CHANGE,this._13401);
         this._13406.addEventListener(Event.CHANGE,this._13398);
         this._13407.addEventListener(Event.CHANGE,this._13403);
         this._4786.addEventListener(Event.CHANGE,this._13400);
         this._4785.addEventListener(Event.CHANGE,this._13399);
         this._13413.addEventListener(Event.CHANGE,this._13409);
         this._13414.addEventListener(Event.CHANGE,this._13408);
         this._4786.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
         this._4785.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
         this._13413.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
         this._13414.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
         this._4066.addEventListener(Event.CHANGE,this._4052);
         this._4066.addEventListener(Event.CANCEL,this._11446);
         this._4066.addEventListener(UIEvent.CONFIRM,this._11446);
         this._13404.addEventListener(MouseEvent.CLICK,this._13405);
      }
      
      private function _13405(param1:MouseEvent) : void
      {
         dispatchEvent(new DBPanelEvent(DBPanelEvent.AUTO_CANVAS_SIZE));
      }
      
      private function onFocusOut(param1:FocusEvent) : void
      {
         dispatchEvent(new DBPanelEvent(DBPanelEvent.BLOCK_HISTORY));
      }
      
      private function _11446(param1:Event) : void
      {
         this.dataChange({"bgColor":this._4066._4061});
      }
      
      private function _4052(param1:Event) : void
      {
         this.dataChange({"bgColor":this._4066._4061},true);
      }
      
      private function _13408(param1:Event) : void
      {
         this.dataChange({"y":this._13414.value},true);
      }
      
      private function _13409(param1:Event) : void
      {
         this.dataChange({"x":this._13413.value},true);
      }
      
      private function _13399(param1:Event) : void
      {
         this.dataChange({"height":this._4785.value},true);
      }
      
      private function _13400(param1:Event) : void
      {
         this.dataChange({"width":this._4786.value},true);
      }
      
      private function _13403(param1:Event) : void
      {
         this.dataChange({"_13227":this._13407.selected});
      }
      
      private function _13398(param1:Event) : void
      {
         this.dataChange({"hasBackground":this._13406.selected});
      }
      
      private function _13401(param1:Event) : void
      {
         this.dataChange({"opened":this._13410.selected});
      }
      
      private function dataChange(param1:Object, param2:Boolean = false) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         if(param1 == null)
         {
            return;
         }
         if(Boolean(this._4761) && Boolean(this._4761._1886))
         {
            if(this._4761._1886._2000 == null)
            {
               this._4761._1886._2000 = _763._1572(_763.DEFAULT_WIDTH,_763.DEFAULT_HEIGHT,16777215);
               this._4761._1886._2000.type = _763.TYPE_NEW;
               _loc3_ = true;
            }
            this._4761._1886._2000.opened = this._13410.selected;
            (_loc4_ = {}).canvas = this._4761._1886._2000;
            _loc4_._3430 = this._4761._1886._2000._10373();
            _loc4_._1642 = this._4761._1886._2000._10373();
            if(_loc3_)
            {
               _loc4_.isNew = true;
            }
            for(_loc5_ in param1)
            {
               _loc4_._1642[_loc5_] = param1[_loc5_];
            }
            _loc4_.merge = param2;
            dispatchEvent(new DBPanelEvent(DBPanelEvent.UPDATE_CANVASVO,_loc4_));
            this.refresh();
         }
      }
      
      public function set model(param1:_672) : void
      {
         this._4761 = param1;
         this.refresh();
      }
      
      public function refresh() : void
      {
         if(Boolean(this._4761) && Boolean(this._4761._1886))
         {
            this._13410.selected = this._2440.visible = this._2440.includeInLayout = Boolean(this._4761._1886._2000) && this._4761._1886._2000.opened;
            if(this._4761._1886._2000)
            {
               this._13413.value = this._4761._1886._2000.x;
               this._13414.value = this._4761._1886._2000.y;
               this._4786.value = this._4761._1886._2000.width;
               this._4785.value = this._4761._1886._2000.height;
               this._13410.selected = this._4761._1886._2000.opened;
               this._13406.selected = this._4761._1886._2000.hasBackground;
               this._13407.selected = this._4761._1886._2000._13227;
               this._4066._4061 = this._4761._1886._2000.bgColor;
               this._4066.visible = this._13407.visible = this._4761._1886._2000.hasBackground;
            }
         }
         else
         {
            this._13410.selected = this._2440.visible = this._2440.includeInLayout = false;
         }
      }
   }
}

