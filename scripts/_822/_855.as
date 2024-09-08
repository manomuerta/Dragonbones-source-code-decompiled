package _822
{
   import _1038._1037;
   import _1045.Button;
   import _1045.Group;
   import _1045.Menu;
   import _1177.MenuEvent;
   import _1374.TextInput;
   import _1439._1233;
   import _28._30;
   import _28._32;
   import _834._841;
   import _935._15567;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   
   public class _855 extends Group
   {
      public var textInput:TextInput;
      
      public var _6318:Button;
      
      public var menu:Menu;
      
      private var _value:int = 0;
      
      private var _6320:_1037;
      
      private var _6317:int = -1;
      
      public function _855()
      {
         this.textInput = new TextInput();
         this._6318 = new Button();
         this.menu = new Menu();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6320 = new _1037();
         this._6320.addItem(_32._1697(tr("ZoomList.fit"),"All"));
         this._6320.addItem(_32._1697("25%","25",null,null,"check",25));
         this._6320.addItem(_32._1697("50%","50",null,null,"check",50));
         this._6320.addItem(_32._1697("100%","100",null,null,"check",100));
         this._6320.addItem(_32._1697("200%","200",null,null,"check",200));
         this._6320.addItem(_32._1697("400%","400",null,null,"check",400));
         this._6320.addItem(_32._1697("800%","800",null,null,"check",800));
         Menu._6319(this.menu,this,this._6320);
         this.menu.visible = false;
         this.menu.tabEnabled = false;
         this.menu.width = 100;
         this.menu._2514 = _15567;
         this.menu.addEventListener(MenuEvent.ITEM_CLICK,this._6315);
         this.textInput.skinName = _841;
         this.textInput.maxChars = 5;
         this.textInput.percentWidth = 100;
         this.textInput.percentHeight = 100;
         this.textInput.addEventListener(FocusEvent.FOCUS_OUT,this._6313);
         this._6318.skinName = _1233;
         this._6318.width = 22;
         this._6318.right = 1;
         this._6318.top = 1;
         this._6318.bottom = 1;
         this._6318.addEventListener(MouseEvent.MOUSE_DOWN,this._6311);
         this.addElement(this.textInput);
         this.addElement(this._6318);
      }
      
      private function _6315(param1:MenuEvent) : void
      {
         var _loc2_:_30 = param1.item as _30;
         this._6316(_loc2_.userData);
      }
      
      private function _6313(param1:FocusEvent) : void
      {
         var _loc4_:int = 0;
         var _loc2_:String = this.textInput.text;
         var _loc3_:Array = _loc2_.split("%");
         if(_loc3_.length > 0)
         {
            _loc4_ = Number(_loc3_[0]);
         }
         if(_loc4_ > 0)
         {
            this._6316(_loc4_);
         }
         else
         {
            this._6312();
         }
      }
      
      private function _6311(param1:MouseEvent) : void
      {
         if(this.menu.visible)
         {
            this.menu.hide();
         }
         else
         {
            this.menu.show(width - this.menu.width,height);
         }
         param1.stopImmediatePropagation();
      }
      
      private function _6312() : void
      {
         this.textInput.text = String(this._value) + "%";
      }
      
      private function _6314() : void
      {
         var _loc1_:_30 = null;
         if(this._6317 != -1)
         {
            _loc1_ = this._6320[this._6317];
            _loc1_._1705 = false;
            this._6320._4016(_loc1_);
            this._6317 = -1;
         }
         var _loc2_:int = 0;
         var _loc3_:int = this._6320.length;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this._6320[_loc2_];
            if(_loc1_.userData == this._value)
            {
               _loc1_._1705 = true;
               this._6320._4016(_loc1_);
               this._6317 = _loc2_;
               break;
            }
            _loc2_++;
         }
      }
      
      public function _6316(param1:Number) : void
      {
         if(this._4866(param1))
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function _4866(param1:int) : Boolean
      {
         if(this._value == param1)
         {
            this._6312();
            return false;
         }
         this._value = param1;
         this._6312();
         this._6314();
         return true;
      }
      
      public function get value() : int
      {
         return this._value;
      }
   }
}

