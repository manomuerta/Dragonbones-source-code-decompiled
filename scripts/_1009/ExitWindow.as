package _1009
{
   import _1045.Button;
   import _1045.CheckBox;
   import _1045.Group;
   import _1045.Label;
   import _1185._1188;
   import _1185._1189;
   import _1185._1196;
   import _1374.Window;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flashx.textLayout.formats.TextAlign;
   
   public class ExitWindow extends Window
   {
      private var _7053:Label;
      
      private var _7054:Button;
      
      private var _7055:Button;
      
      private var _7051:Button;
      
      private var _6492:CheckBox;
      
      private var _6525:Group;
      
      private var _2568:_1189;
      
      private var _7026:String;
      
      private var _7050:Boolean;
      
      private var _6975:int = 0;
      
      public function ExitWindow()
      {
         super();
         this.title = tr("CloseApplication.title");
         this.width = 400;
         this.height = 180;
      }
      
      public function get showText() : String
      {
         return this._7026;
      }
      
      public function set showText(param1:String) : void
      {
         this._7026 = param1;
         _2476();
         _2466();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get _3537() : Boolean
      {
         return this._7050;
      }
      
      public function set _3537(param1:Boolean) : void
      {
         this._7050 = param1;
         _2476();
         _2466();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get num() : int
      {
         return this._6975;
      }
      
      public function set num(param1:int) : void
      {
         this._6975 = param1;
         _2476();
         _2466();
         invalidateSize();
         invalidateDisplayList();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._7053 = new Label();
         this._7053.top = 15;
         this._7053.percentWidth = 100;
         this._7053.horizontalCenter = 0;
         this._7053.textAlign = TextAlign.CENTER;
         this._7053.verticalAlign = _1196.MIDDLE;
         this._7053.text = !!this.showText ? this.showText : tr("CloseApplication.content");
         addElement(this._7053);
         this._2568 = new _1189();
         this._2568._2401 = _1188.CENTER;
         this._2568.verticalAlign = _1196.MIDDLE;
         this._2568.gap = 10;
         this._6492 = new CheckBox();
         this._6492.label = tr("CloseApplication.saveAll1") + this.num + tr("CloseApplication.saveAll2");
         this._6492.bottom = 48;
         this._6492.visible = this._6492.includeInLayout = this._3537;
         addElement(this._6492);
         this._6525 = new Group();
         this._6525.bottom = 10;
         this._6525.height = 30;
         this._6525.left = 15;
         this._6525.right = 15;
         this._6525.layout = this._2568;
         addElement(this._6525);
         this._7054 = new Button();
         this._7054.width = 92;
         this._7054.label = tr("Alert.Yes");
         this._7054.addEventListener(MouseEvent.CLICK,function _6595(param1:MouseEvent):void
         {
            _7052("save");
         });
         this._6525.addElement(this._7054);
         this._7055 = new Button();
         this._7055.width = 92;
         this._7055.label = tr("Alert.No");
         this._7055.addEventListener(MouseEvent.CLICK,function _6595(param1:MouseEvent):void
         {
            _7052("noSave");
         });
         this._6525.addElement(this._7055);
         this._7051 = new Button();
         this._7051.width = 92;
         this._7051.label = tr("Alert.Cancel");
         this._7051.addEventListener(MouseEvent.CLICK,function _6595(param1:MouseEvent):void
         {
            _7052("cancel");
         });
         this._6525.addElement(this._7051);
      }
      
      public function get selectAll() : Boolean
      {
         return Boolean(this._6492) && this._6492.selected;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._7053.text = this.showText;
         this._6492.x = this._7053.x + 2;
         this._6492.label = tr("CloseApplication.saveAll1") + this.num + tr("CloseApplication.saveAll2");
         this._6492.visible = this._6492.includeInLayout = this._3537;
      }
      
      private function _7052(param1:String) : Boolean
      {
         return this.dispatchEvent(new Event(param1,true,true));
      }
      
      override protected function _7028() : void
      {
         super._7028();
      }
   }
}

